/*
  Copyright (c) 1995 Steffen Beyer. All rights reserved.
  This program is free software; you can redistribute it and/or
  modify it under the same terms as Perl itself.
*/

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "lib_date.c"


MODULE = Date::DateCalc		PACKAGE = Date::DateCalc


boolean
leap(year)
    N_int	year


N_int
encode(yy,mm,dd)
    N_int	yy
    N_int	mm
    N_int	dd


void
decode(date)
    N_int	date
    PPCODE:
    {
        N_int	cc;
        N_int	yy;
        N_int	mm;
        N_int	dd;
        decode(date,&cc,&yy,&mm,&dd);
        EXTEND(SP,4);
        PUSHs(sv_2mortal(newSVnv(cc)));
        PUSHs(sv_2mortal(newSVnv(yy)));
        PUSHs(sv_2mortal(newSVnv(mm)));
        PUSHs(sv_2mortal(newSVnv(dd)));
    }


boolean
valid_date(date)
    N_int	date


void
date_string(date)
    N_int	date
    PPCODE:
    {
        byteptr	datestr;
        datestr = date_string(date);
        if (datestr != NULL)
        {
            EXTEND(SP,1);
            PUSHs(sv_2mortal(newSVpv((char *)datestr,0)));
            free(datestr);
        }
    }


boolean
check_date(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd


long
calc_days(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd


long
dates_difference(year1,mm1,dd1,year2,mm2,dd2)
    N_int	year1
    N_int	mm1
    N_int	dd1
    N_int	year2
    N_int	mm2
    N_int	dd2


N_int
day_of_week(year,mm,dd)
    N_int	year
    N_int	mm
    N_int	dd


void
calc_new_date(year,mm,dd,offset)
    N_int	year
    N_int	mm
    N_int	dd
    long	offset
    PPCODE:
    {
        N_int	y;
        N_int	m;
        N_int	d;
        y = year;
        m = mm;
        d = dd;
        calc_new_date(&y,&m,&d,offset);
        EXTEND(SP,3);
        PUSHs(sv_2mortal(newSVnv(y)));
        PUSHs(sv_2mortal(newSVnv(m)));
        PUSHs(sv_2mortal(newSVnv(d)));
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
            EXTEND(SP,1);
            PUSHs(sv_2mortal(newSVpv((char *)datestr,0)));
            free(datestr);
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
            EXTEND(SP,1);
            PUSHs(sv_2mortal(newSVpv((char *)datestr,0)));
            free(datestr);
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
        EXTEND(SP,2);
        PUSHs(sv_2mortal(newSVnv(ww)));
        PUSHs(sv_2mortal(newSVnv(yy)));
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
        EXTEND(SP,3);
        PUSHs(sv_2mortal(newSVnv(yy)));
        PUSHs(sv_2mortal(newSVnv(mm)));
        PUSHs(sv_2mortal(newSVnv(dd)));
    }


N_int
weeks_in_year(year)
    N_int	year
 

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
        EXTEND(SP,3);
        PUSHs(sv_2mortal(newSVnv(year)));
        PUSHs(sv_2mortal(newSVnv(mm)));
        PUSHs(sv_2mortal(newSVnv(dd)));
    }


void
day_short_tab(dd)
    N_int	dd
    PPCODE:
    {
        dd %= 7;
        EXTEND(SP,1);
        PUSHs(sv_2mortal(newSVpv((char *)day_short[dd],0)));
    }


void
day_name_tab(dd)
    N_int	dd
    PPCODE:
    {
        dd %= 7;
        EXTEND(SP,1);
        PUSHs(sv_2mortal(newSVpv((char *)day_name[dd],0)));
    }


void
month_short_tab(mm)
    N_int	mm
    PPCODE:
    {
        mm %= 13;
        EXTEND(SP,1);
        PUSHs(sv_2mortal(newSVpv((char *)month_short[mm],0)));
    }


void
month_name_tab(mm)
    N_int	mm
    PPCODE:
    {
        mm %= 13;
        EXTEND(SP,1);
        PUSHs(sv_2mortal(newSVpv((char *)month_name[mm],0)));
    }


void
Version()
    PPCODE:
    {
        EXTEND(SP,1);
        PUSHs(sv_2mortal(newSVpv("1.2a",0)));
    }


