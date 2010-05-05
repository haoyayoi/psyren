#!/usr/local/bin/perl

use strict;
use warnings;
use lib '../lib';
use PSYREN::Dispatcher;

PSYREN::Dispatcher->new->setup->run;
