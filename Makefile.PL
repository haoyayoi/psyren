use inc::Module::Install;
name 'PSYREN';
all_from 'lib/PSYREN/Base.pm';

requires 'Plack::Request';
requires 'Path::Class';
requires 'Net::Twitter::Lite';
requires 'Exporter';
requires 'YAML::Syck';
requires 'File::Slurp';
requires 'TokyoTyrant';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
install_script 'bin/psyren.cgi';
WriteAll;
