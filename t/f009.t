#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( day_of_week );

# ======================================================================
#   $weekday = day_of_week($year,$mm,$dd);
# ======================================================================

print "1..11\n";

$n = 1;
if (day_of_week(1964,1,3)   == 5) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,13) == 1) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,14) == 2) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,15) == 3) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,16) == 4) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,17) == 5) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,18) == 6) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,19) == 7) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,20) == 1) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,2,28) == 2) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,2,29) == 0) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
