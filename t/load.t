#!perl

use strict;
use warnings;

use Capture::Tiny qw(:all);

use Test2::V0;
use Test::Alien;

use Alien::Plotly::Orca;

alien_ok 'Alien::Plotly::Orca';

diag( Alien::Plotly::Orca->bin_dir );
$ENV{PATH} = join(
    ( $^O eq 'MSWin32' ? ';' : ':' ),
    Alien::Plotly::Orca->bin_dir,
    $ENV{PATH}
);
my ( $merged, $exit ) = capture_merged { system('orca -h') };
ok( ( $merged =~ /plotly/i and $exit == 0 ), 'executable works from bin_dir' );

my $version = Alien::Plotly::Orca->version;
diag("plotly-orca version: $version");
ok( $version, 'version defined' );

pass('Alien::Plotly::Orca loads');

done_testing;
