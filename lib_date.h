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

N_int   compress(N_int yy, N_int mm, N_int dd);
void    uncompress(N_int date, N_int *cc, N_int *yy, N_int *mm, N_int *dd);
boolean check_compressed(N_int date);
byteptr compressed_to_short(N_int date);

boolean check_date(N_int year, N_int mm, N_int dd);
Z_long  calc_days(N_int year, N_int mm, N_int dd);
N_int   day_of_week(N_int year, N_int mm, N_int dd);
Z_long  dates_difference(N_int year1, N_int mm1, N_int dd1,
                         N_int year2, N_int mm2, N_int dd2);
void    calc_new_date(N_int *year, N_int *mm, N_int *dd, Z_long offset);

void    date_time_difference
(
    Z_long *days, Z_int *hh, Z_int *mm, Z_int *ss,
    N_int year1, N_int month1, N_int day1, N_int hh1, N_int mm1, N_int ss1,
    N_int year2, N_int month2, N_int day2, N_int hh2, N_int mm2, N_int ss2
);
void    calc_new_date_time
(
    N_int *year, N_int *month, N_int *day, N_int *hh, N_int *mm, N_int *ss,
    Z_long days_offset, Z_long hh_offset, Z_long mm_offset, Z_long ss_offset
);

byteptr date_to_short(N_int year, N_int mm, N_int dd);
byteptr date_to_string(N_int year, N_int mm, N_int dd);

N_int   week_number(N_int year, N_int mm, N_int dd);
void    first_in_week(N_int week, N_int *year, N_int *mm, N_int *dd);
N_int   weeks_in_year(N_int year);

N_int   decode_day(byteptr buffer, N_int len);
N_int   decode_month(byteptr buffer, N_int len);
boolean decode_date(byteptr buffer, N_int *year, N_int *mm, N_int *dd);

/**************************************/
/* RESOURCES                          */
/**************************************/

extern N_int   month_length[2][13];
/*
    {
        { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 },
        { 0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
    };
*/

extern N_char  day_name[8][16];
/*
    {
        "Error", "Monday", "Tuesday", "Wednesday",
        "Thursday", "Friday", "Saturday", "Sunday"
    };
*/

extern N_char  month_name[13][16];
/*
    {
        "Error", "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    };
*/

extern blockdef(rsrc_date_001,16); /* = "<no date>"; exactly 9 chars long */
extern blockdef(rsrc_date_002,32); /* = "<no date>"; short form */
extern blockdef(rsrc_date_003,64); /* = "<no date>"; verbose form */

/**************************************/
/* IMPLEMENTATION                     */
/**************************************/

/**************************************/
/* PROGRAMMER   Steffen Beyer         */
/**************************************/
/* CREATED      01.11.93              */
/**************************************/
/* MODIFIED     25.05.96              */
/**************************************/
/* COPYRIGHT    Steffen Beyer         */
/**************************************/
#endif
