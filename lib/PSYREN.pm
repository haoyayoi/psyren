package PSYREN;
use strict;
use warnings;
use base qw/PSYREN::Base/;
use PSYREN::Dispatcher;
our $VERSION = '0.01';

sub setup {
    PSYREN::Dispatcher->new->setup;
}

1;
__END__

=head1 NAME

PSYREN -

=head1 SYNOPSIS

  use PSYREN;

=head1 DESCRIPTION

PSYREN is

=head1 AUTHOR

haoyayoi E<lt>st.hao.yayoi@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
