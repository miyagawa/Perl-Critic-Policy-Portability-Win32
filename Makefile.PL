use inc::Module::Install;
name 'Perl-Critic-Policy-Portability-Win32';
all_from 'lib/Perl/Critic/Policy/Portability/Win32.pm';
readme_from 'lib/Perl/Critic/Policy/Portability/Win32.pm';
build_requires 'Test::More';
requires 'Perl::Critic';
use_test_base;
auto_include_deps;
author_tests('xt');
auto_set_repository;
WriteAll;
