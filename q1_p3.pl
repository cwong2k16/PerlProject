open USERS, "<passwd.txt" or die "Can't open input file: $!";

@numbers = ();

while(my $item = <USERS>){
	my @fields = split(":", $item);	
	push @numbers, $fields[3];
}

@numbers = sort @numbers;

$curr = $numbers[0];
$currCount = 1;

shift @numbers;

foreach $i (@numbers){
	if ($i == $curr){
		$currCount = $currCount + 1;
	}
	else{
		print "group $curr has $currCount users\n";
		$currCount = 1;
		$curr = $i;
	}
}