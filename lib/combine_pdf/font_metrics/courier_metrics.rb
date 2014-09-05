module CombinePDF
	class PDFWriter < Hash
		# with thanks to Jan Krutisch, the creator of the afm gem.
		COURIER_METRICS = 
			{"space"=>{:charcode=>32,
			:wx=>600,
			:name=>"space",
			:boundingbox=>[0,
			0,
			0,
			0]},
			"exclam"=>{:charcode=>33,
			:wx=>600,
			:name=>"exclam",
			:boundingbox=>[236,
			-15,
			364,
			572]},
			"quotedbl"=>{:charcode=>34,
			:wx=>600,
			:name=>"quotedbl",
			:boundingbox=>[187,
			328,
			413,
			562]},
			"numbersign"=>{:charcode=>35,
			:wx=>600,
			:name=>"numbersign",
			:boundingbox=>[93,
			-32,
			507,
			639]},
			"dollar"=>{:charcode=>36,
			:wx=>600,
			:name=>"dollar",
			:boundingbox=>[105,
			-126,
			496,
			662]},
			"percent"=>{:charcode=>37,
			:wx=>600,
			:name=>"percent",
			:boundingbox=>[81,
			-15,
			518,
			622]},
			"ampersand"=>{:charcode=>38,
			:wx=>600,
			:name=>"ampersand",
			:boundingbox=>[63,
			-15,
			538,
			543]},
			"quoteright"=>{:charcode=>39,
			:wx=>600,
			:name=>"quoteright",
			:boundingbox=>[213,
			328,
			376,
			562]},
			"parenleft"=>{:charcode=>40,
			:wx=>600,
			:name=>"parenleft",
			:boundingbox=>[269,
			-108,
			440,
			622]},
			"parenright"=>{:charcode=>41,
			:wx=>600,
			:name=>"parenright",
			:boundingbox=>[160,
			-108,
			331,
			622]},
			"asterisk"=>{:charcode=>42,
			:wx=>600,
			:name=>"asterisk",
			:boundingbox=>[116,
			257,
			484,
			607]},
			"plus"=>{:charcode=>43,
			:wx=>600,
			:name=>"plus",
			:boundingbox=>[80,
			44,
			520,
			470]},
			"comma"=>{:charcode=>44,
			:wx=>600,
			:name=>"comma",
			:boundingbox=>[181,
			-112,
			344,
			122]},
			"hyphen"=>{:charcode=>45,
			:wx=>600,
			:name=>"hyphen",
			:boundingbox=>[103,
			231,
			497,
			285]},
			"period"=>{:charcode=>46,
			:wx=>600,
			:name=>"period",
			:boundingbox=>[229,
			-15,
			371,
			109]},
			"slash"=>{:charcode=>47,
			:wx=>600,
			:name=>"slash",
			:boundingbox=>[125,
			-80,
			475,
			629]},
			"zero"=>{:charcode=>48,
			:wx=>600,
			:name=>"zero",
			:boundingbox=>[106,
			-15,
			494,
			622]},
			"one"=>{:charcode=>49,
			:wx=>600,
			:name=>"one",
			:boundingbox=>[96,
			0,
			505,
			622]},
			"two"=>{:charcode=>50,
			:wx=>600,
			:name=>"two",
			:boundingbox=>[70,
			0,
			471,
			622]},
			"three"=>{:charcode=>51,
			:wx=>600,
			:name=>"three",
			:boundingbox=>[75,
			-15,
			466,
			622]},
			"four"=>{:charcode=>52,
			:wx=>600,
			:name=>"four",
			:boundingbox=>[78,
			0,
			500,
			622]},
			"five"=>{:charcode=>53,
			:wx=>600,
			:name=>"five",
			:boundingbox=>[92,
			-15,
			497,
			607]},
			"six"=>{:charcode=>54,
			:wx=>600,
			:name=>"six",
			:boundingbox=>[111,
			-15,
			497,
			622]},
			"seven"=>{:charcode=>55,
			:wx=>600,
			:name=>"seven",
			:boundingbox=>[82,
			0,
			483,
			607]},
			"eight"=>{:charcode=>56,
			:wx=>600,
			:name=>"eight",
			:boundingbox=>[102,
			-15,
			498,
			622]},
			"nine"=>{:charcode=>57,
			:wx=>600,
			:name=>"nine",
			:boundingbox=>[96,
			-15,
			489,
			622]},
			"colon"=>{:charcode=>58,
			:wx=>600,
			:name=>"colon",
			:boundingbox=>[229,
			-15,
			371,
			385]},
			"semicolon"=>{:charcode=>59,
			:wx=>600,
			:name=>"semicolon",
			:boundingbox=>[181,
			-112,
			371,
			385]},
			"less"=>{:charcode=>60,
			:wx=>600,
			:name=>"less",
			:boundingbox=>[41,
			42,
			519,
			472]},
			"equal"=>{:charcode=>61,
			:wx=>600,
			:name=>"equal",
			:boundingbox=>[80,
			138,
			520,
			376]},
			"greater"=>{:charcode=>62,
			:wx=>600,
			:name=>"greater",
			:boundingbox=>[66,
			42,
			544,
			472]},
			"question"=>{:charcode=>63,
			:wx=>600,
			:name=>"question",
			:boundingbox=>[129,
			-15,
			492,
			572]},
			"at"=>{:charcode=>64,
			:wx=>600,
			:name=>"at",
			:boundingbox=>[77,
			-15,
			533,
			622]},
			"A"=>{:charcode=>65,
			:wx=>600,
			:name=>"A",
			:boundingbox=>[3,
			0,
			597,
			562]},
			"B"=>{:charcode=>66,
			:wx=>600,
			:name=>"B",
			:boundingbox=>[43,
			0,
			559,
			562]},
			"C"=>{:charcode=>67,
			:wx=>600,
			:name=>"C",
			:boundingbox=>[41,
			-18,
			540,
			580]},
			"D"=>{:charcode=>68,
			:wx=>600,
			:name=>"D",
			:boundingbox=>[43,
			0,
			574,
			562]},
			"E"=>{:charcode=>69,
			:wx=>600,
			:name=>"E",
			:boundingbox=>[53,
			0,
			550,
			562]},
			"F"=>{:charcode=>70,
			:wx=>600,
			:name=>"F",
			:boundingbox=>[53,
			0,
			545,
			562]},
			"G"=>{:charcode=>71,
			:wx=>600,
			:name=>"G",
			:boundingbox=>[31,
			-18,
			575,
			580]},
			"H"=>{:charcode=>72,
			:wx=>600,
			:name=>"H",
			:boundingbox=>[32,
			0,
			568,
			562]},
			"I"=>{:charcode=>73,
			:wx=>600,
			:name=>"I",
			:boundingbox=>[96,
			0,
			504,
			562]},
			"J"=>{:charcode=>74,
			:wx=>600,
			:name=>"J",
			:boundingbox=>[34,
			-18,
			566,
			562]},
			"K"=>{:charcode=>75,
			:wx=>600,
			:name=>"K",
			:boundingbox=>[38,
			0,
			582,
			562]},
			"L"=>{:charcode=>76,
			:wx=>600,
			:name=>"L",
			:boundingbox=>[47,
			0,
			554,
			562]},
			"M"=>{:charcode=>77,
			:wx=>600,
			:name=>"M",
			:boundingbox=>[4,
			0,
			596,
			562]},
			"N"=>{:charcode=>78,
			:wx=>600,
			:name=>"N",
			:boundingbox=>[7,
			-13,
			593,
			562]},
			"O"=>{:charcode=>79,
			:wx=>600,
			:name=>"O",
			:boundingbox=>[43,
			-18,
			557,
			580]},
			"P"=>{:charcode=>80,
			:wx=>600,
			:name=>"P",
			:boundingbox=>[79,
			0,
			558,
			562]},
			"Q"=>{:charcode=>81,
			:wx=>600,
			:name=>"Q",
			:boundingbox=>[43,
			-138,
			557,
			580]},
			"R"=>{:charcode=>82,
			:wx=>600,
			:name=>"R",
			:boundingbox=>[38,
			0,
			588,
			562]},
			"S"=>{:charcode=>83,
			:wx=>600,
			:name=>"S",
			:boundingbox=>[72,
			-20,
			529,
			580]},
			"T"=>{:charcode=>84,
			:wx=>600,
			:name=>"T",
			:boundingbox=>[38,
			0,
			563,
			562]},
			"U"=>{:charcode=>85,
			:wx=>600,
			:name=>"U",
			:boundingbox=>[17,
			-18,
			583,
			562]},
			"V"=>{:charcode=>86,
			:wx=>600,
			:name=>"V",
			:boundingbox=>[-4,
			-13,
			604,
			562]},
			"W"=>{:charcode=>87,
			:wx=>600,
			:name=>"W",
			:boundingbox=>[-3,
			-13,
			603,
			562]},
			"X"=>{:charcode=>88,
			:wx=>600,
			:name=>"X",
			:boundingbox=>[23,
			0,
			577,
			562]},
			"Y"=>{:charcode=>89,
			:wx=>600,
			:name=>"Y",
			:boundingbox=>[24,
			0,
			576,
			562]},
			"Z"=>{:charcode=>90,
			:wx=>600,
			:name=>"Z",
			:boundingbox=>[86,
			0,
			514,
			562]},
			"bracketleft"=>{:charcode=>91,
			:wx=>600,
			:name=>"bracketleft",
			:boundingbox=>[269,
			-108,
			442,
			622]},
			"backslash"=>{:charcode=>92,
			:wx=>600,
			:name=>"backslash",
			:boundingbox=>[118,
			-80,
			482,
			629]},
			"bracketright"=>{:charcode=>93,
			:wx=>600,
			:name=>"bracketright",
			:boundingbox=>[158,
			-108,
			331,
			622]},
			"asciicircum"=>{:charcode=>94,
			:wx=>600,
			:name=>"asciicircum",
			:boundingbox=>[94,
			354,
			506,
			622]},
			"underscore"=>{:charcode=>95,
			:wx=>600,
			:name=>"underscore",
			:boundingbox=>[0,
			-125,
			600,
			-75]},
			"quoteleft"=>{:charcode=>96,
			:wx=>600,
			:name=>"quoteleft",
			:boundingbox=>[224,
			328,
			387,
			562]},
			"a"=>{:charcode=>97,
			:wx=>600,
			:name=>"a",
			:boundingbox=>[53,
			-15,
			559,
			441]},
			"b"=>{:charcode=>98,
			:wx=>600,
			:name=>"b",
			:boundingbox=>[14,
			-15,
			575,
			629]},
			"c"=>{:charcode=>99,
			:wx=>600,
			:name=>"c",
			:boundingbox=>[66,
			-15,
			529,
			441]},
			"d"=>{:charcode=>100,
			:wx=>600,
			:name=>"d",
			:boundingbox=>[45,
			-15,
			591,
			629]},
			"e"=>{:charcode=>101,
			:wx=>600,
			:name=>"e",
			:boundingbox=>[66,
			-15,
			548,
			441]},
			"f"=>{:charcode=>102,
			:wx=>600,
			:name=>"f",
			:boundingbox=>[114,
			0,
			531,
			629]},
			"g"=>{:charcode=>103,
			:wx=>600,
			:name=>"g",
			:boundingbox=>[45,
			-157,
			566,
			441]},
			"h"=>{:charcode=>104,
			:wx=>600,
			:name=>"h",
			:boundingbox=>[18,
			0,
			582,
			629]},
			"i"=>{:charcode=>105,
			:wx=>600,
			:name=>"i",
			:boundingbox=>[95,
			0,
			505,
			657]},
			"j"=>{:charcode=>106,
			:wx=>600,
			:name=>"j",
			:boundingbox=>[82,
			-157,
			410,
			657]},
			"k"=>{:charcode=>107,
			:wx=>600,
			:name=>"k",
			:boundingbox=>[43,
			0,
			580,
			629]},
			"l"=>{:charcode=>108,
			:wx=>600,
			:name=>"l",
			:boundingbox=>[95,
			0,
			505,
			629]},
			"m"=>{:charcode=>109,
			:wx=>600,
			:name=>"m",
			:boundingbox=>[-5,
			0,
			605,
			441]},
			"n"=>{:charcode=>110,
			:wx=>600,
			:name=>"n",
			:boundingbox=>[26,
			0,
			575,
			441]},
			"o"=>{:charcode=>111,
			:wx=>600,
			:name=>"o",
			:boundingbox=>[62,
			-15,
			538,
			441]},
			"p"=>{:charcode=>112,
			:wx=>600,
			:name=>"p",
			:boundingbox=>[9,
			-157,
			555,
			441]},
			"q"=>{:charcode=>113,
			:wx=>600,
			:name=>"q",
			:boundingbox=>[45,
			-157,
			591,
			441]},
			"r"=>{:charcode=>114,
			:wx=>600,
			:name=>"r",
			:boundingbox=>[60,
			0,
			559,
			441]},
			"s"=>{:charcode=>115,
			:wx=>600,
			:name=>"s",
			:boundingbox=>[80,
			-15,
			513,
			441]},
			"t"=>{:charcode=>116,
			:wx=>600,
			:name=>"t",
			:boundingbox=>[87,
			-15,
			530,
			561]},
			"u"=>{:charcode=>117,
			:wx=>600,
			:name=>"u",
			:boundingbox=>[21,
			-15,
			562,
			426]},
			"v"=>{:charcode=>118,
			:wx=>600,
			:name=>"v",
			:boundingbox=>[10,
			-10,
			590,
			426]},
			"w"=>{:charcode=>119,
			:wx=>600,
			:name=>"w",
			:boundingbox=>[-4,
			-10,
			604,
			426]},
			"x"=>{:charcode=>120,
			:wx=>600,
			:name=>"x",
			:boundingbox=>[20,
			0,
			580,
			426]},
			"y"=>{:charcode=>121,
			:wx=>600,
			:name=>"y",
			:boundingbox=>[7,
			-157,
			592,
			426]},
			"z"=>{:charcode=>122,
			:wx=>600,
			:name=>"z",
			:boundingbox=>[99,
			0,
			502,
			426]},
			"braceleft"=>{:charcode=>123,
			:wx=>600,
			:name=>"braceleft",
			:boundingbox=>[182,
			-108,
			437,
			622]},
			"bar"=>{:charcode=>124,
			:wx=>600,
			:name=>"bar",
			:boundingbox=>[275,
			-250,
			326,
			750]},
			"braceright"=>{:charcode=>125,
			:wx=>600,
			:name=>"braceright",
			:boundingbox=>[163,
			-108,
			418,
			622]},
			"asciitilde"=>{:charcode=>126,
			:wx=>600,
			:name=>"asciitilde",
			:boundingbox=>[63,
			197,
			540,
			320]},
			"exclamdown"=>{:charcode=>161,
			:wx=>600,
			:name=>"exclamdown",
			:boundingbox=>[236,
			-157,
			364,
			430]},
			"cent"=>{:charcode=>162,
			:wx=>600,
			:name=>"cent",
			:boundingbox=>[96,
			-49,
			500,
			614]},
			"sterling"=>{:charcode=>163,
			:wx=>600,
			:name=>"sterling",
			:boundingbox=>[84,
			-21,
			521,
			611]},
			"fraction"=>{:charcode=>164,
			:wx=>600,
			:name=>"fraction",
			:boundingbox=>[92,
			-57,
			509,
			665]},
			"yen"=>{:charcode=>165,
			:wx=>600,
			:name=>"yen",
			:boundingbox=>[26,
			0,
			574,
			562]},
			"florin"=>{:charcode=>166,
			:wx=>600,
			:name=>"florin",
			:boundingbox=>[4,
			-143,
			539,
			622]},
			"section"=>{:charcode=>167,
			:wx=>600,
			:name=>"section",
			:boundingbox=>[113,
			-78,
			488,
			580]},
			"currency"=>{:charcode=>168,
			:wx=>600,
			:name=>"currency",
			:boundingbox=>[73,
			58,
			527,
			506]},
			"quotesingle"=>{:charcode=>169,
			:wx=>600,
			:name=>"quotesingle",
			:boundingbox=>[259,
			328,
			341,
			562]},
			"quotedblleft"=>{:charcode=>170,
			:wx=>600,
			:name=>"quotedblleft",
			:boundingbox=>[143,
			328,
			471,
			562]},
			"guillemotleft"=>{:charcode=>171,
			:wx=>600,
			:name=>"guillemotleft",
			:boundingbox=>[37,
			70,
			563,
			446]},
			"guilsinglleft"=>{:charcode=>172,
			:wx=>600,
			:name=>"guilsinglleft",
			:boundingbox=>[149,
			70,
			451,
			446]},
			"guilsinglright"=>{:charcode=>173,
			:wx=>600,
			:name=>"guilsinglright",
			:boundingbox=>[149,
			70,
			451,
			446]},
			"fi"=>{:charcode=>174,
			:wx=>600,
			:name=>"fi",
			:boundingbox=>[3,
			0,
			597,
			629]},
			"fl"=>{:charcode=>175,
			:wx=>600,
			:name=>"fl",
			:boundingbox=>[3,
			0,
			597,
			629]},
			"endash"=>{:charcode=>177,
			:wx=>600,
			:name=>"endash",
			:boundingbox=>[75,
			231,
			525,
			285]},
			"dagger"=>{:charcode=>178,
			:wx=>600,
			:name=>"dagger",
			:boundingbox=>[141,
			-78,
			459,
			580]},
			"daggerdbl"=>{:charcode=>179,
			:wx=>600,
			:name=>"daggerdbl",
			:boundingbox=>[141,
			-78,
			459,
			580]},
			"periodcentered"=>{:charcode=>180,
			:wx=>600,
			:name=>"periodcentered",
			:boundingbox=>[222,
			189,
			378,
			327]},
			"paragraph"=>{:charcode=>182,
			:wx=>600,
			:name=>"paragraph",
			:boundingbox=>[50,
			-78,
			511,
			562]},
			"bullet"=>{:charcode=>183,
			:wx=>600,
			:name=>"bullet",
			:boundingbox=>[172,
			130,
			428,
			383]},
			"quotesinglbase"=>{:charcode=>184,
			:wx=>600,
			:name=>"quotesinglbase",
			:boundingbox=>[213,
			-134,
			376,
			100]},
			"quotedblbase"=>{:charcode=>185,
			:wx=>600,
			:name=>"quotedblbase",
			:boundingbox=>[143,
			-134,
			457,
			100]},
			"quotedblright"=>{:charcode=>186,
			:wx=>600,
			:name=>"quotedblright",
			:boundingbox=>[143,
			328,
			457,
			562]},
			"guillemotright"=>{:charcode=>187,
			:wx=>600,
			:name=>"guillemotright",
			:boundingbox=>[37,
			70,
			563,
			446]},
			"ellipsis"=>{:charcode=>188,
			:wx=>600,
			:name=>"ellipsis",
			:boundingbox=>[37,
			-15,
			563,
			111]},
			"perthousand"=>{:charcode=>189,
			:wx=>600,
			:name=>"perthousand",
			:boundingbox=>[3,
			-15,
			600,
			622]},
			"questiondown"=>{:charcode=>191,
			:wx=>600,
			:name=>"questiondown",
			:boundingbox=>[108,
			-157,
			471,
			430]},
			"grave"=>{:charcode=>193,
			:wx=>600,
			:name=>"grave",
			:boundingbox=>[151,
			497,
			378,
			672]},
			"acute"=>{:charcode=>194,
			:wx=>600,
			:name=>"acute",
			:boundingbox=>[242,
			497,
			469,
			672]},
			"circumflex"=>{:charcode=>195,
			:wx=>600,
			:name=>"circumflex",
			:boundingbox=>[124,
			477,
			476,
			654]},
			"tilde"=>{:charcode=>196,
			:wx=>600,
			:name=>"tilde",
			:boundingbox=>[105,
			489,
			503,
			606]},
			"macron"=>{:charcode=>197,
			:wx=>600,
			:name=>"macron",
			:boundingbox=>[120,
			525,
			480,
			565]},
			"breve"=>{:charcode=>198,
			:wx=>600,
			:name=>"breve",
			:boundingbox=>[153,
			501,
			447,
			609]},
			"dotaccent"=>{:charcode=>199,
			:wx=>600,
			:name=>"dotaccent",
			:boundingbox=>[249,
			537,
			352,
			640]},
			"dieresis"=>{:charcode=>200,
			:wx=>600,
			:name=>"dieresis",
			:boundingbox=>[148,
			537,
			453,
			640]},
			"ring"=>{:charcode=>202,
			:wx=>600,
			:name=>"ring",
			:boundingbox=>[218,
			463,
			382,
			627]},
			"cedilla"=>{:charcode=>203,
			:wx=>600,
			:name=>"cedilla",
			:boundingbox=>[224,
			-151,
			362,
			10]},
			"hungarumlaut"=>{:charcode=>205,
			:wx=>600,
			:name=>"hungarumlaut",
			:boundingbox=>[133,
			497,
			540,
			672]},
			"ogonek"=>{:charcode=>206,
			:wx=>600,
			:name=>"ogonek",
			:boundingbox=>[211,
			-172,
			407,
			4]},
			"caron"=>{:charcode=>207,
			:wx=>600,
			:name=>"caron",
			:boundingbox=>[124,
			492,
			476,
			669]},
			"emdash"=>{:charcode=>208,
			:wx=>600,
			:name=>"emdash",
			:boundingbox=>[0,
			231,
			600,
			285]},
			"AE"=>{:charcode=>225,
			:wx=>600,
			:name=>"AE",
			:boundingbox=>[3,
			0,
			550,
			562]},
			"ordfeminine"=>{:charcode=>227,
			:wx=>600,
			:name=>"ordfeminine",
			:boundingbox=>[156,
			249,
			442,
			580]},
			"Lslash"=>{:charcode=>232,
			:wx=>600,
			:name=>"Lslash",
			:boundingbox=>[47,
			0,
			554,
			562]},
			"Oslash"=>{:charcode=>233,
			:wx=>600,
			:name=>"Oslash",
			:boundingbox=>[43,
			-80,
			557,
			629]},
			"OE"=>{:charcode=>234,
			:wx=>600,
			:name=>"OE",
			:boundingbox=>[7,
			0,
			567,
			562]},
			"ordmasculine"=>{:charcode=>235,
			:wx=>600,
			:name=>"ordmasculine",
			:boundingbox=>[157,
			249,
			443,
			580]},
			"ae"=>{:charcode=>241,
			:wx=>600,
			:name=>"ae",
			:boundingbox=>[19,
			-15,
			570,
			441]},
			"dotlessi"=>{:charcode=>245,
			:wx=>600,
			:name=>"dotlessi",
			:boundingbox=>[95,
			0,
			505,
			426]},
			"lslash"=>{:charcode=>248,
			:wx=>600,
			:name=>"lslash",
			:boundingbox=>[95,
			0,
			505,
			629]},
			"oslash"=>{:charcode=>249,
			:wx=>600,
			:name=>"oslash",
			:boundingbox=>[62,
			-80,
			538,
			506]},
			"oe"=>{:charcode=>250,
			:wx=>600,
			:name=>"oe",
			:boundingbox=>[19,
			-15,
			559,
			441]},
			"germandbls"=>{:charcode=>251,
			:wx=>600,
			:name=>"germandbls",
			:boundingbox=>[48,
			-15,
			588,
			629]},
			"Idieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Idieresis",
			:boundingbox=>[96,
			0,
			504,
			753]},
			"eacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"eacute",
			:boundingbox=>[66,
			-15,
			548,
			672]},
			"abreve"=>{:charcode=>-1,
			:wx=>600,
			:name=>"abreve",
			:boundingbox=>[53,
			-15,
			559,
			609]},
			"uhungarumlaut"=>{:charcode=>-1,
			:wx=>600,
			:name=>"uhungarumlaut",
			:boundingbox=>[21,
			-15,
			580,
			672]},
			"ecaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ecaron",
			:boundingbox=>[66,
			-15,
			548,
			669]},
			"Ydieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ydieresis",
			:boundingbox=>[24,
			0,
			576,
			753]},
			"divide"=>{:charcode=>-1,
			:wx=>600,
			:name=>"divide",
			:boundingbox=>[87,
			48,
			513,
			467]},
			"Yacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Yacute",
			:boundingbox=>[24,
			0,
			576,
			805]},
			"Acircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Acircumflex",
			:boundingbox=>[3,
			0,
			597,
			787]},
			"aacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"aacute",
			:boundingbox=>[53,
			-15,
			559,
			672]},
			"Ucircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ucircumflex",
			:boundingbox=>[17,
			-18,
			583,
			787]},
			"yacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"yacute",
			:boundingbox=>[7,
			-157,
			592,
			672]},
			"scommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"scommaaccent",
			:boundingbox=>[80,
			-250,
			513,
			441]},
			"ecircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ecircumflex",
			:boundingbox=>[66,
			-15,
			548,
			654]},
			"Uring"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Uring",
			:boundingbox=>[17,
			-18,
			583,
			760]},
			"Udieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Udieresis",
			:boundingbox=>[17,
			-18,
			583,
			753]},
			"aogonek"=>{:charcode=>-1,
			:wx=>600,
			:name=>"aogonek",
			:boundingbox=>[53,
			-172,
			587,
			441]},
			"Uacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Uacute",
			:boundingbox=>[17,
			-18,
			583,
			805]},
			"uogonek"=>{:charcode=>-1,
			:wx=>600,
			:name=>"uogonek",
			:boundingbox=>[21,
			-172,
			590,
			426]},
			"Edieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Edieresis",
			:boundingbox=>[53,
			0,
			550,
			753]},
			"Dcroat"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Dcroat",
			:boundingbox=>[30,
			0,
			574,
			562]},
			"commaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"commaaccent",
			:boundingbox=>[198,
			-250,
			335,
			-58]},
			"copyright"=>{:charcode=>-1,
			:wx=>600,
			:name=>"copyright",
			:boundingbox=>[0,
			-18,
			600,
			580]},
			"Emacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Emacron",
			:boundingbox=>[53,
			0,
			550,
			698]},
			"ccaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ccaron",
			:boundingbox=>[66,
			-15,
			529,
			669]},
			"aring"=>{:charcode=>-1,
			:wx=>600,
			:name=>"aring",
			:boundingbox=>[53,
			-15,
			559,
			627]},
			"Ncommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ncommaaccent",
			:boundingbox=>[7,
			-250,
			593,
			562]},
			"lacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"lacute",
			:boundingbox=>[95,
			0,
			505,
			805]},
			"agrave"=>{:charcode=>-1,
			:wx=>600,
			:name=>"agrave",
			:boundingbox=>[53,
			-15,
			559,
			672]},
			"Tcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Tcommaaccent",
			:boundingbox=>[38,
			-250,
			563,
			562]},
			"Cacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Cacute",
			:boundingbox=>[41,
			-18,
			540,
			805]},
			"atilde"=>{:charcode=>-1,
			:wx=>600,
			:name=>"atilde",
			:boundingbox=>[53,
			-15,
			559,
			606]},
			"Edotaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Edotaccent",
			:boundingbox=>[53,
			0,
			550,
			753]},
			"scaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"scaron",
			:boundingbox=>[80,
			-15,
			513,
			669]},
			"scedilla"=>{:charcode=>-1,
			:wx=>600,
			:name=>"scedilla",
			:boundingbox=>[80,
			-151,
			513,
			441]},
			"iacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"iacute",
			:boundingbox=>[95,
			0,
			505,
			672]},
			"lozenge"=>{:charcode=>-1,
			:wx=>600,
			:name=>"lozenge",
			:boundingbox=>[18,
			0,
			443,
			706]},
			"Rcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Rcaron",
			:boundingbox=>[38,
			0,
			588,
			802]},
			"Gcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Gcommaaccent",
			:boundingbox=>[31,
			-250,
			575,
			580]},
			"ucircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ucircumflex",
			:boundingbox=>[21,
			-15,
			562,
			654]},
			"acircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"acircumflex",
			:boundingbox=>[53,
			-15,
			559,
			654]},
			"Amacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Amacron",
			:boundingbox=>[3,
			0,
			597,
			698]},
			"rcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"rcaron",
			:boundingbox=>[60,
			0,
			559,
			669]},
			"ccedilla"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ccedilla",
			:boundingbox=>[66,
			-151,
			529,
			441]},
			"Zdotaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Zdotaccent",
			:boundingbox=>[86,
			0,
			514,
			753]},
			"Thorn"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Thorn",
			:boundingbox=>[79,
			0,
			538,
			562]},
			"Omacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Omacron",
			:boundingbox=>[43,
			-18,
			557,
			698]},
			"Racute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Racute",
			:boundingbox=>[38,
			0,
			588,
			805]},
			"Sacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Sacute",
			:boundingbox=>[72,
			-20,
			529,
			805]},
			"dcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"dcaron",
			:boundingbox=>[45,
			-15,
			715,
			629]},
			"Umacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Umacron",
			:boundingbox=>[17,
			-18,
			583,
			698]},
			"uring"=>{:charcode=>-1,
			:wx=>600,
			:name=>"uring",
			:boundingbox=>[21,
			-15,
			562,
			627]},
			"threesuperior"=>{:charcode=>-1,
			:wx=>600,
			:name=>"threesuperior",
			:boundingbox=>[155,
			240,
			406,
			622]},
			"Ograve"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ograve",
			:boundingbox=>[43,
			-18,
			557,
			805]},
			"Agrave"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Agrave",
			:boundingbox=>[3,
			0,
			597,
			805]},
			"Abreve"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Abreve",
			:boundingbox=>[3,
			0,
			597,
			732]},
			"multiply"=>{:charcode=>-1,
			:wx=>600,
			:name=>"multiply",
			:boundingbox=>[87,
			43,
			515,
			470]},
			"uacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"uacute",
			:boundingbox=>[21,
			-15,
			562,
			672]},
			"Tcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Tcaron",
			:boundingbox=>[38,
			0,
			563,
			802]},
			"partialdiff"=>{:charcode=>-1,
			:wx=>600,
			:name=>"partialdiff",
			:boundingbox=>[17,
			-38,
			459,
			710]},
			"ydieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ydieresis",
			:boundingbox=>[7,
			-157,
			592,
			620]},
			"Nacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Nacute",
			:boundingbox=>[7,
			-13,
			593,
			805]},
			"icircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"icircumflex",
			:boundingbox=>[94,
			0,
			505,
			654]},
			"Ecircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ecircumflex",
			:boundingbox=>[53,
			0,
			550,
			787]},
			"adieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"adieresis",
			:boundingbox=>[53,
			-15,
			559,
			620]},
			"edieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"edieresis",
			:boundingbox=>[66,
			-15,
			548,
			620]},
			"cacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"cacute",
			:boundingbox=>[66,
			-15,
			529,
			672]},
			"nacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"nacute",
			:boundingbox=>[26,
			0,
			575,
			672]},
			"umacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"umacron",
			:boundingbox=>[21,
			-15,
			562,
			565]},
			"Ncaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ncaron",
			:boundingbox=>[7,
			-13,
			593,
			802]},
			"Iacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Iacute",
			:boundingbox=>[96,
			0,
			504,
			805]},
			"plusminus"=>{:charcode=>-1,
			:wx=>600,
			:name=>"plusminus",
			:boundingbox=>[87,
			44,
			513,
			558]},
			"brokenbar"=>{:charcode=>-1,
			:wx=>600,
			:name=>"brokenbar",
			:boundingbox=>[275,
			-175,
			326,
			675]},
			"registered"=>{:charcode=>-1,
			:wx=>600,
			:name=>"registered",
			:boundingbox=>[0,
			-18,
			600,
			580]},
			"Gbreve"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Gbreve",
			:boundingbox=>[31,
			-18,
			575,
			732]},
			"Idotaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Idotaccent",
			:boundingbox=>[96,
			0,
			504,
			753]},
			"summation"=>{:charcode=>-1,
			:wx=>600,
			:name=>"summation",
			:boundingbox=>[15,
			-10,
			585,
			706]},
			"Egrave"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Egrave",
			:boundingbox=>[53,
			0,
			550,
			805]},
			"racute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"racute",
			:boundingbox=>[60,
			0,
			559,
			672]},
			"omacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"omacron",
			:boundingbox=>[62,
			-15,
			538,
			565]},
			"Zacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Zacute",
			:boundingbox=>[86,
			0,
			514,
			805]},
			"Zcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Zcaron",
			:boundingbox=>[86,
			0,
			514,
			802]},
			"greaterequal"=>{:charcode=>-1,
			:wx=>600,
			:name=>"greaterequal",
			:boundingbox=>[98,
			0,
			502,
			710]},
			"Eth"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Eth",
			:boundingbox=>[30,
			0,
			574,
			562]},
			"Ccedilla"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ccedilla",
			:boundingbox=>[41,
			-151,
			540,
			580]},
			"lcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"lcommaaccent",
			:boundingbox=>[95,
			-250,
			505,
			629]},
			"tcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"tcaron",
			:boundingbox=>[87,
			-15,
			530,
			717]},
			"eogonek"=>{:charcode=>-1,
			:wx=>600,
			:name=>"eogonek",
			:boundingbox=>[66,
			-172,
			548,
			441]},
			"Uogonek"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Uogonek",
			:boundingbox=>[17,
			-172,
			583,
			562]},
			"Aacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Aacute",
			:boundingbox=>[3,
			0,
			597,
			805]},
			"Adieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Adieresis",
			:boundingbox=>[3,
			0,
			597,
			753]},
			"egrave"=>{:charcode=>-1,
			:wx=>600,
			:name=>"egrave",
			:boundingbox=>[66,
			-15,
			548,
			672]},
			"zacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"zacute",
			:boundingbox=>[99,
			0,
			502,
			672]},
			"iogonek"=>{:charcode=>-1,
			:wx=>600,
			:name=>"iogonek",
			:boundingbox=>[95,
			-172,
			505,
			657]},
			"Oacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Oacute",
			:boundingbox=>[43,
			-18,
			557,
			805]},
			"oacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"oacute",
			:boundingbox=>[62,
			-15,
			538,
			672]},
			"amacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"amacron",
			:boundingbox=>[53,
			-15,
			559,
			565]},
			"sacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"sacute",
			:boundingbox=>[80,
			-15,
			513,
			672]},
			"idieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"idieresis",
			:boundingbox=>[95,
			0,
			505,
			620]},
			"Ocircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ocircumflex",
			:boundingbox=>[43,
			-18,
			557,
			787]},
			"Ugrave"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ugrave",
			:boundingbox=>[17,
			-18,
			583,
			805]},
			"Delta"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Delta",
			:boundingbox=>[6,
			0,
			598,
			688]},
			"thorn"=>{:charcode=>-1,
			:wx=>600,
			:name=>"thorn",
			:boundingbox=>[-6,
			-157,
			555,
			629]},
			"twosuperior"=>{:charcode=>-1,
			:wx=>600,
			:name=>"twosuperior",
			:boundingbox=>[177,
			249,
			424,
			622]},
			"Odieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Odieresis",
			:boundingbox=>[43,
			-18,
			557,
			753]},
			"mu"=>{:charcode=>-1,
			:wx=>600,
			:name=>"mu",
			:boundingbox=>[21,
			-157,
			562,
			426]},
			"igrave"=>{:charcode=>-1,
			:wx=>600,
			:name=>"igrave",
			:boundingbox=>[95,
			0,
			505,
			672]},
			"ohungarumlaut"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ohungarumlaut",
			:boundingbox=>[62,
			-15,
			580,
			672]},
			"Eogonek"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Eogonek",
			:boundingbox=>[53,
			-172,
			561,
			562]},
			"dcroat"=>{:charcode=>-1,
			:wx=>600,
			:name=>"dcroat",
			:boundingbox=>[45,
			-15,
			591,
			629]},
			"threequarters"=>{:charcode=>-1,
			:wx=>600,
			:name=>"threequarters",
			:boundingbox=>[8,
			-56,
			593,
			666]},
			"Scedilla"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Scedilla",
			:boundingbox=>[72,
			-151,
			529,
			580]},
			"lcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"lcaron",
			:boundingbox=>[95,
			0,
			533,
			629]},
			"Kcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Kcommaaccent",
			:boundingbox=>[38,
			-250,
			582,
			562]},
			"Lacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Lacute",
			:boundingbox=>[47,
			0,
			554,
			805]},
			"trademark"=>{:charcode=>-1,
			:wx=>600,
			:name=>"trademark",
			:boundingbox=>[-23,
			263,
			623,
			562]},
			"edotaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"edotaccent",
			:boundingbox=>[66,
			-15,
			548,
			620]},
			"Igrave"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Igrave",
			:boundingbox=>[96,
			0,
			504,
			805]},
			"Imacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Imacron",
			:boundingbox=>[96,
			0,
			504,
			698]},
			"Lcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Lcaron",
			:boundingbox=>[47,
			0,
			554,
			562]},
			"onehalf"=>{:charcode=>-1,
			:wx=>600,
			:name=>"onehalf",
			:boundingbox=>[0,
			-57,
			611,
			665]},
			"lessequal"=>{:charcode=>-1,
			:wx=>600,
			:name=>"lessequal",
			:boundingbox=>[98,
			0,
			502,
			710]},
			"ocircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ocircumflex",
			:boundingbox=>[62,
			-15,
			538,
			654]},
			"ntilde"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ntilde",
			:boundingbox=>[26,
			0,
			575,
			606]},
			"Uhungarumlaut"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Uhungarumlaut",
			:boundingbox=>[17,
			-18,
			590,
			805]},
			"Eacute"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Eacute",
			:boundingbox=>[53,
			0,
			550,
			805]},
			"emacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"emacron",
			:boundingbox=>[66,
			-15,
			548,
			565]},
			"gbreve"=>{:charcode=>-1,
			:wx=>600,
			:name=>"gbreve",
			:boundingbox=>[45,
			-157,
			566,
			609]},
			"onequarter"=>{:charcode=>-1,
			:wx=>600,
			:name=>"onequarter",
			:boundingbox=>[0,
			-57,
			600,
			665]},
			"Scaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Scaron",
			:boundingbox=>[72,
			-20,
			529,
			802]},
			"Scommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Scommaaccent",
			:boundingbox=>[72,
			-250,
			529,
			580]},
			"Ohungarumlaut"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ohungarumlaut",
			:boundingbox=>[43,
			-18,
			580,
			805]},
			"degree"=>{:charcode=>-1,
			:wx=>600,
			:name=>"degree",
			:boundingbox=>[123,
			269,
			477,
			622]},
			"ograve"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ograve",
			:boundingbox=>[62,
			-15,
			538,
			672]},
			"Ccaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ccaron",
			:boundingbox=>[41,
			-18,
			540,
			802]},
			"ugrave"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ugrave",
			:boundingbox=>[21,
			-15,
			562,
			672]},
			"radical"=>{:charcode=>-1,
			:wx=>600,
			:name=>"radical",
			:boundingbox=>[3,
			-15,
			597,
			792]},
			"Dcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Dcaron",
			:boundingbox=>[43,
			0,
			574,
			802]},
			"rcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"rcommaaccent",
			:boundingbox=>[60,
			-250,
			559,
			441]},
			"Ntilde"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ntilde",
			:boundingbox=>[7,
			-13,
			593,
			729]},
			"otilde"=>{:charcode=>-1,
			:wx=>600,
			:name=>"otilde",
			:boundingbox=>[62,
			-15,
			538,
			606]},
			"Rcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Rcommaaccent",
			:boundingbox=>[38,
			-250,
			588,
			562]},
			"Lcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Lcommaaccent",
			:boundingbox=>[47,
			-250,
			554,
			562]},
			"Atilde"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Atilde",
			:boundingbox=>[3,
			0,
			597,
			729]},
			"Aogonek"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Aogonek",
			:boundingbox=>[3,
			-172,
			608,
			562]},
			"Aring"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Aring",
			:boundingbox=>[3,
			0,
			597,
			750]},
			"Otilde"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Otilde",
			:boundingbox=>[43,
			-18,
			557,
			729]},
			"zdotaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"zdotaccent",
			:boundingbox=>[99,
			0,
			502,
			620]},
			"Ecaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Ecaron",
			:boundingbox=>[53,
			0,
			550,
			802]},
			"Iogonek"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Iogonek",
			:boundingbox=>[96,
			-172,
			504,
			562]},
			"kcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"kcommaaccent",
			:boundingbox=>[43,
			-250,
			580,
			629]},
			"minus"=>{:charcode=>-1,
			:wx=>600,
			:name=>"minus",
			:boundingbox=>[80,
			232,
			520,
			283]},
			"Icircumflex"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Icircumflex",
			:boundingbox=>[96,
			0,
			504,
			787]},
			"ncaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ncaron",
			:boundingbox=>[26,
			0,
			575,
			669]},
			"tcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"tcommaaccent",
			:boundingbox=>[87,
			-250,
			530,
			561]},
			"logicalnot"=>{:charcode=>-1,
			:wx=>600,
			:name=>"logicalnot",
			:boundingbox=>[87,
			108,
			513,
			369]},
			"odieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"odieresis",
			:boundingbox=>[62,
			-15,
			538,
			620]},
			"udieresis"=>{:charcode=>-1,
			:wx=>600,
			:name=>"udieresis",
			:boundingbox=>[21,
			-15,
			562,
			620]},
			"notequal"=>{:charcode=>-1,
			:wx=>600,
			:name=>"notequal",
			:boundingbox=>[15,
			-16,
			540,
			529]},
			"gcommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"gcommaaccent",
			:boundingbox=>[45,
			-157,
			566,
			708]},
			"eth"=>{:charcode=>-1,
			:wx=>600,
			:name=>"eth",
			:boundingbox=>[62,
			-15,
			538,
			629]},
			"zcaron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"zcaron",
			:boundingbox=>[99,
			0,
			502,
			669]},
			"ncommaaccent"=>{:charcode=>-1,
			:wx=>600,
			:name=>"ncommaaccent",
			:boundingbox=>[26,
			-250,
			575,
			441]},
			"onesuperior"=>{:charcode=>-1,
			:wx=>600,
			:name=>"onesuperior",
			:boundingbox=>[172,
			249,
			428,
			622]},
			"imacron"=>{:charcode=>-1,
			:wx=>600,
			:name=>"imacron",
			:boundingbox=>[95,
			0,
			505,
			565]},
			"Euro"=>{:charcode=>-1,
			:wx=>600,
			:name=>"Euro",
			:boundingbox=>[0,
			0,
			0,
			0]}}
	end
end