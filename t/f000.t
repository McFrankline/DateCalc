#!perl -w

use strict;
no strict "vars";

use Date::DateCalc;

# ======================================================================
#   $version = Date::DateCalc::Version();
#   $version = $Date::DateCalc::VERSION;
# ======================================================================

print "1..2\n";

$n = 1;
if (Date::DateCalc::Version() eq "3.2")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($Date::DateCalc::VERSION eq "3.2")
{print "ok $n\n";} else {print "not ok $n\n";}

__END__

