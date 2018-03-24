sub sort_file{
	open LINES, "<sample_input_q2.txt" or die "Can't open input file: $!";
	($width) = @_;
	@arr = ();
	
	while($line = <LINES>){
		push @arr, split("", $line);
	}
	
	print @arr;
	
	@buffer = ();
	
		
	close LINES;
}

sort_file(15)
