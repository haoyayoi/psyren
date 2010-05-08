use strict;
use warnings;
use Test::More tests => 2;
use PSYREN::Command;

my $command = PSYREN::Command->new;
isa_ok ( $command, "PSYREN::Command" );
can_ok ( $command, qw/new/ );
