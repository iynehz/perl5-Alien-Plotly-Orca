#!perl

use strict;
use warnings;

use lib 'util';
use MyInstallUtil;

use Capture::Tiny qw(:all);
use Config;
use File::Which;

use Test2::V0;
use Test::Alien;

use Alien::Plotly::Orca;

alien_ok 'Alien::Plotly::Orca';

diag( "bin_dir : " . Alien::Plotly::Orca->bin_dir );

$ENV{PATH} =
  join( $Config{path_sep}, Alien::Plotly::Orca->bin_dir, $ENV{PATH} );

sub capture_orca {
    my ($cmd) = @_;

    return
      capture_merged { system( MyInstallUtil::wrap_orca($cmd) ) };
}

my ( $merged, $exit ) = capture_orca('orca -h');
diag( "orca help message:\n" . $merged );
ok( ( $merged =~ /plotly/i and $exit == 0 ), 'executable works from bin_dir' );

my $version_expected = MyInstallUtil::detect_orca_version();
like( $version_expected, qr/^\d+/, 'orca --version' );

my $version = Alien::Plotly::Orca->version;
diag("plotly-orca version: $version");
is( $version, $version_expected, 'version' );

done_testing;
