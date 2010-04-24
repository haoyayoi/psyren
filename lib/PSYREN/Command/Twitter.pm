package PSYREN::Command::Twitter;
use warnings;
use strict;
use base qw/PSYREN Class::Accessor/;
use Net::Twitter;
__PACKAGE__->mk_accessors( qw/name/ );

use PSYREN::Config;

sub new {
    my $self = shift;
    return bless {}, $self;
}

sub tweet {
    my $config = PSYREN::Config->new->instance;
    my $nt = Net::Twitter->new(
        traits          => [qw/API::REST OAuth/],
        consumer_key    => $config->Twitter->{consumer_key},
        consumer_secret => $config->Twitter->{consumer_secret},
    );
    
