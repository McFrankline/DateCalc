#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( first_in_week );

# ======================================================================
#   ($year,$mm,$dd) = first_in_week($week,$year);
# ======================================================================

print "1..11\n";

$n = 1;
($year,$mm,$dd) = first_in_week(52,1994);
if (($year==1994)&&($mm==12)&&($dd==26)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(1,1995);
if (($year==1995)&&($mm==1)&&($dd==2)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(46,1995);
if (($year==1995)&&($mm==11)&&($dd==13)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(52,1995);
if (($year==1995)&&($mm==12)&&($dd==25)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(1,1964);
if (($year==1963)&&($mm==12)&&($dd==30)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(53,1964);
if (($year==1964)&&($mm==12)&&($dd==28)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(1,1965);
if (($year==1965)&&($mm==1)&&($dd==4)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(53,1995);
if (($year==1996)&&($mm==1)&&($dd==1)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(1,1996);
if (($year==1996)&&($mm==1)&&($dd==1)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(54,1995);
if (($year==1996)&&($mm==1)&&($dd==8)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = first_in_week(2,1996);
if (($year==1996)&&($mm==1)&&($dd==8)) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
