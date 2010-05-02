package PSYREN::Model::TokyoTyrant;
use warnings;
use strict;
use TokyoTyrant;
use PSYREN::Config;
use base qw/Class::Accessor::Fast/;
__PACKAGE__->mk_accessors( qw/dbi/ );

sub new {
    my $self = bless {}, shift;
    $self->dbi( TokyoTyrant::RDB->new );
    return $self;
}

sub config {
    PSYREN::Config->new->instance->{tokyotyrant};
}

1;
