#!perl -w

use strict;
no strict "vars";

use Date::DateCalcLib qw( decode_date_us );

# ======================================================================
#   ($year,$mm,$dd) = decode_date_us($date);
# ======================================================================

print "1..46\n";

$n = 1;
unless (($year,$mm,$dd) = decode_date_us(""))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_us("__"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_us("_13_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_134_")) &&
($year==1904) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_0134_")) &&
($year==1904) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_00134_")) &&
($year==1904) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_1364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_01364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_001364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_10364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_010364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_0010364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_110364_")) &&
($year==1964) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_0110364_")) &&
($year==1964) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_00110364_")) &&
($year==1964) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_1031964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_01031964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_001031964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_11031964_")) &&
($year==1964) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_011031964_")) &&
($year==1964) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_0011031964_")) &&
($year==1964) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_1_3_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_1_3_1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_jan_3_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_Jan_3_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_jAN_3_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_January_3_64_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_us("_j_3_64_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us(" January 3rd, 1964 ")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_Jan364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_Jan0364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_Jan00364_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_Jan2264_")) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_Jan02264_")) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_Jan002264_")) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_ja31964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_ja031964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_ja0031964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_ja221964_")) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_ja0221964_")) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_ja00221964_")) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_us("_ja3364_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = decode_date_us("_ja331964_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("x000001x000003x000064x")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us("_ja_000003x000064x")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = decode_date_us(
"_Janeiro_-_3_dia_tres_de_janeiro_de_1964_mil_novecentos_sessenta_e_seis_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__

