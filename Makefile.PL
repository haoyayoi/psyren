use inc::Module::Install;
name 'PSYREN';
all_from 'lib/PSYREN.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
