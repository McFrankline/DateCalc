#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( date_to_string );

# ======================================================================
#   $datestr = date_to_string($year,$mm,$dd);
# ======================================================================

print "1..2\n";

$n = 1;
if (date_to_string(1964,1,3) eq "Friday, 3 January 1964") {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (date_to_string(1995,11,18) eq "Saturday, 18 November 1995") {print "ok $n\n";} else {print "not ok $n\n";}

__END__
