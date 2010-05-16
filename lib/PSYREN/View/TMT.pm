package PSYREN::View::TMT;
use strict;
use warnings;
use Text::MicroTemplate::File;
use PSYREN::Config;

sub new { bless{}, $_[0] }

sub tmt {
    my ( $self, $args ) = @_;
    my $conf = PSYREN::Config->new->instance;
    my $tmt = Text::MicroTemplate::File->new(
        include_path => [ $conf->template->{dir} ],
        use_cache    => 1,
    );
    $tmt->render_file( $args->{tt} || 'not_found.tt', @{$args->{data}});
}

1;

