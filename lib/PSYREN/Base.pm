package PSYREN::Base;
use warnings;
use strict;
use base qw/Class::Accessor::Fast/;
use PSYREN::Model::TokyoTyrant;
__PACKAGE__->mk_accessors( qw/tt/ );

sub new {
    my $self = bless {}, shift;
    $self->tt( PSYREN::Model::TokyoTyrant->new );
    return $self;
 }

1;
