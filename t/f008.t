#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( dates_difference );

# ======================================================================
#   $days = dates_difference($year1,$mm1,$dd1,$year2,$mm2,$dd2);
# ======================================================================

print "1..5\n";

$n = 1;
if (dates_difference(1964,1,3,1995,11,18) == 11642) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (dates_difference(1995,11,18,1964,1,3) == -11642) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (dates_difference(1964,1,3,1995,2,29) == -716973) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (dates_difference(1964,2,30,1995,11,18) == 728615) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (dates_difference(1964,2,30,1995,2,29) == 0) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
