#!perl -w

use strict;
no strict "vars";

use Date::DateCalcLib qw( decode_date_eu );

# ======================================================================
#   ($year,$mm,$dd) = decode_date_eu($date);
# ======================================================================

print "1..46\n";

$n = 1;
unless (($year,$mm,$dd) = decode_date_eu(""))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_eu("__"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_eu("_31_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_314_")) &&
($year==1904) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_0314_")) &&
($year==1904) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_00314_")) &&
($year==1904) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3164_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_03164_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_003164_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_30164_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_030164_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_0030164_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_110364_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_0110364_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_00110364_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3011964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_03011964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_003011964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_11031964_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_011031964_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_0011031964_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3_1_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3_1_1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3_jan_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3_Jan_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3_jAN_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3-JAN-64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3-Jan-1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3-January-1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_000003-Jan-000064_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_000003-Jan-001964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3_ja_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_eu("_3_j_64_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3ja64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_03ja64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_003ja64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_000003ja000064_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_3ja1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_03ja1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_003ja1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("_000003ja001964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_eu("_33ja64_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_eu("_33ja1964_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("x000003x000001x000064x")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu("x000003_ja_000064x")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_eu(
"_dia_tres_3_janeiro_1964_mil_novecentos_sessenta_e_seis_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__

