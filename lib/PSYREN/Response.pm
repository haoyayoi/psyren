package PSYREN::Response;
use strict;
use warnings;
use base qw/PSYREN::Base/;
use HTTP::Engine::Response;

sub new{
    my ( $self, $args ) = @_;
    HTTP::Engine::Response->new(
        status => $args->{status} || '404',,
        body   => $args->{body}   || '404 not found',
    );
}

1;
