use strict;
use Test::More tests => 2;
use PSYREN::Drift;

my $drift = PSYREN::Drift->new;
isa_ok ( $drift->config, 'PSYREN::Config::YAML' );
can_ok ( $drift, qw/tweet/ );
