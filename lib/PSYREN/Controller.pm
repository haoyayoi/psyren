package PSYREN::Controller;
use strict;
use warnings;
use base qw/PSYREN::Base/;
use PSYREN::Command::Twitter;

sub dispatch_index { 'index' }

sub dispatch_callback {}

1;
