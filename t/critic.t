use Perl::Critic;
use Test::More;

my $critic = Perl::Critic->new;
$critic->add_policy(-policy => "Portability::Win32");

my @v      = $critic->critique("t/foo.pl");

ok @v == 1;
like $v[0], qr/perlport/;

done_testing;

