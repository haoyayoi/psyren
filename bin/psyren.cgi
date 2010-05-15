#!/usr/local/bin/perl
BEGIN {
    push @INC, '/Users/haoyayoi/Twitter-Bot/PSYREN/lib';
};

use strict;
use warnings;
use lib '../lib';
use Data::Dumper;
use PSYREN;

PSYREN::run;
