package PSYREN::Controller::Admin;
use strict;
use warnings;
use base qw/PSYREN::Controller/;

sub dispatch_index {
    my $self = $_[0];
    $self->{status} = 200;
    $self->{body}   = "index";
    return $self->_finalize;
}

1;
