#ifndef DATE_CALCULATIONS
#define DATE_CALCULATIONS
/**************************************/
/* MODULE   lib_date.c          (lib) */
/**************************************/
/*  Date calculations complying with  */
/* ISO/R 2015-1971 and DIN 1355 stdds */
/**************************************/
/* IMPORTS                            */
/**************************************/
#include    <stdlib.h>       /* (sys) */
#include    <string.h>       /* (sys) */
#include    <ctype.h>        /* (sys) */
#include    "lib_defs.h"     /* (dat) */
/**************************************/
/* INTERFACE                          */
/**************************************/
/*
boolean leap(N_int year);

N_int   encode(N_int yy, N_int mm, N_int dd);
void    decode(N_int date, N_int *cc, N_int *yy, N_int *mm, N_int *dd);
boolean valid_date(N_int date);
byteptr date_string(N_int date);

boolean check_date(N_int year, N_int mm, N_int dd);
long    calc_days(N_int year, N_int mm, N_int dd);
long    dates_difference(N_int year1, N_int mm1, N_int dd1,
                         N_int year2, N_int mm2, N_int dd2);
N_int   day_of_week(N_int year, N_int mm, N_int dd);
void    calc_new_date(N_int *year, N_int *mm, N_int *dd, long offset);

byteptr date_to_short(N_int year, N_int mm, N_int dd);
byteptr date_to_string(N_int year, N_int mm, N_int dd);

N_int   week_number(N_int year, N_int mm, N_int dd);
void    first_in_week(N_int week, N_int *year, N_int *mm, N_int *dd);
N_int   weeks_in_year(N_int year);

boolean decode_date(byteptr buffer, N_int *year, N_int *mm, N_int *dd);
*/
/**************************************/
/* RESOURCES                          */
/**************************************/

N_char  day_short[7][4] =
    {
        "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
    };

N_char  day_name[7][16] =
    {
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday",
        "Sunday"
    };

N_char  month_short[13][4] =    /* abbreviations must be unique! */
    {
        "Err",
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    };

N_char  month_name[13][16] =
    {
        "Error",
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    };

blockdef(rsrc_date_001,16) = "<no date>";   /* short form, exactly 9 chars long */
blockdef(rsrc_date_002,32) = "<no date>";   /* short form */
blockdef(rsrc_date_003,64) = "<no date>";   /* verbose form */

/**************************************/
/* IMPLEMENTATION                     */
/**************************************/

static  N_int   month_length[2][13] =
    {
        { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 },
        { 0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
    };

static  N_int   days_in_months[2][14] =
    {
        { 0, 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365 },
        { 0, 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366 }
    };

#define     YEAR0       70              /* year of reference */
#define     CENT0       1900            /* century of reference */

/****************************************************************************/

boolean leap(N_int year)
{
    return((((year % 4) == 0) and ((year % 100) != 0)) or ((year % 400) == 0));
}

static long year_to_days(N_int year)
{
    return( year * 365L + (year / 4) - (year / 100) + (year / 400) );
}
/****************************************************************************/

N_int encode(N_int yy, N_int mm, N_int dd)
{
    N_int year;

    if ((yy >= CENT0+YEAR0) and (yy < CENT0+100+YEAR0))
    {
        year = yy;
        yy -= CENT0+YEAR0;
    }
    else
    {
        if ( /* (yy < 0) or */ (yy > 99)) return(0);
        if (yy < YEAR0)
        {
            year = CENT0 + 100 + yy;
            yy += 100-YEAR0;
        }
        else
        {
            year = CENT0 + yy;
            yy -= YEAR0;
        }
    }
    if ((mm < 1) or (mm > 12)) return(0);
    if ((dd < 1) or (dd > month_length[leap(year)][mm])) return(0);
    return( (yy SHL 9) OR (mm SHL 5) OR dd );
}

void decode(N_int date, N_int *cc, N_int *yy, N_int *mm, N_int *dd)
{
    if (date > 0)
    {
        *yy = date SHR 9;
        *mm = (date AND 0x01FF) SHR 5;
        *dd = date AND 0x001F;

        if (*yy < 100-YEAR0)
        {
            *cc = CENT0;
            *yy += YEAR0;
        }
        else
        {
            *cc = CENT0+100;
            *yy -= 100-YEAR0;
        }
    }
    else
    {
        *cc = *yy = *mm = *dd = 0;
    }
}

boolean valid_date(N_int date)
{
    N_int cc;
    N_int yy;
    N_int mm;
    N_int dd;

    if (date > 0)
    {
        decode(date, &cc, &yy, &mm, &dd);
        return(date == encode(cc+yy, mm, dd));
    }
    else return(false);
}

byteptr date_string(N_int date)
{
    N_int cc;
    N_int yy;
    N_int mm;
    N_int dd;
    byteptr datestr;

    datestr = (byteptr) malloc(16);
    if (datestr == NULL) return(NULL);
    if (date > 0)
    {
        decode(date, &cc, &yy, &mm, &dd);
        if (date == encode(cc+yy, mm, dd))
        {
            sprintf((char *)datestr,"%02d-%s-%02d",dd,month_short[mm],yy);
            return(datestr);
        }
    }
    strcpy((char *)datestr,(char *)rsrc_date_001);
    return(datestr);
}
/****************************************************************************/

boolean check_date(N_int year, N_int mm, N_int dd)
{
    if (year < 1) return(false);
    if ((mm < 1) or (mm > 12)) return(false);
    if ((dd < 1) or (dd > month_length[leap(year)][mm])) return(false);
    return(true);
}

long calc_days(N_int year, N_int mm, N_int dd)
{
    boolean lp;

    if (year < 1) return(0L);
    if ((mm < 1) or (mm > 12)) return(0L);
    if ((dd < 1) or (dd > month_length[(lp = leap(year))][mm])) return(0L);
    return( year_to_days(--year) + days_in_months[lp][mm] + dd );
}

long dates_difference(N_int year1, N_int mm1, N_int dd1,
                      N_int year2, N_int mm2, N_int dd2)
{
    return( calc_days(year2, mm2, dd2) - calc_days(year1, mm1, dd1) );
}

N_int day_of_week(N_int year, N_int mm, N_int dd)
{
    return( (N_int) ( (calc_days(year, mm, dd) - 1L) % 7L ) );
}

void calc_new_date(N_int *year, N_int *mm, N_int *dd, long offset)
{
    long    days;
    boolean lp;

    if (((days = calc_days(*year, *mm, *dd)) > 0L) and ((days += offset) > 0L))
    {
        *year = (N_int) ( days / 365.2425 );
        *dd = (N_int) ( days - year_to_days(*year) );
        if (*dd < 1)
        {
            *dd = (N_int) ( days - year_to_days(*year-1) );
        }
        else (*year)++;
        lp = leap(*year);
        if (*dd > days_in_months[lp][13])
        {
            *dd -= days_in_months[lp][13];
            lp = leap(++(*year));
        }
        for ( *mm=12; *mm>0; (*mm)-- )
        {
            if (*dd > days_in_months[lp][*mm])
            {
                *dd -= days_in_months[lp][*mm];
                break;
            }
        }
    }
    else
    {
        *year = *mm = *dd = 0;
    }
}
/****************************************************************************/

byteptr date_to_short(N_int year, N_int mm, N_int dd)
{
    byteptr datestr;

    datestr = (byteptr) malloc(32);
    if (datestr == NULL) return(NULL);
    if (check_date(year,mm,dd))
        sprintf((char *)datestr,"%s %d-%s-%d",
            day_short[day_of_week(year,mm,dd)],
            dd,month_short[mm],year);
    else
        strcpy((char *)datestr,(char *)rsrc_date_002);
    return(datestr);
}

byteptr date_to_string(N_int year, N_int mm, N_int dd)
{
    byteptr datestr;

    datestr = (byteptr) malloc(64);
    if (datestr == NULL) return(NULL);
    if (check_date(year,mm,dd))
        sprintf((char *)datestr,"%s, %d %s %d",
            day_name[day_of_week(year,mm,dd)],
            dd,month_name[mm],year);
    else
        strcpy((char *)datestr,(char *)rsrc_date_003);
    return(datestr);
}
/****************************************************************************/

N_int week_number(N_int year, N_int mm, N_int dd)
{
    N_int first;

    first = day_of_week(year,1,1);
    return( (N_int) ( (dates_difference(year,1,1, year,mm,dd) + first) / 7L ) +
      (first < 4) );
}

void first_in_week(N_int week, N_int *year, N_int *mm, N_int *dd)
{
    N_int first;

    *mm = *dd = 1;
    first = day_of_week(*year,1,1);
    if (first < 4) week--;
    calc_new_date(year, mm, dd, (week * 7L - first) );
}

N_int weeks_in_year(N_int year)
{
    return(52 + ((day_of_week(year,1,1)==3) or (day_of_week(year,12,31)==3)));
}
/****************************************************************************/

static boolean scan(byteptr s, int len, int i, boolean alpha)
{
    if ((s != NULL) and (i >= 0) and (i < len))
        return( (isdigit(s[i]) != 0) XOR alpha );
    else
        return( false );
}

static boolean scanx(byteptr s, int len, int i, boolean delim)
{
    if ((s != NULL) and (i >= 0) and (i < len))
        return( (isalnum(s[i]) != 0) XOR delim );
    else
        return( false );
}

static N_int getval(byteptr src, int len)
{
    blockdef(buf,5);

    if (len > 0)
    {
        if (len > 4) len = 4;
        memcpy(buf,src,len);
        buf[len] = '\0';
        return( atoi((char *)buf) );
    }
    else return(0);
}

static N_int decode_month(byteptr buf, int len)  /* 0 = unable to decode month */
{
    int     i,j;
    N_int   month;
    boolean same;
    boolean ok;

    month = 0;
    ok = (len > 0);
    if (len > 3) len = 3;
    for ( i=1; ok and (i<13); i++ )
    {
        same = true;
        for ( j=0; same and (j<len); j++ )
        {
            same = ( toupper(buf[j]) == toupper(month_short[i][j]) );
        }
        if (same)
        {
            if (month)
                ok = false;
            else
                month = (N_int) i;
        }
    }
    if (ok) return(month);
    else return(0);
}

boolean decode_date(byteptr buffer, N_int *year, N_int *mm, N_int *dd)
{
    int i,j;
    int buflen;

    *year = *mm = *dd = 0;
    buflen = strlen((char *)buffer);
    if (buflen > 0)
    {
        i = 0;
        while (scan(buffer,buflen,i,true)) i++;
        j = buflen-1;
        while (scan(buffer,buflen,j,true)) j--;
        if (i+1 < j)        /* at least 3 chars, else error! */
        {
            buffer += i;
            buflen = j-i+1;
            i = 0;
            while (scan(buffer,buflen,i,false)) i++;
            j = buflen-1;
            while (scan(buffer,buflen,j,false)) j--;
            if (j < i)  /* only numerical chars without delimiters */
            {
                switch (buflen)
                {
                case 3:
                    *dd = getval(buffer,1);
                    *mm = getval(buffer+1,1);
                    *year = getval(buffer+2,1);
                    break;
                case 4:
                    *dd = getval(buffer,1);
                    *mm = getval(buffer+1,1);
                    *year = getval(buffer+2,2);
                    break;
                case 5:
                    *dd = getval(buffer,1);
                    *mm = getval(buffer+1,2);
                    *year = getval(buffer+3,2);
                    break;
                case 6:
                    *dd = getval(buffer,2);
                    *mm = getval(buffer+2,2);
                    *year = getval(buffer+4,2);
                    break;
                case 7:
                    *dd = getval(buffer,1);
                    *mm = getval(buffer+1,2);
                    *year = getval(buffer+3,4);
                    break;
                case 8:
                    *dd = getval(buffer,2);
                    *mm = getval(buffer+2,2);
                    *year = getval(buffer+4,4);
                    break;
                default:
                    return(false);
                    break;
                }
            }
            else        /* at least one non-numerical character (i <= j) */
            {
                if ((i > 0) and (i < 3) and (j < buflen-1) and (j > buflen-6))
                {
                    *dd = getval(buffer,i);
                    *year = getval(buffer+(j+1),buflen-(j+1));
                    while (scanx(buffer,buflen,i,true)) i++;
                    while (scanx(buffer,buflen,j,true)) j--;
                    if ((j-i >= 0) and (j-i < 3))   /* month length = 1..3 */
                    {
                        buffer += i;
                        buflen = j-i+1;
                        i = 0;
                        while (scanx(buffer,buflen,i,false)) i++;
                        if (i >= buflen)    /* ok, no more delimiters */
                        {
                            i = 0;
                            while (scan(buffer,buflen,i,false)) i++;
                            if (i >= buflen)    /* only digits for month */
                            {
                                if (buflen < 3) /* length ok */
                                {
                                    *mm = getval(buffer,buflen);
                                }
                                else return(false); /* month too long */
                            }
                            else                /* try abbreviations for month */
                            {
                                *mm = decode_month(buffer,buflen);
                            }
                        }
                        else return(false); /* delimiters inside month string */
                    }
                    else return(false); /* error in month length */
                }
                else return(false); /* error in numeric substring lengths */
            } /* at least one non-numerical character (i <= j) */
        }
        else return(false); /* less than 3 chars in buffer */
    }
    else return(false); /* buflen <= 0 */
    if (*year < 100)
    {
        /* if (*year < YEAR0) *year += 100; */
        *year += CENT0;
    }
    return(check_date(*year,*mm,*dd));
}
/**************************************/
/* PROGRAMMER   Steffen Beyer         */
/**************************************/
/* CREATED      01.11.93              */
/**************************************/
/* MODIFIED     21.11.95              */
/**************************************/
/* COPYRIGHT    Steffen Beyer         */
/**************************************/
#endif
