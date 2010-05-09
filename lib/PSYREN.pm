package PSYREN;
use strict;
use warnings;

use Plack::Request;
use Plack::Response;

use PSYREN::Dispatcher;

sub run {
    my ( $class, $env ) = @_;
    my $req  = Plack::Request->new($env);
    my $data = PSYREN::Dispatcher->new($req)->finalize;
    return [ 200,
             [ 'Content-Type', 'text/html' ],
             [ "DUMMY" ],
           ];
}

1;

