-- ZPU
--
-- Copyright 2004-2008 oharboe - �yvind Harboe - oyvind.harboe@zylin.com
-- Modified by Alastair M. Robinson for the ZPUFlex project.
--
-- The FreeBSD license
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE ZPU PROJECT ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-- The views and conclusions contained in the software and documentation
-- are those of the authors and should not be interpreted as representing
-- official policies, either expressed or implied, of the ZPU Project.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.zpupkg.all;

entity SDBootstrap_ROM is
generic
	(
		maxAddrBitBRAM : integer := maxAddrBitBRAMLimit -- Specify your actual ROM size to save LEs and unnecessary block RAM usage.
	);
port (
	clk : in std_logic;
	areset : in std_logic := '0';
	from_zpu : in ZPU_ToROM;
	to_zpu : out ZPU_FromROM
);
end SDBootstrap_ROM;

architecture arch of SDBootstrap_ROM is

type ram_type is array(natural range 0 to ((2**(maxAddrBitBRAM+1))/4)-1) of std_logic_vector(wordSize-1 downto 0);

shared variable ram : ram_type :=
(
     0 => x"84808080",
     1 => x"8c0b8480",
     2 => x"8081e004",
     3 => x"84808080",
     4 => x"8c04ff0d",
     5 => x"80040400",
     6 => x"40000016",
     7 => x"00000000",
     8 => x"0b83ffe0",
     9 => x"80080b83",
    10 => x"ffe08408",
    11 => x"0b83ffe0",
    12 => x"88088480",
    13 => x"80809808",
    14 => x"2d0b83ff",
    15 => x"e0880c0b",
    16 => x"83ffe084",
    17 => x"0c0b83ff",
    18 => x"e0800c04",
    19 => x"00000000",
    20 => x"00000000",
    21 => x"00000000",
    22 => x"00000000",
    23 => x"00000000",
    24 => x"71fd0608",
    25 => x"72830609",
    26 => x"81058205",
    27 => x"832b2a83",
    28 => x"ffff0652",
    29 => x"0471fc06",
    30 => x"08728306",
    31 => x"09810583",
    32 => x"05101010",
    33 => x"2a81ff06",
    34 => x"520471fd",
    35 => x"060883ff",
    36 => x"ff738306",
    37 => x"09810582",
    38 => x"05832b2b",
    39 => x"09067383",
    40 => x"ffff0673",
    41 => x"83060981",
    42 => x"05820583",
    43 => x"2b0b2b07",
    44 => x"72fc060c",
    45 => x"51510471",
    46 => x"fc060884",
    47 => x"8080a1bc",
    48 => x"73830610",
    49 => x"10050806",
    50 => x"7381ff06",
    51 => x"73830609",
    52 => x"81058305",
    53 => x"1010102b",
    54 => x"0772fc06",
    55 => x"0c515104",
    56 => x"83ffe080",
    57 => x"7083fff5",
    58 => x"f4278e38",
    59 => x"80717084",
    60 => x"05530c84",
    61 => x"808081e4",
    62 => x"04848080",
    63 => x"808c5184",
    64 => x"80808fd2",
    65 => x"0402ec05",
    66 => x"0d765380",
    67 => x"55727525",
    68 => x"8e38ad51",
    69 => x"84808085",
    70 => x"b32d7209",
    71 => x"81055372",
    72 => x"802ebe38",
    73 => x"8754729c",
    74 => x"2a73842b",
    75 => x"54527180",
    76 => x"2e833881",
    77 => x"55897225",
    78 => x"8a38b712",
    79 => x"52848080",
    80 => x"82c604b0",
    81 => x"12527480",
    82 => x"2e893871",
    83 => x"51848080",
    84 => x"85b32dff",
    85 => x"14547380",
    86 => x"25cc3884",
    87 => x"808082e9",
    88 => x"04b05184",
    89 => x"808085b3",
    90 => x"2d800b83",
    91 => x"ffe0800c",
    92 => x"0294050d",
    93 => x"0402c005",
    94 => x"0d0280c4",
    95 => x"05578070",
    96 => x"78708405",
    97 => x"5a087241",
    98 => x"5f5d587c",
    99 => x"7084055e",
   100 => x"085a805b",
   101 => x"79982a7a",
   102 => x"882b5b56",
   103 => x"75893877",
   104 => x"5f848080",
   105 => x"85a7047d",
   106 => x"802e81d3",
   107 => x"38805e75",
   108 => x"80e42e8a",
   109 => x"387580f8",
   110 => x"2e098106",
   111 => x"89387684",
   112 => x"1871085e",
   113 => x"58547580",
   114 => x"e42ea638",
   115 => x"7580e426",
   116 => x"8e387580",
   117 => x"e32e80d9",
   118 => x"38848080",
   119 => x"84bf0475",
   120 => x"80f32eb5",
   121 => x"387580f8",
   122 => x"2e8f3884",
   123 => x"808084bf",
   124 => x"048a5384",
   125 => x"808083fb",
   126 => x"04905383",
   127 => x"ffe0e052",
   128 => x"7b518480",
   129 => x"8082852d",
   130 => x"83ffe080",
   131 => x"0883ffe0",
   132 => x"e05a5584",
   133 => x"808084d8",
   134 => x"04768418",
   135 => x"71087054",
   136 => x"5b585484",
   137 => x"808085d7",
   138 => x"2d805584",
   139 => x"808084d8",
   140 => x"04768418",
   141 => x"71085858",
   142 => x"54848080",
   143 => x"858f04a5",
   144 => x"51848080",
   145 => x"85b32d75",
   146 => x"51848080",
   147 => x"85b32d82",
   148 => x"18588480",
   149 => x"80859a04",
   150 => x"74ff1656",
   151 => x"54807425",
   152 => x"b9387870",
   153 => x"81055a84",
   154 => x"808080f5",
   155 => x"2d705256",
   156 => x"84808085",
   157 => x"b32d8118",
   158 => x"58848080",
   159 => x"84d80475",
   160 => x"a52e0981",
   161 => x"06893881",
   162 => x"5e848080",
   163 => x"859a0475",
   164 => x"51848080",
   165 => x"85b32d81",
   166 => x"1858811b",
   167 => x"5b837b25",
   168 => x"fdf23875",
   169 => x"fde5387e",
   170 => x"83ffe080",
   171 => x"0c0280c0",
   172 => x"050d0402",
   173 => x"f8050d73",
   174 => x"52c00870",
   175 => x"882a7081",
   176 => x"06515151",
   177 => x"70802ef1",
   178 => x"3871c00c",
   179 => x"7183ffe0",
   180 => x"800c0288",
   181 => x"050d0402",
   182 => x"e8050d80",
   183 => x"78575575",
   184 => x"70840557",
   185 => x"08538054",
   186 => x"72982a73",
   187 => x"882b5452",
   188 => x"71802ea2",
   189 => x"38c00870",
   190 => x"882a7081",
   191 => x"06515151",
   192 => x"70802ef1",
   193 => x"3871c00c",
   194 => x"81158115",
   195 => x"55558374",
   196 => x"25d63871",
   197 => x"ca387483",
   198 => x"ffe0800c",
   199 => x"0298050d",
   200 => x"0402f405",
   201 => x"0dd45281",
   202 => x"ff720c71",
   203 => x"085381ff",
   204 => x"720c7288",
   205 => x"2b83fe80",
   206 => x"06720870",
   207 => x"81ff0651",
   208 => x"525381ff",
   209 => x"720c7271",
   210 => x"07882b72",
   211 => x"087081ff",
   212 => x"06515253",
   213 => x"81ff720c",
   214 => x"72710788",
   215 => x"2b720870",
   216 => x"81ff0672",
   217 => x"0783ffe0",
   218 => x"800c5253",
   219 => x"028c050d",
   220 => x"0402f405",
   221 => x"0d747671",
   222 => x"81ff06d4",
   223 => x"0c535383",
   224 => x"fff1a008",
   225 => x"85387189",
   226 => x"2b527198",
   227 => x"2ad40c71",
   228 => x"902a7081",
   229 => x"ff06d40c",
   230 => x"5171882a",
   231 => x"7081ff06",
   232 => x"d40c5171",
   233 => x"81ff06d4",
   234 => x"0c72902a",
   235 => x"7081ff06",
   236 => x"d40c51d4",
   237 => x"087081ff",
   238 => x"06515182",
   239 => x"b8bf5270",
   240 => x"81ff2e09",
   241 => x"81069438",
   242 => x"81ff0bd4",
   243 => x"0cd40870",
   244 => x"81ff06ff",
   245 => x"14545151",
   246 => x"71e53870",
   247 => x"83ffe080",
   248 => x"0c028c05",
   249 => x"0d0402fc",
   250 => x"050d81c7",
   251 => x"5181ff0b",
   252 => x"d40cff11",
   253 => x"51708025",
   254 => x"f4380284",
   255 => x"050d0402",
   256 => x"f0050d84",
   257 => x"808087e6",
   258 => x"2d819c9f",
   259 => x"53805287",
   260 => x"fc80f751",
   261 => x"84808086",
   262 => x"f12d83ff",
   263 => x"e0800854",
   264 => x"83ffe080",
   265 => x"08812e09",
   266 => x"8106ae38",
   267 => x"81ff0bd4",
   268 => x"0c820a52",
   269 => x"849c80e9",
   270 => x"51848080",
   271 => x"86f12d83",
   272 => x"ffe08008",
   273 => x"8e3881ff",
   274 => x"0bd40c73",
   275 => x"53848080",
   276 => x"88e00484",
   277 => x"808087e6",
   278 => x"2dff1353",
   279 => x"72ffae38",
   280 => x"7283ffe0",
   281 => x"800c0290",
   282 => x"050d0402",
   283 => x"f4050d81",
   284 => x"ff0bd40c",
   285 => x"848080a1",
   286 => x"cc518480",
   287 => x"8085d72d",
   288 => x"93538052",
   289 => x"87fc80c1",
   290 => x"51848080",
   291 => x"86f12d83",
   292 => x"ffe08008",
   293 => x"8e3881ff",
   294 => x"0bd40c81",
   295 => x"53848080",
   296 => x"89af0484",
   297 => x"808087e6",
   298 => x"2dff1353",
   299 => x"72d43872",
   300 => x"83ffe080",
   301 => x"0c028c05",
   302 => x"0d0402f0",
   303 => x"050d8480",
   304 => x"8087e62d",
   305 => x"83aa5284",
   306 => x"9c80c851",
   307 => x"84808086",
   308 => x"f12d83ff",
   309 => x"e0800883",
   310 => x"ffe08008",
   311 => x"53848080",
   312 => x"a1d85253",
   313 => x"84808082",
   314 => x"f52d7281",
   315 => x"2e098106",
   316 => x"a9388480",
   317 => x"8086a12d",
   318 => x"83ffe080",
   319 => x"0883ffff",
   320 => x"06537283",
   321 => x"aa2ebb38",
   322 => x"83ffe080",
   323 => x"08528480",
   324 => x"80a1f051",
   325 => x"84808082",
   326 => x"f52d8480",
   327 => x"8088eb2d",
   328 => x"8480808a",
   329 => x"ba048154",
   330 => x"8480808b",
   331 => x"e5048480",
   332 => x"80a28851",
   333 => x"84808082",
   334 => x"f52d8054",
   335 => x"8480808b",
   336 => x"e50481ff",
   337 => x"0bd40cb1",
   338 => x"53848080",
   339 => x"87ff2d83",
   340 => x"ffe08008",
   341 => x"802e80fe",
   342 => x"38805287",
   343 => x"fc80fa51",
   344 => x"84808086",
   345 => x"f12d83ff",
   346 => x"e0800880",
   347 => x"d73883ff",
   348 => x"e0800852",
   349 => x"848080a2",
   350 => x"a4518480",
   351 => x"8082f52d",
   352 => x"81ff0bd4",
   353 => x"0cd40870",
   354 => x"81ff0670",
   355 => x"54848080",
   356 => x"a2b05351",
   357 => x"53848080",
   358 => x"82f52d81",
   359 => x"ff0bd40c",
   360 => x"81ff0bd4",
   361 => x"0c81ff0b",
   362 => x"d40c81ff",
   363 => x"0bd40c72",
   364 => x"862a7081",
   365 => x"06705651",
   366 => x"5372802e",
   367 => x"a8388480",
   368 => x"808aa604",
   369 => x"83ffe080",
   370 => x"08528480",
   371 => x"80a2a451",
   372 => x"84808082",
   373 => x"f52d7282",
   374 => x"2efed338",
   375 => x"ff135372",
   376 => x"fee73872",
   377 => x"547383ff",
   378 => x"e0800c02",
   379 => x"90050d04",
   380 => x"02f4050d",
   381 => x"810b83ff",
   382 => x"f1a00cd0",
   383 => x"08708f2a",
   384 => x"70810651",
   385 => x"515372f3",
   386 => x"3872d00c",
   387 => x"84808087",
   388 => x"e62d8480",
   389 => x"80a2c051",
   390 => x"84808085",
   391 => x"d72dd008",
   392 => x"708f2a70",
   393 => x"81065151",
   394 => x"5372f338",
   395 => x"810bd00c",
   396 => x"87538052",
   397 => x"84d480c0",
   398 => x"51848080",
   399 => x"86f12d83",
   400 => x"ffe08008",
   401 => x"812e9738",
   402 => x"72822e09",
   403 => x"81068938",
   404 => x"80538480",
   405 => x"808d9804",
   406 => x"ff135372",
   407 => x"d5388480",
   408 => x"8089ba2d",
   409 => x"83ffe080",
   410 => x"0883fff1",
   411 => x"a00c8152",
   412 => x"87fc80d0",
   413 => x"51848080",
   414 => x"86f12d81",
   415 => x"ff0bd40c",
   416 => x"d008708f",
   417 => x"2a708106",
   418 => x"51515372",
   419 => x"f33872d0",
   420 => x"0c81ff0b",
   421 => x"d40c8153",
   422 => x"7283ffe0",
   423 => x"800c028c",
   424 => x"050d0480",
   425 => x"0b83ffe0",
   426 => x"800c0402",
   427 => x"e0050d79",
   428 => x"7b575780",
   429 => x"5881ff0b",
   430 => x"d40cd008",
   431 => x"708f2a70",
   432 => x"81065151",
   433 => x"5473f338",
   434 => x"82810bd0",
   435 => x"0c81ff0b",
   436 => x"d40c7652",
   437 => x"87fc80d1",
   438 => x"51848080",
   439 => x"86f12d80",
   440 => x"dbc6df55",
   441 => x"83ffe080",
   442 => x"08802e9b",
   443 => x"3883ffe0",
   444 => x"80085376",
   445 => x"52848080",
   446 => x"a2cc5184",
   447 => x"808082f5",
   448 => x"2d848080",
   449 => x"8edd0481",
   450 => x"ff0bd40c",
   451 => x"d4087081",
   452 => x"ff065154",
   453 => x"7381fe2e",
   454 => x"098106a5",
   455 => x"3880ff54",
   456 => x"84808086",
   457 => x"a12d83ff",
   458 => x"e0800876",
   459 => x"70840558",
   460 => x"0cff1454",
   461 => x"738025e8",
   462 => x"38815884",
   463 => x"80808ec7",
   464 => x"04ff1555",
   465 => x"74c13881",
   466 => x"ff0bd40c",
   467 => x"d008708f",
   468 => x"2a708106",
   469 => x"51515473",
   470 => x"f33873d0",
   471 => x"0c7783ff",
   472 => x"e0800c02",
   473 => x"a0050d04",
   474 => x"02f4050d",
   475 => x"7470882a",
   476 => x"83fe8006",
   477 => x"7072982a",
   478 => x"0772882b",
   479 => x"87fc8080",
   480 => x"0673982b",
   481 => x"81f00a06",
   482 => x"71730707",
   483 => x"83ffe080",
   484 => x"0c565153",
   485 => x"51028c05",
   486 => x"0d0402f8",
   487 => x"050d028e",
   488 => x"05848080",
   489 => x"80f52d74",
   490 => x"882b0770",
   491 => x"83ffff06",
   492 => x"83ffe080",
   493 => x"0c510288",
   494 => x"050d0402",
   495 => x"f8050d73",
   496 => x"70902b71",
   497 => x"902a0783",
   498 => x"ffe0800c",
   499 => x"52028805",
   500 => x"0d0402ec",
   501 => x"050d800b",
   502 => x"fc800c84",
   503 => x"8080a2ec",
   504 => x"51848080",
   505 => x"85d72d84",
   506 => x"80808bf0",
   507 => x"2d83ffe0",
   508 => x"8008802e",
   509 => x"82863884",
   510 => x"8080a384",
   511 => x"51848080",
   512 => x"85d72d84",
   513 => x"808092e0",
   514 => x"2d83ffe1",
   515 => x"a0528480",
   516 => x"80a39c51",
   517 => x"8480809f",
   518 => x"e12d83ff",
   519 => x"e0800880",
   520 => x"2e81cd38",
   521 => x"83ffe1a0",
   522 => x"0b848080",
   523 => x"a3a85254",
   524 => x"84808085",
   525 => x"d72d8055",
   526 => x"73708105",
   527 => x"55848080",
   528 => x"80f52d53",
   529 => x"72a02e80",
   530 => x"e63872c0",
   531 => x"0c72a32e",
   532 => x"81843872",
   533 => x"80c72e09",
   534 => x"81068d38",
   535 => x"84808080",
   536 => x"922d8480",
   537 => x"80918a04",
   538 => x"728a2e09",
   539 => x"81068d38",
   540 => x"84808080",
   541 => x"8c2d8480",
   542 => x"80918a04",
   543 => x"7280cc2e",
   544 => x"09810686",
   545 => x"3883ffe1",
   546 => x"a0547281",
   547 => x"df06f005",
   548 => x"7081ff06",
   549 => x"5153b873",
   550 => x"278938ef",
   551 => x"137081ff",
   552 => x"06515374",
   553 => x"842b7307",
   554 => x"55848080",
   555 => x"90b80472",
   556 => x"a32ea338",
   557 => x"73708105",
   558 => x"55848080",
   559 => x"80f52d53",
   560 => x"72a02ef0",
   561 => x"38ff1475",
   562 => x"53705254",
   563 => x"8480809f",
   564 => x"e12d74fc",
   565 => x"800c7370",
   566 => x"81055584",
   567 => x"808080f5",
   568 => x"2d53728a",
   569 => x"2e098106",
   570 => x"ed388480",
   571 => x"8090b604",
   572 => x"848080a3",
   573 => x"bc518480",
   574 => x"8085d72d",
   575 => x"848080a3",
   576 => x"d8518480",
   577 => x"8085d72d",
   578 => x"800b83ff",
   579 => x"e0800c02",
   580 => x"94050d04",
   581 => x"02e8050d",
   582 => x"77797b58",
   583 => x"55558053",
   584 => x"727625af",
   585 => x"38747081",
   586 => x"05568480",
   587 => x"8080f52d",
   588 => x"74708105",
   589 => x"56848080",
   590 => x"80f52d52",
   591 => x"5271712e",
   592 => x"89388151",
   593 => x"84808092",
   594 => x"d5048113",
   595 => x"53848080",
   596 => x"92a00480",
   597 => x"517083ff",
   598 => x"e0800c02",
   599 => x"98050d04",
   600 => x"02d8050d",
   601 => x"ff0b83ff",
   602 => x"f5cc0c80",
   603 => x"0b83fff5",
   604 => x"e00c8480",
   605 => x"80a3e451",
   606 => x"84808085",
   607 => x"d72d83ff",
   608 => x"f1b85280",
   609 => x"51848080",
   610 => x"8dab2d83",
   611 => x"ffe08008",
   612 => x"5483ffe0",
   613 => x"80089538",
   614 => x"848080a3",
   615 => x"f4518480",
   616 => x"8085d72d",
   617 => x"73558480",
   618 => x"809b9604",
   619 => x"848080a4",
   620 => x"88518480",
   621 => x"8085d72d",
   622 => x"8056810b",
   623 => x"83fff1ac",
   624 => x"0c885384",
   625 => x"8080a4a0",
   626 => x"5283fff1",
   627 => x"ee518480",
   628 => x"8092942d",
   629 => x"83ffe080",
   630 => x"08762e09",
   631 => x"81068b38",
   632 => x"83ffe080",
   633 => x"0883fff1",
   634 => x"ac0c8853",
   635 => x"848080a4",
   636 => x"ac5283ff",
   637 => x"f28a5184",
   638 => x"80809294",
   639 => x"2d83ffe0",
   640 => x"80088b38",
   641 => x"83ffe080",
   642 => x"0883fff1",
   643 => x"ac0c83ff",
   644 => x"f1ac0852",
   645 => x"848080a4",
   646 => x"b8518480",
   647 => x"8082f52d",
   648 => x"83fff1ac",
   649 => x"08802e81",
   650 => x"cb3883ff",
   651 => x"f4fe0b84",
   652 => x"808080f5",
   653 => x"2d83fff4",
   654 => x"ff0b8480",
   655 => x"8080f52d",
   656 => x"71982b71",
   657 => x"902b0783",
   658 => x"fff5800b",
   659 => x"84808080",
   660 => x"f52d7088",
   661 => x"2b720783",
   662 => x"fff5810b",
   663 => x"84808080",
   664 => x"f52d7107",
   665 => x"83fff5b6",
   666 => x"0b848080",
   667 => x"80f52d83",
   668 => x"fff5b70b",
   669 => x"84808080",
   670 => x"f52d7188",
   671 => x"2b07535f",
   672 => x"54525a56",
   673 => x"57557381",
   674 => x"abaa2e09",
   675 => x"81069538",
   676 => x"75518480",
   677 => x"808ee82d",
   678 => x"83ffe080",
   679 => x"08568480",
   680 => x"8095bd04",
   681 => x"7382d4d5",
   682 => x"2e933884",
   683 => x"8080a4cc",
   684 => x"51848080",
   685 => x"85d72d84",
   686 => x"808097c9",
   687 => x"04755284",
   688 => x"8080a4ec",
   689 => x"51848080",
   690 => x"82f52d83",
   691 => x"fff1b852",
   692 => x"75518480",
   693 => x"808dab2d",
   694 => x"83ffe080",
   695 => x"085583ff",
   696 => x"e0800880",
   697 => x"2e85af38",
   698 => x"848080a5",
   699 => x"84518480",
   700 => x"8085d72d",
   701 => x"848080a5",
   702 => x"ac518480",
   703 => x"8082f52d",
   704 => x"88538480",
   705 => x"80a4ac52",
   706 => x"83fff28a",
   707 => x"51848080",
   708 => x"92942d83",
   709 => x"ffe08008",
   710 => x"8e38810b",
   711 => x"83fff5e0",
   712 => x"0c848080",
   713 => x"96d50488",
   714 => x"53848080",
   715 => x"a4a05283",
   716 => x"fff1ee51",
   717 => x"84808092",
   718 => x"942d83ff",
   719 => x"e0800880",
   720 => x"2e933884",
   721 => x"8080a5c4",
   722 => x"51848080",
   723 => x"82f52d84",
   724 => x"808097c9",
   725 => x"0483fff5",
   726 => x"b60b8480",
   727 => x"8080f52d",
   728 => x"547380d5",
   729 => x"2e098106",
   730 => x"80df3883",
   731 => x"fff5b70b",
   732 => x"84808080",
   733 => x"f52d5473",
   734 => x"81aa2e09",
   735 => x"810680c9",
   736 => x"38800b83",
   737 => x"fff1b80b",
   738 => x"84808080",
   739 => x"f52d5654",
   740 => x"7481e92e",
   741 => x"83388154",
   742 => x"7481eb2e",
   743 => x"8c388055",
   744 => x"73752e09",
   745 => x"810683ee",
   746 => x"3883fff1",
   747 => x"c30b8480",
   748 => x"8080f52d",
   749 => x"59789238",
   750 => x"83fff1c4",
   751 => x"0b848080",
   752 => x"80f52d54",
   753 => x"73822e89",
   754 => x"38805584",
   755 => x"80809b96",
   756 => x"0483fff1",
   757 => x"c50b8480",
   758 => x"8080f52d",
   759 => x"7083fff5",
   760 => x"e80cff11",
   761 => x"7083fff5",
   762 => x"dc0c5452",
   763 => x"848080a5",
   764 => x"e4518480",
   765 => x"8082f52d",
   766 => x"83fff1c6",
   767 => x"0b848080",
   768 => x"80f52d83",
   769 => x"fff1c70b",
   770 => x"84808080",
   771 => x"f52d5676",
   772 => x"05758280",
   773 => x"29057083",
   774 => x"fff5d00c",
   775 => x"83fff1c8",
   776 => x"0b848080",
   777 => x"80f52d70",
   778 => x"83fff5c8",
   779 => x"0c83fff5",
   780 => x"e0085957",
   781 => x"5876802e",
   782 => x"81ec3888",
   783 => x"53848080",
   784 => x"a4ac5283",
   785 => x"fff28a51",
   786 => x"84808092",
   787 => x"942d7855",
   788 => x"83ffe080",
   789 => x"0882bf38",
   790 => x"83fff5e8",
   791 => x"0870842b",
   792 => x"83fff5b8",
   793 => x"0c7083ff",
   794 => x"f5e40c83",
   795 => x"fff1dd0b",
   796 => x"84808080",
   797 => x"f52d83ff",
   798 => x"f1dc0b84",
   799 => x"808080f5",
   800 => x"2d718280",
   801 => x"290583ff",
   802 => x"f1de0b84",
   803 => x"808080f5",
   804 => x"2d708480",
   805 => x"80291283",
   806 => x"fff1df0b",
   807 => x"84808080",
   808 => x"f52d7081",
   809 => x"800a2912",
   810 => x"7083fff1",
   811 => x"b00c83ff",
   812 => x"f5c80871",
   813 => x"2983fff5",
   814 => x"d0080570",
   815 => x"83fff5f0",
   816 => x"0c83fff1",
   817 => x"e50b8480",
   818 => x"8080f52d",
   819 => x"83fff1e4",
   820 => x"0b848080",
   821 => x"80f52d71",
   822 => x"82802905",
   823 => x"83fff1e6",
   824 => x"0b848080",
   825 => x"80f52d70",
   826 => x"84808029",
   827 => x"1283fff1",
   828 => x"e70b8480",
   829 => x"8080f52d",
   830 => x"70982b81",
   831 => x"f00a0672",
   832 => x"057083ff",
   833 => x"f1b40cfe",
   834 => x"117e2977",
   835 => x"0583fff5",
   836 => x"d80c5257",
   837 => x"52575d57",
   838 => x"51525f52",
   839 => x"5c575757",
   840 => x"8480809b",
   841 => x"940483ff",
   842 => x"f1ca0b84",
   843 => x"808080f5",
   844 => x"2d83fff1",
   845 => x"c90b8480",
   846 => x"8080f52d",
   847 => x"71828029",
   848 => x"057083ff",
   849 => x"f5b80c70",
   850 => x"a02983ff",
   851 => x"0570892a",
   852 => x"7083fff5",
   853 => x"e40c83ff",
   854 => x"f1cf0b84",
   855 => x"808080f5",
   856 => x"2d83fff1",
   857 => x"ce0b8480",
   858 => x"8080f52d",
   859 => x"71828029",
   860 => x"057083ff",
   861 => x"f1b00c7b",
   862 => x"71291e70",
   863 => x"83fff5d8",
   864 => x"0c7d83ff",
   865 => x"f1b40c73",
   866 => x"0583fff5",
   867 => x"f00c555e",
   868 => x"51515555",
   869 => x"81557483",
   870 => x"ffe0800c",
   871 => x"02a8050d",
   872 => x"0402ec05",
   873 => x"0d767087",
   874 => x"2c7180ff",
   875 => x"06575553",
   876 => x"83fff5e0",
   877 => x"088a3872",
   878 => x"882c7381",
   879 => x"ff065654",
   880 => x"7383fff5",
   881 => x"cc082ebc",
   882 => x"3883fff5",
   883 => x"d0081452",
   884 => x"848080a6",
   885 => x"88518480",
   886 => x"8082f52d",
   887 => x"83fff1b8",
   888 => x"5283fff5",
   889 => x"d0081451",
   890 => x"8480808d",
   891 => x"ab2d83ff",
   892 => x"e0800853",
   893 => x"83ffe080",
   894 => x"08802e80",
   895 => x"cf387383",
   896 => x"fff5cc0c",
   897 => x"83fff5e0",
   898 => x"08802ea2",
   899 => x"38748429",
   900 => x"83fff1b8",
   901 => x"05700852",
   902 => x"53848080",
   903 => x"8ee82d83",
   904 => x"ffe08008",
   905 => x"f00a0655",
   906 => x"8480809c",
   907 => x"ca047410",
   908 => x"83fff1b8",
   909 => x"05708480",
   910 => x"8080e02d",
   911 => x"52538480",
   912 => x"808f9a2d",
   913 => x"83ffe080",
   914 => x"08557453",
   915 => x"7283ffe0",
   916 => x"800c0294",
   917 => x"050d0402",
   918 => x"c8050d7f",
   919 => x"615f5c80",
   920 => x"57ff0b83",
   921 => x"fff5cc0c",
   922 => x"83fff1b4",
   923 => x"0883fff5",
   924 => x"d8085758",
   925 => x"83fff5e0",
   926 => x"08772e8f",
   927 => x"3883fff5",
   928 => x"e808842b",
   929 => x"59848080",
   930 => x"9d930483",
   931 => x"fff5e408",
   932 => x"842b5980",
   933 => x"5a797927",
   934 => x"81ea3879",
   935 => x"8f06a018",
   936 => x"585473a4",
   937 => x"38755284",
   938 => x"8080a6a8",
   939 => x"51848080",
   940 => x"82f52d83",
   941 => x"fff1b852",
   942 => x"75518116",
   943 => x"56848080",
   944 => x"8dab2d83",
   945 => x"fff1b857",
   946 => x"80778480",
   947 => x"8080f52d",
   948 => x"56547474",
   949 => x"2e833881",
   950 => x"547481e5",
   951 => x"2e819c38",
   952 => x"81707506",
   953 => x"555d7380",
   954 => x"2e819038",
   955 => x"8b178480",
   956 => x"8080f52d",
   957 => x"98065b7a",
   958 => x"8181388b",
   959 => x"537d5276",
   960 => x"51848080",
   961 => x"92942d83",
   962 => x"ffe08008",
   963 => x"80ed389c",
   964 => x"17085184",
   965 => x"80808ee8",
   966 => x"2d83ffe0",
   967 => x"8008841d",
   968 => x"0c9a1784",
   969 => x"808080e0",
   970 => x"2d518480",
   971 => x"808f9a2d",
   972 => x"83ffe080",
   973 => x"0883ffe0",
   974 => x"8008881e",
   975 => x"0c83ffe0",
   976 => x"80085555",
   977 => x"83fff5e0",
   978 => x"08802ea0",
   979 => x"38941784",
   980 => x"808080e0",
   981 => x"2d518480",
   982 => x"808f9a2d",
   983 => x"83ffe080",
   984 => x"08902b83",
   985 => x"fff00a06",
   986 => x"70165154",
   987 => x"73881d0c",
   988 => x"7a7c0c7c",
   989 => x"54848080",
   990 => x"9fd60481",
   991 => x"1a5a8480",
   992 => x"809d9504",
   993 => x"83fff5e0",
   994 => x"08802e80",
   995 => x"c7387751",
   996 => x"8480809b",
   997 => x"a12d83ff",
   998 => x"e0800883",
   999 => x"ffe08008",
  1000 => x"53848080",
  1001 => x"a6c85258",
  1002 => x"84808082",
  1003 => x"f52d7780",
  1004 => x"fffffff8",
  1005 => x"06547380",
  1006 => x"fffffff8",
  1007 => x"2e9638fe",
  1008 => x"1883fff5",
  1009 => x"e8082983",
  1010 => x"fff5f008",
  1011 => x"05568480",
  1012 => x"809d9304",
  1013 => x"80547383",
  1014 => x"ffe0800c",
  1015 => x"02b8050d",
  1016 => x"0402e405",
  1017 => x"0d787a71",
  1018 => x"5483fff5",
  1019 => x"bc535555",
  1020 => x"8480809c",
  1021 => x"d72d83ff",
  1022 => x"e0800881",
  1023 => x"ff065372",
  1024 => x"802e8188",
  1025 => x"38848080",
  1026 => x"a6e05184",
  1027 => x"808085d7",
  1028 => x"2d83fff5",
  1029 => x"c00883ff",
  1030 => x"05892a57",
  1031 => x"80705656",
  1032 => x"75772581",
  1033 => x"873883ff",
  1034 => x"f5c408fe",
  1035 => x"0583fff5",
  1036 => x"e8082983",
  1037 => x"fff5f008",
  1038 => x"117683ff",
  1039 => x"f5dc0806",
  1040 => x"05755452",
  1041 => x"53848080",
  1042 => x"8dab2d83",
  1043 => x"ffe08008",
  1044 => x"802e80cc",
  1045 => x"38811570",
  1046 => x"83fff5dc",
  1047 => x"08065455",
  1048 => x"72973883",
  1049 => x"fff5c408",
  1050 => x"51848080",
  1051 => x"9ba12d83",
  1052 => x"ffe08008",
  1053 => x"83fff5c4",
  1054 => x"0c848014",
  1055 => x"81175754",
  1056 => x"767624ff",
  1057 => x"a1388480",
  1058 => x"80a1ac04",
  1059 => x"74528480",
  1060 => x"80a6fc51",
  1061 => x"84808082",
  1062 => x"f52d8480",
  1063 => x"80a1ae04",
  1064 => x"83ffe080",
  1065 => x"08538480",
  1066 => x"80a1ae04",
  1067 => x"81537283",
  1068 => x"ffe0800c",
  1069 => x"029c050d",
  1070 => x"04000000",
  1071 => x"00ffffff",
  1072 => x"ff00ffff",
  1073 => x"ffff00ff",
  1074 => x"ffffff00",
  1075 => x"436d645f",
  1076 => x"696e6974",
  1077 => x"0a000000",
  1078 => x"636d645f",
  1079 => x"434d4438",
  1080 => x"20726573",
  1081 => x"706f6e73",
  1082 => x"653a2025",
  1083 => x"640a0000",
  1084 => x"434d4438",
  1085 => x"5f342072",
  1086 => x"6573706f",
  1087 => x"6e73653a",
  1088 => x"2025640a",
  1089 => x"00000000",
  1090 => x"53444843",
  1091 => x"20496e69",
  1092 => x"7469616c",
  1093 => x"697a6174",
  1094 => x"696f6e20",
  1095 => x"6572726f",
  1096 => x"72210a00",
  1097 => x"434d4435",
  1098 => x"38202564",
  1099 => x"0a202000",
  1100 => x"434d4435",
  1101 => x"385f3220",
  1102 => x"25640a20",
  1103 => x"20000000",
  1104 => x"53504920",
  1105 => x"496e6974",
  1106 => x"28290a00",
  1107 => x"52656164",
  1108 => x"20636f6d",
  1109 => x"6d616e64",
  1110 => x"20666169",
  1111 => x"6c656420",
  1112 => x"61742025",
  1113 => x"64202825",
  1114 => x"64290a00",
  1115 => x"496e6974",
  1116 => x"69616c69",
  1117 => x"7a696e67",
  1118 => x"20534420",
  1119 => x"63617264",
  1120 => x"0a000000",
  1121 => x"48756e74",
  1122 => x"696e6720",
  1123 => x"666f7220",
  1124 => x"70617274",
  1125 => x"6974696f",
  1126 => x"6e0a0000",
  1127 => x"4d414e49",
  1128 => x"46455354",
  1129 => x"4d535400",
  1130 => x"50617273",
  1131 => x"696e6720",
  1132 => x"6d616e69",
  1133 => x"66657374",
  1134 => x"0a000000",
  1135 => x"4c6f6164",
  1136 => x"696e6720",
  1137 => x"6d616e69",
  1138 => x"66657374",
  1139 => x"20666169",
  1140 => x"6c65640a",
  1141 => x"00000000",
  1142 => x"52657475",
  1143 => x"726e696e",
  1144 => x"670a0000",
  1145 => x"52656164",
  1146 => x"696e6720",
  1147 => x"4d42520a",
  1148 => x"00000000",
  1149 => x"52656164",
  1150 => x"206f6620",
  1151 => x"4d425220",
  1152 => x"6661696c",
  1153 => x"65640a00",
  1154 => x"4d425220",
  1155 => x"73756363",
  1156 => x"65737366",
  1157 => x"756c6c79",
  1158 => x"20726561",
  1159 => x"640a0000",
  1160 => x"46415431",
  1161 => x"36202020",
  1162 => x"00000000",
  1163 => x"46415433",
  1164 => x"32202020",
  1165 => x"00000000",
  1166 => x"50617274",
  1167 => x"6974696f",
  1168 => x"6e636f75",
  1169 => x"6e742025",
  1170 => x"640a0000",
  1171 => x"4e6f2070",
  1172 => x"61727469",
  1173 => x"74696f6e",
  1174 => x"20736967",
  1175 => x"6e617475",
  1176 => x"72652066",
  1177 => x"6f756e64",
  1178 => x"0a000000",
  1179 => x"52656164",
  1180 => x"696e6720",
  1181 => x"626f6f74",
  1182 => x"20736563",
  1183 => x"746f7220",
  1184 => x"25640a00",
  1185 => x"52656164",
  1186 => x"20626f6f",
  1187 => x"74207365",
  1188 => x"63746f72",
  1189 => x"2066726f",
  1190 => x"6d206669",
  1191 => x"72737420",
  1192 => x"70617274",
  1193 => x"6974696f",
  1194 => x"6e0a0000",
  1195 => x"48756e74",
  1196 => x"696e6720",
  1197 => x"666f7220",
  1198 => x"66696c65",
  1199 => x"73797374",
  1200 => x"656d0a00",
  1201 => x"556e7375",
  1202 => x"70706f72",
  1203 => x"74656420",
  1204 => x"70617274",
  1205 => x"6974696f",
  1206 => x"6e207479",
  1207 => x"7065210d",
  1208 => x"00000000",
  1209 => x"436c7573",
  1210 => x"74657220",
  1211 => x"73697a65",
  1212 => x"3a202564",
  1213 => x"2c20436c",
  1214 => x"75737465",
  1215 => x"72206d61",
  1216 => x"736b2c20",
  1217 => x"25640a00",
  1218 => x"47657443",
  1219 => x"6c757374",
  1220 => x"65722072",
  1221 => x"65616469",
  1222 => x"6e672073",
  1223 => x"6563746f",
  1224 => x"72202564",
  1225 => x"0a000000",
  1226 => x"52656164",
  1227 => x"696e6720",
  1228 => x"64697265",
  1229 => x"63746f72",
  1230 => x"79207365",
  1231 => x"63746f72",
  1232 => x"2025640a",
  1233 => x"00000000",
  1234 => x"47657446",
  1235 => x"41544c69",
  1236 => x"6e6b2072",
  1237 => x"65747572",
  1238 => x"6e656420",
  1239 => x"25640a00",
  1240 => x"4f70656e",
  1241 => x"65642066",
  1242 => x"696c652c",
  1243 => x"206c6f61",
  1244 => x"64696e67",
  1245 => x"2e2e2e0a",
  1246 => x"00000000",
  1247 => x"43616e27",
  1248 => x"74206f70",
  1249 => x"656e2025",
  1250 => x"730a0000",
	others => x"00000000"
);

begin

process (clk)
begin
	if (clk'event and clk = '1') then
		if (from_zpu.memAWriteEnable = '1') and (from_zpu.memBWriteEnable = '1') and (from_zpu.memAAddr=from_zpu.memBAddr) and (from_zpu.memAWrite/=from_zpu.memBWrite) then
			report "write collision" severity failure;
		end if;
	
		if (from_zpu.memAWriteEnable = '1') then
			ram(to_integer(unsigned(from_zpu.memAAddr(maxAddrBitBRAM downto 2)))) := from_zpu.memAWrite;
			to_zpu.memARead <= from_zpu.memAWrite;
		else
			to_zpu.memARead <= ram(to_integer(unsigned(from_zpu.memAAddr(maxAddrBitBRAM downto 2))));
		end if;
	end if;
end process;

process (clk)
begin
	if (clk'event and clk = '1') then
		if (from_zpu.memBWriteEnable = '1') then
			ram(to_integer(unsigned(from_zpu.memBAddr(maxAddrBitBRAM downto 2)))) := from_zpu.memBWrite;
			to_zpu.memBRead <= from_zpu.memBWrite;
		else
			to_zpu.memBRead <= ram(to_integer(unsigned(from_zpu.memBAddr(maxAddrBitBRAM downto 2))));
		end if;
	end if;
end process;


end arch;

