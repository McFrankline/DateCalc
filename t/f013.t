#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( week_number );

# ======================================================================
#   ($week,$year) = week_number($year,$mm,$dd);
# ======================================================================

print "1..6\n";

$n = 1;
($week,$year) = week_number(1995,1,1);
if (($week==52)&&($year==1994)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($week,$year) = week_number(1995,11,18);
if (($week==46)&&($year==1995)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($week,$year) = week_number(1995,12,31);
if (($week==52)&&($year==1995)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($week,$year) = week_number(1964,1,3);
if (($week==1)&&($year==1964)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($week,$year) = week_number(1964,12,31);
if (($week==53)&&($year==1964)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($week,$year) = week_number(1965,1,1);
if (($week==53)&&($year==1964)) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
