print "What string do you want to search for?\n";
$string = <>;
chomp $string;

@arr = grep {-f} glob(".* *");

foreach $item (@arr){ # erwT
	@lines = ();
	open LINES, "<$item";
	while($line = <LINES>){
		push @lines, $line;
	}
	$found = 0;
	foreach $line (@lines){
		if(index($line, $string) != -1){
			$found = 1;
		}
	} 
	if($found == 1){
		print "Found \"$string\" in file $item............";
		if(-e $item){
			print "e"; 
		}		
		if(-r $item){
			print "r"; 
		}		
		if(-w $item){
			print "w"; 
		}		
		if(-T $item){
			print "T"; 
		}
		print "\n";
	}
	close LINES;
}