use warnings;
use strict;
use Test::More tests => 4;
use PSYREN::Model::TokyoTyrant;

my $base = PSYREN::Model::TokyoTyrant->new;
isa_ok ( $base, 'PSYREN::Model::TokyoTyrant' );
can_ok ( $base, qw/dbi config/);
isa_ok ( $base->dbi, 'TokyoTyrant::RDB' );
isa_ok ( $base->config, 'HASH' );
