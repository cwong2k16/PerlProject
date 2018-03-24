sub add_user{
	open USERS, "+<passwd.txt" or die "Can't open input file: $!";
	@numbers = ();
	while(my $item = <USERS>){
		my @fields = split(":", $item);	
		push @numbers, $fields[2];
	}
	@numbers = sort{$b <=> $a} @numbers;
	$largest = @numbers[0]; # largest
	$user_id = $largest + 1;
	$group_id = int(rand(100));
	
	$new_user = "\nuser:*:$user_id:$group_id:System Administrator:/var/root:/bin/sh";
	print USERS $new_user;
	close USERS;
}
add_user;