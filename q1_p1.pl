open USERS, "<passwd.txt" or die "Can't open input file: $!";

while(my $line = <USERS>){
	my @fields = split(":", $line);	
	if($fields[2]%2 == 0){
		print "@fields[0], @fields[2]\n";
	}
}

close USERS