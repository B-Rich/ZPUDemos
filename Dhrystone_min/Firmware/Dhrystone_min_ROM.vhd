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
use work.zpu_config.all;
use work.zpupkg.all;

entity Dhrystone_min_ROM is
generic
	(
		maxAddrBit : integer := maxAddrBitBRAMLimit -- Specify your actual ROM size to save LEs and unnecessary block RAM usage.
	);
port (
	clk : in std_logic;
	areset : in std_logic := '0';
	from_zpu : in ZPU_ToROM;
	to_zpu : out ZPU_FromROM
);
end Dhrystone_min_ROM;

architecture arch of Dhrystone_min_ROM is

type ram_type is array(natural range 0 to ((2**(maxAddrBit+1))/4)-1) of std_logic_vector(wordSize-1 downto 0);

shared variable ram : ram_type :=
(
     0 => x"0b0b0b88",
     1 => x"dd040000",
     2 => x"00000000",
     3 => x"00000000",
     4 => x"00000000",
     5 => x"00000000",
     6 => x"00000000",
     7 => x"00000000",
     8 => x"04000000",
     9 => x"00000000",
    10 => x"00000000",
    11 => x"00000000",
    12 => x"00000000",
    13 => x"00000000",
    14 => x"00000000",
    15 => x"00000000",
    16 => x"71fd0608",
    17 => x"72830609",
    18 => x"81058205",
    19 => x"832b2a83",
    20 => x"ffff0652",
    21 => x"04000000",
    22 => x"00000000",
    23 => x"00000000",
    24 => x"71fd0608",
    25 => x"83ffff73",
    26 => x"83060981",
    27 => x"05820583",
    28 => x"2b2b0906",
    29 => x"7383ffff",
    30 => x"0b0b0b0b",
    31 => x"83a50400",
    32 => x"72098105",
    33 => x"72057373",
    34 => x"09060906",
    35 => x"73097306",
    36 => x"070a8106",
    37 => x"53510400",
    38 => x"00000000",
    39 => x"00000000",
    40 => x"72722473",
    41 => x"732e0753",
    42 => x"51040000",
    43 => x"00000000",
    44 => x"00000000",
    45 => x"00000000",
    46 => x"00000000",
    47 => x"00000000",
    48 => x"71737109",
    49 => x"71068106",
    50 => x"09810572",
    51 => x"0a100a72",
    52 => x"0a100a31",
    53 => x"050a8106",
    54 => x"51515351",
    55 => x"04000000",
    56 => x"72722673",
    57 => x"732e0753",
    58 => x"51040000",
    59 => x"00000000",
    60 => x"00000000",
    61 => x"00000000",
    62 => x"00000000",
    63 => x"00000000",
    64 => x"00000000",
    65 => x"00000000",
    66 => x"00000000",
    67 => x"00000000",
    68 => x"00000000",
    69 => x"00000000",
    70 => x"00000000",
    71 => x"00000000",
    72 => x"0b0b0b88",
    73 => x"ba040000",
    74 => x"00000000",
    75 => x"00000000",
    76 => x"00000000",
    77 => x"00000000",
    78 => x"00000000",
    79 => x"00000000",
    80 => x"720a722b",
    81 => x"0a535104",
    82 => x"00000000",
    83 => x"00000000",
    84 => x"00000000",
    85 => x"00000000",
    86 => x"00000000",
    87 => x"00000000",
    88 => x"72729f06",
    89 => x"0981050b",
    90 => x"0b0b889f",
    91 => x"05040000",
    92 => x"00000000",
    93 => x"00000000",
    94 => x"00000000",
    95 => x"00000000",
    96 => x"72722aff",
    97 => x"739f062a",
    98 => x"0974090a",
    99 => x"8106ff05",
   100 => x"06075351",
   101 => x"04000000",
   102 => x"00000000",
   103 => x"00000000",
   104 => x"71715351",
   105 => x"04067383",
   106 => x"06098105",
   107 => x"8205832b",
   108 => x"0b2b0772",
   109 => x"fc060c51",
   110 => x"51040000",
   111 => x"00000000",
   112 => x"72098105",
   113 => x"72050970",
   114 => x"81050906",
   115 => x"0a810653",
   116 => x"51040000",
   117 => x"00000000",
   118 => x"00000000",
   119 => x"00000000",
   120 => x"72098105",
   121 => x"72050970",
   122 => x"81050906",
   123 => x"0a098106",
   124 => x"53510400",
   125 => x"00000000",
   126 => x"00000000",
   127 => x"00000000",
   128 => x"71098105",
   129 => x"52040000",
   130 => x"00000000",
   131 => x"00000000",
   132 => x"00000000",
   133 => x"00000000",
   134 => x"00000000",
   135 => x"00000000",
   136 => x"72720981",
   137 => x"05055351",
   138 => x"04000000",
   139 => x"00000000",
   140 => x"00000000",
   141 => x"00000000",
   142 => x"00000000",
   143 => x"00000000",
   144 => x"72097206",
   145 => x"73730906",
   146 => x"07535104",
   147 => x"00000000",
   148 => x"00000000",
   149 => x"00000000",
   150 => x"00000000",
   151 => x"00000000",
   152 => x"71fc0608",
   153 => x"72830609",
   154 => x"81058305",
   155 => x"1010102a",
   156 => x"81ff0652",
   157 => x"04000000",
   158 => x"00000000",
   159 => x"00000000",
   160 => x"71fc0608",
   161 => x"0b0b0b9f",
   162 => x"a8738306",
   163 => x"10100508",
   164 => x"060b0b0b",
   165 => x"88a20400",
   166 => x"00000000",
   167 => x"00000000",
   168 => x"88088c08",
   169 => x"90087575",
   170 => x"0b0b0b98",
   171 => x"992d5050",
   172 => x"88085690",
   173 => x"0c8c0c88",
   174 => x"0c510400",
   175 => x"00000000",
   176 => x"88088c08",
   177 => x"90087575",
   178 => x"0b0b0b99",
   179 => x"cb2d5050",
   180 => x"88085690",
   181 => x"0c8c0c88",
   182 => x"0c510400",
   183 => x"00000000",
   184 => x"72097081",
   185 => x"0509060a",
   186 => x"8106ff05",
   187 => x"70547106",
   188 => x"73097274",
   189 => x"05ff0506",
   190 => x"07515151",
   191 => x"04000000",
   192 => x"72097081",
   193 => x"0509060a",
   194 => x"098106ff",
   195 => x"05705471",
   196 => x"06730972",
   197 => x"7405ff05",
   198 => x"06075151",
   199 => x"51040000",
   200 => x"05ff0504",
   201 => x"00000000",
   202 => x"00000000",
   203 => x"00000000",
   204 => x"00000000",
   205 => x"00000000",
   206 => x"00000000",
   207 => x"00000000",
   208 => x"04000000",
   209 => x"00000000",
   210 => x"00000000",
   211 => x"00000000",
   212 => x"00000000",
   213 => x"00000000",
   214 => x"00000000",
   215 => x"00000000",
   216 => x"71810552",
   217 => x"04000000",
   218 => x"00000000",
   219 => x"00000000",
   220 => x"00000000",
   221 => x"00000000",
   222 => x"00000000",
   223 => x"00000000",
   224 => x"00000000",
   225 => x"00000000",
   226 => x"00000000",
   227 => x"00000000",
   228 => x"00000000",
   229 => x"00000000",
   230 => x"00000000",
   231 => x"00000000",
   232 => x"02840572",
   233 => x"10100552",
   234 => x"04000000",
   235 => x"00000000",
   236 => x"00000000",
   237 => x"00000000",
   238 => x"00000000",
   239 => x"00000000",
   240 => x"00000000",
   241 => x"00000000",
   242 => x"00000000",
   243 => x"00000000",
   244 => x"00000000",
   245 => x"00000000",
   246 => x"00000000",
   247 => x"00000000",
   248 => x"717105ff",
   249 => x"05715351",
   250 => x"020d0400",
   251 => x"00000000",
   252 => x"00000000",
   253 => x"00000000",
   254 => x"00000000",
   255 => x"00000000",
   256 => x"10101010",
   257 => x"10101010",
   258 => x"10101010",
   259 => x"10101010",
   260 => x"10101010",
   261 => x"10101010",
   262 => x"10101010",
   263 => x"10101053",
   264 => x"51047381",
   265 => x"ff067383",
   266 => x"06098105",
   267 => x"83051010",
   268 => x"102b0772",
   269 => x"fc060c51",
   270 => x"51047272",
   271 => x"80728106",
   272 => x"ff050972",
   273 => x"06057110",
   274 => x"52720a10",
   275 => x"0a5372ed",
   276 => x"38515153",
   277 => x"51040000",
   278 => x"800488da",
   279 => x"0488da0b",
   280 => x"8dc504f1",
   281 => x"3d0d923d",
   282 => x"0b0b0ba4",
   283 => x"bc5c5c80",
   284 => x"7c708405",
   285 => x"5e08715f",
   286 => x"5f587d70",
   287 => x"84055f08",
   288 => x"57805a76",
   289 => x"982a7788",
   290 => x"2b585574",
   291 => x"802e81ef",
   292 => x"387c802e",
   293 => x"b738805d",
   294 => x"7480e42e",
   295 => x"81983874",
   296 => x"80e42680",
   297 => x"d8387480",
   298 => x"e32eb738",
   299 => x"a5518e87",
   300 => x"3f74518e",
   301 => x"823f8218",
   302 => x"58811a5a",
   303 => x"837a25c3",
   304 => x"3874ffb6",
   305 => x"387e880c",
   306 => x"913d0d04",
   307 => x"74a52e09",
   308 => x"81069738",
   309 => x"810b811b",
   310 => x"5b5d837a",
   311 => x"25ffa438",
   312 => x"e0397b84",
   313 => x"1d710857",
   314 => x"5d547451",
   315 => x"8dc93f81",
   316 => x"18811b5b",
   317 => x"58837a25",
   318 => x"ff8938c5",
   319 => x"397480f3",
   320 => x"2e098106",
   321 => x"ffa6387b",
   322 => x"841d7108",
   323 => x"70545d5d",
   324 => x"538dc33f",
   325 => x"800bff11",
   326 => x"54528072",
   327 => x"25ff9a38",
   328 => x"7a708105",
   329 => x"5c337052",
   330 => x"558d8c3f",
   331 => x"811873ff",
   332 => x"15555358",
   333 => x"e5397b84",
   334 => x"1d71087f",
   335 => x"5c555d52",
   336 => x"8756729c",
   337 => x"2a73842b",
   338 => x"54527180",
   339 => x"2e833881",
   340 => x"59b71254",
   341 => x"71892484",
   342 => x"38b01254",
   343 => x"789238ff",
   344 => x"16567580",
   345 => x"25dc3880",
   346 => x"0bff1154",
   347 => x"52ffab39",
   348 => x"73518cc3",
   349 => x"3fff1656",
   350 => x"758025c6",
   351 => x"38e93977",
   352 => x"880c913d",
   353 => x"0d04c808",
   354 => x"880c0480",
   355 => x"3d0d80c1",
   356 => x"0b80f488",
   357 => x"34800b80",
   358 => x"f6a00c70",
   359 => x"880c823d",
   360 => x"0d04ff3d",
   361 => x"0d800b80",
   362 => x"f4883352",
   363 => x"527080c1",
   364 => x"2e993871",
   365 => x"80f6a008",
   366 => x"0780f6a0",
   367 => x"0c80c20b",
   368 => x"80f48c34",
   369 => x"70880c83",
   370 => x"3d0d0481",
   371 => x"0b80f6a0",
   372 => x"080780f6",
   373 => x"a00c80c2",
   374 => x"0b80f48c",
   375 => x"3470880c",
   376 => x"833d0d04",
   377 => x"fd3d0d75",
   378 => x"70088a05",
   379 => x"535380f4",
   380 => x"88335170",
   381 => x"80c12e8b",
   382 => x"3873f338",
   383 => x"70880c85",
   384 => x"3d0d04ff",
   385 => x"127080f4",
   386 => x"84083174",
   387 => x"0c880c85",
   388 => x"3d0d04fc",
   389 => x"3d0d80f4",
   390 => x"b0085574",
   391 => x"802e8c38",
   392 => x"76750871",
   393 => x"0c80f4b0",
   394 => x"0856548c",
   395 => x"155380f4",
   396 => x"8408528a",
   397 => x"5188ed3f",
   398 => x"73880c86",
   399 => x"3d0d04fb",
   400 => x"3d0d7770",
   401 => x"085656b0",
   402 => x"5380f4b0",
   403 => x"08527451",
   404 => x"90a53f85",
   405 => x"0b8c170c",
   406 => x"850b8c16",
   407 => x"0c750875",
   408 => x"0c80f4b0",
   409 => x"08547380",
   410 => x"2e8a3873",
   411 => x"08750c80",
   412 => x"f4b00854",
   413 => x"8c145380",
   414 => x"f4840852",
   415 => x"8a5188a4",
   416 => x"3f841508",
   417 => x"ad38860b",
   418 => x"8c160c88",
   419 => x"15528816",
   420 => x"085187b0",
   421 => x"3f80f4b0",
   422 => x"08700876",
   423 => x"0c548c15",
   424 => x"7054548a",
   425 => x"52730851",
   426 => x"87fa3f73",
   427 => x"880c873d",
   428 => x"0d047508",
   429 => x"54b05373",
   430 => x"5275518f",
   431 => x"ba3f7388",
   432 => x"0c873d0d",
   433 => x"04f33d0d",
   434 => x"80f39c0b",
   435 => x"80f3d00c",
   436 => x"80f3d40b",
   437 => x"80f4b00c",
   438 => x"80f39c0b",
   439 => x"80f3d40c",
   440 => x"800b80f3",
   441 => x"d40b8405",
   442 => x"0c820b80",
   443 => x"f3d40b88",
   444 => x"050ca80b",
   445 => x"80f3d40b",
   446 => x"8c050c9f",
   447 => x"530b0b0b",
   448 => x"9fb85280",
   449 => x"f3e4518e",
   450 => x"ee3f9f53",
   451 => x"0b0b0b9f",
   452 => x"d85280f6",
   453 => x"80518edf",
   454 => x"3f8a0bb1",
   455 => x"e80c0b0b",
   456 => x"0ba2b851",
   457 => x"fabd3f0b",
   458 => x"0b0b9ff8",
   459 => x"51fab43f",
   460 => x"0b0b0ba2",
   461 => x"b851faab",
   462 => x"3fa3e808",
   463 => x"802e8487",
   464 => x"380b0b0b",
   465 => x"a0a851fa",
   466 => x"9a3f0b0b",
   467 => x"0ba2b851",
   468 => x"fa913fa3",
   469 => x"e408520b",
   470 => x"0b0ba0d4",
   471 => x"51fa843f",
   472 => x"c80870a5",
   473 => x"880c5681",
   474 => x"58800ba3",
   475 => x"e4082582",
   476 => x"c7388c3d",
   477 => x"5b80c10b",
   478 => x"80f48834",
   479 => x"810b80f6",
   480 => x"a00c80c2",
   481 => x"0b80f48c",
   482 => x"34825c83",
   483 => x"5a9f530b",
   484 => x"0b0ba184",
   485 => x"5280f490",
   486 => x"518ddc3f",
   487 => x"815d800b",
   488 => x"80f49053",
   489 => x"80f68052",
   490 => x"55879d3f",
   491 => x"8808752e",
   492 => x"09810683",
   493 => x"38815574",
   494 => x"80f6a00c",
   495 => x"7b705755",
   496 => x"748325a0",
   497 => x"38741010",
   498 => x"15fd055e",
   499 => x"8f3dfc05",
   500 => x"53835275",
   501 => x"5185cd3f",
   502 => x"811c705d",
   503 => x"70575583",
   504 => x"7524e238",
   505 => x"7d547453",
   506 => x"a58c5280",
   507 => x"f4b85185",
   508 => x"c33f80f4",
   509 => x"b0087008",
   510 => x"5757b053",
   511 => x"76527551",
   512 => x"8cf53f85",
   513 => x"0b8c180c",
   514 => x"850b8c17",
   515 => x"0c760876",
   516 => x"0c80f4b0",
   517 => x"08557480",
   518 => x"2e8a3874",
   519 => x"08760c80",
   520 => x"f4b00855",
   521 => x"8c155380",
   522 => x"f4840852",
   523 => x"8a5184f4",
   524 => x"3f841608",
   525 => x"83d43886",
   526 => x"0b8c170c",
   527 => x"88165288",
   528 => x"17085183",
   529 => x"ff3f80f4",
   530 => x"b0087008",
   531 => x"770c578c",
   532 => x"16705455",
   533 => x"8a527408",
   534 => x"5184c93f",
   535 => x"80c10b80",
   536 => x"f48c3356",
   537 => x"56757526",
   538 => x"a23880c3",
   539 => x"52755185",
   540 => x"ad3f8808",
   541 => x"7d2e82e2",
   542 => x"38811670",
   543 => x"81ff0680",
   544 => x"f48c3352",
   545 => x"57557476",
   546 => x"27e0387d",
   547 => x"7a7d2935",
   548 => x"705d8a05",
   549 => x"80f48833",
   550 => x"80f48408",
   551 => x"59575575",
   552 => x"80c12e82",
   553 => x"fd3878f7",
   554 => x"38811858",
   555 => x"a3e40878",
   556 => x"25fdc238",
   557 => x"a5880856",
   558 => x"c8087080",
   559 => x"f3cc0c70",
   560 => x"773170a5",
   561 => x"840c530b",
   562 => x"0b0ba1a4",
   563 => x"525bf793",
   564 => x"3fa58408",
   565 => x"5680f776",
   566 => x"2580f538",
   567 => x"a3e40870",
   568 => x"7787e829",
   569 => x"35a4fc0c",
   570 => x"767187e8",
   571 => x"2935a580",
   572 => x"0c767184",
   573 => x"b9293580",
   574 => x"f4b40c5a",
   575 => x"0b0b0ba1",
   576 => x"b451f6df",
   577 => x"3fa4fc08",
   578 => x"520b0b0b",
   579 => x"a1e451f6",
   580 => x"d23f0b0b",
   581 => x"0ba1ec51",
   582 => x"f6c93fa5",
   583 => x"8008520b",
   584 => x"0b0ba1e4",
   585 => x"51f6bc3f",
   586 => x"80f4b408",
   587 => x"520b0b0b",
   588 => x"a29c51f6",
   589 => x"ae3f0b0b",
   590 => x"0ba2b851",
   591 => x"f6a53f80",
   592 => x"0b880c8f",
   593 => x"3d0d040b",
   594 => x"0b0ba2bc",
   595 => x"51fbf839",
   596 => x"0b0b0ba2",
   597 => x"ec51f68b",
   598 => x"3f0b0b0b",
   599 => x"a3a451f6",
   600 => x"823f0b0b",
   601 => x"0ba2b851",
   602 => x"f5f93fa5",
   603 => x"8408a3e4",
   604 => x"08707287",
   605 => x"e82935a4",
   606 => x"fc0c7171",
   607 => x"87e82935",
   608 => x"a5800c71",
   609 => x"7184b929",
   610 => x"3580f4b4",
   611 => x"0c5b560b",
   612 => x"0b0ba1b4",
   613 => x"51f5cc3f",
   614 => x"a4fc0852",
   615 => x"0b0b0ba1",
   616 => x"e451f5bf",
   617 => x"3f0b0b0b",
   618 => x"a1ec51f5",
   619 => x"b63fa580",
   620 => x"08520b0b",
   621 => x"0ba1e451",
   622 => x"f5a93f80",
   623 => x"f4b40852",
   624 => x"0b0b0ba2",
   625 => x"9c51f59b",
   626 => x"3f0b0b0b",
   627 => x"a2b851f5",
   628 => x"923f800b",
   629 => x"880c8f3d",
   630 => x"0d048f3d",
   631 => x"f8055280",
   632 => x"5180e13f",
   633 => x"9f530b0b",
   634 => x"0ba3c452",
   635 => x"80f49051",
   636 => x"89853f77",
   637 => x"7880f484",
   638 => x"0c811770",
   639 => x"81ff0680",
   640 => x"f48c3352",
   641 => x"58565afc",
   642 => x"fd397608",
   643 => x"56b05375",
   644 => x"52765188",
   645 => x"e23f80c1",
   646 => x"0b80f48c",
   647 => x"335656fc",
   648 => x"c439ff15",
   649 => x"7078317c",
   650 => x"0c598059",
   651 => x"fcfb39ff",
   652 => x"3d0d7382",
   653 => x"32703070",
   654 => x"72078025",
   655 => x"880c5252",
   656 => x"833d0d04",
   657 => x"fe3d0d74",
   658 => x"76715354",
   659 => x"5271822e",
   660 => x"83388351",
   661 => x"71812e9a",
   662 => x"38817226",
   663 => x"9f387182",
   664 => x"2eb83871",
   665 => x"842ea938",
   666 => x"70730c70",
   667 => x"880c843d",
   668 => x"0d0480e4",
   669 => x"0b80f484",
   670 => x"08258b38",
   671 => x"80730c70",
   672 => x"880c843d",
   673 => x"0d048373",
   674 => x"0c70880c",
   675 => x"843d0d04",
   676 => x"82730c70",
   677 => x"880c843d",
   678 => x"0d048173",
   679 => x"0c70880c",
   680 => x"843d0d04",
   681 => x"803d0d74",
   682 => x"74148205",
   683 => x"710c880c",
   684 => x"823d0d04",
   685 => x"f73d0d7b",
   686 => x"7d7f6185",
   687 => x"1270822b",
   688 => x"75117074",
   689 => x"71708405",
   690 => x"530c5a5a",
   691 => x"5d5b760c",
   692 => x"7980f818",
   693 => x"0c798612",
   694 => x"5257585a",
   695 => x"5a767624",
   696 => x"993876b3",
   697 => x"29822b79",
   698 => x"11515376",
   699 => x"73708405",
   700 => x"550c8114",
   701 => x"54757425",
   702 => x"f2387681",
   703 => x"cc2919fc",
   704 => x"11088105",
   705 => x"fc120c7a",
   706 => x"1970089f",
   707 => x"a0130c58",
   708 => x"56850b80",
   709 => x"f4840c75",
   710 => x"880c8b3d",
   711 => x"0d04fe3d",
   712 => x"0d029305",
   713 => x"33518002",
   714 => x"84059705",
   715 => x"33545270",
   716 => x"732e8838",
   717 => x"71880c84",
   718 => x"3d0d0470",
   719 => x"80f48834",
   720 => x"810b880c",
   721 => x"843d0d04",
   722 => x"f83d0d7a",
   723 => x"7c595682",
   724 => x"0b831955",
   725 => x"55741670",
   726 => x"3375335b",
   727 => x"51537279",
   728 => x"2e80c638",
   729 => x"80c10b81",
   730 => x"16811656",
   731 => x"56578275",
   732 => x"25e338ff",
   733 => x"a9177081",
   734 => x"ff065559",
   735 => x"73822683",
   736 => x"38875581",
   737 => x"537680d2",
   738 => x"2e983877",
   739 => x"52755186",
   740 => x"ff3f8053",
   741 => x"72880825",
   742 => x"89388715",
   743 => x"80f4840c",
   744 => x"81537288",
   745 => x"0c8a3d0d",
   746 => x"047280f4",
   747 => x"88348275",
   748 => x"25ffa238",
   749 => x"ffbd39ff",
   750 => x"3d0d7352",
   751 => x"c0087088",
   752 => x"2a708106",
   753 => x"51515170",
   754 => x"802ef138",
   755 => x"71c00c71",
   756 => x"880c833d",
   757 => x"0d04fb3d",
   758 => x"0d775675",
   759 => x"70840557",
   760 => x"08538054",
   761 => x"72982a73",
   762 => x"882b5452",
   763 => x"71802ea2",
   764 => x"38c00870",
   765 => x"882a7081",
   766 => x"06515151",
   767 => x"70802ef1",
   768 => x"3871c00c",
   769 => x"81158115",
   770 => x"55558374",
   771 => x"25d63871",
   772 => x"ca387488",
   773 => x"0c873d0d",
   774 => x"04940802",
   775 => x"940cf93d",
   776 => x"0d800b94",
   777 => x"08fc050c",
   778 => x"94088805",
   779 => x"088025ab",
   780 => x"38940888",
   781 => x"05083094",
   782 => x"0888050c",
   783 => x"800b9408",
   784 => x"f4050c94",
   785 => x"08fc0508",
   786 => x"8838810b",
   787 => x"9408f405",
   788 => x"0c9408f4",
   789 => x"05089408",
   790 => x"fc050c94",
   791 => x"088c0508",
   792 => x"8025ab38",
   793 => x"94088c05",
   794 => x"08309408",
   795 => x"8c050c80",
   796 => x"0b9408f0",
   797 => x"050c9408",
   798 => x"fc050888",
   799 => x"38810b94",
   800 => x"08f0050c",
   801 => x"9408f005",
   802 => x"089408fc",
   803 => x"050c8053",
   804 => x"94088c05",
   805 => x"08529408",
   806 => x"88050851",
   807 => x"81a73f88",
   808 => x"08709408",
   809 => x"f8050c54",
   810 => x"9408fc05",
   811 => x"08802e8c",
   812 => x"389408f8",
   813 => x"05083094",
   814 => x"08f8050c",
   815 => x"9408f805",
   816 => x"0870880c",
   817 => x"54893d0d",
   818 => x"940c0494",
   819 => x"0802940c",
   820 => x"fb3d0d80",
   821 => x"0b9408fc",
   822 => x"050c9408",
   823 => x"88050880",
   824 => x"25933894",
   825 => x"08880508",
   826 => x"30940888",
   827 => x"050c810b",
   828 => x"9408fc05",
   829 => x"0c94088c",
   830 => x"05088025",
   831 => x"8c389408",
   832 => x"8c050830",
   833 => x"94088c05",
   834 => x"0c815394",
   835 => x"088c0508",
   836 => x"52940888",
   837 => x"050851ad",
   838 => x"3f880870",
   839 => x"9408f805",
   840 => x"0c549408",
   841 => x"fc050880",
   842 => x"2e8c3894",
   843 => x"08f80508",
   844 => x"309408f8",
   845 => x"050c9408",
   846 => x"f8050870",
   847 => x"880c5487",
   848 => x"3d0d940c",
   849 => x"04940802",
   850 => x"940cfd3d",
   851 => x"0d810b94",
   852 => x"08fc050c",
   853 => x"800b9408",
   854 => x"f8050c94",
   855 => x"088c0508",
   856 => x"94088805",
   857 => x"0827ac38",
   858 => x"9408fc05",
   859 => x"08802ea3",
   860 => x"38800b94",
   861 => x"088c0508",
   862 => x"24993894",
   863 => x"088c0508",
   864 => x"1094088c",
   865 => x"050c9408",
   866 => x"fc050810",
   867 => x"9408fc05",
   868 => x"0cc93994",
   869 => x"08fc0508",
   870 => x"802e80c9",
   871 => x"3894088c",
   872 => x"05089408",
   873 => x"88050826",
   874 => x"a1389408",
   875 => x"88050894",
   876 => x"088c0508",
   877 => x"31940888",
   878 => x"050c9408",
   879 => x"f8050894",
   880 => x"08fc0508",
   881 => x"079408f8",
   882 => x"050c9408",
   883 => x"fc050881",
   884 => x"2a9408fc",
   885 => x"050c9408",
   886 => x"8c050881",
   887 => x"2a94088c",
   888 => x"050cffaf",
   889 => x"39940890",
   890 => x"0508802e",
   891 => x"8f389408",
   892 => x"88050870",
   893 => x"9408f405",
   894 => x"0c518d39",
   895 => x"9408f805",
   896 => x"08709408",
   897 => x"f4050c51",
   898 => x"9408f405",
   899 => x"08880c85",
   900 => x"3d0d940c",
   901 => x"04940802",
   902 => x"940cff3d",
   903 => x"0d800b94",
   904 => x"08fc050c",
   905 => x"94088805",
   906 => x"088106ff",
   907 => x"11700970",
   908 => x"94088c05",
   909 => x"08069408",
   910 => x"fc050811",
   911 => x"9408fc05",
   912 => x"0c940888",
   913 => x"0508812a",
   914 => x"94088805",
   915 => x"0c94088c",
   916 => x"05081094",
   917 => x"088c050c",
   918 => x"51515151",
   919 => x"94088805",
   920 => x"08802e84",
   921 => x"38ffbd39",
   922 => x"9408fc05",
   923 => x"0870880c",
   924 => x"51833d0d",
   925 => x"940c04fc",
   926 => x"3d0d7670",
   927 => x"797b5555",
   928 => x"55558f72",
   929 => x"278c3872",
   930 => x"75078306",
   931 => x"5170802e",
   932 => x"a738ff12",
   933 => x"5271ff2e",
   934 => x"98387270",
   935 => x"81055433",
   936 => x"74708105",
   937 => x"5634ff12",
   938 => x"5271ff2e",
   939 => x"098106ea",
   940 => x"3874880c",
   941 => x"863d0d04",
   942 => x"74517270",
   943 => x"84055408",
   944 => x"71708405",
   945 => x"530c7270",
   946 => x"84055408",
   947 => x"71708405",
   948 => x"530c7270",
   949 => x"84055408",
   950 => x"71708405",
   951 => x"530c7270",
   952 => x"84055408",
   953 => x"71708405",
   954 => x"530cf012",
   955 => x"52718f26",
   956 => x"c9388372",
   957 => x"27953872",
   958 => x"70840554",
   959 => x"08717084",
   960 => x"05530cfc",
   961 => x"12527183",
   962 => x"26ed3870",
   963 => x"54ff8339",
   964 => x"fb3d0d77",
   965 => x"79707207",
   966 => x"83065354",
   967 => x"52709338",
   968 => x"71737308",
   969 => x"54565471",
   970 => x"73082e80",
   971 => x"c4387375",
   972 => x"54527133",
   973 => x"7081ff06",
   974 => x"52547080",
   975 => x"2e9d3872",
   976 => x"33557075",
   977 => x"2e098106",
   978 => x"95388112",
   979 => x"81147133",
   980 => x"7081ff06",
   981 => x"54565452",
   982 => x"70e53872",
   983 => x"33557381",
   984 => x"ff067581",
   985 => x"ff067171",
   986 => x"31880c52",
   987 => x"52873d0d",
   988 => x"04710970",
   989 => x"f7fbfdff",
   990 => x"140670f8",
   991 => x"84828180",
   992 => x"06515151",
   993 => x"70973884",
   994 => x"14841671",
   995 => x"08545654",
   996 => x"7175082e",
   997 => x"dc387375",
   998 => x"5452ff96",
   999 => x"39800b88",
  1000 => x"0c873d0d",
  1001 => x"04000000",
  1002 => x"00ffffff",
  1003 => x"ff00ffff",
  1004 => x"ffff00ff",
  1005 => x"ffffff00",
  1006 => x"44485259",
  1007 => x"53544f4e",
  1008 => x"45205052",
  1009 => x"4f475241",
  1010 => x"4d2c2053",
  1011 => x"4f4d4520",
  1012 => x"53545249",
  1013 => x"4e470000",
  1014 => x"44485259",
  1015 => x"53544f4e",
  1016 => x"45205052",
  1017 => x"4f475241",
  1018 => x"4d2c2031",
  1019 => x"27535420",
  1020 => x"53545249",
  1021 => x"4e470000",
  1022 => x"44687279",
  1023 => x"73746f6e",
  1024 => x"65204265",
  1025 => x"6e63686d",
  1026 => x"61726b2c",
  1027 => x"20566572",
  1028 => x"73696f6e",
  1029 => x"20322e31",
  1030 => x"20284c61",
  1031 => x"6e677561",
  1032 => x"67653a20",
  1033 => x"43290a00",
  1034 => x"50726f67",
  1035 => x"72616d20",
  1036 => x"636f6d70",
  1037 => x"696c6564",
  1038 => x"20776974",
  1039 => x"68202772",
  1040 => x"65676973",
  1041 => x"74657227",
  1042 => x"20617474",
  1043 => x"72696275",
  1044 => x"74650a00",
  1045 => x"45786563",
  1046 => x"7574696f",
  1047 => x"6e207374",
  1048 => x"61727473",
  1049 => x"2c202564",
  1050 => x"2072756e",
  1051 => x"73207468",
  1052 => x"726f7567",
  1053 => x"68204468",
  1054 => x"72797374",
  1055 => x"6f6e650a",
  1056 => x"00000000",
  1057 => x"44485259",
  1058 => x"53544f4e",
  1059 => x"45205052",
  1060 => x"4f475241",
  1061 => x"4d2c2032",
  1062 => x"274e4420",
  1063 => x"53545249",
  1064 => x"4e470000",
  1065 => x"55736572",
  1066 => x"2074696d",
  1067 => x"653a2025",
  1068 => x"640a0000",
  1069 => x"4d696372",
  1070 => x"6f736563",
  1071 => x"6f6e6473",
  1072 => x"20666f72",
  1073 => x"206f6e65",
  1074 => x"2072756e",
  1075 => x"20746872",
  1076 => x"6f756768",
  1077 => x"20446872",
  1078 => x"7973746f",
  1079 => x"6e653a20",
  1080 => x"00000000",
  1081 => x"2564200a",
  1082 => x"00000000",
  1083 => x"44687279",
  1084 => x"73746f6e",
  1085 => x"65732070",
  1086 => x"65722053",
  1087 => x"65636f6e",
  1088 => x"643a2020",
  1089 => x"20202020",
  1090 => x"20202020",
  1091 => x"20202020",
  1092 => x"20202020",
  1093 => x"20202020",
  1094 => x"00000000",
  1095 => x"56415820",
  1096 => x"4d495053",
  1097 => x"20726174",
  1098 => x"696e6720",
  1099 => x"2a203130",
  1100 => x"3030203d",
  1101 => x"20256420",
  1102 => x"0a000000",
  1103 => x"50726f67",
  1104 => x"72616d20",
  1105 => x"636f6d70",
  1106 => x"696c6564",
  1107 => x"20776974",
  1108 => x"686f7574",
  1109 => x"20277265",
  1110 => x"67697374",
  1111 => x"65722720",
  1112 => x"61747472",
  1113 => x"69627574",
  1114 => x"650a0000",
  1115 => x"4d656173",
  1116 => x"75726564",
  1117 => x"2074696d",
  1118 => x"6520746f",
  1119 => x"6f20736d",
  1120 => x"616c6c20",
  1121 => x"746f206f",
  1122 => x"62746169",
  1123 => x"6e206d65",
  1124 => x"616e696e",
  1125 => x"6766756c",
  1126 => x"20726573",
  1127 => x"756c7473",
  1128 => x"0a000000",
  1129 => x"506c6561",
  1130 => x"73652069",
  1131 => x"6e637265",
  1132 => x"61736520",
  1133 => x"6e756d62",
  1134 => x"6572206f",
  1135 => x"66207275",
  1136 => x"6e730a00",
  1137 => x"44485259",
  1138 => x"53544f4e",
  1139 => x"45205052",
  1140 => x"4f475241",
  1141 => x"4d2c2033",
  1142 => x"27524420",
  1143 => x"53545249",
  1144 => x"4e470000",
  1145 => x"000061a8",
  1146 => x"00000000",
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
			ram(to_integer(unsigned(from_zpu.memAAddr(maxAddrBit downto 2)))) := from_zpu.memAWrite;
			to_zpu.memARead <= from_zpu.memAWrite;
		else
			to_zpu.memARead <= ram(to_integer(unsigned(from_zpu.memAAddr(maxAddrBit downto 2))));
		end if;
	end if;
end process;

process (clk)
begin
	if (clk'event and clk = '1') then
		if (from_zpu.memBWriteEnable = '1') then
			ram(to_integer(unsigned(from_zpu.memBAddr(maxAddrBit downto 2)))) := from_zpu.memBWrite;
			to_zpu.memBRead <= from_zpu.memBWrite;
		else
			to_zpu.memBRead <= ram(to_integer(unsigned(from_zpu.memBAddr(maxAddrBit downto 2))));
		end if;
	end if;
end process;


end arch;

