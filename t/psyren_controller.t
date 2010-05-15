use strict;
use warnings;
use Test::More tests => 3;
use PSYREN::Controller;

my $controller = PSYREN::Controller->new;
isa_ok ( $controller, "PSYREN::Controller" );
isa_ok ( $controller->TMT, "Text::MicroTemplate::File" );
for my $method ( qw/index error/ ) {
    can_ok ( $controller, ( "dispatch_$method" ) );
}
