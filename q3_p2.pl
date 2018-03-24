%hashf = (usd=>1, eur=>0.81, cad=>1.29, inr=>65.2, jpy=>105.75, vnd=>22750, krw=>1079.43, btc=>0.000088);

print "Exchangeable currency: usd, eur, cad, inr, jpy, vnd, krw, btc\n";
print "Enter the current currency: ";

$curr_currency = <STDIN>;

chomp $curr_currency;

while(not $hashf{$curr_currency}){
	print "We do not trade $curr_currency!\n";
	print "Re-enter the current currency: ";
	$curr_currency = <>;
	chomp $curr_currency;
}

print "Enter the target currency: ";

$target_currency = <STDIN>;

chomp $target_currency;

while(not $hashf{$target_currency}){
	print "We do not trade $target_currency!\n";
	print "Re-enter the target currency: ";
	$target_currency = <>;
	chomp $target_currency;
}

print "Enter the amount of money: ";

$amount = <STDIN>;
chomp $amount;

$ratio = ($hashf{$curr_currency})/($hashf{$target_currency});

$converted = $amount/$ratio;

print "$amount $curr_currency is ";
if(int($converted)!=$converted){
	printf("%.2f", $converted);
}
else{
	print($converted);
}

print " $target_currency.";
