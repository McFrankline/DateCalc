#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( date_time_difference );

# ======================================================================
#   ($days,$hh,$mm,$ss) = date_time_difference
#   (
#       $year1,$month1,$day1,$hh1,$mm1,$ss1,
#       $year2,$month2,$day2,$hh2,$mm2,$ss2
#   );
# ======================================================================

print "1..17\n";

$n = 1;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,8,1995,2,28,7,58,31);
if (($dd == 0) && ($h == -10) && ($m == -13) && ($s == -37))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,29,18,12,8,1995,2,28,7,58,31);
if (($dd == 728352) && ($h == 7) && ($m == 58) && ($s == 31))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,8,1995,2,29,7,58,31);
if (($dd == -728352) && ($h == -18) && ($m == -12) && ($s == -8))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,29,18,12,8,1995,2,29,7,58,31);
if (($dd == 0) && ($h == 0) && ($m == 0) && ($s == 0))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,-1,12,8,1995,2,28,7,58,31);
if (($dd == 728352) && ($h == 7) && ($m == 58) && ($s == 31))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,-1,8,1995,2,28,7,58,31);
if (($dd == 728352) && ($h == 7) && ($m == 58) && ($s == 31))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,-1,1995,2,28,7,58,31);
if (($dd == 728352) && ($h == 7) && ($m == 58) && ($s == 31))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,8,1995,2,28,-1,58,31);
if (($dd == -728352) && ($h == -18) && ($m == -12) && ($s == -8))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,8,1995,2,28,7,-1,31);
if (($dd == -728352) && ($h == -18) && ($m == -12) && ($s == -8))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,8,1995,2,28,7,58,-1);
if (($dd == -728352) && ($h == -18) && ($m == -12) && ($s == -8))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,24,12,8,1995,2,28,7,58,31);
if (($dd == 728352) && ($h == 7) && ($m == 58) && ($s == 31))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,60,8,1995,2,28,7,58,31);
if (($dd == 728352) && ($h == 7) && ($m == 58) && ($s == 31))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,60,1995,2,28,7,58,31);
if (($dd == 728352) && ($h == 7) && ($m == 58) && ($s == 31))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,8,1995,2,28,24,58,31);
if (($dd == -728352) && ($h == -18) && ($m == -12) && ($s == -8))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,8,1995,2,28,7,60,31);
if (($dd == -728352) && ($h == -18) && ($m == -12) && ($s == -8))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,8,1995,2,28,7,58,60);
if (($dd == -728352) && ($h == -18) && ($m == -12) && ($s == -8))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($dd,$h,$m,$s) = date_time_difference(1995,2,28,18,12,60,1995,2,28,7,58,60);
if (($dd == 0) && ($h == 0) && ($m == 0) && ($s == 0))
{print "ok $n\n";} else {print "not ok $n\n";}

__END__
