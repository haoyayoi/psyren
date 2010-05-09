package PSYREN;
use strict;
use warnings;

use Plack::Request;
use PSYREN::Dispatcher;
use Data::Dumper;
sub run {
    my ( $class, $env ) = @_;
    my $req  = Plack::Request->new($env);
    my $data = PSYREN::Dispatcher->new($req)->finalize;
    my $res  = $req->new_response;
    
    if ( ref $data eq "HASH" ) {
        $res->headers( $data->{headers} );
        $res->status( $data->{status} );
        $res->body( $data->{body} );
        return $res->finalize;
    } elsif ( ref $data eq "ARRAY" ) {
        return $data;
    } else {
        $res->redirect("/");
        return $res->finalize
    }
}

1;

