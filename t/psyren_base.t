use warnings;
use strict;
use Test::More tests => 3;
use PSYREN::Base;

my $base = PSYREN::Base->new;
isa_ok ( $base, 'PSYREN::Base' );
can_ok ( $base, qw/new tt/ );
isa_ok ( $base->tt, 'PSYREN::Model::TokyoTyrant' );
