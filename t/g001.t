#!perl -w

use strict;
no strict "vars";

use Date::DateCalcLib qw( nth_wday_of_month_year );

# ======================================================================
#   ($year,$mm,$dd) = nth_wday_of_month_year($nth,$wday,$month,$year);
# ======================================================================

print "1..5\n";

$n = 1;
if ((($year,$mm,$dd) = nth_wday_of_month_year(2,4,4,1996)) &&
($year==1996) && ($mm==4) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = nth_wday_of_month_year(4,1,4,1996)) &&
($year==1996) && ($mm==4) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = nth_wday_of_month_year(5,1,4,1996)) &&
($year==1996) && ($mm==4) && ($dd==29))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = nth_wday_of_month_year(5,3,4,1996))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = nth_wday_of_month_year(1,5,2,1997)) &&
($year==1997) && ($mm==2) && ($dd==7))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__

