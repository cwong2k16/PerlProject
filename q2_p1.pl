sub sort_file{
	open LINES, "<sample_input_q2.txt" or die "Can't open input file: $!";

	%hashf = ();

	while($line = <LINES>){
		$count = 0;
		$line =~ s/^\s+//;
		$line =~ s/\s+$//;
		foreach $i (split('', $line)) { 
			$count++;
		}
		chomp $line;
		$hashf{$line} = $count;
	}

	@keys = sort {$hashf{$a} <=> $hashf{$b}} keys(%hashf);
	@vals = @hashf{@keys};
	
	foreach $item (@keys){
		print "$item\n";
	}
	close LINES;
}

sort_file;