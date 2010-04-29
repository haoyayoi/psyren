package PSYREN::Engine;
use strict;
use warnings;
use base qw/PSYREN::Base/;
use HTTP::Engine;
use PSYREN::Config;

sub setup {
    my ( $self, $args ) = @_;
    my $config = PSYREN::Config->new->instance->{handler};
    HTTP::Engine->new(
        interface => {
            module => $args->{module} || $config->{module},
            args   => {
                host => $args->{host} || $config->{args}->{host},
                port => $args->{port} || $config->{args}->{port},
            },
            request_handler => $args->{req} || 'PSYREN::Dispatcher::handle_request',
        },
    );
}

1;

