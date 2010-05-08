package PSYREN;
use strict;
use warnings;
use Data::Dumper;

sub run {
    my ( $class, $env ) = @_;
    return [ 200,
             [ 'Content-Type', 'text/html' ],
             [ Dumper $env ],
           ];
}

1;

