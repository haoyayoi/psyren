package PSYREN::Command::Twitter;
use strict;
use warnings;
use base qw/PSYREN::Command Class::Accessor::Fast/;
use Net::Twitter;
use PSYREN::Config;
use PSYREN::Response;
__PACKAGE__->follow_best_practice;
__PACKAGE__->mk_accessors( qw/name/ );

sub oauth {
    my $config = PSYREN::Config->new->instance;
    my $nt = Net::Twitter->new(
        traits          => [qw/API::REST OAuth/],
        consumer_key    => $config->Twitter->{consumer_key},
        consumer_secret => $config->Twitter->{consumer_secret},
    );
    my $url = $nt->get_authorization_url( callback => $config->Twitter->{callback_url} );

    my $res = PSYREN::Response->new({ status => 200 });
    $res->cookies->{oauth} = {
        value => {
            token        => $nt->request_token,
            token_secret => $nt->request_token_secret,
        },
    };

    $res->redirect( $url );
}

sub cb {
    
}

1;    
