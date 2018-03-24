open USERS, "<passwd.txt" or die "Can't open input file: $!";

@numbers = ();

while(my $item = <USERS>){
	my @fields = split(":", $item);	
	push @numbers, $fields[3];
}

@numbers = sort @numbers;

%hashf = {};

foreach $i (@numbers){
	$hashf{$i} = $hashf{$i} + 1;
}

while(my($k, $v) = each %hashf) {
	print "group $k has $v users\n" if $v;
}

close USERS;