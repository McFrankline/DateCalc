#ifndef DATE_CALCULATIONS
#define DATE_CALCULATIONS
/**************************************/
/* MODULE   lib_date.h          (lib) */
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

boolean leap(N_int year);

N_int   encode(N_int yy, N_int mm, N_int dd);
void    decode(N_int date, N_int *cc, N_int *yy, N_int *mm, N_int *dd);
boolean valid_date(N_int date);
byteptr date_string(N_int date);    /* exactly 9 chars long */

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

/**************************************/
/* RESOURCES                          */
/**************************************/

extern N_char  day_short[7][4];
/*
    {
        "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
    };
*/

extern N_char  day_name[7][16];
/*
    {
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday",
        "Sunday"
    };
*/

extern N_char  month_short[13][4];     /* abbreviations must be unique! */
/*
    {
        "Err",
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    };
*/

extern N_char  month_name[13][16];
/*
    {
        "Error",
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    };
*/

extern blockdef(rsrc_date_001,16); /* "<no date>";   short form, exactly 9 chars long */
extern blockdef(rsrc_date_002,32); /* "<no date>";   short form */
extern blockdef(rsrc_date_003,64); /* "<no date>";   verbose form */

/**************************************/
/* IMPLEMENTATION                     */
/**************************************/

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
