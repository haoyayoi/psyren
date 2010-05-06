package PSYREN::Handler::PSGI;
use strict;
use warnings;
use Carp qw/croak/;
use UNIVERSAL::require;

sub handler {
    my ( $class, $app ) = @_;
    croak qq/no such app: $app/ if ! $app->use;
    sub {
        my $env = shift;
        $app->run($env);
    };
}

1;
