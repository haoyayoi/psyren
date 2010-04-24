package PSYREN::Config;
use warnings;
use strict;
use PSYREN::Config::YAML;
use Path::Class qw/file/;

my $CONF_PATH = $ENV{'HOME'} . '/' . file( qw/Twitter-Bot config conf.yaml/)->stringify;

sub new { bless {}, shift }

sub instance {
    my $env = $ENV{'PSYREN_ENV'} || 'dev';
    PSYREN::Config::YAML->new( $env, $CONF_PATH );
}

1;

