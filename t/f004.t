#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( uncompress );

# ======================================================================
#   ($cc,$yy,$mm,$dd) = uncompress($date);
# ======================================================================

print "1..5\n";

$n = 1;
if ((($cc,$yy,$mm,$dd) = uncompress(48163)) &&
($cc==2000)&&($yy==64)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
unless (($cc,$yy,$mm,$dd) = uncompress(0))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($cc,$yy,$mm,$dd) = uncompress(13170)) &&
($cc==1900)&&($yy==95)&&($mm==11)&&($dd==18))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($cc,$yy,$mm,$dd) = uncompress(12892)) &&
($cc==1900)&&($yy==95)&&($mm==2)&&($dd==28))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
unless (($cc,$yy,$mm,$dd) = uncompress(12893))
{print "ok $n\n";} else {print "not ok $n\n";}

__END__

