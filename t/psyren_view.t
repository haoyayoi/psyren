use strict;
use warnings;
use Test::Base -Base;
use PSYREN::View;

filters ({ input => 'yaml', expected => 'yaml' });

plan tests => 5;

run {
    my $block = shift;
    my $view = PSYREN::View->new;
    isa_ok( $view, "PSYREN::View");
    for my $i ( 0 .. @{$block->input->{view}} - 1 ) {
        my $ref = $block->input->{view}->[$i];
        my $res = $block->expected->{result}->[$i];
        like ( $view->grep_isa($ref), qr/$res/, $block->name);
    }
    can_ok ( $view, qw/new render grep_isa/ );
}

__DATA__
=== view
--- input
view:
  - JSON
  - TMT
  - DUMMY

--- expected
result:
  - PSYREN::View::JSON
  - PSYREN::View::TMT
  - ""
