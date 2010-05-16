use strict;
use warnings;
use Test::More tests => 6;
use PSYREN::Dispatcher;
use CGI;
use Data::Dumper;

eval { my $dispatcher = PSYREN::Dispatcher->new(); };
if ($@) { like ( $@, qr/need hashref/, "err test" ); }
eval { my $dispatcher = PSYREN::Dispatcher->new(()); };
if ($@) { like ( $@, qr/need hashref/, "err test" ); }
eval { my $dispatcher = PSYREN::Dispatcher->new($_); };
if ($@) { like ( $@, qr/need hashref/, "err test" ); }

my $dist = PSYREN::Dispatcher->new({ query => CGI->new });
is( $dist->method,         "index",              "default method"     );
is( ref $dist->controller, "PSYREN::Controller", "default controller" );
can_ok( $dist, qw/new finalize is_index make_controller_package path_to_class_and_method/ );
