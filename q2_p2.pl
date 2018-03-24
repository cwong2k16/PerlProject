sub sort_file{
	open LINES, "<sample_input_q2.txt" or die "Can't open input file: $!";
	($width) = @_;
	@arr = ();
	
	while($line = <LINES>){
		push @arr, split(" ", $line);
	}
	
	$index = 0;
	$curr_length = 0;
	$concat = "";
	
	foreach $item (@arr){
		if($index == 0){
			$index = 1;
			$curr_length = length($item) + 1;
			$concat = $item . " ";
		}
		else{
			if(($curr_length + length($item)) > $width){
				chop $concat;
				print $concat;
				print "\n";
				$concat = $item . " ";
				$curr_length = length($item) + 1;
			}
			else{
				$curr_length = $curr_length + length($item) + 1;
				$concat = $concat . $item . " ";
			}	
		}
	}
	
	if($concat){
		chop $concat;
		print $concat;
	}
	
		
	close LINES;
}

sort_file(15)
