#!perl -w

use strict;
no strict "vars";

use Date::DateCalc;

# ======================================================================
#   $version = Date::DateCalc::Version();
# ======================================================================

print "1..1\n";

$n = 1;
if (Date::DateCalc::Version() eq "1.2b") {print "ok $n\n";} else {print "not ok $n\n";}

__END__