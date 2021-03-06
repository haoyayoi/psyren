package PSYREN::Dispatcher;
use strict;
use warnings;
use base qw/PSYREN::Base/;
use PSYREN::Controller;
use PSYREN::Config;
use PSYREN::Engine;
use PSYREN::Response;

sub setup {
    my ( $self, $args ) = @_;
    PSYREN::Engine->new->setup($args);
}

sub handle_request {
    my $res    = shift;
    my $method = $res->{uri}->path;
    
    $method =~ s/\//_/g;
    $method =~ s/_$//;
    $method =~ s/^_//;
    $method =~ tr/A-Z/a-z/;
    
    my $data;
    {
        no strict 'refs';
        my $controller = PSYREN::Controller->new;
        if ( $controller->can("dispatch_$method") ){
            my $call = "dispatch_$method";
            my $args = {};
            if ( $call eq "dispatch_twitter_cb" ) {
                warn $call;
                $args->{cookie}   = $res->cookies->{oauth}->value;
                $args->{verifier} = $res->param('oauth_verifier');
            }
            $data = $controller->$call($args);
        }
    }
    PSYREN::Response->new($data);
}

1;
__END__

=head1 PSYREN::Dispatcher

PSYREN::Dispatcher - PSYREN dispatcher for request.

=head1 SYNOPSIS

  use PSYREN::Dispatcher;
  PSYREN::Dispatcher->new->setup;

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
