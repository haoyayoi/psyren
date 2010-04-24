package PSYREN::Config::YAML;
use warnings;
use strict;
use YAML::Syck;
use File::Slurp;
our $VERSION = '0.09';

sub new {
    my ( $class, $config_name, $config_file ) = @_;

    my $config_base;
    if ($config_name =~ /^([^_]+)_/) {
        $config_base = $1;
    }

    my $config_data = read_file($config_file);
    $config_data =~ s{__ENV:(.+?)__}{ $ENV{$1}||'' }ge;
    my $conf = $class->_load($config_data);

    my %config;
    if ($config_base) {
        %config = (
            %{$conf->{common}},
            %{$conf->{$config_base}},
            $conf->{$config_name} ? %{$conf->{$config_name}} : (),
        );
    } else {
        %config = (
            %{$conf->{common}},
            $conf->{$config_name} ? %{$conf->{$config_name}} : (),
        );
    }

    # case sensitive hash
    %config = map { lc($_) => $config{$_} } keys %config
        unless $class->case_sensitive;

    bless \%config, $class;
}

sub case_sensitive { 1; }

sub _load {
    my ($self, $config_data) = @_;

    return YAML::Syck::Load( $config_data );
}

