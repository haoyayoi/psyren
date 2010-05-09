use strict;
use warnings;
use Test::More tests => 4;
use PSYREN::Controller::Twitter;

my $controller = PSYREN::Controller::Twitter->new;
isa_ok ( $controller, "PSYREN::Controller::Twitter" );
for my $method ( qw/index oauth cb/ ) {
    can_ok ( $controller, ( "dispatch_$method" ) );
}
