#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( calc_days );

# ======================================================================
#   $days = calc_days($year,$mm,$dd);
# ======================================================================

print "1..2\n";

$n = 1;
if (calc_days(1964,1,3) == 716973)   {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (calc_days(1995,11,18) == 728615) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
