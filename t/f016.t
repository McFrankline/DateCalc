#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( decode_date );

# ======================================================================
#   ($year,$mm,$dd) = decode_date($buffer);
# ======================================================================

print "1..14\n";

$n = 1;
if ((($year,$mm,$dd) = decode_date("3.1.64")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("3 1 64")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("03.01.64")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("03/01/64")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("3. Jan 1964")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("3. Jan '64")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("03-Jan-64")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("3.Jan1964")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("3Jan64")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("3ja64")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("030164")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("3164")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = decode_date("28.2.1995")) &&
($year==1995)&&($mm==2)&&($dd==28))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
unless (($year,$mm,$dd) = decode_date("29.2.1995"))
{print "ok $n\n";} else {print "not ok $n\n";}

__END__

