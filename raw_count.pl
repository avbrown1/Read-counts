#The script will return the number of raw reads that match a given target.
#This script takes as input a file that has been sorted by the first column and the second column will be the counts column, separated by tab (\t). It will output the abundance of the first column, i.e. add all the second column values that have the same value in the first column. 

open IN, $ARGV[0] or die "Can't open input file\n";

@line_array = ();
my $count = "count";
my $previousID = "genes";


while(<IN>)
{
chomp;
@line_array = split(/\t/);
   if ( $line_array[0] eq $previousID )
	{
	$count = $count+$line_array[1];
	}
   else
	{
	print "$previousID\t$count\n";
	$previousID = $line_array[0];
	$count = $line_array[1];
	}

}
print "$previousID\t$count\n";
close IN;
