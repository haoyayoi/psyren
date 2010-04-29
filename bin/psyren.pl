#!/usr/local/bin/perl

use strict;
use warnings;
use lib '../lib';
use PSYREN;

my $c = PSYREN->new->setup();
$c->run;
