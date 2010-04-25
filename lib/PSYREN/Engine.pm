package PSYREN::Engine;
use strict;
use warnings;
use HTTP::Engine;

sub new {
    my ( $self, $args ) = @_;
    my $config = PSYREN::Config->new->instance->{handler};
    HTTP::Engine->new(
        interface => {
            module => $args->{module} || $config->{module},
            args   => {
                host => $config->{args}->{host},
                port => $config->{args}->{port},
            },
            request_handler => 'PSYREN::Dispatcher::handle_request',
        },
    );
}

1;

