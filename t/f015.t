#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( weeks_in_year );

# ======================================================================
#   $weeks = weeks_in_year($year);
# ======================================================================

print "1..4\n";

$n = 1;
if (weeks_in_year(1964) == 53) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (weeks_in_year(1970) == 53) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (weeks_in_year(1976) == 53) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (weeks_in_year(1995) == 52) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
