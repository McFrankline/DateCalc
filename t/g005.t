#!perl -w

use strict;
no strict "vars";

use Date::DateCalcLib qw( parse_date );

# ======================================================================
#   ($year,$mm,$dd) = parse_date($date);
# ======================================================================

print "1..8\n";

$n = 1;
unless (($year,$mm,$dd) = parse_date(""))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = parse_date("Sat Dec  2 00:10:10 1995")) &&
($year==1995) && ($mm==12) && ($dd==2))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = parse_date("Tue Jan 04 16:31:59 1996")) &&
($year==1996) && ($mm==1) && ($dd==4))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = parse_date("Sun Feb 16 00:01:13 GMT+0100 1997")) &&
($year==1997) && ($mm==2) && ($dd==16))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = parse_date("Jane 1997 Feb 16 birthday")) &&
($year==1997) && ($mm==2) && ($dd==16))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = parse_date("Jan 1997 Feb 16 birthday")) &&
($year==1997) && ($mm==2) && ($dd==16))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = parse_date("Tue Jan 04 16:31:59 1896"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = parse_date("Sun Feb 29 00:01:13 GMT+0100 1997"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__

