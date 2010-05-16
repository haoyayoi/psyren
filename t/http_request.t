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

plan tests => 2;

run {
    my $block = shift;

    for my $i ( 0 .. @{$block->input->{path}} - 1 ) {
        my $req = HTTP::Request->new(GET => $block->input->{path}->[$i]);
        my $env = $req->as_string;
        my $content = `perl bin/psyren.cgi`;
        my $output  = $block->expected->{content}->[$i];
        like($content,
            qr/$output/,
            $block->input->{path}->[$i]
        );  
    }
}

__END__
=== content
--- input
path:
  - index
  - 
--- expected
content:
  - index
  - index

