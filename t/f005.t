#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( date_string );

# ======================================================================
#   $datestr = date_string($date);
# ======================================================================

print "1..5\n";

$n = 1;
if (date_string(48163) eq "03-Jan-64") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (date_string(    0) eq "<no date>") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (date_string(13170) eq "18-Nov-95") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (date_string(12892) eq "28-Feb-95") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (date_string(12893) eq "<no date>") {print "ok $n\n";} else {print "not ok $n\n";}

__END__
