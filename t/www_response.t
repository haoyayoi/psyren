use strict;
use warnings;
use Test::More tests => 1;
use PSYREN::Dispatcher;
use HTTP::Engine::Test::Request;
use PSYREN::Config;

my $psyren = PSYREN::Dispatcher->new;
my $engine = $psyren->setup({ module => 'Test' });
my $req = HTTP::Engine::Test::Request->new(
    uri => 'http://localhost:5555/DUMMY',
    method => 'GET',
);
my $res = $engine->run($req);
is( $res->code, 404, '404 not found');

