
###############################################################################
##                                                                           ##
##    Copyright (c) 1995 - 2000 by Steffen Beyer.                            ##
##    All rights reserved.                                                   ##
##                                                                           ##
##    This package is free software; you can redistribute it                 ##
##    and/or modify it under the same terms as Perl itself.                  ##
##                                                                           ##
###############################################################################

package Date::Calc;

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

@EXPORT_OK = qw(
    Days_in_Year
    Days_in_Month
    Weeks_in_Year
    leap_year
    check_date
    check_business_date
    Day_of_Year
    Date_to_Days
    Day_of_Week
    Week_Number
    Week_of_Year
    Monday_of_Week
    Nth_Weekday_of_Month_Year
    Standard_to_Business
    Business_to_Standard
    Delta_Days
    Delta_DHMS
    Add_Delta_Days
    Add_Delta_DHMS
    Add_Delta_YMD
    System_Clock
    Today
    Now
    Today_and_Now
    Easter_Sunday
    Decode_Month
    Decode_Day_of_Week
    Decode_Language
    Decode_Date_EU
    Decode_Date_US
    Compress
    Uncompress
    check_compressed
    Compressed_to_Text
    Date_to_Text
    Date_to_Text_Long
    English_Ordinal
    Calendar
    Month_to_Text
    Day_of_Week_to_Text
    Day_of_Week_Abbreviation
    Language_to_Text
    Language
    Languages
    Decode_Date_EU2
    Decode_Date_US2
    Parse_Date
);

%EXPORT_TAGS = (all => [@EXPORT_OK]);

##################################################
##                                              ##
##  "Version()" is available but not exported   ##
##  in order to avoid possible name clashes.    ##
##  Call with "Date::Calc::Version()" instead!  ##
##                                              ##
##################################################

$VERSION = '4.3';

bootstrap Date::Calc $VERSION;

use Carp;

sub Decode_Date_EU2
{
    croak "Usage: (\$year,\$month,\$day) = Decode_Date_EU2(\$date);"
      if (@_ != 1);

    my($buffer) = @_;
    my($year,$month,$day,$length);

    if ($buffer =~ /^\D*  (\d+)  [^A-Za-z0-9]*  ([A-Za-z]+)  [^A-Za-z0-9]*  (\d+)  \D*$/x)
    {
        ($day,$month,$year) = ($1,$2,$3);
        $month = Decode_Month($month);
        unless ($month > 0)
        {
            return(); # can't decode month!
        }
    }
    elsif ($buffer =~ /^\D*  0*(\d+)  \D*$/x)
    {
        $buffer = $1;
        $length = length($buffer);
        if    ($length == 3)
        {
            $day   = substr($buffer,0,1);
            $month = substr($buffer,1,1);
            $year  = substr($buffer,2,1);
        }
        elsif ($length == 4)
        {
            $day   = substr($buffer,0,1);
            $month = substr($buffer,1,1);
            $year  = substr($buffer,2,2);
        }
        elsif ($length == 5)
        {
            $day   = substr($buffer,0,1);
            $month = substr($buffer,1,2);
            $year  = substr($buffer,3,2);
        }
        elsif ($length == 6)
        {
            $day   = substr($buffer,0,2);
            $month = substr($buffer,2,2);
            $year  = substr($buffer,4,2);
        }
        elsif ($length == 7)
        {
            $day   = substr($buffer,0,1);
            $month = substr($buffer,1,2);
            $year  = substr($buffer,3,4);
        }
        elsif ($length == 8)
        {
            $day   = substr($buffer,0,2);
            $month = substr($buffer,2,2);
            $year  = substr($buffer,4,4);
        }
        else { return(); } # wrong number of digits!
    }
    elsif ($buffer =~ /^\D*  (\d+)  \D+  (\d+)  \D+  (\d+)  \D*$/x)
    {
        ($day,$month,$year) = ($1,$2,$3);
    }
    else { return(); } # no match at all!

    if ($year < 100)
    {
        if ($year < 70) { $year += 100; }
        $year += 1900;
    }

    if (check_date($year,$month,$day))
    {
        return($year,$month,$day);
    }
    else { return(); } # not a valid date!
}

sub Decode_Date_US2
{
    croak "Usage: (\$year,\$month,\$day) = Decode_Date_US2(\$date);"
      if (@_ != 1);

    my($buffer) = @_;
    my($year,$month,$day,$length);

    if ($buffer =~ /^[^A-Za-z0-9]*  ([A-Za-z]+)  [^A-Za-z0-9]*  0*(\d+)  \D*$/x)
    {
        ($month,$buffer) = ($1,$2);
        $month = Decode_Month($month);
        unless ($month > 0)
        {
            return(); # can't decode month!
        }
        $length = length($buffer);
        if    ($length == 2)
        {
            $day  = substr($buffer,0,1);
            $year = substr($buffer,1,1);
        }
        elsif ($length == 3)
        {
            $day  = substr($buffer,0,1);
            $year = substr($buffer,1,2);
        }
        elsif ($length == 4)
        {
            $day  = substr($buffer,0,2);
            $year = substr($buffer,2,2);
        }
        elsif ($length == 5)
        {
            $day  = substr($buffer,0,1);
            $year = substr($buffer,1,4);
        }
        elsif ($length == 6)
        {
            $day  = substr($buffer,0,2);
            $year = substr($buffer,2,4);
        }
        else { return(); } # wrong number of digits!
    }
    elsif ($buffer =~ /^[^A-Za-z0-9]*  ([A-Za-z]+)  [^A-Za-z0-9]*  (\d+)  \D+  (\d+)  \D*$/x)
    {
        ($month,$day,$year) = ($1,$2,$3);
        $month = Decode_Month($month);
        unless ($month > 0)
        {
            return(); # can't decode month!
        }
    }
    elsif ($buffer =~ /^\D*  0*(\d+)  \D*$/x)
    {
        $buffer = $1;
        $length = length($buffer);
        if    ($length == 3)
        {
            $month = substr($buffer,0,1);
            $day   = substr($buffer,1,1);
            $year  = substr($buffer,2,1);
        }
        elsif ($length == 4)
        {
            $month = substr($buffer,0,1);
            $day   = substr($buffer,1,1);
            $year  = substr($buffer,2,2);
        }
        elsif ($length == 5)
        {
            $month = substr($buffer,0,1);
            $day   = substr($buffer,1,2);
            $year  = substr($buffer,3,2);
        }
        elsif ($length == 6)
        {
            $month = substr($buffer,0,2);
            $day   = substr($buffer,2,2);
            $year  = substr($buffer,4,2);
        }
        elsif ($length == 7)
        {
            $month = substr($buffer,0,1);
            $day   = substr($buffer,1,2);
            $year  = substr($buffer,3,4);
        }
        elsif ($length == 8)
        {
            $month = substr($buffer,0,2);
            $day   = substr($buffer,2,2);
            $year  = substr($buffer,4,4);
        }
        else { return(); } # wrong number of digits!
    }
    elsif ($buffer =~ /^\D*  (\d+)  \D+  (\d+)  \D+  (\d+)  \D*$/x)
    {
        ($month,$day,$year) = ($1,$2,$3);
    }
    else { return(); } # no match at all!

    if ($year < 100)
    {
        if ($year < 70) { $year += 100; }
        $year += 1900;
    }

    if (check_date($year,$month,$day))
    {
        return($year,$month,$day);
    }
    else { return(); } # not a valid date!
}

sub Parse_Date
{
    croak "Usage: (\$year,\$month,\$day) = Parse_Date(\$date);"
      if (@_ != 1);

    my($date) = @_;
    my($year,$month,$day);
    unless ($date =~ /\b([JFMASOND][aepuco][nbrynlgptvc])\s+([0123]??\d)\b/)
    {
        return();
    }
    $month = $1;
    $day   = $2;
    unless ($date =~ /\b(19\d\d|20\d\d)\b/)
    {
        return();
    }
    $year  = $1;
    $month = Decode_Month($month);
    unless ($month > 0)
    {
        return();
    }
    unless (check_date($year,$month,$day))
    {
        return();
    }
    return($year,$month,$day);
}

1;

__END__

=head1 NAME

Date::Calc - Gregorian calendar date calculations

=head1 PREFACE

This package consists of a C library and a Perl module (which uses
the C library, internally) for all kinds of date calculations based
on the Gregorian calendar (the one used in all western countries today),
thereby complying with all relevant norms and standards: S<ISO/R 2015-1971>,
S<DIN 1355> and, to some extent, S<ISO 8601> (where applicable).

(See also http://www.engelschall.com/u/sb/download/Date-Calc/DIN1355/
for a scan of part of the "S<DIN 1355>" document (in German)).

The module of course handles year numbers of 2000 and above correctly
("Year 2000" or "Y2K" compliance) -- actually all year numbers from 1
to the largest positive integer representable on your system (which
is at least 32767) can be dealt with.

Note that this package projects the Gregorian calendar back until the
year S<1 A.D.> -- even though the Gregorian calendar was only adopted
in 1582 by most (not all) European countries, in obedience to the
corresponding decree of catholic pope S<Gregor I> in that year.

Some (mainly protestant) countries continued to use the Julian calendar
(used until then) until as late as the beginning of the 20th century.

Finally, note that this package is not intended to do everything you could
ever imagine automagically for you; it is rather intended to serve as a
toolbox (in the best of UNIX spirit and traditions) which should, however,
always get you where you want to go.

See the section "RECIPES" at the bottom of this document for solutions
to common problems!

If nevertheless you can't figure out how to solve a particular problem,
please let me know! (See e-mail address at the end of this document.)

=head1 SYNOPSIS

  use Date::Calc qw(
      Days_in_Year
      Days_in_Month
      Weeks_in_Year
      leap_year
      check_date
      check_business_date
      Day_of_Year
      Date_to_Days
      Day_of_Week
      Week_Number
      Week_of_Year
      Monday_of_Week
      Nth_Weekday_of_Month_Year
      Standard_to_Business
      Business_to_Standard
      Delta_Days
      Delta_DHMS
      Add_Delta_Days
      Add_Delta_DHMS
      Add_Delta_YMD
      System_Clock
      Today
      Now
      Today_and_Now
      Easter_Sunday
      Decode_Month
      Decode_Day_of_Week
      Decode_Language
      Decode_Date_EU
      Decode_Date_US
      Compress
      Uncompress
      check_compressed
      Compressed_to_Text
      Date_to_Text
      Date_to_Text_Long
      English_Ordinal
      Calendar
      Month_to_Text
      Day_of_Week_to_Text
      Day_of_Week_Abbreviation
      Language_to_Text
      Language
      Languages
      Decode_Date_EU2
      Decode_Date_US2
      Parse_Date
  );

  use Date::Calc qw(:all);

  Days_in_Year
      $days = Days_in_Year($year,$month);

  Days_in_Month
      $days = Days_in_Month($year,$month);

  Weeks_in_Year
      $weeks = Weeks_in_Year($year);

  leap_year
      if (leap_year($year))

  check_date
      if (check_date($year,$month,$day))

  check_business_date
      if (check_business_date($year,$week,$dow))

  Day_of_Year
      $doy = Day_of_Year($year,$month,$day);

  Date_to_Days
      $days = Date_to_Days($year,$month,$day);

  Day_of_Week
      $dow = Day_of_Week($year,$month,$day);

  Week_Number
      $week = Week_Number($year,$month,$day);

  Week_of_Year
      ($week,$year) = Week_of_Year($year,$month,$day);

  Monday_of_Week
      ($year,$month,$day) = Monday_of_Week($week,$year);

  Nth_Weekday_of_Month_Year
      if (($year,$month,$day) =
      Nth_Weekday_of_Month_Year($year,$month,$dow,$n))

  Standard_to_Business
      ($year,$week,$dow) =
      Standard_to_Business($year,$month,$day);

  Business_to_Standard
      ($year,$month,$day) =
      Business_to_Standard($year,$week,$dow);

  Delta_Days
      $Dd = Delta_Days($year1,$month1,$day1,
                       $year2,$month2,$day2);

  Delta_DHMS
      ($Dd,$Dh,$Dm,$Ds) =
      Delta_DHMS($year1,$month1,$day1, $hour1,$min1,$sec1,
                 $year2,$month2,$day2, $hour2,$min2,$sec2);

  Add_Delta_Days
      ($year,$month,$day) =
      Add_Delta_Days($year,$month,$day,
                     $Dd);

  Add_Delta_DHMS
      ($year,$month,$day, $hour,$min,$sec) =
      Add_Delta_DHMS($year,$month,$day, $hour,$min,$sec,
                     $Dd,$Dh,$Dm,$Ds);

  Add_Delta_YMD
      ($year,$month,$day) =
      Add_Delta_YMD($year,$month,$day,
                    $Dy,$Dm,$Dd);

  System_Clock
      ($year,$month,$day, $hour,$min,$sec, $doy,$dow,$dst) =
      System_Clock();

  Today
      ($year,$month,$day) = Today();

  Now
      ($hour,$min,$sec) = Now();

  Today_and_Now
      ($year,$month,$day, $hour,$min,$sec) = Today_and_Now();

  Easter_Sunday
      ($year,$month,$day) = Easter_Sunday($year);

  Decode_Month
      if ($month = Decode_Month($string))

  Decode_Day_of_Week
      if ($dow = Decode_Day_of_Week($string))

  Decode_Language
      if ($lang = Decode_Language($string))

  Decode_Date_EU
      if (($year,$month,$day) = Decode_Date_EU($string))

  Decode_Date_US
      if (($year,$month,$day) = Decode_Date_US($string))

  Compress
      $date = Compress($year,$month,$day);

  Uncompress
      if (($century,$year,$month,$day) = Uncompress($date))

  check_compressed
      if (check_compressed($date))

  Compressed_to_Text
      $string = Compressed_to_Text($date);

  Date_to_Text
      $string = Date_to_Text($year,$month,$day);

  Date_to_Text_Long
      $string = Date_to_Text_Long($year,$month,$day);

  English_Ordinal
      $string = English_Ordinal($number);

  Calendar
      $string = Calendar($year,$month);

  Month_to_Text
      $string = Month_to_Text($month);

  Day_of_Week_to_Text
      $string = Day_of_Week_to_Text($dow);

  Day_of_Week_Abbreviation
      $string = Day_of_Week_Abbreviation($dow);

  Language_to_Text
      $string = Language_to_Text($lang);

  Language
      $lang = Language();
      Language($lang);
      $oldlang = Language($newlang);

  Languages
      $max_lang = Languages();

  Decode_Date_EU2
      if (($year,$month,$day) = Decode_Date_EU2($string))

  Decode_Date_US2
      if (($year,$month,$day) = Decode_Date_US2($string))

  Parse_Date
      if (($year,$month,$day) = Parse_Date($string))

  Version
      $string = Date::Calc::Version();

=head1 IMPORTANT NOTES

(See the section "RECIPES" at the bottom of this document for
solutions to common problems!)

=over 2

=item *

"Year 2000" ("Y2K") compliance

The upper limit for any year number in this module is only given
by the size of the largest positive integer that can be represented
in a variable of the C type "int" on your system, which is at least
32767, according to the ANSI C standard (exceptions see below).

In order to simplify calculations, this module projects the gregorian
calendar back until the year S<1 A.D.> -- i.e., back B<BEYOND> the
year 1582 when this calendar was first decreed by the catholic pope
S<Gregor I>!

Therefore, B<BE SURE TO ALWAYS SPECIFY "1998" WHEN YOU MEAN "1998">,
for instance, and B<DO NOT WRITE "98" INSTEAD>, because this will
in fact perform a calculation based on the year "98" A.D. and
B<NOT> "1998"!

The only exceptions from this rule are the functions which contain
the word "compress" in their names (which only handle years between
1970 and 2069 and also accept the abbreviations "00" to "99"), and
the functions whose names begin with "Decode_Date_" (which map year
numbers below 100 to the range 1970 - 2069, using a technique known
as "windowing").

=item *

First index

B<ALL> ranges in this module start with "C<1>", B<NOT> "C<0>"!

I.e., the day of month, day of week, day of year, month of year,
week of year, first valid year number and language B<ALL> start
counting at one, B<NOT> zero!

The only exception is the function "C<Week_Number()>", which may
in fact return "C<0>" when the given date actually lies in the
last week of the B<PREVIOUS> year.

=item *

Function naming conventions

Function names completely in lower case indicate a boolean return value.

=item *

Boolean values

Boolean values in this module are always a numeric zero ("C<0>") for
"false" and a numeric one ("C<1>") for "true".

=item *

Exception handling

The functions in this module will usually die with a corresponding error
message if their input parameters, intermediate results or output values
are out of range.

The following functions handle errors differently:

  -  check_date()
  -  check_business_date()
  -  check_compressed()

(which return a "false" return value when the given input does not represent
a valid date),

  -  Nth_Weekday_of_Month_Year()

(which returns an empty list if the requested 5th day of week does not exist),

  -  Decode_Month()
  -  Decode_Day_of_Week()
  -  Decode_Language()
  -  Compress()

(which return "C<0>" upon failure or invalid input), and

  -  Decode_Date_EU()
  -  Decode_Date_US()
  -  Decode_Date_EU2()
  -  Decode_Date_US2()
  -  Parse_Date()
  -  Uncompress()

(which return an empty list upon failure or invalid input).

Note that you can always catch an exception thrown by any of the functions
in this module and handle it yourself by enclosing the function call in an
"C<eval>" with curly brackets and checking the special variable "C<$@>"
(see L<perlfunc(1)/eval> for details).

=back

=head1 DESCRIPTION

=over 2

=item *

C<use Date::Calc qw( Days_in_Year Days_in_Month ... );>

=item *

C<use Date::Calc qw(:all);>

You can either specify the functions you want to import explicitly by
enumerating them between the parentheses of the "C<qw()>" operator, or
you can use the "C<:all>" tag instead to import B<ALL> available functions.

=item *

C<$days = Days_in_Year($year,$month);>

This function returns the sum of the number of days in the months starting
with January up to and including "C<$month>" in the given year "C<$year>".

I.e., "C<Days_in_Year(1998,1)>" returns "C<31>", "C<Days_in_Year(1998,2)>"
returns "C<59>", "C<Days_in_Year(1998,3)>" returns "C<90>", and so on.

Note that "C<Days_in_Year($year,12)>" returns the number of days in the
given year "C<$year>", i.e., either "C<365>" or "C<366>".

=item *

C<$days = Days_in_Month($year,$month);>

This function returns the number of days in the given month "C<$month>" of
the given year "C<$year>".

The year must always be supplied, even though it is only needed when the
month is February, in order to determine wether it is a leap year or not.

I.e., "C<Days_in_Month(1998,1)>" returns "C<31>", "C<Days_in_Month(1998,2)>"
returns "C<28>", "C<Days_in_Month(2000,2)>" returns "C<29>",
"C<Days_in_Month(1998,3)>" returns "C<31>", and so on.

=item *

C<$weeks = Weeks_in_Year($year);>

This function returns the number of weeks in the given year "C<$year>",
i.e., either "C<52>" or "C<53>".

=item *

C<if (leap_year($year))>

This function returns "true" ("C<1>") if the given year "C<$year>" is
a leap year and "false" ("C<0>") otherwise.

=item *

C<if (check_date($year,$month,$day))>

This function returns "true" ("C<1>") if the given three numerical
values "C<$year>", "C<$month>" and "C<$day>" constitute a valid date,
and "false" ("C<0>") otherwise.

=item *

C<if (check_business_date($year,$week,$dow))>

This function returns "true" ("C<1>") if the given three numerical
values "C<$year>", "C<$week>" and "C<$dow>" constitute a valid date
in business format, and "false" ("C<0>") otherwise.

B<Beware> that this function does B<NOT> compute wether a given date
is a business day (i.e., Monday to Friday)!

To do so, use "C<(Day_of_Week($year,$month,$day) E<lt> 6)>" instead.

=item *

C<$doy = Day_of_Year($year,$month,$day);>

This function returns the (relative) number of the day of the given date
in the given year.

E.g., "C<Day_of_Year($year,1,1)>" returns "C<1>",
"C<Day_of_Year($year,2,1)>" returns "C<32>", and
"C<Day_of_Year($year,12,31)>" returns either "C<365>" or "C<366>".

=item *

C<$days = Date_to_Days($year,$month,$day);>

This function returns the (absolute) number of the day of the given date,
where counting starts at the 1st of January of the year S<1 A.D.>

I.e., "C<Date_to_Days(1,1,1)>" returns "C<1>", "C<Date_to_Days(1,12,31)>"
returns "C<365>", "C<Date_to_Days(2,1,1)>" returns "C<366>",
"C<Date_to_Days(1998,5,1)>" returns "C<729510>", and so on.

=item *

C<$dow = Day_of_Week($year,$month,$day);>

This function returns the number of the day of week of the given date.

The function returns "C<1>" for Monday, "C<2>" for Tuesday and so on
until "C<7>" for Sunday.

Note that in the Hebrew calendar (on which the Christian calendar is based),
the week starts with Sunday and ends with the Sabbath or Saturday (where
according to the Genesis (as described in the Bible) the Lord rested from
creating the world).

In medieval times, catholic popes have decreed the Sunday to be the official
day of rest, in order to dissociate the Christian from the Hebrew belief.

Nowadays, the Sunday B<AND> the Saturday are commonly considered (and
used as) days of rest, usually referred to as the "week-end".

Consistent with this practice, current norms and standards (such as
S<ISO/R 2015-1971>, S<DIN 1355> and S<ISO 8601>) define the Monday
as the first day of the week.

=item *

C<$week = Week_Number($year,$month,$day);>

This function returns the number of the week the given date lies in.

If the given date lies in the B<LAST> week of the B<PREVIOUS> year,
"C<0>" is returned.

If the given date lies in the B<FIRST> week of the B<NEXT> year,
"C<Weeks_in_Year($year) + 1>" is returned.

=item *

C<($week,$year) = Week_of_Year($year,$month,$day);>

This function returns the number of the week the given date lies in,
as well as the year that week belongs to.

I.e., if the given date lies in the B<LAST> week of the B<PREVIOUS> year,
"C<(Weeks_in_Year($year-1), $year-1)>" is returned.

If the given date lies in the B<FIRST> week of the B<NEXT> year,
"C<(1, $year+1)>" is returned.

Otherwise, "C<(Week_Number($year,$month,$day), $year)>" is returned.

=item *

C<($year,$month,$day) = Monday_of_Week($week,$year);>

This function returns the date of the first day of the given week, i.e.,
the Monday.

"C<$year>" must be greater than or equal to "C<1>", and "C<$week>" must
lie in the range "C<1>" to "C<Weeks_in_Year($year)>".

Note that you can write
"C<($year,$month,$day) = Monday_of_Week(Week_of_Year($year,$month,$day));>"
in order to calculate the date of the Monday of the same week as the
given date.

=item *

C<if (($year,$month,$day) = Nth_Weekday_of_Month_Year($year,$month,$dow,$n))>

This function calculates the date of the "C<$n>"th day of week "C<$dow>"
in the given month "C<$month>" and year "C<$year>"; such as, for example,
the 3rd Thursday of a given month and year.

This can be used to send a notification mail to the members of a group
which meets regularly on every 3rd Thursday of a month, for instance.

(See the section "RECIPES" near the end of this document for a code
snippet to actually do so.)

"C<$year>" must be greater than or equal to "C<1>", "C<$month>" must lie
in the range "C<1>" to "C<12>", "C<$dow>" must lie in the range "C<1>"
to "C<7>" and "C<$n>" must lie in the range "C<1>" to "C<5>", or a fatal
error (with appropriate error message) occurs.

The function returns an empty list when the 5th of a given day of week
does not exist in the given month and year.

=item *

C<($year,$week,$dow) = Standard_to_Business($year,$month,$day);>

This function converts a given date from standard notation (year,
month, day (of month)) to business notation (year, week, day of week).

=item *

C<($year,$month,$day) = Business_to_Standard($year,$week,$dow);>

This function converts a given date from business notation (year,
week, day of week) to standard notation (year, month, day (of month)).

=item *

C<$Dd = Delta_Days($year1,$month1,$day1, $year2,$month2,$day2);>

This function returns the difference in days between the two given
dates.

The result is positive if the two dates are in chronological order,
i.e., if date #1 comes chronologically B<BEFORE> date #2, and negative
if the order of the two dates is reversed.

The result is zero if the two dates are identical.

=item *

C<($Dd,$Dh,$Dm,$Ds) = Delta_DHMS($year1,$month1,$day1, $hour1,$min1,$sec1, $year2,$month2,$day2, $hour2,$min2,$sec2);>

This function returns the difference in days, hours, minutes and seconds
between the two given dates with times.

All four return values will be positive if the two dates are in chronological
order, i.e., if date #1 comes chronologically B<BEFORE> date #2, and negative
(in all four return values!) if the order of the two dates is reversed.

This is so that the two functions "C<Delta_DHMS()>" and "C<Add_Delta_DHMS()>"
(description see further below) are complementary, i.e., mutually inverse:

  Add_Delta_DHMS(@date1,@time1, Delta_DHMS(@date1,@time1, @date2,@time2))

yields "C<(@date2,@time2)>" again, whereas

  Add_Delta_DHMS(@date2,@time2,
      map(-$_, Delta_DHMS(@date1,@time1, @date2,@time2)))

yields "C<(@date1,@time1)>", and

  Delta_DHMS(@date1,@time1, Add_Delta_DHMS(@date1,@time1, @delta))

yields "C<@delta>" again.

The result is zero (in all four return values) if the two dates and times
are identical.

=item *

C<($year,$month,$day) = Add_Delta_Days($year,$month,$day, $Dd);>

This function has two principal uses:

First, it can be used to calculate a new date, given an initial date and
an offset (which may be positive or negative) in days, in order to answer
questions like "today plus 90 days -- which date gives that?".

(In order to add a weeks offset, simply multiply the weeks offset with
"C<7>" and use that as your days offset.)

Second, it can be used to convert the canonical representation of a date,
i.e., the number of that day (where counting starts at the 1st of January
in S<1 A.D.>), back into a date given as year, month and day.

Because counting starts at "C<1>", you will actually have to subtract "C<1>"
from the canonical date in order to get back the original date:

  $canonical = Date_to_Days($year,$month,$day);

  ($year,$month,$day) = Add_Delta_Days(1,1,1, $canonical - 1);

Moreover, this function is the inverse of the function "C<Delta_Days()>":

  Add_Delta_Days(@date1, Delta_Days(@date1, @date2))

yields "C<@date2>" again, whereas

  Add_Delta_Days(@date2, -Delta_Days(@date1, @date2))

yields "C<@date1>", and

  Delta_Days(@date1, Add_Delta_Days(@date1, $delta))

yields "C<$delta>" again.

=item *

C<($year,$month,$day, $hour,$min,$sec) = Add_Delta_DHMS($year,$month,$day, $hour,$min,$sec, $Dd,$Dh,$Dm,$Ds);>

This function serves to add a days, hours, minutes and seconds offset to a
given date and time, in order to answer questions like "today and now plus
7 days but minus 5 hours and then plus 30 minutes, what date and time gives
that?":

  ($y,$m,$d,$H,$M,$S) = Add_Delta_DHMS(Today_and_Now(), +7,-5,+30,0);

=item *

C<($year,$month,$day) = Add_Delta_YMD($year,$month,$day, $Dy,$Dm,$Dd);>

This function serves to add a years, months and days offset to a given date.

(In order to add a weeks offset, simply multiply the weeks offset with "C<7>"
and add this number to your days offset.)

Note that the three offsets for years, months and days are applied separately
from each other, in reverse order.

(This also allows them to have opposite signs.)

In other words, first the days offset is applied (using the function
"C<Add_Delta_Days()>", internally), then the months offset, and finally
the years offset.

If the resulting date happens to fall on a day beyond the end of the
resulting month, like the 31st of April or the 29th of February (in
non-leap years), then the day is replaced by the last valid day of
that month in that year (e.g., the 30th of April or 28th of February).

B<BEWARE> that this behaviour differs from that of previous versions
of this module!

(Formerly, only the 29th of February in non-leap years was checked for
(which - in contrast to the current version - was replaced by the 1st
of March). Other possible invalid dates were not checked (and returned
unwittingly), constituting a severe bug of previous versions.)

B<BEWARE> also that because of this replacement, but even more because
a year and a month offset is not equivalent to a fixed number of days,
the transformation performed by this function is B<NOT REVERSIBLE>!

This is in contrast to the functions "C<Add_Delta_Days()>" and
"C<Add_Delta_DHMS()>", which for this very reason have inverse functions
(namely "C<Delta_Days()>" and "C<Delta_DHMS()>"), whereas there exists no
inverse for this function.

Note that for this same reason, even

  @date = Add_Delta_YMD(
          Add_Delta_YMD(@date, $Dy,$Dm,$Dd), -$Dy,-$Dm,-$Dd);

will (in general!) B<NOT> return the initial date "C<@date>"!

(This might work in some cases, though.)

Note that this is B<NOT> a program bug but B<NECESSARILY> so because of
the varying lengths of years and months!

=item *

C<($year,$month,$day, $hour,$min,$sec, $doy,$dow,$dst) = System_Clock();>

If your operating system supports the corresponding system calls
("C<time()>" and "C<localtime()>"), this function will return
the information provided by your system clock, i.e., the current
date and time, the number of the day of year, the number of the
day of week and a flag signaling wether daylight savings time
is currently in effect or not.

The ranges of values returned (and their meanings) are as follows:

                $year   :   should at least cover 1900..2038
                $month  :   1..12
                $day    :   1..31
                $hour   :   0..23
                $min    :   0..59
                $sec    :   0..59    (0..61 on some systems)
                $doy    :   1..366
                $dow    :   1..7
                $dst    :  -1..1

The day of week ("C<$dow>") will be "C<1>" for Monday, "C<2>" for
Tuesday and so on until "C<7>" for Sunday.

The daylight savings time flag ("C<$dst>") will be "C<-1>" if this
information is not available on your system, "C<0>" for no daylight
savings time (i.e., normal time) and "C<1>" when daylight savings
time is in effect.

If your operating system does not provide the necessary system calls,
calling this function will result in a fatal "not available on this
system" error message.

If you want to handle this exception yourself, use "C<eval>" as follows:

  eval { ($year,$month,$day, $hour,$min,$sec, $doy,$dow,$dst) =
    System_Clock(); };

  if ($@)
  {
      # Handle missing system clock
      # (For instance, ask user to enter this information manually)
  }

Note that curlies ("{" and "}") are used here to delimit the statement to
be "eval"ed (which is the way to catch exceptions in Perl), and not quotes
(which is a way to evaluate Perl expressions at runtime).

=item *

C<($year,$month,$day) = Today();>

This function returns a subset of the values returned by the function
"C<System_Clock()>" (see above for details), namely the current year,
month and day.

A fatal "not available on this system" error message will appear if the
corresponding system calls are not supported by your current operating
system.

=item *

C<($hour,$min,$sec) = Now();>

This function returns a subset of the values returned by the function
"C<System_Clock()>" (see above for details), namely the current time
(hours, minutes and full seconds).

A fatal "not available on this system" error message will appear if the
corresponding system calls are not supported by your current operating
system.

=item *

C<($year,$month,$day, $hour,$min,$sec) = Today_and_Now();>

This function returns a subset of the values returned by the function
"C<System_Clock()>" (see above for details), namely the current date
(year, month, day) and time (hours, minutes and full seconds).

A fatal "not available on this system" error message will appear if the
corresponding system calls are not supported by your current operating
system.

=item *

C<($year,$month,$day) = Easter_Sunday($year);>

This function calculates the date of easter sunday for all years in the
range from 1583 to 2299 (all other year numbers will result in a fatal
"year out of range" error message) using the method known as the "Gaussian
Rule".

Some related christian feast days which depend on the date of easter sunday:

  Carnival Monday / Rosenmontag / Veille du Mardi Gras   =  -48 days
  Mardi Gras / Karnevalsdienstag / Mardi Gras            =  -47 days
  Ash Wednesday / Aschermittwoch / Mercredi des Cendres  =  -46 days
  Palm Sunday / Palmsonntag / Dimanche des Rameaux       =   -7 days
  Easter Friday / Karfreitag / Vendredi Saint            =   -2 days
  Easter Saturday / Ostersamstag / Samedi de Paques      =   -1 day
  Easter Monday / Ostermontag / Lundi de Paques          =   +1 day
  Ascension of Christ / Christi Himmelfahrt / Ascension  =  +39 days
  Whitsunday / Pfingstsonntag / Dimanche de Pentecote    =  +49 days
  Whitmonday / Pfingstmontag / Lundi de Pentecote        =  +50 days
  Feast of Corpus Christi / Fronleichnam / Fete-Dieu     =  +60 days

Use the offsets shown above to calculate the date of the corresponding
feast day as follows:

  ($year,$month,$day) = Add_Delta_Days(Easter_Sunday($year), $offset));

=item *

C<if ($month = Decode_Month($string))>

This function takes a string as its argument, which should contain the
name of a month B<IN THE CURRENTLY SELECTED LANGUAGE> (see further below
for details about the multi-language support of this package), or any uniquely
identifying abbreviation of a month's name (i.e., the first few letters),
and returns the corresponding number (1..12) upon a successful match, or
"C<0>" otherwise (therefore, the return value can also be used as the
conditional expression in an "if" statement).

Note that the input string may not contain any other characters which do not
pertain to the month's name, especially no leading or trailing whitespace.

Note also that matching is performed in a case-insensitive manner (this may
depend on the "locale" setting on your current system, though!)

With "English" as the currently selected language (which is the default),
the following examples will all return the value "C<9>":

  $month = Decode_Month("s");
  $month = Decode_Month("Sep");
  $month = Decode_Month("septemb");
  $month = Decode_Month("September");

=item *

C<if ($dow = Decode_Day_of_Week($string))>

This function takes a string as its argument, which should contain the
name of a day of week B<IN THE CURRENTLY SELECTED LANGUAGE> (see further
below for details about the multi-language support of this package), or any
uniquely identifying abbreviation of the name of a day of week (i.e., the
first few letters), and returns the corresponding number (1..7) upon a
successful match, or "C<0>" otherwise (therefore, the return value can
also be used as the conditional expression in an "if" statement).

Note that the input string may not contain any other characters which
do not pertain to the name of the day of week, especially no leading
or trailing whitespace.

Note also that matching is performed in a case-insensitive manner (this may
depend on the "locale" setting on your current system, though!)

With "English" as the currently selected language (which is the default),
the following examples will all return the value "C<3>":

  $dow = Decode_Day_of_Week("w");
  $dow = Decode_Day_of_Week("Wed");
  $dow = Decode_Day_of_Week("wednes");
  $dow = Decode_Day_of_Week("Wednesday");

=item *

C<if ($lang = Decode_Language($string))>

This function takes a string as its argument, which should contain the
name of one of the languages supported by this package (B<IN THIS VERY
LANGUAGE ITSELF>), or any uniquely identifying abbreviation of the name
of a language (i.e., the first few letters), and returns its corresponding
internal number (1..7 in the original distribution) upon a successful match,
or "C<0>" otherwise (therefore, the return value can also be used as the
conditional expression in an "if" statement).

Note that the input string may not contain any other characters which do
not pertain to the name of a language, especially no leading or trailing
whitespace.

Note also that matching is performed in a case-insensitive manner (this may
depend on the "locale" setting on your current system, though!)

The original distribution supports the following seven languages:

            English                    ==>   1    (default)
            Fran�ais    (French)       ==>   2
            Deutsch     (German)       ==>   3
            Espa�ol     (Spanish)      ==>   4
            Portugu�s   (Portuguese)   ==>   5
            Nederlands  (Dutch)        ==>   6
            Italiano    (Italian)      ==>   7

See the section "How to install additional languages" in the file
"INSTALL.txt" in this distribution for how to add more languages
to this package.

In the original distribution (no other languages installed),
the following examples will all return the value "C<3>":

  $lang = Decode_Language("d");
  $lang = Decode_Language("de");
  $lang = Decode_Language("Deutsch");

Note that you may not be able to enter the special international characters
in some of the languages' names over the keyboard directly on some systems.

This should never be a problem, though; just enter an abbreviation of the
name of the language consisting of the first few letters up to the character
before the first special international character.

=item *

C<if (($year,$month,$day) = Decode_Date_EU($string))>

This function scans a given string and tries to parse any date
which might be embedded in it.

The function returns an empty list if it can't successfully
extract a valid date from its input string, or else it returns
the date found.

The function accepts almost any format, as long as the date is
given in the european order (hence its name) day-month-year.

Thereby, zero or more B<NON-NUMERIC> characters may B<PRECEDE>
the day and B<FOLLOW> the year.

Moreover, zero or more B<NON-ALPHANUMERIC> characters are permitted
B<BETWEEN> these three items (i.e., between day and month and between
month and year).

The month may be given either numerically (i.e., a number from "C<1>"
to "C<12>"), or alphanumerically, i.e., as the name of the month B<IN
THE CURRENTLY SELECTED LANGUAGE>, or any uniquely identifying abbreviation
thereof.

(See further below for details about the multi-language support of this
package!)

If the year is given as one or two digits only (i.e., if the year is less
than 100), it is mapped to the window "C<1970 - 2069>" as follows:

   0 E<lt>= $year E<lt>  70  ==>  $year += 2000;
  70 E<lt>= $year E<lt> 100  ==>  $year += 1900;

If the day, month and year are all given numerically but B<WITHOUT> any
delimiting characters between them, this string of digits will be mapped
to the day, month and year as follows:

                Length:        Mapping:
                  3              dmy
                  4              dmyy
                  5              dmmyy
                  6              ddmmyy
                  7              dmmyyyy
                  8              ddmmyyyy

(Where "d" stands for "day", "m" stands for "month" and "y" stands for
"year".)

All other strings consisting purely of digits (without any intervening
delimiters) are rejected, i.e., not recognized.

Examples:

  "3.1.64"
  "3 1 64"
  "03.01.64"
  "03/01/64"
  "3. Jan 1964"
  "Birthday: 3. Jan '64 in Backnang/Germany"
  "03-Jan-64"
  "3.Jan1964"
  "3Jan64"
  "030164"
  "3ja64"
  "3164"

Experiment! (See the corresponding example applications in the
"examples" subdirectory of this distribution in order to do so.)

=item *

C<if (($year,$month,$day) = Decode_Date_US($string))>

This function scans a given string and tries to parse any date
which might be embedded in it.

The function returns an empty list if it can't successfully
extract a valid date from its input string, or else it returns
the date found.

The function accepts almost any format, as long as the date is
given in the U.S. american order (hence its name) month-day-year.

Thereby, zero or more B<NON-ALPHANUMERIC> characters may B<PRECEDE>
and B<FOLLOW> the month (i.e., precede the month and separate it from
the day which follows behind).

Moreover, zero or more B<NON-NUMERIC> characters are permitted
B<BETWEEN> the day and the year, as well as B<AFTER> the year.

The month may be given either numerically (i.e., a number from "C<1>"
to "C<12>"), or alphanumerically, i.e., as the name of the month B<IN
THE CURRENTLY SELECTED LANGUAGE>, or any uniquely identifying abbreviation
thereof.

(See further below for details about the multi-language support of this
package!)

If the year is given as one or two digits only (i.e., if the year is less
than 100), it is mapped to the window "C<1970 - 2069>" as follows:

   0 E<lt>= $year E<lt>  70  ==>  $year += 2000;
  70 E<lt>= $year E<lt> 100  ==>  $year += 1900;

If the month, day and year are all given numerically but B<WITHOUT> any
delimiting characters between them, this string of digits will be mapped
to the month, day and year as follows:

                Length:        Mapping:
                  3              mdy
                  4              mdyy
                  5              mddyy
                  6              mmddyy
                  7              mddyyyy
                  8              mmddyyyy

(Where "m" stands for "month", "d" stands for "day" and "y" stands for
"year".)

All other strings consisting purely of digits (without any intervening
delimiters) are rejected, i.e., not recognized.

If only the day and the year form a contiguous string of digits, they
will be mapped as follows:

                Length:        Mapping:
                  2              dy
                  3              dyy
                  4              ddyy
                  5              dyyyy
                  6              ddyyyy

(Where "d" stands for "day" and "y" stands for "year".)

Examples:

  "1 3 64"
  "01/03/64"
  "Jan 3 '64"
  "Jan 3 1964"
  "===> January 3rd 1964 (birthday)"
  "Jan31964"
  "Jan364"
  "ja364"
  "1364"

Experiment! (See the corresponding example applications in the
"examples" subdirectory of this distribution in order to do so.)

=item *

C<$date = Compress($year,$month,$day);>

This function encodes a date in 16 bits, which is the value being returned.

The encoding scheme is as follows:

            Bit number:    FEDCBA9 8765 43210
            Contents:      yyyyyyy mmmm ddddd

(Where the "yyyyyyy" contain the number of the year, "mmmm" the number of
the month and "ddddd" the number of the day.)

The function returns "C<0>" if the given input values do not represent a
valid date. Therefore, the return value of this function can also be used
as the conditional expression in an "if" statement, in order to check
wether the given input values constitute a valid date).

Through this special encoding scheme, it is possible to B<COMPARE>
compressed dates for equality and order (less than/greater than)
B<WITHOUT> any previous B<DECODING>!

Note however that contiguous dates do B<NOT> necessarily have contiguous
compressed representations!

I.e., incrementing the compressed representation of a date B<MAY OR MAY NOT>
yield a valid new date!

Note also that this function can only handle dates within one century.

This century can be chosen at random by defining a base century and year
(also called the "epoch"). In the original distribution of this package,
the base century is set to "1900" and the base year to "70" (which is
standard on UNIX systems).

This allows this function to handle dates from "1970" up to "2069".

If the given year is equal to, say, "95", this package will automatically
assume that you really mean "1995" instead. However, if you specify a year
number which is B<SMALLER> than 70, like "64", for instance, this package
will assume that you really mean "2064".

You are not confined to two-digit (abbreviated) year numbers, though.

The function also accepts "full-length" year numbers, provided that they
lie in the supported range (i.e., from "1970" to "2069", in the original
configuration of this package).

Note that this function is maintained mainly for backward compatibility,
and that its use is not recommended.

=item *

C<if (($century,$year,$month,$day) = Uncompress($date))>

This function decodes dates that were encoded previously using the function
"C<Compress()>".

It returns the century, year, month and day of the date encoded in "C<$date>"
if "C<$date>" represents a valid date, or an empty list otherwise.

The year returned in "C<$year>" is actually a two-digit year number
(i.e., the year number taken modulo 100), and only the expression
"C<$century + $year>" yields the "full-length" year number
(for example, C<1900 + 95 = 1995>).

Note that this function is maintained mainly for backward compatibility,
and that its use is not recommended.

=item *

C<if (check_compressed($date))>

This function returns "true" ("C<1>") if the given input value
constitutes a valid compressed date, and "false" ("C<0>") otherwise.

Note that this function is maintained mainly for backward compatibility,
and that its use is not recommended.

=item *

C<$string = Compressed_to_Text($date);>

This function returns a string of fixed length (always 9 characters long)
containing a textual representation of the compressed date encoded in
"C<$date>".

This string has the form "dd-Mmm-yy", where "dd" is the two-digit number
of the day, "Mmm" are the first three letters of the name of the month
in the currently selected language (see further below for details about
the multi-language support of this package), and "yy" is the two-digit
year number (i.e., the year number taken modulo 100).

If "C<$date>" does not represent a valid date, the string "??-???-??" is
returned instead.

Note that this function is maintained mainly for backward compatibility,
and that its use is not recommended.

=item *

C<$string = Date_to_Text($year,$month,$day);>

This function returns a string containing a textual representation of the
given date of the form "www dd-Mmm-yyyy", where "www" are the first three
letters of the name of the day of week in the currently selected language,
or a special abbreviation, if special abbreviations have been defined for
the currently selected language (see further below for details about the
multi-language support of this package), "dd" is the day (one or two digits),
"Mmm" are the first three letters of the name of the month in the currently
selected language, and "yyyy" is the number of the year in full length.

If the given input values do not constitute a valid date, a fatal "not a
valid date" error occurs.

(See the section "RECIPES" near the end of this document for a code snippet
for how to print dates in any format you like.)

=item *

C<$string = Date_to_Text_Long($year,$month,$day);>

This function returns a string containing a textual representation of the
given date roughly of the form "Wwwwww, dd Mmmmmm yyyy", where "Wwwwww"
is the name of the day of week in the currently selected language (see
further below for details about the multi-language support of this package),
"dd" is the day (one or two digits), "Mmmmmm" is the name of the month
in the currently selected language, and "yyyy" is the number of the year
in full length.

The exact format of the output string depends on the currently selected
language. In the original distribution of this package, these formats are
defined as follows:

  1  English    :  "Wwwwww, Mmmmmm ddth yyyy"
  2  French     :  "Wwwwww, le dd Mmmmmm yyyy"
  3  German     :  "Wwwwww, den dd. Mmmmmm yyyy"
  4  Spanish    :  "Wwwwww, dd de Mmmmmm de yyyy"
  5  Portuguese :  "Wwwwww, dia dd de Mmmmmm de yyyy"
  6  Dutch      :  "Wwwwww, dd. Mmmmmm yyyy"
  7  Italian    :  "Wwwwww, dd Mmmmmm yyyy"

(You can change these formats in the file "DateCalc.c" before
building this module in order to suit your personal preferences.)

If the given input values do not constitute a valid date, a fatal
"not a valid date" error occurs.

(See the section "RECIPES" near the end of this document for
an example on how to print dates in any format you like.)

=item *

C<$string = English_Ordinal($number);>

This function returns a string containing the (english) abbreviation
of the ordinal number for the given (cardinal) number "C<$number>".

I.e.,

    0  =>  '0th'    10  =>  '10th'    20  =>  '20th'
    1  =>  '1st'    11  =>  '11th'    21  =>  '21st'
    2  =>  '2nd'    12  =>  '12th'    22  =>  '22nd'
    3  =>  '3rd'    13  =>  '13th'    23  =>  '23rd'
    4  =>  '4th'    14  =>  '14th'    24  =>  '24th'
    5  =>  '5th'    15  =>  '15th'    25  =>  '25th'
    6  =>  '6th'    16  =>  '16th'    26  =>  '26th'
    7  =>  '7th'    17  =>  '17th'    27  =>  '27th'
    8  =>  '8th'    18  =>  '18th'    28  =>  '28th'
    9  =>  '9th'    19  =>  '19th'    29  =>  '29th'

etc.

=item *

C<$string = Calendar($year,$month);>

This function returns a calendar of the given month in the given year
(somewhat similar to the UNIX "cal" command), B<IN THE CURRENTLY SELECTED
LANGUAGE> (see further below for details about the multi-language support
of this package).

Example:

  print Calendar(1998,5);

This will print:

           May 1998
  Mon Tue Wed Thu Fri Sat Sun
                    1   2   3
    4   5   6   7   8   9  10
   11  12  13  14  15  16  17
   18  19  20  21  22  23  24
   25  26  27  28  29  30  31

=item *

C<$string = Month_to_Text($month);>

This function returns the name of the given month in the currently selected
language (see further below for details about the multi-language support of
this package).

If the given month lies outside of the valid range from "C<1>" to "C<12>",
a fatal "month out of range" error will occur.

=item *

C<$string = Day_of_Week_to_Text($dow);>

This function returns the name of the given day of week in the currently
selected language (see further below for details about the multi-language
support of this package).

If the given day of week lies outside of the valid range from "C<1>" to "C<7>",
a fatal "day of week out of range" error will occur.

=item *

C<$string = Day_of_Week_Abbreviation($dow);>

This function returns the special abbreviation of the name of the given
day of week, B<IF> such special abbreviations have been defined for the
currently selected language (see further below for details about the
multi-language support of this package).

(In the original distribution of this package, this is only true for
Portuguese.)

If not, the first three letters of the name of the day of week in the
currently selected language are returned instead.

If the given day of week lies outside of the valid range from "C<1>"
to "C<7>", a fatal "day of week out of range" error will occur.

Currently, this table of special abbreviations is only used by the
functions "C<Date_to_Text()>" and "C<Calendar()>", internally.

=item *

C<$string = Language_to_Text($lang);>

This function returns the name of any language supported by this package
when the internal number representing that language is given as input.

The original distribution supports the following seven languages:

            1   ==>   English                     (default)
            2   ==>   Fran�ais    (French)
            3   ==>   Deutsch     (German)
            4   ==>   Espa�ol     (Spanish)
            5   ==>   Portugu�s   (Portuguese)
            6   ==>   Nederlands  (Dutch)
            7   ==>   Italiano    (Italian)

See the section "How to install additional languages" in the file
"INSTALL.txt" in this distribution for how to add more languages
to this package.

See the description of the function "C<Languages()>" further below
to determine how many languages are actually available in a given
installation of this package.

=item *

C<$lang = Language();>

=item *

C<Language($lang);>

=item *

C<$oldlang = Language($newlang);>

This function can be used to determine which language is currently selected,
and to change the selected language.

Thereby, each language has a unique internal number.

The original distribution contains the following seven languages:

            1   ==>   English                     (default)
            2   ==>   Fran�ais    (French)
            3   ==>   Deutsch     (German)
            4   ==>   Espa�ol     (Spanish)
            5   ==>   Portugu�s   (Portuguese)
            6   ==>   Nederlands  (Dutch)
            7   ==>   Italiano    (Italian)

See the section "How to install additional languages" in the file
"INSTALL.txt" in this distribution for how to add more languages
to this package.

See the description of the function "C<Languages()>" further below
to determine how many languages are actually available in a given
installation of this package.

B<BEWARE> that in order for your programs to be portable, you should B<NEVER>
actually use the internal number of a language in this package B<EXPLICITLY>,
because the same number could mean different languages on different systems,
depending on what languages have been added to any given installation of this
package.

Therefore, you should always use a statement such as

  Language(Decode_Language("Name_of_Language"));

to select the desired language, and

  $language = Language_to_Text(Language());

or

  $old_language = Language_to_Text(Language("Name_of_new_Language"));

to determine the (previously) selected language.

If the so chosen language is not available in the current installation,
this will result in an appropriate error message, instead of silently
using the wrong (a random) language (which just happens to have the
same internal number in the other installation).

Note that in the current implementation of this package, the selected
language is a global setting valid for B<ALL> functions that use the names
of months, days of week or languages internally, valid for B<ALL PROCESSES>
using the same copy of the "Date::Calc" shared library in memory!

This may have surprising side-effects in a multi-user environment, and even
more so when Perl will be capable of multi-threading in some future release.

=item *

C<$max_lang = Languages();>

This function returns the (maximum) number of languages which are
currently available in your installation of this package.

(This may vary from installation to installation.)

See the section "How to install additional languages" in the file
"INSTALL.txt" in this distribution for how to add more languages
to this package.

In the original distribution of this package there are seven built-in
languages, therefore the value returned by this function will be "C<7>"
if no other languages have been added to your particular installation.

=item *

C<if (($year,$month,$day) = Decode_Date_EU2($string))>

This function is the Perl equivalent of the function "C<Decode_Date_EU()>"
(implemented in C), included here merely as an example to demonstrate how
easy it is to write your own routine in Perl (using regular expressions)
adapted to your own special needs, should the necessity arise, and intended
primarily as a basis for your own development.

In one particular case this Perl version is actually slightly more permissive
than its C equivalent, as far as the class of permitted intervening (i.e.,
delimiting) characters is concerned.

(Can you tell the subtle, almost insignificant difference by looking at
the code? Or by experimenting? Hint: Try the string "a3b1c64d" with both
functions.)

=item *

C<if (($year,$month,$day) = Decode_Date_US2($string))>

This function is the Perl equivalent of the function "C<Decode_Date_US()>"
(implemented in C), included here merely as an example to demonstrate how
easy it is to write your own routine in Perl (using regular expressions)
adapted to your own special needs, should the necessity arise, and intended
primarily as a basis for your own development.

In one particular case this Perl version is actually slightly more permissive
than its C equivalent.

(Hint: This is the same difference as with the "C<Decode_Date_EU()>" and
"C<Decode_Date_EU2()>" pair of functions.)

In a different case, the C version is a little bit more permissive than its
Perl equivalent.

(Can you tell the difference by looking at the code? Or by experimenting?
Hint: Try the string "(1/364)" with both functions.)

=item *

C<if (($year,$month,$day) = Parse_Date($string))>

This function is useful for parsing dates as returned by the UNIX "C<date>"
command or as found in the headers of e-mail (in order to determine the
date at which some e-mail has been sent or received, for instance).

Example #1:

  ($year,$month,$day) = Parse_Date(`/bin/date`);

Example #2:

  while (<MAIL>)
  {
      if (/^From \S/)
      {
          ($year,$month,$day) = Parse_Date($_);
          ...
      }
      ...
  }

The function returns an empty list if it can't extract a valid date from
the input string.

=item *

C<$string = Date::Calc::Version();>

This function returns a string with the (numeric) version number of the
S<C library> ("DateCalc.c") at the core of this package (which is also
(automatically) the version number of the "Calc.xs" file).

Note that under all normal circumstances, this version number should be
identical with the one found in the Perl variable "C<$Date::Calc::VERSION>"
(the version number of the "Calc.pm" file).

Since this function is not exported, you always have to qualify it explicitly,
i.e., "C<Date::Calc::Version()>".

This is to avoid possible name space conflicts with version functions from
other modules.

=back

=head1 RECIPES

=over 4

=item 1)

How do I compare two dates?

Solution #1:

  use Date::Calc qw( Date_to_Days );

  if (Date_to_Days($year1,$month1,$day1)  <
      Date_to_Days($year2,$month2,$day2))

  if (Date_to_Days($year1,$month1,$day1)  <=
      Date_to_Days($year2,$month2,$day2))

  if (Date_to_Days($year1,$month1,$day1)  >
      Date_to_Days($year2,$month2,$day2))

  if (Date_to_Days($year1,$month1,$day1)  >=
      Date_to_Days($year2,$month2,$day2))

  if (Date_to_Days($year1,$month1,$day1)  ==
      Date_to_Days($year2,$month2,$day2))

  if (Date_to_Days($year1,$month1,$day1)  !=
      Date_to_Days($year2,$month2,$day2))

  $cmp = (Date_to_Days($year1,$month1,$day1)  <=>
          Date_to_Days($year2,$month2,$day2));

Solution #2:

  use Date::Calc qw( Delta_Days );

  if (Delta_Days($year1,$month1,$day1,
                 $year2,$month2,$day2) > 0)

  if (Delta_Days($year1,$month1,$day1,
                 $year2,$month2,$day2) >= 0)

  if (Delta_Days($year1,$month1,$day1,
                 $year2,$month2,$day2) < 0)

  if (Delta_Days($year1,$month1,$day1,
                 $year2,$month2,$day2) <= 0)

  if (Delta_Days($year1,$month1,$day1,
                 $year2,$month2,$day2) == 0)

  if (Delta_Days($year1,$month1,$day1,
                 $year2,$month2,$day2) != 0)

=item 2)

How do I check wether a given date lies within a certain range of dates?

  use Date::Calc qw( Date_to_Days );

  $lower = Date_to_Days($year1,$month1,$day1);
  $upper = Date_to_Days($year2,$month2,$day2);

  $date = Date_to_Days($year,$month,$day);

  if (($date >= $lower) && ($date <= $upper))
  {
      # ok
  }
  else
  {
      # not ok
  }

=item 3)

How do I verify wether someone has a certain age?

  use Date::Calc qw( Decode_Date_EU Today leap_year Delta_Days );

  $date = <STDIN>; # get birthday

  ($year1,$month1,$day1) = Decode_Date_EU($date);

  ($year2,$month2,$day2) = Today();

  if (($day1 == 29) && ($month1 == 2) && !leap_year($year2))
      { $day1--; }

  if ( (($year2 - $year1) >  18) ||
     ( (($year2 - $year1) == 18) &&
     (Delta_Days($year2,$month1,$day1, $year2,$month2,$day2) >= 0) ) )
  {
      print "Ok - you are over 18.\n";
  }
  else
  {
      print "Sorry - you aren't 18 yet!\n";
  }

=item 4)

How do I calculate the number of the week of month
the current date lies in?

For example:

            April 1998
    Mon Tue Wed Thu Fri Sat Sun
              1   2   3   4   5  =  week #1
      6   7   8   9  10  11  12  =  week #2
     13  14  15  16  17  18  19  =  week #3
     20  21  22  23  24  25  26  =  week #4
     27  28  29  30              =  week #5

Solution:

  use Date::Calc qw( Today Day_of_Week );

  ($year,$month,$day) = Today();

  $week = int(($day + Day_of_Week($year,$month,1) - 2) / 7) + 1;

=item 5)

How do I calculate wether a given date is the 1st, 2nd, 3rd, 4th or 5th
of that day of week in the given month?

For example:

           October 2000
    Mon Tue Wed Thu Fri Sat Sun
                              1
      2   3   4   5   6   7   8
      9  10  11  12  13  14  15
     16  17  18  19  20  21  22
     23  24  25  26  27  28  29
     30  31

Is Sunday, the 15th of October 2000, the 1st, 2nd, 3rd, 4th or 5th
Sunday of that month?

Solution:

  use Date::Calc qw( Day_of_Week Delta_Days
                     Nth_Weekday_of_Month_Year
                     Date_to_Text_Long English_Ordinal
                     Day_of_Week_to_Text Month_to_Text );

  ($year,$month,$day) = (2000,10,15);

  $dow = Day_of_Week($year,$month,$day);

  $n = int( Delta_Days(
            Nth_Weekday_of_Month_Year($year,$month,$dow,1),
            $year,$month,$day)
            / 7) + 1;

  printf("%s is the %s %s in %s %d.\n",
      Date_to_Text_Long($year,$month,$day),
      English_Ordinal($n),
      Day_of_Week_to_Text($dow),
      Month_to_Text($month),
      $year);

This prints:

  Sunday, October 15th 2000 is the 3rd Sunday in October 2000.

=item 6)

How do I calculate the date of the Wednesday of the same week as
the current date?

Solution #1:

  use Date::Calc qw( Today Day_of_Week Add_Delta_Days );

  $searching_dow = 3; # 3 = Wednesday

  @today = Today();

  $current_dow = Day_of_Week(@today);

  @date = Add_Delta_Days(@today, $searching_dow - $current_dow);

Solution #2:

  use Date::Calc qw( Today Add_Delta_Days
                     Monday_of_Week Week_of_Year );

  $searching_dow = 3; # 3 = Wednesday

  @today = Today();

  @date = Add_Delta_Days( Monday_of_Week( Week_of_Year(@today) ),
                          $searching_dow - 1 );

Solution #3:

  use Date::Calc qw( Standard_to_Business Today
                     Business_to_Standard );

  @business = Standard_to_Business(Today());

  $business[2] = 3; # 3 = Wednesday

  @date = Business_to_Standard(@business);

=item 7)

How can I add a week offset to a business date (including across
year boundaries)?

  use Date::Calc qw( Business_to_Standard Add_Delta_Days
                     Standard_to_Business );

  @temp = Business_to_Standard($year,$week,$dow);

  @temp = Add_Delta_Days(@temp, $week_offset * 7);

  ($year,$week,$dow) = Standard_to_Business(@temp);

=item 8)

How do I calculate the last and the next Saturday for any
given date?

  use Date::Calc qw( Today Day_of_Week Add_Delta_Days
                     Day_of_Week_to_Text Date_to_Text );

  $searching_dow = 6; # 6 = Saturday

  @today = Today();

  $current_dow = Day_of_Week(@today);

  if ($searching_dow == $current_dow)
  {
      @prev = Add_Delta_Days(@today,-7);
      @next = Add_Delta_Days(@today,+7);
  }
  else
  {
      if ($searching_dow > $current_dow)
      {
          @next = Add_Delta_Days(@today,
                    $searching_dow - $current_dow);
          @prev = Add_Delta_Days(@next,-7);
      }
      else
      {
          @prev = Add_Delta_Days(@today,
                    $searching_dow - $current_dow);
          @next = Add_Delta_Days(@prev,+7);
      }
  }

  $dow = Day_of_Week_to_Text($searching_dow);

  print "Today is:      ", ' ' x length($dow),
                               Date_to_Text(@today), "\n";
  print "Last $dow was:     ", Date_to_Text(@prev),  "\n";
  print "Next $dow will be: ", Date_to_Text(@next),  "\n";

This will print something like:

  Today is:              Sun 12-Apr-1998
  Last Saturday was:     Sat 11-Apr-1998
  Next Saturday will be: Sat 18-Apr-1998

=item 9)

How can I calculate the last business day (payday!) of a month?

Solution #1 (holidays B<NOT> taken into account):

  use Date::Calc qw( Days_in_Month Day_of_Week Add_Delta_Days );

  $day = Days_in_Month($year,$month);
  $dow = Day_of_Week($year,$month,$day);
  if ($dow > 5)
  {
      ($year,$month,$day) =
          Add_Delta_Days($year,$month,$day, 5-$dow);
  }

Solution #2 (holidays taken into account):

This solution expects a multi-dimensional array "C<@holiday>", which
contains all holidays, as follows: "C<$holiday[$year][$month][$day] = 1;>".

(See the description of the function "C<Easter_Sunday()>" further above for
how to calculate the moving (variable) christian feast days!)

Days which are not holidays remain undefined or should have a value of zero
in this array.

  use Date::Calc qw( Days_in_Month Add_Delta_Days Day_of_Week );

  $day = Days_in_Month($year,$month);
  while (1)
  {
      while ($holiday[$year][$month][$day])
      {
          ($year,$month,$day) =
              Add_Delta_Days($year,$month,$day, -1);
      }
      $dow = Day_of_Week($year,$month,$day);
      if ($dow > 5)
      {
          ($year,$month,$day) =
              Add_Delta_Days($year,$month,$day, 5-$dow);
      }
      else { last; }
  }

=item 10)

How do I convert a MS Visual Basic "DATETIME" value into its date
and time constituents?

  use Date::Calc qw( Add_Delta_DHMS Date_to_Text );

  $datetime = "35883.121653";

  ($Dd,$Dh,$Dm,$Ds) = ($datetime =~ /^(\d+)\.(\d\d)(\d\d)(\d\d)$/);

  ($year,$month,$day, $hour,$min,$sec) =
      Add_Delta_DHMS(1900,1,1, 0,0,0, $Dd,$Dh,$Dm,$Ds);

  printf("The given date is %s %02d:%02d:%02d\n",
      Date_to_Text($year,$month,$day), $hour, $min, $sec);

This prints:

  The given date is Tue 31-Mar-1998 12:16:53

=item 11)

How can I send a reminder to members of a group on the day
before a meeting which occurs every first Friday of a month?

  use Date::Calc qw( Today Date_to_Days Add_Delta_YMD
                     Nth_Weekday_of_Month_Year );

  ($year,$month,$day) = Today();

  $tomorrow = Date_to_Days($year,$month,$day) + 1;

  $dow = 5; # 5 = Friday
  $n   = 1; # 1 = First of that day of week

  $meeting_this_month = Date_to_Days(
      Nth_Weekday_of_Month_Year($year,$month,$dow,$n) );

  ($year,$month,$day) = Add_Delta_YMD($year,$month,$day, 0,1,0);

  $meeting_next_month = Date_to_Days(
      Nth_Weekday_of_Month_Year($year,$month,$dow,$n) );

  if (($tomorrow == $meeting_this_month) ||
      ($tomorrow == $meeting_next_month))
  {
      # Send reminder e-mail!
  }

=item 12)

How can I print a date in a different format than provided by
the functions "C<Date_to_Text()>", "C<Date_to_Text_Long()>" or
"C<Compressed_to_Text()>"?

  use Date::Calc qw( Today Day_of_Week_to_Text
                     Day_of_Week Month_to_Text
                     English_Ordinal );

  ($year,$month,$day) = Today();

For example with leading zeros for the day: "S<Fri 03-Jan-1964>"

  printf("%.3s %02d-%.3s-%d\n",
      Day_of_Week_to_Text(Day_of_Week($year,$month,$day)),
      $day,
      Month_to_Text($month),
      $year);

For example in U.S. american format: "S<April 12th, 1998>"

  $string = sprintf("%s %s, %d",
                Month_to_Text($month),
                English_Ordinal($day),
                $year);

(See also L<perlfunc(1)/printf> and/or L<perlfunc(1)/sprintf>!)

=item 13)

How can I iterate through a range of dates?

  use Date::Calc qw( Delta_Days Add_Delta_Days );

  @start = (1999,5,27);
  @stop  = (1999,6,1);

  $j = Delta_Days(@start,@stop);

  for ( $i = 0; $i <= $j; $i++ )
  {
      @date = Add_Delta_Days(@start,$i);
      printf("%4d/%02d/%02d\n", @date);
  }

Note that the loop can be improved; see also the recipe below.

=item 14)

How can I create a (Perl) list of dates in a certain range?

  use Date::Calc qw( Delta_Days Add_Delta_Days Date_to_Text );

  sub date_range
  {
      my(@date) = (@_)[0,1,2];
      my(@list);
      my($i);

      $i = Delta_Days(@_);
      while ($i-- >= 0)
      {
          push( @list, [ @date ] );
          @date = Add_Delta_Days(@date, 1) if ($i >= 0);
      }
      return(@list);
  }

  @range = &date_range(1999,11,3, 1999,12,24); # in chronological order

  foreach $date (@range)
  {
      print Date_to_Text(@{$date}), "\n";
  }

Note that you probably shouldn't use this one, because it is much
more efficient to iterate through all the dates (as shown in the
recipe immediately above) than to construct such an array and then
to loop through it. Also, it is much more space-efficient not to
create this array.

=item 15)

How can I calculate the difference in days between dates,
but without counting Saturdays and Sundays?

  sub Delta_Business_Days
  {
      my(@date1) = (@_)[0,1,2];
      my(@date2) = (@_)[3,4,5];
      my($minus,$result,$dow1,$dow2,$diff,$temp);

      $minus  = 0;
      $result = Delta_Days(@date1,@date2);
      if ($result != 0)
      {
          if ($result < 0)
          {
              $minus = 1;
              $result = -$result;
              $dow1 = Day_of_Week(@date2);
              $dow2 = Day_of_Week(@date1);
          }
          else
          {
              $dow1 = Day_of_Week(@date1);
              $dow2 = Day_of_Week(@date2);
          }
          $diff = $dow2 - $dow1;
          $temp = $result;
          if ($diff != 0)
          {
              if ($diff < 0)
              {
                  $diff += 7;
              }
              $temp -= $diff;
              $dow1 += $diff;
              if ($dow1 > 6)
              {
                  $result--;
                  if ($dow1 > 7)
                  {
                      $result--;
                  }
              }
          }
          if ($temp != 0)
          {
              $temp /= 7;
              $result -= ($temp << 1);
          }
      }
      if ($minus) { return -$result; }
      else        { return  $result; }
  }

This solution is probably of little practical value, however,
because it doesn't take legal holidays into account.

=back

=head1 SEE ALSO

perl(1), perlfunc(1), perlsub(1), perlmod(1),
perlxs(1), perlxstut(1), perlguts(1).

news:news.answers
"Calendar FAQ, v. 1.9 (modified 25 Apr 1998) Part 1/3"

news:news.answers
"Calendar FAQ, v. 1.9 (modified 25 Apr 1998) Part 2/3"

news:news.answers
"Calendar FAQ, v. 1.9 (modified 25 Apr 1998) Part 3/3"

http://www.math.uio.no/faq/calendars/faq.html

http://www.pip.dknet.dk/~pip10160/calendar.html

(All authored by Claus Tondering <c-t@pip.dknet.dk>)

=head1 LIMITATIONS

In the current implementation of this package, the selected language
is stored in a global variable.

Therefore, when you are using a threaded Perl, this may cause undesired
side effects (of one thread always selecting the language for B<ALL OTHER>
threads as well).

=head1 VERSION

This man page documents "Date::Calc" version 4.3.

=head1 AUTHOR

  Steffen Beyer
  Ainmillerstr. 5 / App. 513
  D-80801 Munich
  Germany

  mailto:sb@engelschall.com
  http://www.engelschall.com/u/sb/download/

B<Please contact me by e-mail whenever possible!>

=head1 COPYRIGHT

Copyright (c) 1995 - 2000 by Steffen Beyer.
All rights reserved.

=head1 LICENSE

This package is free software; you can redistribute it and/or
modify it under the same terms as Perl itself, i.e., under the
terms of the "Artistic License" or the "GNU General Public License".

The C library at the core of this Perl module can additionally
be redistributed and/or modified under the terms of the
"GNU Library General Public License".

Please refer to the files "Artistic.txt", "GNU_GPL.txt" and
"GNU_LGPL.txt" in this distribution for details!

=head1 DISCLAIMER

This package is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the "GNU General Public License" for more details.

