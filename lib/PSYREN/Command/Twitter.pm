package PSYREN::Command::Twitter;
use strict;
use warnings;
use base qw/PSYREN::Command Class::Accessor::Fast/;
use Net::Twitter;
use PSYREN::Config;
use PSYREN::Response;
use PSYREN::Model::TokyoTyrant;
__PACKAGE__->mk_accessors( qw/name/ );

sub oauth {
    my $config = PSYREN::Config->new->instance;
    my $nt = Net::Twitter->new(
        traits          => [qw/API::REST OAuth/],
        consumer_key    => $config->{twitter}->{consumer_key},
        consumer_secret => $config->{twitter}->{consumer_secret},
    );
    my $url = $nt->get_authorization_url( callback => $config->{twitter}->{callback} );

    my $res = PSYREN::Response->new({ status  => 301 });
    $res->set_http_response( $res );
    $res->headers->header( Location => $url );
    $res->cookies->{oauth} = {
        value => {
            token        => $nt->request_token,
            token_secret => $nt->request_token_secret,
        },
    };
    return $res;
}

sub cb {
    my ( $self, $args ) = @_;
    my $config = PSYREN::Config->new->instance;
    my $nt = Net::Twitter::OAuth->new(
        traits          => [ qw/API::REST OAuth/ ],
        consumer_key    => $config->{twitter}->{consumer_key},
        consumer_secret => $config->{twitter}->{consumer_secret},
    );
    $nt->request_token( $args->{cookie}->{token} );
    $nt->request_token_secret( $args->{cookie}->{token_secret} );
    
    my ( $access_token, $access_token_secret, $user_id, $screen_name )
        = $nt->request_access_token( verifier => $args->{verifier} );
    my $tt = $self->tt;
    $tt->dbi->open( $tt->config->{host}, $tt->config->{port} );
    $tt->dbi->put("tw_access_token", $access_token);
    $tt->dbi->put("tw_access_token_secret", $access_token_secret);
    $tt->dbi->put("tw_user_id", $user_id);
    $tt->dbi->put("tw_screen_name", $screen_name);
    $tt->dbi->close();
}

1;
