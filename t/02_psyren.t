use warnings;
use strict;
use Test::More tests => 2;
use PSYREN;

my $psyren = PSYREN->new;
isa_ok ( $psyren, 'PSYREN' );
can_ok ( $psyren, qw/setup new/);
