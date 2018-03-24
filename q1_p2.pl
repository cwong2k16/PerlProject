open USERS, "<passwd.txt" or die "Can't open input file: $!";

@arr = ();

while(my $line = <USERS>){
	push @arr, $line;
}

@arr = sort {$a->[2] <=> $b->[2]} @arr;
@arr = reverse @arr;

foreach $item (@arr){
	my @fields = split(":", $item);	
	print "$fields[0], $fields[2]";
	print "\n";
}

close USERS;