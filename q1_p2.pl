open USERS, "<passwd.txt" or die "Can't open input file: $!";

@arr = ();

@keys = ();
@values = ();

while(my $line = <USERS>){
	push @arr, $line;
}

@arr = sort {$a->[2] <=> $b->[2]} @arr;
@arr = reverse @arr;

foreach $item (@arr){
	my @fields = split(":", $item);	
	push @keys, $fields[0];
	push @values, $fields[2];
}

print "sorted uids:";
foreach $item (@values){
	print " $item";
}

print "\nusernames:";
foreach $item (@keys){
	print " $item";
}

close USERS;