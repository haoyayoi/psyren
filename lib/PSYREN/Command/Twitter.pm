package PSYREN::Command::Twitter;
use strict;
use warnings;
use base qw/PSYREN::Command Class::Accessor::Fast/;
use Net::Twitter;
use PSYREN::Config;
use PSYREN::Engine;
__PACKAGE__->follow_best_practice;
__PACKAGE__->mk_accessors( qw/name/ );

sub oauth {
    my $config = PSYREN::Config->new->instance;
    my $nt = Net::Twitter->new(
        traits          => [qw/API::REST OAuth/],
        consumer_key    => $config->Twitter->{consumer_key},
        consumer_secret => $config->Twitter->{consumer_secret},
    );
    $nt->get_authorization_url( callback => $config->Twitter->{callback_url} );
    return {
        cookies => {
            oauth => {
                value => {
                    token => $nt->request_token,
                    token => $nt->request_token_secret,
                },
            },
        },
    };
}

sub cb {
}

1;    
