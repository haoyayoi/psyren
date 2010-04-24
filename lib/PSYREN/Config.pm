package PSYREN::Config;
use strict;
use warnings;
use base qw/PSYREN::Base/;
use PSYREN::Config::YAML;
use Path::Class qw/file/;

my $CONF_PATH = $ENV{'HOME'} . '/' . file( qw/Twitter-Bot config conf.yaml/)->stringify;

sub instance {
    my $env = $ENV{'PSYREN_ENV'} || 'dev';
    PSYREN::Config::YAML->new( $env, $CONF_PATH );
}

1;

