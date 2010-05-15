use strict;
use warnings;
use Test::More tests => 3;
use PSYREN::Dispatcher;
use CGI;
use Data::Dumper;

eval {
    my $dispatcher = PSYREN::Dispatcher->new();
};
if ($@) {
    like ( $@, qr/need hashref/, "err test" );
}
my $dist = PSYREN::Dispatcher->new({ query => CGI->new });
is($dist->method,     "index",              "default method" );
is( ref $dist->controller, "PSYREN::Controller", "default controller" );
