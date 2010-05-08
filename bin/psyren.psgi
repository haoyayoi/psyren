#!/usr/local/bin/perl

use strict;
use warnings;
use lib '../lib';
use PSYREN::Handler::PSGI;

PSYREN::Handler::PSGI->handler('PSYREN');
