module CombinePDF
	class PDFWriter < Hash
		# with thanks to Jan Krutisch, the creator of the afm gem.
		COURIER_BOLDOBLIQUE_METRICS = 
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
			 :boundingbox=>[215,
			 -15,
			 495,
			 572]},
			 "quotedbl"=>{:charcode=>34,
			 :wx=>600,
			 :name=>"quotedbl",
			 :boundingbox=>[211,
			 277,
			 585,
			 562]},
			 "numbersign"=>{:charcode=>35,
			 :wx=>600,
			 :name=>"numbersign",
			 :boundingbox=>[88,
			 -45,
			 641,
			 651]},
			 "dollar"=>{:charcode=>36,
			 :wx=>600,
			 :name=>"dollar",
			 :boundingbox=>[87,
			 -126,
			 630,
			 666]},
			 "percent"=>{:charcode=>37,
			 :wx=>600,
			 :name=>"percent",
			 :boundingbox=>[101,
			 -15,
			 625,
			 616]},
			 "ampersand"=>{:charcode=>38,
			 :wx=>600,
			 :name=>"ampersand",
			 :boundingbox=>[61,
			 -15,
			 595,
			 543]},
			 "quoteright"=>{:charcode=>39,
			 :wx=>600,
			 :name=>"quoteright",
			 :boundingbox=>[229,
			 277,
			 543,
			 562]},
			 "parenleft"=>{:charcode=>40,
			 :wx=>600,
			 :name=>"parenleft",
			 :boundingbox=>[265,
			 -102,
			 592,
			 616]},
			 "parenright"=>{:charcode=>41,
			 :wx=>600,
			 :name=>"parenright",
			 :boundingbox=>[117,
			 -102,
			 444,
			 616]},
			 "asterisk"=>{:charcode=>42,
			 :wx=>600,
			 :name=>"asterisk",
			 :boundingbox=>[179,
			 219,
			 598,
			 601]},
			 "plus"=>{:charcode=>43,
			 :wx=>600,
			 :name=>"plus",
			 :boundingbox=>[114,
			 39,
			 596,
			 478]},
			 "comma"=>{:charcode=>44,
			 :wx=>600,
			 :name=>"comma",
			 :boundingbox=>[99,
			 -111,
			 430,
			 174]},
			 "hyphen"=>{:charcode=>45,
			 :wx=>600,
			 :name=>"hyphen",
			 :boundingbox=>[143,
			 203,
			 567,
			 313]},
			 "period"=>{:charcode=>46,
			 :wx=>600,
			 :name=>"period",
			 :boundingbox=>[206,
			 -15,
			 427,
			 171]},
			 "slash"=>{:charcode=>47,
			 :wx=>600,
			 :name=>"slash",
			 :boundingbox=>[90,
			 -77,
			 626,
			 626]},
			 "zero"=>{:charcode=>48,
			 :wx=>600,
			 :name=>"zero",
			 :boundingbox=>[135,
			 -15,
			 593,
			 616]},
			 "one"=>{:charcode=>49,
			 :wx=>600,
			 :name=>"one",
			 :boundingbox=>[93,
			 0,
			 562,
			 616]},
			 "two"=>{:charcode=>50,
			 :wx=>600,
			 :name=>"two",
			 :boundingbox=>[61,
			 0,
			 594,
			 616]},
			 "three"=>{:charcode=>51,
			 :wx=>600,
			 :name=>"three",
			 :boundingbox=>[71,
			 -15,
			 571,
			 616]},
			 "four"=>{:charcode=>52,
			 :wx=>600,
			 :name=>"four",
			 :boundingbox=>[81,
			 0,
			 559,
			 616]},
			 "five"=>{:charcode=>53,
			 :wx=>600,
			 :name=>"five",
			 :boundingbox=>[77,
			 -15,
			 621,
			 601]},
			 "six"=>{:charcode=>54,
			 :wx=>600,
			 :name=>"six",
			 :boundingbox=>[135,
			 -15,
			 652,
			 616]},
			 "seven"=>{:charcode=>55,
			 :wx=>600,
			 :name=>"seven",
			 :boundingbox=>[147,
			 0,
			 622,
			 601]},
			 "eight"=>{:charcode=>56,
			 :wx=>600,
			 :name=>"eight",
			 :boundingbox=>[115,
			 -15,
			 604,
			 616]},
			 "nine"=>{:charcode=>57,
			 :wx=>600,
			 :name=>"nine",
			 :boundingbox=>[75,
			 -15,
			 592,
			 616]},
			 "colon"=>{:charcode=>58,
			 :wx=>600,
			 :name=>"colon",
			 :boundingbox=>[205,
			 -15,
			 480,
			 425]},
			 "semicolon"=>{:charcode=>59,
			 :wx=>600,
			 :name=>"semicolon",
			 :boundingbox=>[99,
			 -111,
			 481,
			 425]},
			 "less"=>{:charcode=>60,
			 :wx=>600,
			 :name=>"less",
			 :boundingbox=>[120,
			 15,
			 613,
			 501]},
			 "equal"=>{:charcode=>61,
			 :wx=>600,
			 :name=>"equal",
			 :boundingbox=>[96,
			 118,
			 614,
			 398]},
			 "greater"=>{:charcode=>62,
			 :wx=>600,
			 :name=>"greater",
			 :boundingbox=>[97,
			 15,
			 589,
			 501]},
			 "question"=>{:charcode=>63,
			 :wx=>600,
			 :name=>"question",
			 :boundingbox=>[183,
			 -14,
			 592,
			 580]},
			 "at"=>{:charcode=>64,
			 :wx=>600,
			 :name=>"at",
			 :boundingbox=>[65,
			 -15,
			 642,
			 616]},
			 "A"=>{:charcode=>65,
			 :wx=>600,
			 :name=>"A",
			 :boundingbox=>[-9,
			 0,
			 632,
			 562]},
			 "B"=>{:charcode=>66,
			 :wx=>600,
			 :name=>"B",
			 :boundingbox=>[30,
			 0,
			 630,
			 562]},
			 "C"=>{:charcode=>67,
			 :wx=>600,
			 :name=>"C",
			 :boundingbox=>[74,
			 -18,
			 675,
			 580]},
			 "D"=>{:charcode=>68,
			 :wx=>600,
			 :name=>"D",
			 :boundingbox=>[30,
			 0,
			 664,
			 562]},
			 "E"=>{:charcode=>69,
			 :wx=>600,
			 :name=>"E",
			 :boundingbox=>[25,
			 0,
			 670,
			 562]},
			 "F"=>{:charcode=>70,
			 :wx=>600,
			 :name=>"F",
			 :boundingbox=>[39,
			 0,
			 684,
			 562]},
			 "G"=>{:charcode=>71,
			 :wx=>600,
			 :name=>"G",
			 :boundingbox=>[74,
			 -18,
			 675,
			 580]},
			 "H"=>{:charcode=>72,
			 :wx=>600,
			 :name=>"H",
			 :boundingbox=>[20,
			 0,
			 700,
			 562]},
			 "I"=>{:charcode=>73,
			 :wx=>600,
			 :name=>"I",
			 :boundingbox=>[77,
			 0,
			 643,
			 562]},
			 "J"=>{:charcode=>74,
			 :wx=>600,
			 :name=>"J",
			 :boundingbox=>[58,
			 -18,
			 721,
			 562]},
			 "K"=>{:charcode=>75,
			 :wx=>600,
			 :name=>"K",
			 :boundingbox=>[21,
			 0,
			 692,
			 562]},
			 "L"=>{:charcode=>76,
			 :wx=>600,
			 :name=>"L",
			 :boundingbox=>[39,
			 0,
			 636,
			 562]},
			 "M"=>{:charcode=>77,
			 :wx=>600,
			 :name=>"M",
			 :boundingbox=>[-2,
			 0,
			 722,
			 562]},
			 "N"=>{:charcode=>78,
			 :wx=>600,
			 :name=>"N",
			 :boundingbox=>[8,
			 -12,
			 730,
			 562]},
			 "O"=>{:charcode=>79,
			 :wx=>600,
			 :name=>"O",
			 :boundingbox=>[74,
			 -18,
			 645,
			 580]},
			 "P"=>{:charcode=>80,
			 :wx=>600,
			 :name=>"P",
			 :boundingbox=>[48,
			 0,
			 643,
			 562]},
			 "Q"=>{:charcode=>81,
			 :wx=>600,
			 :name=>"Q",
			 :boundingbox=>[83,
			 -138,
			 636,
			 580]},
			 "R"=>{:charcode=>82,
			 :wx=>600,
			 :name=>"R",
			 :boundingbox=>[24,
			 0,
			 617,
			 562]},
			 "S"=>{:charcode=>83,
			 :wx=>600,
			 :name=>"S",
			 :boundingbox=>[54,
			 -22,
			 673,
			 582]},
			 "T"=>{:charcode=>84,
			 :wx=>600,
			 :name=>"T",
			 :boundingbox=>[86,
			 0,
			 679,
			 562]},
			 "U"=>{:charcode=>85,
			 :wx=>600,
			 :name=>"U",
			 :boundingbox=>[101,
			 -18,
			 716,
			 562]},
			 "V"=>{:charcode=>86,
			 :wx=>600,
			 :name=>"V",
			 :boundingbox=>[84,
			 0,
			 733,
			 562]},
			 "W"=>{:charcode=>87,
			 :wx=>600,
			 :name=>"W",
			 :boundingbox=>[79,
			 0,
			 738,
			 562]},
			 "X"=>{:charcode=>88,
			 :wx=>600,
			 :name=>"X",
			 :boundingbox=>[12,
			 0,
			 690,
			 562]},
			 "Y"=>{:charcode=>89,
			 :wx=>600,
			 :name=>"Y",
			 :boundingbox=>[109,
			 0,
			 709,
			 562]},
			 "Z"=>{:charcode=>90,
			 :wx=>600,
			 :name=>"Z",
			 :boundingbox=>[62,
			 0,
			 637,
			 562]},
			 "bracketleft"=>{:charcode=>91,
			 :wx=>600,
			 :name=>"bracketleft",
			 :boundingbox=>[223,
			 -102,
			 606,
			 616]},
			 "backslash"=>{:charcode=>92,
			 :wx=>600,
			 :name=>"backslash",
			 :boundingbox=>[222,
			 -77,
			 496,
			 626]},
			 "bracketright"=>{:charcode=>93,
			 :wx=>600,
			 :name=>"bracketright",
			 :boundingbox=>[103,
			 -102,
			 486,
			 616]},
			 "asciicircum"=>{:charcode=>94,
			 :wx=>600,
			 :name=>"asciicircum",
			 :boundingbox=>[171,
			 250,
			 556,
			 616]},
			 "underscore"=>{:charcode=>95,
			 :wx=>600,
			 :name=>"underscore",
			 :boundingbox=>[-27,
			 -125,
			 585,
			 -75]},
			 "quoteleft"=>{:charcode=>96,
			 :wx=>600,
			 :name=>"quoteleft",
			 :boundingbox=>[297,
			 277,
			 487,
			 562]},
			 "a"=>{:charcode=>97,
			 :wx=>600,
			 :name=>"a",
			 :boundingbox=>[61,
			 -15,
			 593,
			 454]},
			 "b"=>{:charcode=>98,
			 :wx=>600,
			 :name=>"b",
			 :boundingbox=>[13,
			 -15,
			 636,
			 626]},
			 "c"=>{:charcode=>99,
			 :wx=>600,
			 :name=>"c",
			 :boundingbox=>[81,
			 -15,
			 631,
			 459]},
			 "d"=>{:charcode=>100,
			 :wx=>600,
			 :name=>"d",
			 :boundingbox=>[60,
			 -15,
			 645,
			 626]},
			 "e"=>{:charcode=>101,
			 :wx=>600,
			 :name=>"e",
			 :boundingbox=>[81,
			 -15,
			 605,
			 454]},
			 "f"=>{:charcode=>102,
			 :wx=>600,
			 :name=>"f",
			 :boundingbox=>[83,
			 0,
			 677,
			 626]},
			 "g"=>{:charcode=>103,
			 :wx=>600,
			 :name=>"g",
			 :boundingbox=>[40,
			 -146,
			 674,
			 454]},
			 "h"=>{:charcode=>104,
			 :wx=>600,
			 :name=>"h",
			 :boundingbox=>[18,
			 0,
			 615,
			 626]},
			 "i"=>{:charcode=>105,
			 :wx=>600,
			 :name=>"i",
			 :boundingbox=>[77,
			 0,
			 546,
			 658]},
			 "j"=>{:charcode=>106,
			 :wx=>600,
			 :name=>"j",
			 :boundingbox=>[36,
			 -146,
			 580,
			 658]},
			 "k"=>{:charcode=>107,
			 :wx=>600,
			 :name=>"k",
			 :boundingbox=>[33,
			 0,
			 643,
			 626]},
			 "l"=>{:charcode=>108,
			 :wx=>600,
			 :name=>"l",
			 :boundingbox=>[77,
			 0,
			 546,
			 626]},
			 "m"=>{:charcode=>109,
			 :wx=>600,
			 :name=>"m",
			 :boundingbox=>[-22,
			 0,
			 649,
			 454]},
			 "n"=>{:charcode=>110,
			 :wx=>600,
			 :name=>"n",
			 :boundingbox=>[18,
			 0,
			 615,
			 454]},
			 "o"=>{:charcode=>111,
			 :wx=>600,
			 :name=>"o",
			 :boundingbox=>[71,
			 -15,
			 622,
			 454]},
			 "p"=>{:charcode=>112,
			 :wx=>600,
			 :name=>"p",
			 :boundingbox=>[-32,
			 -142,
			 622,
			 454]},
			 "q"=>{:charcode=>113,
			 :wx=>600,
			 :name=>"q",
			 :boundingbox=>[60,
			 -142,
			 685,
			 454]},
			 "r"=>{:charcode=>114,
			 :wx=>600,
			 :name=>"r",
			 :boundingbox=>[47,
			 0,
			 655,
			 454]},
			 "s"=>{:charcode=>115,
			 :wx=>600,
			 :name=>"s",
			 :boundingbox=>[66,
			 -17,
			 608,
			 459]},
			 "t"=>{:charcode=>116,
			 :wx=>600,
			 :name=>"t",
			 :boundingbox=>[118,
			 -15,
			 567,
			 562]},
			 "u"=>{:charcode=>117,
			 :wx=>600,
			 :name=>"u",
			 :boundingbox=>[70,
			 -15,
			 592,
			 439]},
			 "v"=>{:charcode=>118,
			 :wx=>600,
			 :name=>"v",
			 :boundingbox=>[70,
			 0,
			 695,
			 439]},
			 "w"=>{:charcode=>119,
			 :wx=>600,
			 :name=>"w",
			 :boundingbox=>[53,
			 0,
			 712,
			 439]},
			 "x"=>{:charcode=>120,
			 :wx=>600,
			 :name=>"x",
			 :boundingbox=>[6,
			 0,
			 671,
			 439]},
			 "y"=>{:charcode=>121,
			 :wx=>600,
			 :name=>"y",
			 :boundingbox=>[-21,
			 -142,
			 695,
			 439]},
			 "z"=>{:charcode=>122,
			 :wx=>600,
			 :name=>"z",
			 :boundingbox=>[81,
			 0,
			 614,
			 439]},
			 "braceleft"=>{:charcode=>123,
			 :wx=>600,
			 :name=>"braceleft",
			 :boundingbox=>[203,
			 -102,
			 595,
			 616]},
			 "bar"=>{:charcode=>124,
			 :wx=>600,
			 :name=>"bar",
			 :boundingbox=>[201,
			 -250,
			 505,
			 750]},
			 "braceright"=>{:charcode=>125,
			 :wx=>600,
			 :name=>"braceright",
			 :boundingbox=>[114,
			 -102,
			 506,
			 616]},
			 "asciitilde"=>{:charcode=>126,
			 :wx=>600,
			 :name=>"asciitilde",
			 :boundingbox=>[120,
			 153,
			 590,
			 356]},
			 "exclamdown"=>{:charcode=>161,
			 :wx=>600,
			 :name=>"exclamdown",
			 :boundingbox=>[196,
			 -146,
			 477,
			 449]},
			 "cent"=>{:charcode=>162,
			 :wx=>600,
			 :name=>"cent",
			 :boundingbox=>[121,
			 -49,
			 605,
			 614]},
			 "sterling"=>{:charcode=>163,
			 :wx=>600,
			 :name=>"sterling",
			 :boundingbox=>[106,
			 -28,
			 650,
			 611]},
			 "fraction"=>{:charcode=>164,
			 :wx=>600,
			 :name=>"fraction",
			 :boundingbox=>[22,
			 -60,
			 708,
			 661]},
			 "yen"=>{:charcode=>165,
			 :wx=>600,
			 :name=>"yen",
			 :boundingbox=>[98,
			 0,
			 710,
			 562]},
			 "florin"=>{:charcode=>166,
			 :wx=>600,
			 :name=>"florin",
			 :boundingbox=>[-57,
			 -131,
			 702,
			 616]},
			 "section"=>{:charcode=>167,
			 :wx=>600,
			 :name=>"section",
			 :boundingbox=>[74,
			 -70,
			 620,
			 580]},
			 "currency"=>{:charcode=>168,
			 :wx=>600,
			 :name=>"currency",
			 :boundingbox=>[77,
			 49,
			 644,
			 517]},
			 "quotesingle"=>{:charcode=>169,
			 :wx=>600,
			 :name=>"quotesingle",
			 :boundingbox=>[303,
			 277,
			 493,
			 562]},
			 "quotedblleft"=>{:charcode=>170,
			 :wx=>600,
			 :name=>"quotedblleft",
			 :boundingbox=>[190,
			 277,
			 594,
			 562]},
			 "guillemotleft"=>{:charcode=>171,
			 :wx=>600,
			 :name=>"guillemotleft",
			 :boundingbox=>[62,
			 70,
			 639,
			 446]},
			 "guilsinglleft"=>{:charcode=>172,
			 :wx=>600,
			 :name=>"guilsinglleft",
			 :boundingbox=>[195,
			 70,
			 545,
			 446]},
			 "guilsinglright"=>{:charcode=>173,
			 :wx=>600,
			 :name=>"guilsinglright",
			 :boundingbox=>[165,
			 70,
			 514,
			 446]},
			 "fi"=>{:charcode=>174,
			 :wx=>600,
			 :name=>"fi",
			 :boundingbox=>[12,
			 0,
			 644,
			 626]},
			 "fl"=>{:charcode=>175,
			 :wx=>600,
			 :name=>"fl",
			 :boundingbox=>[12,
			 0,
			 644,
			 626]},
			 "endash"=>{:charcode=>177,
			 :wx=>600,
			 :name=>"endash",
			 :boundingbox=>[108,
			 203,
			 602,
			 313]},
			 "dagger"=>{:charcode=>178,
			 :wx=>600,
			 :name=>"dagger",
			 :boundingbox=>[175,
			 -70,
			 586,
			 580]},
			 "daggerdbl"=>{:charcode=>179,
			 :wx=>600,
			 :name=>"daggerdbl",
			 :boundingbox=>[121,
			 -70,
			 587,
			 580]},
			 "periodcentered"=>{:charcode=>180,
			 :wx=>600,
			 :name=>"periodcentered",
			 :boundingbox=>[248,
			 165,
			 461,
			 351]},
			 "paragraph"=>{:charcode=>182,
			 :wx=>600,
			 :name=>"paragraph",
			 :boundingbox=>[61,
			 -70,
			 700,
			 580]},
			 "bullet"=>{:charcode=>183,
			 :wx=>600,
			 :name=>"bullet",
			 :boundingbox=>[196,
			 132,
			 523,
			 430]},
			 "quotesinglbase"=>{:charcode=>184,
			 :wx=>600,
			 :name=>"quotesinglbase",
			 :boundingbox=>[144,
			 -142,
			 458,
			 143]},
			 "quotedblbase"=>{:charcode=>185,
			 :wx=>600,
			 :name=>"quotedblbase",
			 :boundingbox=>[34,
			 -142,
			 560,
			 143]},
			 "quotedblright"=>{:charcode=>186,
			 :wx=>600,
			 :name=>"quotedblright",
			 :boundingbox=>[119,
			 277,
			 645,
			 562]},
			 "guillemotright"=>{:charcode=>187,
			 :wx=>600,
			 :name=>"guillemotright",
			 :boundingbox=>[71,
			 70,
			 647,
			 446]},
			 "ellipsis"=>{:charcode=>188,
			 :wx=>600,
			 :name=>"ellipsis",
			 :boundingbox=>[35,
			 -15,
			 587,
			 116]},
			 "perthousand"=>{:charcode=>189,
			 :wx=>600,
			 :name=>"perthousand",
			 :boundingbox=>[-45,
			 -15,
			 743,
			 616]},
			 "questiondown"=>{:charcode=>191,
			 :wx=>600,
			 :name=>"questiondown",
			 :boundingbox=>[100,
			 -146,
			 509,
			 449]},
			 "grave"=>{:charcode=>193,
			 :wx=>600,
			 :name=>"grave",
			 :boundingbox=>[272,
			 508,
			 503,
			 661]},
			 "acute"=>{:charcode=>194,
			 :wx=>600,
			 :name=>"acute",
			 :boundingbox=>[312,
			 508,
			 609,
			 661]},
			 "circumflex"=>{:charcode=>195,
			 :wx=>600,
			 :name=>"circumflex",
			 :boundingbox=>[212,
			 483,
			 607,
			 657]},
			 "tilde"=>{:charcode=>196,
			 :wx=>600,
			 :name=>"tilde",
			 :boundingbox=>[199,
			 493,
			 643,
			 636]},
			 "macron"=>{:charcode=>197,
			 :wx=>600,
			 :name=>"macron",
			 :boundingbox=>[195,
			 505,
			 637,
			 585]},
			 "breve"=>{:charcode=>198,
			 :wx=>600,
			 :name=>"breve",
			 :boundingbox=>[217,
			 468,
			 652,
			 631]},
			 "dotaccent"=>{:charcode=>199,
			 :wx=>600,
			 :name=>"dotaccent",
			 :boundingbox=>[348,
			 498,
			 493,
			 638]},
			 "dieresis"=>{:charcode=>200,
			 :wx=>600,
			 :name=>"dieresis",
			 :boundingbox=>[246,
			 498,
			 595,
			 638]},
			 "ring"=>{:charcode=>202,
			 :wx=>600,
			 :name=>"ring",
			 :boundingbox=>[319,
			 481,
			 528,
			 678]},
			 "cedilla"=>{:charcode=>203,
			 :wx=>600,
			 :name=>"cedilla",
			 :boundingbox=>[168,
			 -206,
			 368,
			 0]},
			 "hungarumlaut"=>{:charcode=>205,
			 :wx=>600,
			 :name=>"hungarumlaut",
			 :boundingbox=>[171,
			 488,
			 729,
			 661]},
			 "ogonek"=>{:charcode=>206,
			 :wx=>600,
			 :name=>"ogonek",
			 :boundingbox=>[143,
			 -199,
			 367,
			 0]},
			 "caron"=>{:charcode=>207,
			 :wx=>600,
			 :name=>"caron",
			 :boundingbox=>[238,
			 493,
			 633,
			 667]},
			 "emdash"=>{:charcode=>208,
			 :wx=>600,
			 :name=>"emdash",
			 :boundingbox=>[33,
			 203,
			 677,
			 313]},
			 "AE"=>{:charcode=>225,
			 :wx=>600,
			 :name=>"AE",
			 :boundingbox=>[-29,
			 0,
			 708,
			 562]},
			 "ordfeminine"=>{:charcode=>227,
			 :wx=>600,
			 :name=>"ordfeminine",
			 :boundingbox=>[188,
			 196,
			 526,
			 580]},
			 "Lslash"=>{:charcode=>232,
			 :wx=>600,
			 :name=>"Lslash",
			 :boundingbox=>[39,
			 0,
			 636,
			 562]},
			 "Oslash"=>{:charcode=>233,
			 :wx=>600,
			 :name=>"Oslash",
			 :boundingbox=>[48,
			 -22,
			 673,
			 584]},
			 "OE"=>{:charcode=>234,
			 :wx=>600,
			 :name=>"OE",
			 :boundingbox=>[26,
			 0,
			 701,
			 562]},
			 "ordmasculine"=>{:charcode=>235,
			 :wx=>600,
			 :name=>"ordmasculine",
			 :boundingbox=>[188,
			 196,
			 543,
			 580]},
			 "ae"=>{:charcode=>241,
			 :wx=>600,
			 :name=>"ae",
			 :boundingbox=>[21,
			 -15,
			 652,
			 454]},
			 "dotlessi"=>{:charcode=>245,
			 :wx=>600,
			 :name=>"dotlessi",
			 :boundingbox=>[77,
			 0,
			 546,
			 439]},
			 "lslash"=>{:charcode=>248,
			 :wx=>600,
			 :name=>"lslash",
			 :boundingbox=>[77,
			 0,
			 587,
			 626]},
			 "oslash"=>{:charcode=>249,
			 :wx=>600,
			 :name=>"oslash",
			 :boundingbox=>[54,
			 -24,
			 638,
			 463]},
			 "oe"=>{:charcode=>250,
			 :wx=>600,
			 :name=>"oe",
			 :boundingbox=>[18,
			 -15,
			 662,
			 454]},
			 "germandbls"=>{:charcode=>251,
			 :wx=>600,
			 :name=>"germandbls",
			 :boundingbox=>[22,
			 -15,
			 629,
			 626]},
			 "Idieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Idieresis",
			 :boundingbox=>[77,
			 0,
			 643,
			 761]},
			 "eacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"eacute",
			 :boundingbox=>[81,
			 -15,
			 609,
			 661]},
			 "abreve"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"abreve",
			 :boundingbox=>[61,
			 -15,
			 658,
			 661]},
			 "uhungarumlaut"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"uhungarumlaut",
			 :boundingbox=>[70,
			 -15,
			 769,
			 661]},
			 "ecaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ecaron",
			 :boundingbox=>[81,
			 -15,
			 633,
			 667]},
			 "Ydieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ydieresis",
			 :boundingbox=>[109,
			 0,
			 709,
			 761]},
			 "divide"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"divide",
			 :boundingbox=>[114,
			 16,
			 596,
			 500]},
			 "Yacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Yacute",
			 :boundingbox=>[109,
			 0,
			 709,
			 784]},
			 "Acircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Acircumflex",
			 :boundingbox=>[-9,
			 0,
			 632,
			 780]},
			 "aacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"aacute",
			 :boundingbox=>[61,
			 -15,
			 609,
			 661]},
			 "Ucircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ucircumflex",
			 :boundingbox=>[101,
			 -18,
			 716,
			 780]},
			 "yacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"yacute",
			 :boundingbox=>[-21,
			 -142,
			 695,
			 661]},
			 "scommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"scommaaccent",
			 :boundingbox=>[66,
			 -250,
			 608,
			 459]},
			 "ecircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ecircumflex",
			 :boundingbox=>[81,
			 -15,
			 607,
			 657]},
			 "Uring"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Uring",
			 :boundingbox=>[101,
			 -18,
			 716,
			 801]},
			 "Udieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Udieresis",
			 :boundingbox=>[101,
			 -18,
			 716,
			 761]},
			 "aogonek"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"aogonek",
			 :boundingbox=>[61,
			 -199,
			 593,
			 454]},
			 "Uacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Uacute",
			 :boundingbox=>[101,
			 -18,
			 716,
			 784]},
			 "uogonek"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"uogonek",
			 :boundingbox=>[70,
			 -199,
			 592,
			 439]},
			 "Edieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Edieresis",
			 :boundingbox=>[25,
			 0,
			 670,
			 761]},
			 "Dcroat"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Dcroat",
			 :boundingbox=>[30,
			 0,
			 664,
			 562]},
			 "commaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"commaaccent",
			 :boundingbox=>[151,
			 -250,
			 385,
			 -57]},
			 "copyright"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"copyright",
			 :boundingbox=>[53,
			 -18,
			 667,
			 580]},
			 "Emacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Emacron",
			 :boundingbox=>[25,
			 0,
			 670,
			 708]},
			 "ccaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ccaron",
			 :boundingbox=>[81,
			 -15,
			 633,
			 667]},
			 "aring"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"aring",
			 :boundingbox=>[61,
			 -15,
			 593,
			 678]},
			 "Ncommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ncommaaccent",
			 :boundingbox=>[8,
			 -250,
			 730,
			 562]},
			 "lacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"lacute",
			 :boundingbox=>[77,
			 0,
			 639,
			 801]},
			 "agrave"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"agrave",
			 :boundingbox=>[61,
			 -15,
			 593,
			 661]},
			 "Tcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Tcommaaccent",
			 :boundingbox=>[86,
			 -250,
			 679,
			 562]},
			 "Cacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Cacute",
			 :boundingbox=>[74,
			 -18,
			 675,
			 784]},
			 "atilde"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"atilde",
			 :boundingbox=>[61,
			 -15,
			 643,
			 636]},
			 "Edotaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Edotaccent",
			 :boundingbox=>[25,
			 0,
			 670,
			 761]},
			 "scaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"scaron",
			 :boundingbox=>[66,
			 -17,
			 633,
			 667]},
			 "scedilla"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"scedilla",
			 :boundingbox=>[66,
			 -206,
			 608,
			 459]},
			 "iacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"iacute",
			 :boundingbox=>[77,
			 0,
			 609,
			 661]},
			 "lozenge"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"lozenge",
			 :boundingbox=>[145,
			 0,
			 614,
			 740]},
			 "Rcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Rcaron",
			 :boundingbox=>[24,
			 0,
			 659,
			 790]},
			 "Gcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Gcommaaccent",
			 :boundingbox=>[74,
			 -250,
			 675,
			 580]},
			 "ucircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ucircumflex",
			 :boundingbox=>[70,
			 -15,
			 597,
			 657]},
			 "acircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"acircumflex",
			 :boundingbox=>[61,
			 -15,
			 607,
			 657]},
			 "Amacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Amacron",
			 :boundingbox=>[-9,
			 0,
			 633,
			 708]},
			 "rcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"rcaron",
			 :boundingbox=>[47,
			 0,
			 655,
			 667]},
			 "ccedilla"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ccedilla",
			 :boundingbox=>[81,
			 -206,
			 631,
			 459]},
			 "Zdotaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Zdotaccent",
			 :boundingbox=>[62,
			 0,
			 637,
			 761]},
			 "Thorn"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Thorn",
			 :boundingbox=>[48,
			 0,
			 620,
			 562]},
			 "Omacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Omacron",
			 :boundingbox=>[74,
			 -18,
			 663,
			 708]},
			 "Racute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Racute",
			 :boundingbox=>[24,
			 0,
			 665,
			 784]},
			 "Sacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Sacute",
			 :boundingbox=>[54,
			 -22,
			 673,
			 784]},
			 "dcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"dcaron",
			 :boundingbox=>[60,
			 -15,
			 861,
			 626]},
			 "Umacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Umacron",
			 :boundingbox=>[101,
			 -18,
			 716,
			 708]},
			 "uring"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"uring",
			 :boundingbox=>[70,
			 -15,
			 592,
			 678]},
			 "threesuperior"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"threesuperior",
			 :boundingbox=>[193,
			 222,
			 526,
			 616]},
			 "Ograve"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ograve",
			 :boundingbox=>[74,
			 -18,
			 645,
			 784]},
			 "Agrave"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Agrave",
			 :boundingbox=>[-9,
			 0,
			 632,
			 784]},
			 "Abreve"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Abreve",
			 :boundingbox=>[-9,
			 0,
			 684,
			 784]},
			 "multiply"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"multiply",
			 :boundingbox=>[104,
			 39,
			 606,
			 478]},
			 "uacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"uacute",
			 :boundingbox=>[70,
			 -15,
			 599,
			 661]},
			 "Tcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Tcaron",
			 :boundingbox=>[86,
			 0,
			 679,
			 790]},
			 "partialdiff"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"partialdiff",
			 :boundingbox=>[91,
			 -38,
			 627,
			 728]},
			 "ydieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ydieresis",
			 :boundingbox=>[-21,
			 -142,
			 695,
			 638]},
			 "Nacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Nacute",
			 :boundingbox=>[8,
			 -12,
			 730,
			 784]},
			 "icircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"icircumflex",
			 :boundingbox=>[77,
			 0,
			 577,
			 657]},
			 "Ecircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ecircumflex",
			 :boundingbox=>[25,
			 0,
			 670,
			 780]},
			 "adieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"adieresis",
			 :boundingbox=>[61,
			 -15,
			 595,
			 638]},
			 "edieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"edieresis",
			 :boundingbox=>[81,
			 -15,
			 605,
			 638]},
			 "cacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"cacute",
			 :boundingbox=>[81,
			 -15,
			 649,
			 661]},
			 "nacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"nacute",
			 :boundingbox=>[18,
			 0,
			 639,
			 661]},
			 "umacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"umacron",
			 :boundingbox=>[70,
			 -15,
			 637,
			 585]},
			 "Ncaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ncaron",
			 :boundingbox=>[8,
			 -12,
			 730,
			 790]},
			 "Iacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Iacute",
			 :boundingbox=>[77,
			 0,
			 643,
			 784]},
			 "plusminus"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"plusminus",
			 :boundingbox=>[76,
			 24,
			 614,
			 515]},
			 "brokenbar"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"brokenbar",
			 :boundingbox=>[217,
			 -175,
			 489,
			 675]},
			 "registered"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"registered",
			 :boundingbox=>[53,
			 -18,
			 667,
			 580]},
			 "Gbreve"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Gbreve",
			 :boundingbox=>[74,
			 -18,
			 684,
			 784]},
			 "Idotaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Idotaccent",
			 :boundingbox=>[77,
			 0,
			 643,
			 761]},
			 "summation"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"summation",
			 :boundingbox=>[15,
			 -10,
			 672,
			 706]},
			 "Egrave"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Egrave",
			 :boundingbox=>[25,
			 0,
			 670,
			 784]},
			 "racute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"racute",
			 :boundingbox=>[47,
			 0,
			 655,
			 661]},
			 "omacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"omacron",
			 :boundingbox=>[71,
			 -15,
			 637,
			 585]},
			 "Zacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Zacute",
			 :boundingbox=>[62,
			 0,
			 665,
			 784]},
			 "Zcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Zcaron",
			 :boundingbox=>[62,
			 0,
			 659,
			 790]},
			 "greaterequal"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"greaterequal",
			 :boundingbox=>[26,
			 0,
			 627,
			 696]},
			 "Eth"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Eth",
			 :boundingbox=>[30,
			 0,
			 664,
			 562]},
			 "Ccedilla"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ccedilla",
			 :boundingbox=>[74,
			 -206,
			 675,
			 580]},
			 "lcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"lcommaaccent",
			 :boundingbox=>[77,
			 -250,
			 546,
			 626]},
			 "tcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"tcaron",
			 :boundingbox=>[118,
			 -15,
			 627,
			 703]},
			 "eogonek"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"eogonek",
			 :boundingbox=>[81,
			 -199,
			 605,
			 454]},
			 "Uogonek"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Uogonek",
			 :boundingbox=>[101,
			 -199,
			 716,
			 562]},
			 "Aacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Aacute",
			 :boundingbox=>[-9,
			 0,
			 655,
			 784]},
			 "Adieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Adieresis",
			 :boundingbox=>[-9,
			 0,
			 632,
			 761]},
			 "egrave"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"egrave",
			 :boundingbox=>[81,
			 -15,
			 605,
			 661]},
			 "zacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"zacute",
			 :boundingbox=>[81,
			 0,
			 614,
			 661]},
			 "iogonek"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"iogonek",
			 :boundingbox=>[77,
			 -199,
			 546,
			 658]},
			 "Oacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Oacute",
			 :boundingbox=>[74,
			 -18,
			 645,
			 784]},
			 "oacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"oacute",
			 :boundingbox=>[71,
			 -15,
			 649,
			 661]},
			 "amacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"amacron",
			 :boundingbox=>[61,
			 -15,
			 637,
			 585]},
			 "sacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"sacute",
			 :boundingbox=>[66,
			 -17,
			 609,
			 661]},
			 "idieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"idieresis",
			 :boundingbox=>[77,
			 0,
			 561,
			 618]},
			 "Ocircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ocircumflex",
			 :boundingbox=>[74,
			 -18,
			 645,
			 780]},
			 "Ugrave"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ugrave",
			 :boundingbox=>[101,
			 -18,
			 716,
			 784]},
			 "Delta"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Delta",
			 :boundingbox=>[6,
			 0,
			 594,
			 688]},
			 "thorn"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"thorn",
			 :boundingbox=>[-32,
			 -142,
			 622,
			 626]},
			 "twosuperior"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"twosuperior",
			 :boundingbox=>[191,
			 230,
			 542,
			 616]},
			 "Odieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Odieresis",
			 :boundingbox=>[74,
			 -18,
			 645,
			 761]},
			 "mu"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"mu",
			 :boundingbox=>[49,
			 -142,
			 592,
			 439]},
			 "igrave"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"igrave",
			 :boundingbox=>[77,
			 0,
			 546,
			 661]},
			 "ohungarumlaut"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ohungarumlaut",
			 :boundingbox=>[71,
			 -15,
			 809,
			 661]},
			 "Eogonek"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Eogonek",
			 :boundingbox=>[25,
			 -199,
			 670,
			 562]},
			 "dcroat"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"dcroat",
			 :boundingbox=>[60,
			 -15,
			 712,
			 626]},
			 "threequarters"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"threequarters",
			 :boundingbox=>[8,
			 -60,
			 699,
			 661]},
			 "Scedilla"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Scedilla",
			 :boundingbox=>[54,
			 -206,
			 673,
			 582]},
			 "lcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"lcaron",
			 :boundingbox=>[77,
			 0,
			 731,
			 626]},
			 "Kcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Kcommaaccent",
			 :boundingbox=>[21,
			 -250,
			 692,
			 562]},
			 "Lacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Lacute",
			 :boundingbox=>[39,
			 0,
			 636,
			 784]},
			 "trademark"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"trademark",
			 :boundingbox=>[86,
			 230,
			 869,
			 562]},
			 "edotaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"edotaccent",
			 :boundingbox=>[81,
			 -15,
			 605,
			 638]},
			 "Igrave"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Igrave",
			 :boundingbox=>[77,
			 0,
			 643,
			 784]},
			 "Imacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Imacron",
			 :boundingbox=>[77,
			 0,
			 663,
			 708]},
			 "Lcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Lcaron",
			 :boundingbox=>[39,
			 0,
			 757,
			 562]},
			 "onehalf"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"onehalf",
			 :boundingbox=>[22,
			 -60,
			 716,
			 661]},
			 "lessequal"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"lessequal",
			 :boundingbox=>[26,
			 0,
			 671,
			 696]},
			 "ocircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ocircumflex",
			 :boundingbox=>[71,
			 -15,
			 622,
			 657]},
			 "ntilde"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ntilde",
			 :boundingbox=>[18,
			 0,
			 643,
			 636]},
			 "Uhungarumlaut"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Uhungarumlaut",
			 :boundingbox=>[101,
			 -18,
			 805,
			 784]},
			 "Eacute"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Eacute",
			 :boundingbox=>[25,
			 0,
			 670,
			 784]},
			 "emacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"emacron",
			 :boundingbox=>[81,
			 -15,
			 637,
			 585]},
			 "gbreve"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"gbreve",
			 :boundingbox=>[40,
			 -146,
			 674,
			 661]},
			 "onequarter"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"onequarter",
			 :boundingbox=>[13,
			 -60,
			 707,
			 661]},
			 "Scaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Scaron",
			 :boundingbox=>[54,
			 -22,
			 689,
			 790]},
			 "Scommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Scommaaccent",
			 :boundingbox=>[54,
			 -250,
			 673,
			 582]},
			 "Ohungarumlaut"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ohungarumlaut",
			 :boundingbox=>[74,
			 -18,
			 795,
			 784]},
			 "degree"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"degree",
			 :boundingbox=>[173,
			 243,
			 570,
			 616]},
			 "ograve"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ograve",
			 :boundingbox=>[71,
			 -15,
			 622,
			 661]},
			 "Ccaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ccaron",
			 :boundingbox=>[74,
			 -18,
			 689,
			 790]},
			 "ugrave"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ugrave",
			 :boundingbox=>[70,
			 -15,
			 592,
			 661]},
			 "radical"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"radical",
			 :boundingbox=>[67,
			 -104,
			 635,
			 778]},
			 "Dcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Dcaron",
			 :boundingbox=>[30,
			 0,
			 664,
			 790]},
			 "rcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"rcommaaccent",
			 :boundingbox=>[47,
			 -250,
			 655,
			 454]},
			 "Ntilde"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ntilde",
			 :boundingbox=>[8,
			 -12,
			 730,
			 759]},
			 "otilde"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"otilde",
			 :boundingbox=>[71,
			 -15,
			 643,
			 636]},
			 "Rcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Rcommaaccent",
			 :boundingbox=>[24,
			 -250,
			 617,
			 562]},
			 "Lcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Lcommaaccent",
			 :boundingbox=>[39,
			 -250,
			 636,
			 562]},
			 "Atilde"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Atilde",
			 :boundingbox=>[-9,
			 0,
			 669,
			 759]},
			 "Aogonek"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Aogonek",
			 :boundingbox=>[-9,
			 -199,
			 632,
			 562]},
			 "Aring"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Aring",
			 :boundingbox=>[-9,
			 0,
			 632,
			 801]},
			 "Otilde"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Otilde",
			 :boundingbox=>[74,
			 -18,
			 669,
			 759]},
			 "zdotaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"zdotaccent",
			 :boundingbox=>[81,
			 0,
			 614,
			 638]},
			 "Ecaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Ecaron",
			 :boundingbox=>[25,
			 0,
			 670,
			 790]},
			 "Iogonek"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Iogonek",
			 :boundingbox=>[77,
			 -199,
			 643,
			 562]},
			 "kcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"kcommaaccent",
			 :boundingbox=>[33,
			 -250,
			 643,
			 626]},
			 "minus"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"minus",
			 :boundingbox=>[114,
			 203,
			 596,
			 313]},
			 "Icircumflex"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Icircumflex",
			 :boundingbox=>[77,
			 0,
			 643,
			 780]},
			 "ncaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ncaron",
			 :boundingbox=>[18,
			 0,
			 633,
			 667]},
			 "tcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"tcommaaccent",
			 :boundingbox=>[118,
			 -250,
			 567,
			 562]},
			 "logicalnot"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"logicalnot",
			 :boundingbox=>[135,
			 103,
			 617,
			 413]},
			 "odieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"odieresis",
			 :boundingbox=>[71,
			 -15,
			 622,
			 638]},
			 "udieresis"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"udieresis",
			 :boundingbox=>[70,
			 -15,
			 595,
			 638]},
			 "notequal"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"notequal",
			 :boundingbox=>[30,
			 -47,
			 626,
			 563]},
			 "gcommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"gcommaaccent",
			 :boundingbox=>[40,
			 -146,
			 674,
			 714]},
			 "eth"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"eth",
			 :boundingbox=>[93,
			 -27,
			 661,
			 626]},
			 "zcaron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"zcaron",
			 :boundingbox=>[81,
			 0,
			 643,
			 667]},
			 "ncommaaccent"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"ncommaaccent",
			 :boundingbox=>[18,
			 -250,
			 615,
			 454]},
			 "onesuperior"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"onesuperior",
			 :boundingbox=>[212,
			 230,
			 514,
			 616]},
			 "imacron"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"imacron",
			 :boundingbox=>[77,
			 0,
			 575,
			 585]},
			 "Euro"=>{:charcode=>-1,
			 :wx=>600,
			 :name=>"Euro",
			 :boundingbox=>[0,
			 0,
			 0,
			 0]}}
	end
end