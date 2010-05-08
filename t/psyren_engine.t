use strict;
use warnings;
use Test::More tests => 3;
use PSYREN::Engine;

my $psyren = PSYREN::Engine->new;
isa_ok ( $psyren, "PSYREN::Engine" );
can_ok ( $psyren, qw/new setup/ );
my $engine = $psyren->setup;
isa_ok ( $engine, "HTTP::Engine" );
