#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( week_number );

# ======================================================================
#   ($week,$year) = week_number($year,$mm,$dd);
# ======================================================================

print "1..8\n";

$n = 1;
if ((($week,$year) = week_number(1995,1,1)) &&
($week==52)&&($year==1994))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($week,$year) = week_number(1995,11,18)) &&
($week==46)&&($year==1995))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($week,$year) = week_number(1995,12,31)) &&
($week==52)&&($year==1995))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($week,$year) = week_number(1964,1,3)) &&
($week==1)&&($year==1964))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($week,$year) = week_number(1964,12,31)) &&
($week==53)&&($year==1964))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($week,$year) = week_number(1965,1,1)) &&
($week==53)&&($year==1964))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
unless (($week,$year) = week_number(0,1,1))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
unless (($week,$year) = week_number(1997,2,29))
{print "ok $n\n";} else {print "not ok $n\n";}

__END__

