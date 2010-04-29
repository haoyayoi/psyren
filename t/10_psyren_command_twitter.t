use strict;
use warnings;
use Test::More tests => 2;
use PSYREN::Command::Twitter;

my $command = PSYREN::Command::Twitter->new;
isa_ok ( $command, "PSYREN::Command::Twitter" );
can_ok ( $command, qw/new oauth cb/ );
