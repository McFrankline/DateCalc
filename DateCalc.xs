/*
  Copyright (c) 1996 Steffen Beyer. All rights reserved.
  This program is free software; you can redistribute it and/or
  modify it under the same terms as Perl itself.
*/

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <string.h>
#include "lib_defs.h"
#include "lib_date.h"


MODULE = Date::DateCalc		PACKAGE = Date::DateCalc


PROTOTYPES: DISABLE


boolean
leap(year)
    N_int	year


N_int
compress(yy,mm,dd)
    N_int	yy
    N_int	mm
    N_int	dd


void
uncompress(date)
    N_int	date
    PPCODE:
    {
        N_int	cc;
        N_int	yy;
        N_int	mm;
        N_int	dd;
        uncompress(date,&cc,&yy,&mm,&dd);
        EXTEND(sp,4);
        PUSHs(sv_2mortal(newSViv((IV)cc)));
        PUSHs(sv_2mortal(newSViv((IV)yy)));
        PUSHs(sv_2mortal(newSViv((IV)mm)));
        PUSHs(sv_2mortal(newSViv((IV)dd)));
    }


boolean
check_compressed(date)
    N_int	date


void
compressed_to_short(date)
    N_int	date
    PPCODE:
    {
        byteptr	datestr;
        datestr = compressed_to_short(date);
        if (datestr != NULL)
        {
            EXTEND(sp,1);
            PUSHs(sv_2mortal(newSVpv((char *)datestr,0)));
            annihilate(datestr);
        }
    }


boolean
check_date(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd


Z_long
calc_days(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd


N_int
day_of_week(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd


Z_long
dates_difference(year1,mm1,dd1,year2,mm2,dd2)
    N_int	year1
    N_int	mm1
    N_int	dd1
    N_int	year2
    N_int	mm2
    N_int	dd2


void
calc_new_date(year,mm,dd,offset)
    N_int	year
    N_int	mm
    N_int	dd
    Z_long	offset
    PPCODE:
    {
        N_int	y;
        N_int	m;
        N_int	d;
        y = year;
        m = mm;
        d = dd;
        calc_new_date(&y,&m,&d,offset);
        EXTEND(sp,3);
        PUSHs(sv_2mortal(newSViv((IV)y)));
        PUSHs(sv_2mortal(newSViv((IV)m)));
        PUSHs(sv_2mortal(newSViv((IV)d)));
    }


void
date_time_difference(year1,month1,day1,hh1,mm1,ss1,year2,month2,day2,hh2,mm2,ss2)
    N_int	year1;
    N_int	month1;
    N_int	day1;
    N_int	hh1;
    N_int	mm1;
    N_int	ss1;
    N_int	year2;
    N_int	month2;
    N_int	day2;
    N_int	hh2;
    N_int	mm2;
    N_int	ss2;
    PPCODE:
    {
        Z_long	days;
        Z_int	hh;
        Z_int	mm;
        Z_int	ss;
        date_time_difference(&days,&hh,&mm,&ss,year1,month1,day1,hh1,mm1,ss1,year2,month2,day2,hh2,mm2,ss2);
        EXTEND(sp,4);
        PUSHs(sv_2mortal(newSViv((IV)days)));
        PUSHs(sv_2mortal(newSViv((IV)hh)));
        PUSHs(sv_2mortal(newSViv((IV)mm)));
        PUSHs(sv_2mortal(newSViv((IV)ss)));
    }


void
calc_new_date_time(year,month,day,hour,min,sec,days_offset,hh_offset,mm_offset,ss_offset)
    N_int	year;
    N_int	month;
    N_int	day;
    N_int	hour;
    N_int	min;
    N_int	sec;
    Z_long	days_offset;
    Z_long	hh_offset;
    Z_long	mm_offset;
    Z_long	ss_offset;
    PPCODE:
    {
        N_int	yy;
        N_int	mm;
        N_int	dd;
        N_int	h;
        N_int	m;
        N_int	s;
        yy = year;
        mm = month;
        dd = day;
        h = hour;
        m = min;
        s = sec;
        calc_new_date_time(&yy,&mm,&dd,&h,&m,&s,days_offset,hh_offset,mm_offset,ss_offset);
        EXTEND(sp,6);
        PUSHs(sv_2mortal(newSViv((IV)yy)));
        PUSHs(sv_2mortal(newSViv((IV)mm)));
        PUSHs(sv_2mortal(newSViv((IV)dd)));
        PUSHs(sv_2mortal(newSViv((IV)h)));
        PUSHs(sv_2mortal(newSViv((IV)m)));
        PUSHs(sv_2mortal(newSViv((IV)s)));
    }


void
date_to_short(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd
    PPCODE:
    {
        byteptr	datestr;
        datestr = date_to_short(year,mm,dd);
        if (datestr != NULL)
        {
            EXTEND(sp,1);
            PUSHs(sv_2mortal(newSVpv((char *)datestr,0)));
            annihilate(datestr);
        }
    }


void
date_to_string(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd
    PPCODE:
    {
        byteptr	datestr;
        datestr = date_to_string(year,mm,dd);
        if (datestr != NULL)
        {
            EXTEND(sp,1);
            PUSHs(sv_2mortal(newSVpv((char *)datestr,0)));
            annihilate(datestr);
        }
    }


void
week_number(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd
    PPCODE:
    {
        N_int	yy;
        N_int	ww;
        yy = year;
        ww = week_number(yy,mm,dd);
        if (ww == 0) ww = weeks_in_year(--yy);
        else if (ww > weeks_in_year(yy))
        {
            ww = 1;
            yy++;
        }
        EXTEND(sp,2);
        PUSHs(sv_2mortal(newSViv((IV)ww)));
        PUSHs(sv_2mortal(newSViv((IV)yy)));
    }


void
first_in_week(week,year)
    N_int	week
    N_int	year
    PPCODE:
    {
        N_int	yy;
        N_int	mm;
        N_int	dd;
        yy = year;
        mm = dd = 0;
        first_in_week(week,&yy,&mm,&dd);
        EXTEND(sp,3);
        PUSHs(sv_2mortal(newSViv((IV)yy)));
        PUSHs(sv_2mortal(newSViv((IV)mm)));
        PUSHs(sv_2mortal(newSViv((IV)dd)));
    }


N_int
weeks_in_year(year)
    N_int	year
 

N_int
decode_day(buffer)
    byteptr	buffer
    CODE:
        RETVAL = decode_day(buffer,strlen((char *)buffer));
    OUTPUT:
        RETVAL


N_int
decode_month(buffer)
    byteptr	buffer
    CODE:
        RETVAL = decode_month(buffer,strlen((char *)buffer));
    OUTPUT:
        RETVAL


void
decode_date(buffer)
    byteptr	buffer
    PPCODE:
    {
        N_int	year;
        N_int	mm;
        N_int	dd;
        if (!decode_date(buffer,&year,&mm,&dd))
        {
            year = mm = dd = 0;
        }
        EXTEND(sp,3);
        PUSHs(sv_2mortal(newSViv((IV)year)));
        PUSHs(sv_2mortal(newSViv((IV)mm)));
        PUSHs(sv_2mortal(newSViv((IV)dd)));
    }


void
day_name_tab(dd)
    N_int	dd
    PPCODE:
    {
        dd %= 8;
        EXTEND(sp,1);
        PUSHs(sv_2mortal(newSVpv((char *)day_name[dd],0)));
    }


void
month_name_tab(mm)
    N_int	mm
    PPCODE:
    {
        mm %= 13;
        EXTEND(sp,1);
        PUSHs(sv_2mortal(newSVpv((char *)month_name[mm],0)));
    }


void
days_in_month(year,mm)
    N_int	year
    N_int	mm
    PPCODE:
    {
        mm %= 13;
        EXTEND(sp,1);
        PUSHs(sv_2mortal(newSViv((IV)month_length[leap(year)][mm])));
    }


void
Version()
    PPCODE:
    {
        EXTEND(sp,1);
        PUSHs(sv_2mortal(newSVpv("2.3",0)));
    }


