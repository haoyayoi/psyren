package PSYREN::Response;
use strict;
use warnings;
use base qw/PSYREN::Base/;
use Data::Dumper;

sub new{
    my ( $self, $args ) = @_;
    unless ( ref $args eq "HASH" ) {
        $args = {
            status => 404,
            body   => "404 not found",
        };
    }
    return [ $args->{status},
             [ 'Content-Type' => 'text/plain' ],
             [ $args->{body} ],
           ];
}

1;
