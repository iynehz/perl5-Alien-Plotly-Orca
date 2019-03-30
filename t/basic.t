#!perl

use strict;
use warnings;

use Capture::Tiny qw(:all);

use Test2::V0;
use Test::Alien;

use Alien::Plotly::Orca;
use Config;

alien_ok 'Alien::Plotly::Orca';

diag( Alien::Plotly::Orca->bin_dir );
$ENV{PATH} = join(
    $Config{path_sep},
    Alien::Plotly::Orca->bin_dir,
    $ENV{PATH}
);
my ( $merged, $exit ) = capture_merged { system('orca -h') };
ok( ( $merged =~ /plotly/i and $exit == 0 ), 'executable works from bin_dir' );

my $version = Alien::Plotly::Orca->version;
diag("plotly-orca version: $version");
ok( $version, 'version defined' );

done_testing;
