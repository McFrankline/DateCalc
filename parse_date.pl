
#  Copyright (c) 1996 Steffen Beyer. All rights reserved.
#  This program is free software; you can redistribute it and/or
#  modify it under the same terms as Perl itself.

use Date::DateCalc qw( decode_month );

# Usage (examples):
#
# use lib '/opt/lib/perl5.002/site_perl/Date';
#
# (or whatever the path to your perl library directory is)
# (see items 'installsitelib' and 'sitelibexp' in config.sh)
#
# require "parse_date.pl";
#
# - Parse today's date:
#
# ($year,$month,$day) = parse_date(`date`);
#
# - Parse day of submitment of a mail:
#
# while (<MAIL>)
# {
#     if (/^From \S/)
#     {
#         ($yy,$mm,$dd) = parse_date($_);
#         ...
#     }
#     ...
# }

sub parse_date
{
    my($date) = @_;
    my($yy,$mm,$dd);
    unless ($date =~ /\b([JFMASOND][aepuco][nbrynlgptvc])\s+([0123]??\d)\b/)
    {
        return(0,0,0);
    }
    $mm = $1;
    $dd = $2;
    unless ($date =~ /\b(19\d\d|20\d\d)\b/)
    {
        return(0,0,0);
    }
    $yy = $1;
    $mm = decode_month($mm);
    unless ($mm > 0)
    {
        return(0,0,0);
    }
    return($yy,$mm,$dd);
}

1;

__END__

