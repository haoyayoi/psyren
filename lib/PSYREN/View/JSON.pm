package PSYREN::View::JSON;
use strict;
use warnings;
use JSON;
use PSYREN::Config;

sub new { bless{}, $_[0] }

sub json {
    my ( $self, $args ) = @_;
    return to_json($args);
}

1;

