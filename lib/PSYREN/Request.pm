package PSYREN::Request;
use strict;
use warnings;
use 5.008_001;
our $VERSION = '0.01';

use HTTP::Headers;
use HTTP::Body;
use Carp qw/croak/;

sub new {
    my ( $class, $env );
    croak(q/$env is required/)
        unless defined $env && ref($env) eq 'HASH';
    bless { env => $env }, $class;
}

1;
