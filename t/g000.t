#!perl -w

use strict;
no strict "vars";

use Date::DateCalcLib;

# ======================================================================
#   $version = $Date::DateCalcLib::VERSION;
# ======================================================================

print "1..1\n";

$n = 1;
if ($Date::DateCalcLib::VERSION eq "1.0")
{print "ok $n\n";} else {print "not ok $n\n";}

__END__

