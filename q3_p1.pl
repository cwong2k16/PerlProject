$file = $ARGV[0];

open FILE, "<", $file;

$line_count = 0;
$word_count = 0;
$char_count = 0;

@words = ();
@reverse_words = ();


while($line =<FILE>){
	if($line ne "\n"){
		push @words, $line;
		$line_count++;
		
		foreach $item (split(" ", $line)){
			$word_count++;
		}
		
		chomp $line;
		
		foreach $item2 (split("", $line)){
			$char_count++;
		}
	}
}

print "lines: $line_count, words: $word_count, characters: $char_count\n";

foreach $item (@words){
	push @reverse_words, split("", $item);
}
print "reversed: ";
print reverse @reverse_words;