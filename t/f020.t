#!perl -w

use strict;
no strict "vars";

use Date::DateCalc qw( decode_day );

# ======================================================================
#   $weekday = decode_day($buffer);
# ======================================================================

print "1..34\n";

$n = 1;
if (decode_day("m") == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("mo") == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("mon") == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("Monday") == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("t") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("tu") == 2)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("tue") == 2)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("Tuesday") == 2)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("w") == 3)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("we") == 3)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("wed") == 3)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("Wednesday") == 3)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("t") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("th") == 4)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("thu") == 4)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("Thursday") == 4)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("f") == 5)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("fr") == 5)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("fri") == 5)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("Friday") == 5)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("s") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("sa") == 6)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("sat") == 6)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("Saturday") == 6)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("s") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("su") == 7)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("sun") == 7)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("Sunday") == 7)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("workday") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("funday") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("bad day") == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("sunny day") == 7)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("payday") == 0)                     # too bad! ;-)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (decode_day("holyday") == 0)                    # sigh. ;-)
{print "ok $n\n";} else {print "not ok $n\n";}

__END__
