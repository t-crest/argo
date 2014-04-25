#!/usr/bin/perl -w
use strict;
my $orig_sdf = "$ARGV[0].sdf";
my $sdf_fixed = "$ARGV[0]Fixed.sdf";
my $i_orig = "";

# Open elc_lib & elc_lib_fixed and replace area in
open(orig_file,$orig_sdf)
  or die "Failed to open file: $orig_sdf, $!\n";
open(sdf_fixed,"> ${sdf_fixed}")
  or die "Failed to open file: $sdf_fixed, $!\n";

while(defined(my $i = <orig_file>)) {
#	$i =~ s/\(COND [\w]+ \(([a-z]+)edge ([\w]+)\)\)/\($1edge $2\)/g;
 
    # replace all the & in the cond statements with && to prevent errors with sdf backannotation
    $i =~ s/[&]([^& ])/ && $1/g;

    if ($i =~ /\(HOLD \((pos|neg)edge (R|S)N\) \((pos|neg)edge (GN|G)\).*/ || $i =~ /\(HOLD \((pos|neg)edge (R|S)N\) \((pos|neg)edge CP\).*/) {
    } else {
        print sdf_fixed $i;
    }
        

    #if ($i ne "pelle") {#
#
#        
#    }
}

close(orig_file);
close(sdf_fixed)
  or die "Error while closing file '${sdf_fixed}': $! \n";

