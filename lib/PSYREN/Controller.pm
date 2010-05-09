package PSYREN::Controller;
use strict;
use warnings;
use PSYREN::Command::Twitter;
use Text::MicroTemplate;

sub new {
    my $class = $_[0];
    return bless {}, $class;
}

sub dispatch_index { 
    { body =>'index', status => 200 }
}

sub dispatch_twitter_oauth {
    my ( $self, $args ) = @_;
    PSYREN::Command::Twitter->new->oauth;
}

sub dispatch_twitter_cb {
    my ( $self, $args ) = @_;
    PSYREN::Command::Twitter->new->cb($args);
}

1;
