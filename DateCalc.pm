
#  Copyright (c) 1996 Steffen Beyer. All rights reserved.
#  This program is free software; you can redistribute it and/or
#  modify it under the same terms as Perl itself.

package Date::DateCalc;

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

@EXPORT_OK = qw( leap compress uncompress check_compressed compressed_to_short check_date calc_days day_of_week dates_difference calc_new_date date_time_difference calc_new_date_time date_to_short date_to_string week_number first_in_week weeks_in_year day_name_tab month_name_tab decode_day decode_month decode_date days_in_month );

%EXPORT_TAGS = (all => [@EXPORT_OK]);

# "Version" is available but not exported!
# Call with "Date::DateCalc::Version()"!

$VERSION = '2.2';

bootstrap Date::DateCalc $VERSION;

1;

__END__

=head1 NAME

Date::DateCalc - Date Calculations

in compliance with ISO/R 2015-1971 and DIN 1355 standards

=head1 SYNOPSIS

C<use Date::DateCalc;>

(in which case you must fully qualify every function with the
name of this module, i.e. C<$flag = Date::DateCalc::leap($year)>)

or

C<use Date::DateCalc>
C<qw( leap compress uncompress check_compressed compressed_to_short>
C<check_date calc_days day_of_week dates_difference calc_new_date>
C<date_time_difference calc_new_date_time date_to_short date_to_string>
C<week_number first_in_week weeks_in_year day_name_tab month_name_tab>
C<decode_day decode_month decode_date days_in_month );>

(or only portions thereof, whatever you need)

or

C<use DateCalc qw(:all);>

(which imports everything)

=head1 DESCRIPTION

=head2 ===========

=head2 Convention:

=head2 ===========

In the following, "$year" stands for a "complete" year number
(like "1995", for instance), whereas "$yy" may be an abbreviated
year number (like "95") OR a complete year number.

Year numbers must be positive integers (greater than zero).

"$mm" stands for the number of a month (from 1 to 12), and "$dd"
is the number of a day in a month (from 1 to 28,29,30 or 31,
depending on the month and the year).

Hint: The functions that support abbreviated year numbers are
the functions whose names contain the word "compress" and the
function "decode_date".

=head2   ====================

=head2 C<$flag = leap($year);>

=head2   ====================

This function returns a boolean value which is "true" (1) if the
year "$year" is a leap year, and "false" (0) otherwise.

No check is made if the year "$year" is in the valid range.

For years less than 1, the result is probably meaningless (it IS
almost meaningless, anyway, for years before 1582).

=head2   ==============================

=head2 C<$date = compress($yy,$mm,$dd);>

=head2   ==============================

This function encodes a date in 16 bits. The encoding scheme is
as follows:

	Bit-No.:       FEDCBA9 8765 43210
	Contents:      yyyyyyy mmmm ddddd

All bits equal to zero is equivalent to "<no date>".

Through this encoding scheme, it is possible to COMPARE ENCODED
DATES for equality and ORDER (less than/greater than) WITHOUT
any previous DECODING!!

However, this function can only handle dates within one century.

This century can be biased at will by choosing a base century
and year. In this module, the base century is set to 1900 and
the base year to 70. (Standard on UNIX systems)

This allows the function to handle dates from 1970 up to 2069.

If the year "$yy" is equal to, say, 95, it is automatically
assumed that 1995 is meant. However, if you specify a year
number which is SMALLER than 70, like 64, for instance, it
is assumed that you meant 2064.

You are not confined to abbreviated year numbers (smaller than
100), however. The function also accepts complete year numbers,
provided that they are in the supported range (that is, from
1970 to 2069).

If no valid date is specified, zero is returned.

=head2   ======================================

=head2 C<($cc,$yy,$mm,$dd) = uncompress($date);>

=head2   ======================================

This function decodes dates that were encoded by "compress".
It returns the century, year, month and day of the date encoded
in "$date" in the variables "$cc", "$yy", "$mm" and "$dd",
respectively.

The expression "$cc + $yy" yields the complete year number (for
example, 1900 + 95 = 1995).

If "$date" is zero, all return values are zero as well.

Apart from this, no other checks are performed by this function.

=head2   ================================

=head2 C<$flag = check_compressed($date);>

=head2   ================================

This function returns a boolean value which is "true" (1) if
"$date" contains a valid encoded date, and "false" (0) otherwise.

When determining validity, leap years are taken into account,
i.e., the 29th of february is rejected in non-leap years.

=head2   ======================================

=head2 C<$datestr = compressed_to_short($date);>

=head2   ======================================

This function converts the encoded date in "$date" to a string
of the format "dd-mmm-yy", which is returned.

("mmm" is the 3-letter abbreviation (in english) of the month)

If the date in "$date" is invalid, the string "<no date>" is
returned.

Note that the string which is returned by this function is
always exactly 9 characters long.

=head2   ==================================

=head2 C<$flag = check_date($year,$mm,$dd);>

=head2   ==================================

This function returns a boolean value which is "true" (1) if the
three numbers "$year", "$mm" and "$dd" represent a valid date,
and "false" (0) otherwise.

When determining validity, leap years are taken into account,
i.e., the 29th of february is rejected in non-leap years.

Year numbers must be greater than zero (negative values will be
interpreted as large positive numbers due to their internal 2's
complement representation). A year number of zero is invalid.

=head2   =================================

=head2 C<$days = calc_days($year,$mm,$dd);>

=head2   =================================

This function returns the (theoretical) number of days between
the first of january of the year one and the given date.

The function doesn't take into account the change from the
Julian to the Gregorian calendar used today in 1582.

It is needed to calculate the difference in days between two
dates and the day of week.

Zero is returned if no valid date is specified.

=head2   ======================================

=head2 C<$weekday = day_of_week($year,$mm,$dd);>

=head2   ======================================

This function calculates the day of week for the given date
(which must be a valid date).

The return values have the following meaning:

		0       =       Error
		1       =       Monday
		2       =       Tuesday
		3       =       Wednesday
		4       =       Thursday
		5       =       Friday
		6       =       Saturday
		7       =       Sunday

The value zero is returned if the date is not valid.

=head2   ============================================================

=head2 C<$days = dates_difference($year1,$mm1,$dd1,$year2,$mm2,$dd2);>

=head2   ============================================================

This function calculates the difference in days between the two
given dates.

The function calculates the difference "date 2" - "date 1", i.e.,
you normally specify the two dates in chronological order.

If date 1 is later than date 2, the result will be negative,
which allows you to use this function to compare dates.

If one of the two dates is invalid, the result will degrade to
the value of the function "calc_days" for the other date. If
both dates are invalid, the result is zero.

=head2   =======================================================

=head2 C<($year,$mm,$dd) = calc_new_date($year,$mm,$dd,$offset);>

=head2   =======================================================

Starting from the given date, a new date can be calculated with
this function which is "$offset" days away from the original
date. "$offset" may be positive (for a date later than the
original date) or negative (for a date earlier than the given date).

If the date cannot be calculated (for instance, if the given
date is invalid or the new date would be before the year one),
only zeros are returned.

=head2   ===========================================

=head2 C<($days,$hh,$mm,$ss) = date_time_difference( $year1,$month1,$day1,$hh1,$mm1,$ss1, $year2,$month2,$day2,$hh2,$mm2,$ss2 );>

=head2   ===========================================

This function calculates the difference in days, hours, minutes
and seconds between the two given dates.

The function calculates the difference "date 2" - "date 1", i.e.,
you normally specify the two dates in chronological order.

If date 1 is later than date 2, the result will be negative
in every of the four return values, which allows you to use
this function to compare dates and to feed its output into
the function explained next in this text, "calc_new_date_time".

If one of the two date/time pairs is invalid, the result will
degrade to the value of the other date/time argument, converted
to days, hours, minutes and seconds. If both date/time pairs are
invalid, the result is zero in every return value.

A date/time pair is invalid either when the date is invalid or
when the values for hour, minute and second are outside the range
of 0..23, 0..59 and 0..59, respectively.

=head2   =====================================================

=head2 C<($year,$month,$day,$hh,$mm,$ss) = calc_new_date_time( $year,$month,$day,$hh,$mm,$ss, $days_offset,$hh_offset,$mm_offset,$ss_offset );>

=head2   =====================================================

Starting from the given date and time, a new date and time can
be calculated with this function.

The new date will be "$days_offset" days and "$hh_offset" hours,
"$mm_offset" minutes and "$ss_offset" seconds away from the
original date. The values of these four offsets may be positive or
negative, independently from each other. This means that you can
add, for instance, 9 hours and subtract 5 minutes at the same time.

If the new date and time cannot be calculated (for instance, if
the given date is invalid or the new date would be before the year
one, or the values for hour, minute and second are outside the
range of 0..23, 0..59 and 0..59, respectively), only zeros are
returned in all return values.

=head2   ========================================

=head2 C<$datestr = date_to_short($year,$mm,$dd);>

=head2   ========================================

This function converts the given date to a string of the format
"www dd-mmm-yyyy", which is returned.

"www" is a (3-letter) abbreviation of the day of week, and "mmm"
is a (3-letter) abbreviation of the month (both in english).

If the given date is invalid, the string "<no date>" is returned.

=head2   =========================================

=head2 C<$datestr = date_to_string($year,$mm,$dd);>

=head2   =========================================

This function converts the given date to a string of the format
"wwwwwwwww, dd mmmmmmmmm yyyy", which is returned.

"wwwwwwwww" is the day of week and "mmmmmmmmm" the name of the
month (both in english).

If the given date is invalid, the string "<no date>" is returned.

=head2   ===========================================

=head2 C<($week,$year) = week_number($year,$mm,$dd);>

=head2   ===========================================

This function calculates the number of the week in which the
given date lies.

This can occasionally be the last week of the previous year
or the first week of the next year.

=head2   =============================================

=head2 C<($year,$mm,$dd) = first_in_week($week,$year);>

=head2   =============================================

This function calculates the date of the first day (the Monday)
of the given week in the given year.

The return value "$year" is adjusted accordingly if the first
day of the given week lies in the previous or next year (also
if the given week number is greater than the number of weeks in
the given year!).

If the date cannot be calculated (for instance, if the calculated
date would be before the year one), only zeros are returned.

With help of the expression

	($year,$mm,$dd) = first_in_week(week_number($year,$mm,$dd));

it is possible to easily calculate the date of the Monday belonging
to the week in which the given date lies.

Alternatively, the expression

	($year,$mm,$dd) =
	calc_new_date($year,$mm,$dd,-day_of_week($year,$mm,$dd)+1);

can be used to achieve the same effect.

=head2   ==============================

=head2 C<$weeks = weeks_in_year($year);>

=head2   ==============================

This function returns the number of weeks of the given year
(52 or 53 weeks).

No check is made if the year "$year" is in the valid range.

For years less than 1, the result is probably meaningless.

=head2   ===================================

=head2 C<$day_name = day_name_tab($weekday);>

=head2   ===================================

This function accesses the internal table of the days of week.

It returns the corresponding string for each numeric value of a
day of week (as returned by the function "day_of_week").

The value of "$weekday" is taken modulo 8 (!) internally to prevent
out-of-range access to the internal array.

The strings which are returned are the following:

		0       =>      Error
		1       =>      Monday
		2       =>      Tuesday
		3       =>      Wednesday
		4       =>      Thursday
		5       =>      Friday
		6       =>      Saturday
		7       =>      Sunday

=head2   =====================================

=head2 C<$month_name = month_name_tab($month);>

=head2   =====================================

This function accesses the internal table of the months' names.

It returns the corresponding string for each numeric value of a
month.

The value of "$month" is taken modulo 13 (!) internally to prevent
out-of-range access to the internal array.

The strings which are returned are the following:

		 0       =>      Error
		 1       =>      January
		 2       =>      February
		 3       =>      March
		 4       =>      April
		 5       =>      May
		 6       =>      June
		 7       =>      July
		 8       =>      August
		 9       =>      September
		10       =>      October
		11       =>      November
		12       =>      December

=head2   ===============================

=head2 C<$weekday = decode_day($buffer);>

=head2   ===============================

This function provides the inverse of the function "day_name_tab".

Whereas "day_name_tab" takes a number as its argument and returns
a string, "decode_day" takes a string (of any length) and tries
to match it with the table of the names of days (Monday, Tuesday,
and so on) and returns the corresponding number (1..7).

Only the first 3 characters are checked (in case-insensitive
manner) for a unique match. If it uniquely identifies the day,
one or two characters are sufficient:

    Name of the day:     Uniquely identified by:     Value returned:

           Monday        M, Mo, Mon, ... Monday            1
           Tuesday          Tu, Tue, ... Tuesday           2
           Wednesday     W, We, Wed, ... Wednesday         3
           Thursday         Th, Thu, ... Thursday          4
           Friday        F, Fr, Fri, ... Friday            5
           Saturday         Sa, Sat, ... Saturday          6
           Sunday           Su, Sun, ... Sunday            7

If there is no match, zero is returned.

This function is roughly equivalent to an associative array:

	%day_tab = ( 'Mon' => 1, 'Tue' => 2, 'Wed' => 3, 'Thu' => 4,
	             'Fri' => 5, 'Sat' => 6, 'Sun' => 7);

	$weekday = $day_tab{$buffer};

except for the capability of recognizing abbreviations and
to be case-independent.

=head2   ===============================

=head2 C<$month = decode_month($buffer);>

=head2   ===============================

This function provides the inverse of the function "month_name_tab".

Whereas "month_name_tab" takes a number as its argument and returns
a string, "decode_month" takes a string (of any length) and tries
to match it with the table of the names of months (January, February,
and so on) and returns the corresponding number (1..12).

Only the first 3 characters are checked (in case-insensitive
manner) for a unique match. If it uniquely identifies the month,
one or two characters are sufficient:

    Name of the month:     Uniquely identified by:     Value returned:

             January          Ja, Jan, ... January           1
             February      F, Fe, Feb, ... February          2
             March                Mar, ... March             3
             April            Ap, Apr, ... April             4
             May                  May, ... May               5
             June                 Jun, ... June              6
             July                 Jul, ... July              7
             August           Au, Aug, ... August            8
             September     S, Se, Sep, ... September         9
             October       O, Oc, Oct, ... October          10
             November      N, No, Nov, ... November         11
             December      D, De, Dec, ... December         12

If there is no match, zero is returned.

This function is roughly equivalent to an associative array:

	%month_tab = ( 'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4,
	               'May' => 5, 'Jun' => 6, 'Jul' => 7, 'Aug' => 8,
	               'Sep' => 9, 'Oct' => 10, 'Nov' => 11, 'Dec' => 12);

	$month = $month_tab{$buffer};

except for the capability of recognizing abbreviations and
to be case-independent.

=head2   =======================================

=head2 C<($year,$mm,$dd) = decode_date($buffer);>

=head2   =======================================

With help of this function, it is possible to recognize
dates in almost any format, provided the date is given
as "day - month - year".

The day and the year must be given as numbers, the month may be
specified either by number or an abbreviation (up to 3 characters
long) of the month's name (case is ignored).

If they uniquely identify the month, one or two letters are
sufficient (e.g. "s" for september or "ja" for january).

The year may be abbreviated as well, for instance "95" instead
of "1995". (Year numbers below 100 are incremented by 1900.)

Any number of non-digits may precede the number of the day and
follow the number of the year.

Between the number of the day and the month, as well as between
the month and the number of the year, any number of non-alphanumeric
characters (i.e., all characters not in [A-Za-z0-9])
may be interspersed.

If after removing the preceding and trailing non-digit characters
the string consists only of digits, it is automatically mapped to
the day, month and year depending on its length, as intuitively as
possible, as follows:

		Length:        Mapping:
		  3              dmy
		  4              dmyy
		  5              dmmyy
		  6              ddmmyy
		  7              dmmyyyy
		  8              ddmmyyyy

Example:

All the following strings will be recognized as
"january 3rd 1964":

			  3.1.64
			  3 1 64
			 03.01.64
			 03/01/64
			3. Jan 1964
			3. Jan '64
			 03-Jan-64
			 3.Jan1964
			  3Jan64
			   3ja64
			   3164

If no valid date can be deduced from its input, the function
returns zeros in all its return values.

=head2   =================================

=head2 C<$days = days_in_month($year,$mm);>

=head2   =================================

This function accesses the internal table of the months' lengths
and returns the length in days of the given month "$mm" in the
given year "$year".

It is necessary to specify the year "$year" since the length of
the month february is 29 instead of 28 in leap years.

This function is useful, for example, to calculate the last day
of a month or the last working-day (payday!) of a month.

Last working-day of the month (legal holidays not taken into
account):

	$dd = days_in_month($year,$mm);
	$dw = day_of_week($year,$mm,$dd) - 1;
	if ($dw > 4)
	{
	    ($year,$mm,$dd) = calc_new_date($year,$mm,$dd,4-$dw);
	}

Last working-day of the month (legal holidays taken into account):

(assuming that the array $holiday[$year][$mm][$dd] = 1; contains
all legal holidays)

	$dd = days_in_month($year,$mm);
	while (1)
	{
	    while ($holiday[$year][$mm][$dd])
	    {
	        ($year,$mm,$dd) = calc_new_date($year,$mm,$dd,-1);
	    }
	    $dw = day_of_week($year,$mm,$dd) - 1;
	    if ($dw > 4)
	    {
	        ($year,$mm,$dd) = calc_new_date($year,$mm,$dd,4-$dw);
	    }
	    else { last; }
	}

The value of "$mm" is taken modulo 13 (!) internally to prevent
out-of-range access to the internal array.

The values the internal array contains are the following:

	normal             leap
	 month             year              year

	   0                 0                 0
	   1                31                31
	   2                28                29
	   3                31                31
	   4                30                30
	   5                31                31
	   6                30                30
	   7                31                31
	   8                31                31
	   9                30                30
	  10                31                31
	  11                30                30
	  12                31                31

=head2   =====================================

=head2 C<$version = Date::DateCalc::Version();>

=head2   =====================================

This function returns a string with the (numeric) version
number of the "DateCalc" extension package.

Since this function is not exported, you always have to
qualify it explicitly (i.e., "C<Date::DateCalc::Version()>").

This is to avoid possible conflicts with version functions
from other packages.

=head1 EXAMPLE

	#!perl -w
	
	use strict;
	no strict "vars";
	
	use Date::DateCalc qw(:all);
	
	print "\n";
	
	$ok = 0;
	while (! $ok)
	{
	    print "Please enter the date of your birthday (day-month-year): ";
	    $date = <STDIN>;
	    print "\n";
	    ($yy1,$mm1,$dd1) = decode_date($date);
	    if ($yy1)
	    {
	        $datestr = date_to_short($yy1,$mm1,$dd1);
	        print "Your date is: $datestr\n";
	        print "\n";
	        print "Is that correct? (Yes/No) ";
	        $response = <STDIN>;
	        print "\n";
	        $ok = ($response =~ /^Y/i);
	    }
	}
	print "Your birthday is: $datestr\n";
	print "\n";
	
	$ok = 0;
	while (! $ok)
	{
	    print "Please enter today's date (day-month-year): ";
	    $date = <STDIN>;
	    print "\n";
	    ($yy2,$mm2,$dd2) = decode_date($date);
	    if ($yy2)
	    {
	        $datestr = date_to_short($yy2,$mm2,$dd2);
	        print "Your date is: $datestr\n";
	        print "\n";
	        print "Is that correct? (Yes/No) ";
	        $response = <STDIN>;
	        print "\n";
	        $ok = ($response =~ /^Y/i);
	    }
	}
	print "Today's date is: $datestr\n";
	print "\n";
	
	$days = dates_difference($yy1,$mm1,$dd1,$yy2,$mm2,$dd2);
	print "You are $days days old.\n";
	print "\n";
	
	__END__

=head1 SEE ALSO

perl(1), perlsub(1), perlmod(1), perlxs(1), perlxstut(1), perlguts(1).

=head1 VERSION

This man page documents Date::DateCalc, version 2.2.

=head1 AUTHOR

Steffen Beyer <sb@sdm.de> (sd&m GmbH&Co.KG, Munich, Germany)

=head1 COPYRIGHT

Copyright (c) 1996 by Steffen Beyer. All rights reserved.

=head1 LICENSE AGREEMENT

This package is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

