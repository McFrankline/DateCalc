#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( leap );

# ======================================================================
#   $flag = leap($year);
# ======================================================================

print "1..2\n";

$n = 1;
if (leap(1964) == 1) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (leap(1995) == 0) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
