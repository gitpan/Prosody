
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Library for things around the prosody XMPP server',
  'AUTHOR' => 'Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.96',
    'Test::Simple' => '0.98'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Prosody',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Prosody',
  'PREREQ_PM' => {
    'DBIx::Class' => '0.08192',
    'DBIx::Class::Candy' => '0.002000',
    'JSON' => '2.53',
    'Moose' => '2.0007'
  },
  'VERSION' => '0.001',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



