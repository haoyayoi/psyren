package PSYREN::Controller::Twitter;
use strict;
use warnings;
use base qw/PSYREN::Controller/;
use PSYREN::Command::Twitter;

sub index {
    my $self = $_[0];
    $self->{status} = "200";
    $self->{body}   = "Twitter";
    return $self->_finalize;
}

sub dispatch_oauth {
    my ( $self, $args ) = @_;
    PSYREN::Command::Twitter->new->oauth;
}

sub dispatch_cb {
    my ( $self, $args ) = @_;
    PSYREN::Command::Twitter->new->cb($args);
}

1;
