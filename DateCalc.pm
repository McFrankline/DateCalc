
#  Copyright (c) 1995 Steffen Beyer. All rights reserved.
#  This program is free software; you can redistribute it and/or
#  modify it under the same terms as Perl itself.

package Date::DateCalc;

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

@EXPORT_OK = qw( leap encode decode valid_date date_string check_date calc_days dates_difference day_of_week calc_new_date date_to_short date_to_string week_number first_in_week weeks_in_year decode_date day_short_tab day_name_tab month_short_tab month_name_tab );

# "Version" is available but not exported!
# Call with "Date::DateCalc::Version()"!

bootstrap Date::DateCalc;

1;
__END__
