use strict;
use warnings;
use Test::More tests => 3;
use PSYREN::Config;

my $config = PSYREN::Config->new;
isa_ok ( $config, "PSYREN::Config" );
can_ok ( $config, qw/new instance/ );
isa_ok ( $config->instance, "PSYREN::Config::YAML" )
