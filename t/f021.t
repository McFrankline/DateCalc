#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( decode_month );

# ======================================================================
#   $month_name = decode_month($month);
# ======================================================================

print "1..52\n";

$n = 1;
if (decode_month("j") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("ja") == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("jan") == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("January") == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("f") == 2)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("fe") == 2)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("feb") == 2)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("February") == 2)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("m") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("ma") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("mar") == 3)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("March") == 3)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("a") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("ap") == 4)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("apr") == 4)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("April") == 4)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("m") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("ma") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("may") == 5)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("May") == 5)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("j") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("ju") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("jun") == 6)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("June") == 6)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("j") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("ju") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("jul") == 7)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("July") == 7)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("a") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("au") == 8)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("aug") == 8)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("August") == 8)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("s") == 9)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("se") == 9)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("sep") == 9)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("September") == 9)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("o") == 10)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("oc") == 10)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("oct") == 10)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("October") == 10)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("n") == 11)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("no") == 11)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("nov") == 11)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("November") == 11)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("d") == 12)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("de") == 12)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("dec") == 12)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("December") == 12)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("Spring") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("Summer") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("Fall") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_month("Winter") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}

__END__
