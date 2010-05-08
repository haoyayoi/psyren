use inc::Module::Install;
name 'PSYREN';
all_from 'lib/PSYREN/Base.pm';

requires 'HTTP::Engine';
requires 'Class::Accessor::Fast';
requires 'Path::Class';
requires 'Net::Twitter';
requires 'Exporter';
requires 'YAML::Syck';
requires 'File::Slurp';
requires 'TokyoTyrant';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
install_script 'bin/psyren.psgi';
WriteAll;
