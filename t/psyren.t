use strict;
use warnings;
use Test::Base -Base;
use PSYREN;
use HTTP::Request;
use HTTP::Message::PSGI;
use LWP::UserAgent;
use Data::Dumper;

filters({
    input    => "yaml",
    expected => "yaml",
});
plan tests => 1 * blocks;

run {
    my $block = shift;

    for my $i ( 0 .. @{$block->input->{url}} -1 ) {
        my $req = HTTP::Request->new(GET => $block->input->{url}->[$i]);
        my $env = $req->as_string;
        my $content = `perl bin/psyren.cgi $env`;
        like($content,
            $block->expected->{content}->[$i],
            $block->input->{url}->[$i]
        );  
    }
}

__END__
=== content
--- input
url:
  - http://localhost
  - http://localhost/
--- expected
content:
  - index
  - index

