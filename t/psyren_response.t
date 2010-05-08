use strict;
use warnings;
use Test::More tests => 2;
use PSYREN::Response;

my $config = PSYREN::Response->new;
isa_ok ( $config, "HTTP::Engine::Response" );
can_ok ( $config, qw/new/ );
