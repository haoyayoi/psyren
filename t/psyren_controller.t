use strict;
use warnings;
use Test::More tests => 3;
use PSYREN::Controller;

my $controller = PSYREN::Controller->new;
isa_ok ( $controller, "PSYREN::Controller" );
for my $method ( qw/index error/ ) {
    can_ok ( $controller, ( "dispatch_$method" ) );
}
