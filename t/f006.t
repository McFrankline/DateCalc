#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( compressed_to_short );

# ======================================================================
#   $datestr = compressed_to_short($date);
# ======================================================================

print "1..5\n";

$n = 1;
if (compressed_to_short(48163) eq "03-Jan-64") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compressed_to_short(    0) eq "<no date>") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compressed_to_short(13170) eq "18-Nov-95") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compressed_to_short(12892) eq "28-Feb-95") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (compressed_to_short(12893) eq "<no date>") {print "ok $n\n";} else {print "not ok $n\n";}

__END__
