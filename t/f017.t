#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( day_name_tab );

# ======================================================================
#   $day = day_name_tab($weekday);
# ======================================================================

print "1..17\n";

$n = 1;
if (day_name_tab(0) eq "Error")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(1) eq "Monday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(2) eq "Tuesday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(3) eq "Wednesday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(4) eq "Thursday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(5) eq "Friday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(6) eq "Saturday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(7) eq "Sunday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(8) eq "Error")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(9) eq "Monday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(10) eq "Tuesday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(11) eq "Wednesday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(12) eq "Thursday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(13) eq "Friday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(14) eq "Saturday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(15) eq "Sunday")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_name_tab(16) eq "Error")
{print "ok $n\n";} else {print "not ok $n\n";}

__END__
