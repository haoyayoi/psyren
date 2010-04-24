package PSYREN::Controller;
use warnings;
use strict;
use PSYREN::Command::Twitter;

sub new { bless {}, shift }

sub dispatch_index { 'index' }

sub dispatch_callback {}

1;
