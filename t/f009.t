#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( day_of_week );

# ======================================================================
#   $weekday = day_of_week($year,$mm,$dd);
# ======================================================================

print "1..9\n";

$n = 1;
if (day_of_week(1964,1,3)   == 4) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,13) == 0) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,14) == 1) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,15) == 2) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,16) == 3) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,17) == 4) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,18) == 5) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,19) == 6) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (day_of_week(1995,11,20) == 0) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
