
#  Copyright (c) 1996 Steffen Beyer. All rights reserved.
#  This program is free software; you can redistribute it and/or
#  modify it under the same terms as Perl itself.

package Date::DateCalc;

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

@EXPORT_OK = qw( leap compress uncompress check_compressed compressed_to_short check_date calc_days day_of_week dates_difference calc_new_date date_time_difference calc_new_date_time date_to_short date_to_string week_number first_in_week weeks_in_year day_name_tab month_name_tab decode_day decode_month decode_date days_in_month );

%EXPORT_TAGS = (all => [@EXPORT_OK]);

# "Version" is available but not exported!
# Call with "Date::DateCalc::Version()"!

bootstrap Date::DateCalc;

1;

__END__

