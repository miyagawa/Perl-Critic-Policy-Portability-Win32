package Perl::Critic::Policy::Portability::Win32;

use strict;
use 5.008_001;
our $VERSION = '0.01';

use Perl::Critic::Utils qw{ :booleans :severities :classification :ppi $SCOLON };
use base qw(Perl::Critic::Policy);

my $DESC = 'Unsafe functions for Win32 portability';
my $EXPL = 'See perldoc perlport and http://docs.activestate.com/activeperl/5.8/faq/Windows/ActivePerl-Winfaq5.html';

sub default_severity { $SEVERITY_MEDIUM }
sub applies_to       { 'PPI::Token::Word' }

my %unsafe = map { $_ => 1 } qw(
    alarm getpgrp getppid getpriority setpgrp setpriority
    endgrent endpwent getgrent getgrgid getgrnam getpwent getpwnam getpwuid setgrent setpwent
    msgctl msgget msgrcv msgsnd semctl semget semop shmctl shmget shmread shmwrite
    link symlink chroot
    syscall
    getnetbyname getnetbyaddr getnetent getprotoent getservent sethostent setnetent setprotoent setservent endhostent endnetent endprotoent endservent socketpair
);

sub violates {
    my($self, $elem) = @_;

    return unless is_function_call($elem);
    return unless $unsafe{$elem};

    return $self->violation( $DESC, $EXPL, $elem );
}

1;
__END__

=encoding utf-8

=for stopwords

=head1 NAME

Perl::Critic::Policy::Portability::Win32 -

=head1 SYNOPSIS

  use Perl::Critic::Policy::Portability::Win32;

=head1 DESCRIPTION

Perl::Critic::Policy::Portability::Win32 is

=head1 AUTHOR

Tatsuhiko Miyagawa E<lt>miyagawa@bulknews.netE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
