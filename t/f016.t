#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( decode_date );

# ======================================================================
#   ($year,$mm,$dd) = decode_date($buffer);
# ======================================================================

print "1..14\n";

$n = 1;
($year,$mm,$dd) = decode_date("3.1.64");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("3 1 64");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("03.01.64");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("03/01/64");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("3. Jan 1964");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("3. Jan '64");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("03-Jan-64");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("3.Jan1964");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("3Jan64");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("3ja64");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("030164");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("3164");
if (($year==1964)&&($mm==1)&&($dd==3)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("28.2.1995");
if (($year==1995)&&($mm==2)&&($dd==28)) {print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($year,$mm,$dd) = decode_date("29.2.1995");
if (($year==0)&&($mm==0)&&($dd==0)) {print "ok $n\n";} else {print "not ok $n\n";}

__END__
