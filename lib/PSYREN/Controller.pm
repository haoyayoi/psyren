package PSYREN::Controller;
use strict;
use warnings;
use PSYREN::Command::Twitter;
use Text::MicroTemplate::File;
use base qw/Class::Accessor::Fast/;

__PACKAGE__->mk_accessors( qw/TMT/ );

sub new {
    my $class = $_[0];
    my $self = bless {}, $class;
    $self->TMT( Text::MicroTemplate::File->new(
        include_path => [ ],
        use_cache    => 1,
    ) );
    return $self;
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
    print "index";
    return $self->_finalize;
}

sub dispatch_error {
    my ( $self, $code ) = @_;
    
}

1;
