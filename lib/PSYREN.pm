package PSYREN;
use strict;
use warnings;

use CGI;
use PSYREN::Dispatcher;
use Data::Dumper;

sub run {
    my ( $class, $env ) = @_;
    my $data = PSYREN::Dispatcher->new({ query => CGI->new })->finalize;
}

1;

