#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( calc_new_date );

# ======================================================================
#   ($year,$mm,$dd) = calc_new_date($year,$mm,$dd,$offset);
# ======================================================================

print "1..9\n";

$n = 1;
($year,$mm,$dd) = calc_new_date(1964,1,3,11642);
if (($year==1995)&&($mm==11)&&($dd==18)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = calc_new_date(1995,11,18,-11642);
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = calc_new_date(1995,2,28,0);
if (($year==1995)&&($mm==2)&&($dd==28)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = calc_new_date(1995,2,28,-1);
if (($year==1995)&&($mm==2)&&($dd==27)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = calc_new_date(1995,2,28,1);
if (($year==1995)&&($mm==3)&&($dd==1)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = calc_new_date(1995,2,29,-1);
if (($year==0)&&($mm==0)&&($dd==0)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = calc_new_date(1,1,1,0);
if (($year==1)&&($mm==1)&&($dd==1)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = calc_new_date(1,1,1,-1);
if (($year==0)&&($mm==0)&&($dd==0)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = calc_new_date(0,1,1,0);
if (($year==0)&&($mm==0)&&($dd==0)) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
