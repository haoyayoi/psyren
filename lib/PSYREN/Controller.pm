package PSYREN::Controller;
use strict;
use warnings;
use PSYREN::Command::Twitter;

sub new {
    my $class = $_[0];
    return bless {}, $class;
}

sub _finalize {
    my $self = $_[0];
    return [
        $self->{status},
        [ "Content-Type" => "text/html" ],
        [ $self->{body} ],
    ];
}

sub dispatch_index {
    my $self = $_[0];
    $self->{status} = "200";
    $self->{body}   = "index";
    return $self->_finalize;
}

1;
