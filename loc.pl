#!/usr/bin/perl
# Calculates lines of code in a perl or python file

use File::Find;
use File::Basename qw(fileparse);
use List::MoreUtils qw(any first_index);

print "Please specify one or more files.\n" and exit 1 unless defined @ARGV;

$counter = 0;
$flag = "-p";
# see if prettify is set
if (any { $_ eq $flag } @ARGV) { $set = 1; } else { $set = 0; }
# now strip it from the array
delete $ARGV[first_index{$_ eq $flag} @ARGV] if $set;

#get any special extensions if provided.
@exts = ();
$args = join('', @ARGV);
#print $args;
if($args =~ /\[(.*)\]/){
  @exts = split(/,/, $1);
}

finddepth(\&warning, @ARGV);

sub warning{
    $isset = 1;
    $name = $_;
    $size = @exts;
    if($size != 0){
      $isset = 0;
      foreach $ext (@exts) {
        $wext = ".$ext";
        @fileext = fileparse($name, qr/\.[^.]*/);
        $isset++ if ($fileext[2] eq $wext);
      }
    }
    next unless $isset;
    next unless -T $_;
    open FILE, '<', $_;
    foreach(<FILE>){
        ($counter++ and $filecounter++)unless (/^(?:[\s]+)?(#|\/\/|\/\*|\*\/)/) or (/^\n(?:[\s])?$/);
    }
    close FILE;
    if($set == 1) {
    print "$File::Find::dir/$_:($filecounter)\n";
  }
  $filecounter = 0;
}

print $counter, "\n";
