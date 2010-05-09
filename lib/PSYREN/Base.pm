package PSYREN::Base;
use warnings;
use strict;
use base qw/Class::Accessor::Fast/;
__PACKAGE__->mk_accessors( qw/tt/ );

sub new {
    my $self = bless {}, shift;
    return $self;
 }

1;
