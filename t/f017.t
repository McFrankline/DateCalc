#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( day_short_tab day_name_tab );

# ======================================================================
#   $day = day_short_tab($weekday);
# ======================================================================

# ======================================================================
#   $day = day_name_tab($weekday);
# ======================================================================

print "1..14\n";

$n = 1;
if ((day_short_tab(0) eq "Mon") && (day_name_tab(0) eq "Monday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(1) eq "Tue") && (day_name_tab(1) eq "Tuesday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(2) eq "Wed") && (day_name_tab(2) eq "Wednesday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(3) eq "Thu") && (day_name_tab(3) eq "Thursday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(4) eq "Fri") && (day_name_tab(4) eq "Friday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(5) eq "Sat") && (day_name_tab(5) eq "Saturday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(6) eq "Sun") && (day_name_tab(6) eq "Sunday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(7) eq "Mon") && (day_name_tab(7) eq "Monday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(8) eq "Tue") && (day_name_tab(8) eq "Tuesday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(9) eq "Wed") && (day_name_tab(9) eq "Wednesday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(10) eq "Thu") && (day_name_tab(10) eq "Thursday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(11) eq "Fri") && (day_name_tab(11) eq "Friday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(12) eq "Sat") && (day_name_tab(12) eq "Saturday"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((day_short_tab(13) eq "Sun") && (day_name_tab(13) eq "Sunday"))
{print "ok $n\n";} else {print "not ok $n\n";}

__END__
