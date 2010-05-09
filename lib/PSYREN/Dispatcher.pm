package PSYREN::Dispatcher;
use strict;
use warnings;
use PSYREN::Controller;
use PSYREN::Config;
use PSYREN::Response;
use UNIVERSAL::require;
use Carp qw/croak/;
use base qw/Class::Accessor::Fast/;
use CGI;
use Data::Dumper;

__PACKAGE__->mk_accessors( qw/query/ );

sub req { $_[0]->{_req} }

sub finalize {
    my $self   = $_[0];
    my $path = $self->req->uri->path;
    
    $path =~ s{/$}{};
    $path =~ s{^/}{};
    
    my $method;
    my $subdir = "";
    my $ctrl_class = "PSYREN::Controller";
    
    if ( index( $path, "/" ) ) {
        my @path = split( '/', $path );
        $method = pop @path;
        
        if (@path) {
            for my $dir ( @path ) {
                $dir  =~ tr/A-Z/a-z/;
                $dir  =~ /^(\w)/;
                my $head = $1;
                $head =~ tr/a-z/A-Z/;
                $dir  =~ s/^./$head/;
                $subdir .= "::$dir";
            }
        }
        if ("$ctrl_class$subdir"->use) {
            "$ctrl_class$subdir"->require;
            $ctrl_class = "$ctrl_class$subdir"; 
        } else {
            return;
        }
    } else {
        $method = $path;
    }
    $method = "index" unless $method;
    $method =~ tr/A-Z/a-z/;
    my $data;

    {
        no strict 'refs';
        my $controller = $ctrl_class->new;
        if ( $controller->can("dispatch_$method") ){
            my $call = "dispatch_$method";
            my $args = {};
            if ( $call eq "dispatch_twitter_cb" ) {
                warn $call;
                $args->{cookie}   = $self->req->cookies->{oauth}->value;
                $args->{verifier} = $self->req->param('oauth_verifier');
            } 
            $data = $controller->$call($args);
        } else {
            $data =
                [ 404 ,
                    [ "Content-Type" => "text/html" ],
                    [ "404 not found" ],
                ];
        }
    }
    return $data;
}

1;
__END__

=head1 PSYREN::Dispatcher

PSYREN::Dispatcher - PSYREN dispatcher for request.

=head1 SYNOPSIS

  use PSYREN::Dispatcher;
  PSYREN::Dispatcher->new($req);

=head1 DESCRIPTION

PSYREN::Dispatcher is Dispatcher for request on PSYREN.

=head1 AUTHOR

haoyayoi E<lt>st.hao.yayoi@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
