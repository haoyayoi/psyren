package PSYREN::View;
use strict;
use warnings;
use Carp qw/croak/;
use base qw/Class::Accessor::Fast/;
use UNIVERSAL::require;

__PACKAGE__->mk_accessors( qw/data view/ );
sub new {
    my ( $class, $view ) = $_[0];
    
    __PACKAGE__->mk_accessors( qw/data view/ );
    my $self = bless {}, $class;
    $self->view( eval{ $view || "" } );
    return $self;
}

sub render {
    my ( $self, $args ) = @_;
    my $view = $args->{view} || $self->view;
    croak "need to specify view type" unless $view;
    croak "view class not found :PSYREN::View::$view"
        unless $self->_grep_isa($view);
    
    my $class = "PSYREN::View::$view";
    $class->require;
    $class->import;
    my $render = $class->new;
    $view =~ s/A-Z/a-z/;
    my $data = $args->{data} || $self->data;
    $render->$view( $data );
}

sub grep_isa {
    my ( $self, $isa ) = @_;
    return unless $isa;

    for my $name ( @PSYREN::View::ISA ) {
        "PSYREN::View::$isa"->use ? return "PSYREN::View::$isa" : next;
    }
}

1;
