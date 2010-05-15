use strict;
use warnings;
use Test::Base tests => 1;
use PSYREN;
use Test::WWW::Mechanize::CGI;

my $mech = Test::WWW::Mechanize::CGI->new;
$mech->cgi( PSYREN::run );
$mech->get_ok('http://localhost');
