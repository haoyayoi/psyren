package PSYREN::Controller;
use strict;
use warnings;
use base qw/PSYREN::Base/;
use PSYREN::Command::Twitter;

sub dispatch_index { 'index' }

sub dispatch_twitter_oauth {
    my ( $self, $args ) = @_;
    PSYREN::Command::Twitter->new->oauth;
}

sub dispatch_twitter_cb {
    my ( $self, $args ) = @_;
    PSYREN::Command::Twitter->new->cb($args);
}

1;
