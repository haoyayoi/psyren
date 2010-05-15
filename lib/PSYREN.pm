package PSYREN;
use strict;
use warnings;

use CGI;
use PSYREN::Dispatcher;

sub run {
    PSYREN::Dispatcher->new({ query => CGI->new })->finalize;
}

1;
