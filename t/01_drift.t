use strict;
use Test::More tests => 1;
use PSYREN::Drift;

my $drift = PSYREN::Drift->new;
isa_ok ( $drift->config, 'PSYREN::Config::YAML' );
