use strict;
use warnings;
use Test::More tests => 4;
use PSYREN::Controller;

my $controller = PSYREN::Controller->new;
isa_ok ( $controller, "PSYREN::Controller" );
for my $method ( qw/index twitter_oauth twitter_cb/ ) {
    can_ok ( $controller, ( "dispatch_$method" ) );
}
