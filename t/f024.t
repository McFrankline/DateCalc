#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( calc_new_date_time );

# ======================================================================
#   ($year,$month,$day,$hh,$mm,$ss) = calc_new_date_time
#   (
#       $year,$month,$day,$hh,$mm,$ss,
#       $days_offset,$hh_offset,$mm_offset,$ss_offset
#   );
# ======================================================================

print "1..5\n";

$n = 1;
($yy,$mm,$dd,$h,$m,$s) = calc_new_date_time(1995,2,28,18,12,8,0,0,0,999983);
if (($yy == 1995) && ($mm == 3) && ($dd == 12) && ($h == 7) && ($m == 58) && ($s == 31))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($yy,$mm,$dd,$h,$m,$s) = calc_new_date_time(1995,2,29,18,12,8,0,0,0,999983);
if (($yy == 0) && ($mm == 0) && ($dd == 0) && ($h == 0) && ($m == 0) && ($s == 0))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($yy,$mm,$dd,$h,$m,$s) = calc_new_date_time(2,2,28,18,12,8,-58,-19,2,-1);
if (($yy == 1) && ($mm == 12) && ($dd == 31) && ($h == 23) && ($m == 14) && ($s == 7))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($yy,$mm,$dd,$h,$m,$s) = calc_new_date_time(1,2,28,18,12,8,-57,-19,2,-1);
if (($yy == 1) && ($mm == 1) && ($dd == 1) && ($h == 23) && ($m == 14) && ($s == 7))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
($yy,$mm,$dd,$h,$m,$s) = calc_new_date_time(1,2,28,18,12,8,-58,-19,2,-1);
if (($yy == 0) && ($mm == 0) && ($dd == 0) && ($h == 0) && ($m == 0) && ($s == 0))
{print "ok $n\n";} else {print "not ok $n\n";}

__END__
