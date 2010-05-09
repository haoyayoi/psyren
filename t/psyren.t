use strict;
use warnings;
use Plack::Test;
use Test::Base tests => 1;
use PSYREN::Handler::PSGI;
use HTTP::Request::Common;

my $app = PSYREN::Handler::PSGI->handler('PSYREN');
test_psgi app => $app, client => sub {
    my $cb  = shift;
    my $res = $cb->(GET "/index");
    like $res->content, qr/DUMMY/;
};
