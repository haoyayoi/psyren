package PSYREN::Dispatcher;
use strict;
use warnings;
use PSYREN::Controller;
use PSYREN::Config;
use UNIVERSAL::require;
use String::CamelCase qw/decamelize/;
use Carp qw/croak/;
use base qw/Class::Accessor::Fast/;
use CGI;
use URI;
use URI::Escape qw/uri_unescape/;
use Data::Dumper;

__PACKAGE__->mk_accessors( qw/query uri method controller/ );

my $BASE_CONTROLLER = "PSYREN::Controller";

sub new {
    my ( $class, $args ) = @_;
    croak 'need hashref' unless $args || ref $args eq "HASH";
    my $self = bless $args, $class;

    $self->uri( URI->new( $self->query->url() ) );
    my ( $package, $method )
        = $self->path_to_class_and_method( $self->query->param('path') );
    $self->method($method);
    $self->controller( $self->make_controller_package($package) );
    return $self;
}

sub finalize {
    my $self = $_[0];
    my $method = "dispatch_" . $self->method;
    if ( $self->controller->can($method) ) {
        $self->controller->$method;
    } else {
        $self->controller->dispatch_error("404");
    }
}

sub path_to_class_and_method {
    my ( $self, $path ) = @_;
    return ( '', 'index' ) unless $path;

    my $str = uri_unescape($path);
    $str =~ s{([/]*)}{/}g;
    my @path = split('/', $str);
    my $method = $self->is_index($path) ? 'index' : pop @path;
    my $class;
    map { $class .= "::".decamelize($_) if $_ } @path;
    return ($class, $method );
}

sub make_controller_package {
    my ( $self, $class ) = @_;
    my $build_package =  !$class ?  "$BASE_CONTROLLER" :
    "$BASE_CONTROLLER$class"->use ? "$BASE_CONTROLLER$class" :
                                          "$BASE_CONTROLLER" ;
    $build_package->require;
    $build_package->new;
}

sub is_index {
    my ( $self, $path ) = @_;
    length($path) - 1 == rindex($path, "/") || 
        length($path) - 5 == rindex($path, "index");
}

sub twitter_oauth {
    my $self = shift;
    if ( $self->method eq "dispatch_twitter_cb" ) {
        $self->{cookie}   = $self->query->cookies->{oauth}->value;
        $self->{verifier} = $self->query->param('oauth_verifier');
    }
    return $self;
}

1;
__END__

=head1 PSYREN::Dispatcher

PSYREN::Dispatcher - PSYREN dispatcher for request.

=head1 SYNOPSIS

  use PSYREN::Dispatcher;
  PSYREN::Dispatcher->new({ query => $req })->finalize;

=head1 DESCRIPTION

PSYREN::Dispatcher is Dispatcher for request on PSYREN.

=head1 AUTHOR

haoyayoi E<lt>st.hao.yayoi@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
