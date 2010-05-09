use warnings;
use strict;
use Test::More tests => 2;
use PSYREN::Base;

my $base = PSYREN::Base->new;
isa_ok ( $base, 'PSYREN::Base' );
can_ok ( $base, qw/new/ );
