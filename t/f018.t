#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( month_short_tab month_name_tab );

# ======================================================================
#   $month = month_short_tab($mm);
# ======================================================================

# ======================================================================
#   $month = month_name_tab($mm);
# ======================================================================

print "1..26\n";

$n = 1;
if ((month_short_tab(0) eq "Err") && (month_name_tab(0) eq "Error"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(1) eq "Jan") && (month_name_tab(1) eq "January"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(2) eq "Feb") && (month_name_tab(2) eq "February"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(3) eq "Mar") && (month_name_tab(3) eq "March"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(4) eq "Apr") && (month_name_tab(4) eq "April"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(5) eq "May") && (month_name_tab(5) eq "May"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(6) eq "Jun") && (month_name_tab(6) eq "June"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(7) eq "Jul") && (month_name_tab(7) eq "July"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(8) eq "Aug") && (month_name_tab(8) eq "August"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(9) eq "Sep") && (month_name_tab(9) eq "September"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(10) eq "Oct") && (month_name_tab(10) eq "October"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(11) eq "Nov") && (month_name_tab(11) eq "November"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(12) eq "Dec") && (month_name_tab(12) eq "December"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(13) eq "Err") && (month_name_tab(13) eq "Error"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(14) eq "Jan") && (month_name_tab(14) eq "January"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(15) eq "Feb") && (month_name_tab(15) eq "February"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(16) eq "Mar") && (month_name_tab(16) eq "March"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(17) eq "Apr") && (month_name_tab(17) eq "April"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(18) eq "May") && (month_name_tab(18) eq "May"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(19) eq "Jun") && (month_name_tab(19) eq "June"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(20) eq "Jul") && (month_name_tab(20) eq "July"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(21) eq "Aug") && (month_name_tab(21) eq "August"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(22) eq "Sep") && (month_name_tab(22) eq "September"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(23) eq "Oct") && (month_name_tab(23) eq "October"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(24) eq "Nov") && (month_name_tab(24) eq "November"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((month_short_tab(25) eq "Dec") && (month_name_tab(25) eq "December"))
{print "ok $n\n";} else {print "not ok $n\n";}

__END__
