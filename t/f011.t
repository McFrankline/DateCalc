#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( date_to_short );

# ======================================================================
#   $datestr = date_to_short($year,$mm,$dd);
# ======================================================================

print "1..2\n";

$n = 1;
if (date_to_short(1964,1,3) eq "Fri 3-Jan-1964") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (date_to_short(1995,11,18) eq "Sat 18-Nov-1995") {print "ok $n\n";} else {print "not ok $n\n";}

__END__
