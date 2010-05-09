use strict;
use warnings;
use Test::More tests => 1;
use PSYREN::Response;

my $config = PSYREN::Response->new;
isa_ok ( $config, "ARRAY" );
