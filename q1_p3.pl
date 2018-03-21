open USERS, "<passwd.txt" or die "Can't open input file: $!";

@arr = ();

while(my $line = <USERS>){
	push @arr, $line;
}

foreach $item (@arr){
	print $item; 
}