#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( week_number first_in_week );

# ======================================================================
#   ($week,$year) = week_number($year,$mm,$dd);
#   ($year,$mm,$dd) = first_in_week($week,$year);
# ======================================================================

print "1..1\n";

$n = 1;
($year,$mm,$dd) = first_in_week(week_number(1996,6,26));
if (($year==1996)&&($mm==6)&&($dd==24)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__
