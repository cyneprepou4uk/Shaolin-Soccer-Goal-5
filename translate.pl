#by KOHR

#!/usr/bin/perl
use warnings;
use strict;
use 5.010;
use Encode qw(decode encode);
use utf8;

my $files_encoding='utf8'; #cp1251 utf8
my $mask=(
	'
	bank_00.asm
	bank_01.asm
	bank_02.asm
	bank_03.asm
	bank_04.asm
	bank_05.asm
	bank_06.asm
	bank_07.asm
	bank_ram.inc
	'
);
my %replace_table=(
	'А'=>'A',	'а'=>'a',
	'Б'=>'B',	'б'=>'b',
	'В'=>'V',	'в'=>'v',
	'Г'=>'G',	'г'=>'g',
	'Д'=>'D',	'д'=>'d',
	'Е'=>'E',	'е'=>'e',
	'Ё'=>'E',	'ё'=>'e',
	'Ж'=>'J',	'ж'=>'j',
	'З'=>'Z',	'з'=>'z',
	'И'=>'I',	'и'=>'i',
	'Й'=>'I',	'й'=>'i',
	'К'=>'K',	'к'=>'k',
	'Л'=>'L',	'л'=>'l',
	'М'=>'M',	'м'=>'m',
	'Н'=>'N',	'н'=>'n',
	'О'=>'O',	'о'=>'o',
	'П'=>'P',	'п'=>'p',
	'Р'=>'R',	'р'=>'r',
	'С'=>'S',	'с'=>'s',
	'Т'=>'T',	'т'=>'t',
	'У'=>'Y',	'у'=>'y',
	'Ф'=>'F',	'ф'=>'f',
	'Х'=>'H',	'х'=>'h',
	'Ц'=>'C',	'ц'=>'c',
	'Ч'=>'CH',	'ч'=>'ch',
	'Ш'=>'SH',	'ш'=>'sh',
	'Щ'=>'SH',	'щ'=>'sh',
	'Ъ'=>'b',	'ъ'=>'b',
	'Ы'=>'bI',	'ы'=>'bI',
	'Ь'=>'b',	'ь'=>'b',
	'Э'=>'E',	'э'=>'e',
	'Ю'=>'U',	'ю'=>'u',
	'Я'=>'Ja',	'я'=>'ja',
);

for my $file (glob $mask) {
	next unless $file=~/^(.*)\.(.*?)$/;
	my ($name,$ext)=($1,$2);
	next if $name =~/_copy$/;
	open S,'<',"$file" or die "$!";
	open D,'>',"${name}_copy.${ext}" or die "$!";
	while (my $line=decode($files_encoding,<S>)) {
		for my $replace (keys %replace_table) {
			my $l=length ($replace);
			while (1){
				my $i=index($line,$replace);
				last if $i==-1;
				substr($line,$i,$l)=$replace_table{$replace};
			}
		}
		$line=encode $files_encoding,$line;
		print D $line;
	}
}
