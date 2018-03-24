use File::Copy;
print "Enter a file name: ";
$file_name = <>;
chomp $file_name;

$string = "Perl is cool!";

@lines = ();

# if file is present go inside...
if(-e $file_name){
	$dir_exists = 0;
	@arr = grep {-d} glob(".* *");
	foreach $item (@arr){
		if($item eq "backup"){
			# backup exists
			$dir_exists = 1;
		}
	}
	if($dir_exists == 0){ # doesn't exist, so mkdir
		mkdir("backup");
		print "Checking backup directory... backup directory created\n";
	}
	else{ # backup exists
		print "Checking backup directory... already exists\n";
	}	
	
	# now that a backup directory has been created, check if file has 10 lines
	open LINES, "+<$file_name";
	$lines = 0;
	while($line = <LINES>){
		push @lines, $line if($lines < 10);
		push @lines_2, $line;
		$lines++;
	}
	if($lines > 10){
		print "$file_name has more than 10 lines. What to do next?\n";
		print "Enter 'c' to backup the first 10 lines, 'o' to overwrite without creating a backup\n";
		$userOption = <>;
		chomp $userOption;
		if($userOption eq "o"){
			seek(LINES, 0, 0);
			truncate LINES, 0;
			print LINES "$string";
			print "Wrote to file $file_name";
		}
		elsif($userOption eq "c"){
			open COPY, ">backup/$file_name";
			print COPY @lines;
			print "Ok, old file backed up under backup directory\n";
			seek(LINES, 0, 0);
			truncate LINES, 0;
			print LINES "$string";
			print "Wrote to file $file_name";
			close COPY;
		}
	}
	else{
		print "$file_name has no more than 10 lines.\n";
		open COPY, ">backup/$file_name";
		print COPY @lines;
		print "Ok, old file backed up under backup directory\n";
		seek(LINES, 0, 0);
		truncate LINES, 0;
		print LINES "$string";
		print "Wrote to file $file_name";
		close COPY;
	}
	close LINES;
}

	# if file is not present, create it and write to it;
else{
	open FILE, ">$file_name";
	print FILE $string;
	close FILE;
	print "Wrote to file $file_name";
}