#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( compress );

# ======================================================================
#   $date = compress($yy,$mm,$dd);
# ======================================================================

print "1..6\n";

$n = 1;
if (compress(64,1,3)     == 48163) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compress(1964,1,3)   ==     0) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compress(95,11,18)   == 13170) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compress(1995,11,18) == 13170) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compress(1995,2,28)  == 12892) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compress(1995,2,29)  ==     0) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
