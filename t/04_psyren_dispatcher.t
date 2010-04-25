use strict;
use warnings;
use Test::More tests => 2;
use PSYREN::Dispatcher;

my $dispatcher = PSYREN::Dispatcher->new;
isa_ok ( $dispatcher, "PSYREN::Dispatcher" );
can_ok ( $dispatcher, qw/setup handle_request/ );

