use strict;
use warnings;
use Test::More tests => 11;

BEGIN { use_ok 'PSYREN' }
BEGIN { use_ok 'PSYREN::Base' }
BEGIN { use_ok 'PSYREN::Config' }
BEGIN { use_ok 'PSYREN::Drift' }
BEGIN { use_ok 'PSYREN::Dispatcher' }
BEGIN { use_ok 'PSYREN::Controller' }
BEGIN { use_ok 'PSYREN::Engine' }
BEGIN { use_ok 'PSYREN::Response' }
BEGIN { use_ok 'PSYREN::Command' }
BEGIN { use_ok 'PSYREN::Command::Twitter' }
BEGIN { use_ok 'PSYREN::Config::YAML' }
