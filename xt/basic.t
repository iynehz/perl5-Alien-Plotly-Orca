#!perl

use strict;
use warnings;

use Path::Tiny;

my $dest_dir;
BEGIN { $dest_dir = Path::Tiny->tempdir; }
use Test::File::ShareDir -share =>
  { -dist => { 'Alien-Plotly-Orca' => $dest_dir } };

use Test2::V0;

use Alien::Plotly::Orca qw(:all);

my %download_url = %{ Alien::Plotly::Orca::_download_url() };

my $tempdir    = Path::Tiny->tempdir;
diag("Downloading plotly-orca release files to $tempdir...");

my @os         = sort keys %download_url;
my %downloaded = map {
    my $os   = $_;
    my $url  = $download_url{$os};
    my $file = Alien::Plotly::Orca::_download( $url, $tempdir );
    ( $os => $file );
} @os;

pass( "plotly-orca release files downloable for OSes: " . join( ', ', @os ) );

done_testing;
