use strict;
use warnings;
use Plack::Test;
use Test::Base tests => 2;
use PSYREN::Handler::PSGI;
use HTTP::Request::Common;

my $app = PSYREN::Handler::PSGI->handler('PSYREN');
test_psgi app => $app, client => sub {
    my $cb  = shift;
    my $res_1 = $cb->(GET "/index");
    like($res_1->content, qr/index/);
    my $res_2 = $cb->(GET "/DUMMY");
    like($res_2->content, qr/404 not found/);
};
