package PSYREN::Drift;
use warnings;
use strict;

use PSYREN::Config;

sub new { bless {}, shift }

sub config { PSYREN::Config->new->instance }

sub tweet {

}

1;
