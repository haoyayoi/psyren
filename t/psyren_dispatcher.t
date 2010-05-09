use strict;
use warnings;
use Test::More tests => 1;
use PSYREN::Dispatcher;

eval {
    my $dispatcher = PSYREN::Dispatcher->new;
};
if ($@) {
    like ( $@, qr/need request/, "err test" );
}

