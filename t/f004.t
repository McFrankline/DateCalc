#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( valid_date );

# ======================================================================
#   $flag = valid_date($date);
# ======================================================================

print "1..5\n";

$n = 1;
if (valid_date(48163) == 1) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (valid_date(    0) == 0) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (valid_date(13170) == 1) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (valid_date(12892) == 1) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (valid_date(12893) == 0) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
