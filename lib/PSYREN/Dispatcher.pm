package PSYREN::Dispatcher;
use warnings;
use strict;
use HTTP::Engine;
use PSYREN::Controller;
use PSYREN::Config;

sub setup {
    my $config = PSYREN::Config->new->instance->{handler};
    HTTP::Engine->new(
        interface => {
            module => $config->{module},
            args   => {
                host => $config->{args}->{host},
                port => $config->{args}->{port},
            },
            request_handler => 'PSYREN::Dispatcher::handle_request',
        },
    )->run;
}

sub handle_request {
    my $method = shift->{uri}->path;
    
    $method =~ s/\//_/g;
    $method =~ s/_$//;
    $method =~ s/^_//;
    $method =~ tr/A-Z/a-z/;
    
    my $data;
    {
        no strict 'refs';
        my $controller = PSYREN::Controller->new;
        if ( $controller->can("do_$method") ){
            my $call = "dispatch_$method";
            $data = $controller->$call;
        }
    }
    return HTTP::Engine::Response->new(
        status => $data->{status} || '404',
        body   => $data->{body}   || '404 not found',
    );
}

1;
__END__

=head1 PSYREN::Dispatcher

PSYREN::Dispatcher - PSYREN dispatcher for request.

=head1 SYNOPSIS

  use PSYREN::Dispatcher;
  PSYREN::Dispatcher->run();

=head1 DESCRIPTION

PSYREN::Dispatcher is Dispatcher for request on PSYREN.

=head1 AUTHOR

haoyayoi E<lt>st.hao.yayoi@gmail.comE<gt>

=head1 SEE ALSO

HTTP::Engine

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
