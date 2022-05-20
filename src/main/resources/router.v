module xbar
  (input  [19:0] func,
   input  [179:0] inport,
   output [179:0] outport);
  wire [3:0] sel0;
  wire [3:0] sel1;
  wire [3:0] sel2;
  wire [3:0] sel3;
  wire [3:0] sel4;
  wire [3:0] n182_o;
  wire [3:0] n183_o;
  wire [3:0] n184_o;
  wire [3:0] n185_o;
  wire [3:0] n186_o;
  wire [35:0] n187_o;
  wire [34:0] n188_o;
  wire n189_o;
  wire n190_o;
  wire n191_o;
  wire n192_o;
  wire n193_o;
  wire n194_o;
  wire n195_o;
  wire n196_o;
  wire n197_o;
  wire n198_o;
  wire n199_o;
  wire n200_o;
  wire n201_o;
  wire n202_o;
  wire n203_o;
  wire n204_o;
  wire n205_o;
  wire n206_o;
  wire n207_o;
  wire n208_o;
  wire n209_o;
  wire n210_o;
  wire n211_o;
  wire n212_o;
  wire n213_o;
  wire n214_o;
  wire n215_o;
  wire n216_o;
  wire n217_o;
  wire n218_o;
  wire n219_o;
  wire n220_o;
  wire n221_o;
  wire n222_o;
  wire n223_o;
  wire [3:0] n224_o;
  wire [3:0] n225_o;
  wire [3:0] n226_o;
  wire [3:0] n227_o;
  wire [3:0] n228_o;
  wire [3:0] n229_o;
  wire [3:0] n230_o;
  wire [3:0] n231_o;
  wire [2:0] n232_o;
  wire [15:0] n233_o;
  wire [15:0] n234_o;
  wire [34:0] n235_o;
  wire [34:0] n236_o;
  wire [35:0] n237_o;
  wire [34:0] n238_o;
  wire n239_o;
  wire n240_o;
  wire n241_o;
  wire n242_o;
  wire n243_o;
  wire n244_o;
  wire n245_o;
  wire n246_o;
  wire n247_o;
  wire n248_o;
  wire n249_o;
  wire n250_o;
  wire n251_o;
  wire n252_o;
  wire n253_o;
  wire n254_o;
  wire n255_o;
  wire n256_o;
  wire n257_o;
  wire n258_o;
  wire n259_o;
  wire n260_o;
  wire n261_o;
  wire n262_o;
  wire n263_o;
  wire n264_o;
  wire n265_o;
  wire n266_o;
  wire n267_o;
  wire n268_o;
  wire n269_o;
  wire n270_o;
  wire n271_o;
  wire n272_o;
  wire n273_o;
  wire [3:0] n274_o;
  wire [3:0] n275_o;
  wire [3:0] n276_o;
  wire [3:0] n277_o;
  wire [3:0] n278_o;
  wire [3:0] n279_o;
  wire [3:0] n280_o;
  wire [3:0] n281_o;
  wire [2:0] n282_o;
  wire [15:0] n283_o;
  wire [15:0] n284_o;
  wire [34:0] n285_o;
  wire [34:0] n286_o;
  wire [34:0] n287_o;
  wire [35:0] n288_o;
  wire [34:0] n289_o;
  wire n290_o;
  wire n291_o;
  wire n292_o;
  wire n293_o;
  wire n294_o;
  wire n295_o;
  wire n296_o;
  wire n297_o;
  wire n298_o;
  wire n299_o;
  wire n300_o;
  wire n301_o;
  wire n302_o;
  wire n303_o;
  wire n304_o;
  wire n305_o;
  wire n306_o;
  wire n307_o;
  wire n308_o;
  wire n309_o;
  wire n310_o;
  wire n311_o;
  wire n312_o;
  wire n313_o;
  wire n314_o;
  wire n315_o;
  wire n316_o;
  wire n317_o;
  wire n318_o;
  wire n319_o;
  wire n320_o;
  wire n321_o;
  wire n322_o;
  wire n323_o;
  wire n324_o;
  wire [3:0] n325_o;
  wire [3:0] n326_o;
  wire [3:0] n327_o;
  wire [3:0] n328_o;
  wire [3:0] n329_o;
  wire [3:0] n330_o;
  wire [3:0] n331_o;
  wire [3:0] n332_o;
  wire [2:0] n333_o;
  wire [15:0] n334_o;
  wire [15:0] n335_o;
  wire [34:0] n336_o;
  wire [34:0] n337_o;
  wire [34:0] n338_o;
  wire [35:0] n339_o;
  wire [34:0] n340_o;
  wire n341_o;
  wire n342_o;
  wire n343_o;
  wire n344_o;
  wire n345_o;
  wire n346_o;
  wire n347_o;
  wire n348_o;
  wire n349_o;
  wire n350_o;
  wire n351_o;
  wire n352_o;
  wire n353_o;
  wire n354_o;
  wire n355_o;
  wire n356_o;
  wire n357_o;
  wire n358_o;
  wire n359_o;
  wire n360_o;
  wire n361_o;
  wire n362_o;
  wire n363_o;
  wire n364_o;
  wire n365_o;
  wire n366_o;
  wire n367_o;
  wire n368_o;
  wire n369_o;
  wire n370_o;
  wire n371_o;
  wire n372_o;
  wire n373_o;
  wire n374_o;
  wire n375_o;
  wire [3:0] n376_o;
  wire [3:0] n377_o;
  wire [3:0] n378_o;
  wire [3:0] n379_o;
  wire [3:0] n380_o;
  wire [3:0] n381_o;
  wire [3:0] n382_o;
  wire [3:0] n383_o;
  wire [2:0] n384_o;
  wire [15:0] n385_o;
  wire [15:0] n386_o;
  wire [34:0] n387_o;
  wire [34:0] n388_o;
  wire [34:0] n389_o;
  wire [35:0] n390_o;
  wire [34:0] n391_o;
  wire n392_o;
  wire n393_o;
  wire n394_o;
  wire n395_o;
  wire n396_o;
  wire n397_o;
  wire n398_o;
  wire n399_o;
  wire n400_o;
  wire n401_o;
  wire n402_o;
  wire n403_o;
  wire n404_o;
  wire n405_o;
  wire n406_o;
  wire n407_o;
  wire n408_o;
  wire n409_o;
  wire n410_o;
  wire n411_o;
  wire n412_o;
  wire n413_o;
  wire n414_o;
  wire n415_o;
  wire n416_o;
  wire n417_o;
  wire n418_o;
  wire n419_o;
  wire n420_o;
  wire n421_o;
  wire n422_o;
  wire n423_o;
  wire n424_o;
  wire n425_o;
  wire n426_o;
  wire [3:0] n427_o;
  wire [3:0] n428_o;
  wire [3:0] n429_o;
  wire [3:0] n430_o;
  wire [3:0] n431_o;
  wire [3:0] n432_o;
  wire [3:0] n433_o;
  wire [3:0] n434_o;
  wire [2:0] n435_o;
  wire [15:0] n436_o;
  wire [15:0] n437_o;
  wire [34:0] n438_o;
  wire [34:0] n439_o;
  wire [35:0] n440_o;
  wire [34:0] n441_o;
  wire n442_o;
  wire n443_o;
  wire n444_o;
  wire n445_o;
  wire n446_o;
  wire n447_o;
  wire n448_o;
  wire n449_o;
  wire n450_o;
  wire n451_o;
  wire n452_o;
  wire n453_o;
  wire n454_o;
  wire n455_o;
  wire n456_o;
  wire n457_o;
  wire n458_o;
  wire n459_o;
  wire n460_o;
  wire n461_o;
  wire n462_o;
  wire n463_o;
  wire n464_o;
  wire n465_o;
  wire n466_o;
  wire n467_o;
  wire n468_o;
  wire n469_o;
  wire n470_o;
  wire n471_o;
  wire n472_o;
  wire n473_o;
  wire n474_o;
  wire n475_o;
  wire n476_o;
  wire [3:0] n477_o;
  wire [3:0] n478_o;
  wire [3:0] n479_o;
  wire [3:0] n480_o;
  wire [3:0] n481_o;
  wire [3:0] n482_o;
  wire [3:0] n483_o;
  wire [3:0] n484_o;
  wire [2:0] n485_o;
  wire [15:0] n486_o;
  wire [15:0] n487_o;
  wire [34:0] n488_o;
  wire [34:0] n489_o;
  wire [34:0] n490_o;
  wire [35:0] n491_o;
  wire [34:0] n492_o;
  wire n493_o;
  wire n494_o;
  wire n495_o;
  wire n496_o;
  wire n497_o;
  wire n498_o;
  wire n499_o;
  wire n500_o;
  wire n501_o;
  wire n502_o;
  wire n503_o;
  wire n504_o;
  wire n505_o;
  wire n506_o;
  wire n507_o;
  wire n508_o;
  wire n509_o;
  wire n510_o;
  wire n511_o;
  wire n512_o;
  wire n513_o;
  wire n514_o;
  wire n515_o;
  wire n516_o;
  wire n517_o;
  wire n518_o;
  wire n519_o;
  wire n520_o;
  wire n521_o;
  wire n522_o;
  wire n523_o;
  wire n524_o;
  wire n525_o;
  wire n526_o;
  wire n527_o;
  wire [3:0] n528_o;
  wire [3:0] n529_o;
  wire [3:0] n530_o;
  wire [3:0] n531_o;
  wire [3:0] n532_o;
  wire [3:0] n533_o;
  wire [3:0] n534_o;
  wire [3:0] n535_o;
  wire [2:0] n536_o;
  wire [15:0] n537_o;
  wire [15:0] n538_o;
  wire [34:0] n539_o;
  wire [34:0] n540_o;
  wire [34:0] n541_o;
  wire [35:0] n542_o;
  wire [34:0] n543_o;
  wire n544_o;
  wire n545_o;
  wire n546_o;
  wire n547_o;
  wire n548_o;
  wire n549_o;
  wire n550_o;
  wire n551_o;
  wire n552_o;
  wire n553_o;
  wire n554_o;
  wire n555_o;
  wire n556_o;
  wire n557_o;
  wire n558_o;
  wire n559_o;
  wire n560_o;
  wire n561_o;
  wire n562_o;
  wire n563_o;
  wire n564_o;
  wire n565_o;
  wire n566_o;
  wire n567_o;
  wire n568_o;
  wire n569_o;
  wire n570_o;
  wire n571_o;
  wire n572_o;
  wire n573_o;
  wire n574_o;
  wire n575_o;
  wire n576_o;
  wire n577_o;
  wire n578_o;
  wire [3:0] n579_o;
  wire [3:0] n580_o;
  wire [3:0] n581_o;
  wire [3:0] n582_o;
  wire [3:0] n583_o;
  wire [3:0] n584_o;
  wire [3:0] n585_o;
  wire [3:0] n586_o;
  wire [2:0] n587_o;
  wire [15:0] n588_o;
  wire [15:0] n589_o;
  wire [34:0] n590_o;
  wire [34:0] n591_o;
  wire [34:0] n592_o;
  wire [35:0] n593_o;
  wire [34:0] n594_o;
  wire n595_o;
  wire n596_o;
  wire n597_o;
  wire n598_o;
  wire n599_o;
  wire n600_o;
  wire n601_o;
  wire n602_o;
  wire n603_o;
  wire n604_o;
  wire n605_o;
  wire n606_o;
  wire n607_o;
  wire n608_o;
  wire n609_o;
  wire n610_o;
  wire n611_o;
  wire n612_o;
  wire n613_o;
  wire n614_o;
  wire n615_o;
  wire n616_o;
  wire n617_o;
  wire n618_o;
  wire n619_o;
  wire n620_o;
  wire n621_o;
  wire n622_o;
  wire n623_o;
  wire n624_o;
  wire n625_o;
  wire n626_o;
  wire n627_o;
  wire n628_o;
  wire n629_o;
  wire [3:0] n630_o;
  wire [3:0] n631_o;
  wire [3:0] n632_o;
  wire [3:0] n633_o;
  wire [3:0] n634_o;
  wire [3:0] n635_o;
  wire [3:0] n636_o;
  wire [3:0] n637_o;
  wire [2:0] n638_o;
  wire [15:0] n639_o;
  wire [15:0] n640_o;
  wire [34:0] n641_o;
  wire [34:0] n642_o;
  wire [35:0] n643_o;
  wire [34:0] n644_o;
  wire n645_o;
  wire n646_o;
  wire n647_o;
  wire n648_o;
  wire n649_o;
  wire n650_o;
  wire n651_o;
  wire n652_o;
  wire n653_o;
  wire n654_o;
  wire n655_o;
  wire n656_o;
  wire n657_o;
  wire n658_o;
  wire n659_o;
  wire n660_o;
  wire n661_o;
  wire n662_o;
  wire n663_o;
  wire n664_o;
  wire n665_o;
  wire n666_o;
  wire n667_o;
  wire n668_o;
  wire n669_o;
  wire n670_o;
  wire n671_o;
  wire n672_o;
  wire n673_o;
  wire n674_o;
  wire n675_o;
  wire n676_o;
  wire n677_o;
  wire n678_o;
  wire n679_o;
  wire [3:0] n680_o;
  wire [3:0] n681_o;
  wire [3:0] n682_o;
  wire [3:0] n683_o;
  wire [3:0] n684_o;
  wire [3:0] n685_o;
  wire [3:0] n686_o;
  wire [3:0] n687_o;
  wire [2:0] n688_o;
  wire [15:0] n689_o;
  wire [15:0] n690_o;
  wire [34:0] n691_o;
  wire [34:0] n692_o;
  wire [34:0] n693_o;
  wire [35:0] n694_o;
  wire [34:0] n695_o;
  wire n696_o;
  wire n697_o;
  wire n698_o;
  wire n699_o;
  wire n700_o;
  wire n701_o;
  wire n702_o;
  wire n703_o;
  wire n704_o;
  wire n705_o;
  wire n706_o;
  wire n707_o;
  wire n708_o;
  wire n709_o;
  wire n710_o;
  wire n711_o;
  wire n712_o;
  wire n713_o;
  wire n714_o;
  wire n715_o;
  wire n716_o;
  wire n717_o;
  wire n718_o;
  wire n719_o;
  wire n720_o;
  wire n721_o;
  wire n722_o;
  wire n723_o;
  wire n724_o;
  wire n725_o;
  wire n726_o;
  wire n727_o;
  wire n728_o;
  wire n729_o;
  wire n730_o;
  wire [3:0] n731_o;
  wire [3:0] n732_o;
  wire [3:0] n733_o;
  wire [3:0] n734_o;
  wire [3:0] n735_o;
  wire [3:0] n736_o;
  wire [3:0] n737_o;
  wire [3:0] n738_o;
  wire [2:0] n739_o;
  wire [15:0] n740_o;
  wire [15:0] n741_o;
  wire [34:0] n742_o;
  wire [34:0] n743_o;
  wire [34:0] n744_o;
  wire [35:0] n745_o;
  wire [34:0] n746_o;
  wire n747_o;
  wire n748_o;
  wire n749_o;
  wire n750_o;
  wire n751_o;
  wire n752_o;
  wire n753_o;
  wire n754_o;
  wire n755_o;
  wire n756_o;
  wire n757_o;
  wire n758_o;
  wire n759_o;
  wire n760_o;
  wire n761_o;
  wire n762_o;
  wire n763_o;
  wire n764_o;
  wire n765_o;
  wire n766_o;
  wire n767_o;
  wire n768_o;
  wire n769_o;
  wire n770_o;
  wire n771_o;
  wire n772_o;
  wire n773_o;
  wire n774_o;
  wire n775_o;
  wire n776_o;
  wire n777_o;
  wire n778_o;
  wire n779_o;
  wire n780_o;
  wire n781_o;
  wire [3:0] n782_o;
  wire [3:0] n783_o;
  wire [3:0] n784_o;
  wire [3:0] n785_o;
  wire [3:0] n786_o;
  wire [3:0] n787_o;
  wire [3:0] n788_o;
  wire [3:0] n789_o;
  wire [2:0] n790_o;
  wire [15:0] n791_o;
  wire [15:0] n792_o;
  wire [34:0] n793_o;
  wire [34:0] n794_o;
  wire [34:0] n795_o;
  wire [35:0] n796_o;
  wire [34:0] n797_o;
  wire n798_o;
  wire n799_o;
  wire n800_o;
  wire n801_o;
  wire n802_o;
  wire n803_o;
  wire n804_o;
  wire n805_o;
  wire n806_o;
  wire n807_o;
  wire n808_o;
  wire n809_o;
  wire n810_o;
  wire n811_o;
  wire n812_o;
  wire n813_o;
  wire n814_o;
  wire n815_o;
  wire n816_o;
  wire n817_o;
  wire n818_o;
  wire n819_o;
  wire n820_o;
  wire n821_o;
  wire n822_o;
  wire n823_o;
  wire n824_o;
  wire n825_o;
  wire n826_o;
  wire n827_o;
  wire n828_o;
  wire n829_o;
  wire n830_o;
  wire n831_o;
  wire n832_o;
  wire [3:0] n833_o;
  wire [3:0] n834_o;
  wire [3:0] n835_o;
  wire [3:0] n836_o;
  wire [3:0] n837_o;
  wire [3:0] n838_o;
  wire [3:0] n839_o;
  wire [3:0] n840_o;
  wire [2:0] n841_o;
  wire [15:0] n842_o;
  wire [15:0] n843_o;
  wire [34:0] n844_o;
  wire [34:0] n845_o;
  wire [35:0] n846_o;
  wire [34:0] n847_o;
  wire n848_o;
  wire n849_o;
  wire n850_o;
  wire n851_o;
  wire n852_o;
  wire n853_o;
  wire n854_o;
  wire n855_o;
  wire n856_o;
  wire n857_o;
  wire n858_o;
  wire n859_o;
  wire n860_o;
  wire n861_o;
  wire n862_o;
  wire n863_o;
  wire n864_o;
  wire n865_o;
  wire n866_o;
  wire n867_o;
  wire n868_o;
  wire n869_o;
  wire n870_o;
  wire n871_o;
  wire n872_o;
  wire n873_o;
  wire n874_o;
  wire n875_o;
  wire n876_o;
  wire n877_o;
  wire n878_o;
  wire n879_o;
  wire n880_o;
  wire n881_o;
  wire n882_o;
  wire [3:0] n883_o;
  wire [3:0] n884_o;
  wire [3:0] n885_o;
  wire [3:0] n886_o;
  wire [3:0] n887_o;
  wire [3:0] n888_o;
  wire [3:0] n889_o;
  wire [3:0] n890_o;
  wire [2:0] n891_o;
  wire [15:0] n892_o;
  wire [15:0] n893_o;
  wire [34:0] n894_o;
  wire [34:0] n895_o;
  wire [34:0] n896_o;
  wire [35:0] n897_o;
  wire [34:0] n898_o;
  wire n899_o;
  wire n900_o;
  wire n901_o;
  wire n902_o;
  wire n903_o;
  wire n904_o;
  wire n905_o;
  wire n906_o;
  wire n907_o;
  wire n908_o;
  wire n909_o;
  wire n910_o;
  wire n911_o;
  wire n912_o;
  wire n913_o;
  wire n914_o;
  wire n915_o;
  wire n916_o;
  wire n917_o;
  wire n918_o;
  wire n919_o;
  wire n920_o;
  wire n921_o;
  wire n922_o;
  wire n923_o;
  wire n924_o;
  wire n925_o;
  wire n926_o;
  wire n927_o;
  wire n928_o;
  wire n929_o;
  wire n930_o;
  wire n931_o;
  wire n932_o;
  wire n933_o;
  wire [3:0] n934_o;
  wire [3:0] n935_o;
  wire [3:0] n936_o;
  wire [3:0] n937_o;
  wire [3:0] n938_o;
  wire [3:0] n939_o;
  wire [3:0] n940_o;
  wire [3:0] n941_o;
  wire [2:0] n942_o;
  wire [15:0] n943_o;
  wire [15:0] n944_o;
  wire [34:0] n945_o;
  wire [34:0] n946_o;
  wire [34:0] n947_o;
  wire [35:0] n948_o;
  wire [34:0] n949_o;
  wire n950_o;
  wire n951_o;
  wire n952_o;
  wire n953_o;
  wire n954_o;
  wire n955_o;
  wire n956_o;
  wire n957_o;
  wire n958_o;
  wire n959_o;
  wire n960_o;
  wire n961_o;
  wire n962_o;
  wire n963_o;
  wire n964_o;
  wire n965_o;
  wire n966_o;
  wire n967_o;
  wire n968_o;
  wire n969_o;
  wire n970_o;
  wire n971_o;
  wire n972_o;
  wire n973_o;
  wire n974_o;
  wire n975_o;
  wire n976_o;
  wire n977_o;
  wire n978_o;
  wire n979_o;
  wire n980_o;
  wire n981_o;
  wire n982_o;
  wire n983_o;
  wire n984_o;
  wire [3:0] n985_o;
  wire [3:0] n986_o;
  wire [3:0] n987_o;
  wire [3:0] n988_o;
  wire [3:0] n989_o;
  wire [3:0] n990_o;
  wire [3:0] n991_o;
  wire [3:0] n992_o;
  wire [2:0] n993_o;
  wire [15:0] n994_o;
  wire [15:0] n995_o;
  wire [34:0] n996_o;
  wire [34:0] n997_o;
  wire [34:0] n998_o;
  wire [35:0] n999_o;
  wire [34:0] n1000_o;
  wire n1001_o;
  wire n1002_o;
  wire n1003_o;
  wire n1004_o;
  wire n1005_o;
  wire n1006_o;
  wire n1007_o;
  wire n1008_o;
  wire n1009_o;
  wire n1010_o;
  wire n1011_o;
  wire n1012_o;
  wire n1013_o;
  wire n1014_o;
  wire n1015_o;
  wire n1016_o;
  wire n1017_o;
  wire n1018_o;
  wire n1019_o;
  wire n1020_o;
  wire n1021_o;
  wire n1022_o;
  wire n1023_o;
  wire n1024_o;
  wire n1025_o;
  wire n1026_o;
  wire n1027_o;
  wire n1028_o;
  wire n1029_o;
  wire n1030_o;
  wire n1031_o;
  wire n1032_o;
  wire n1033_o;
  wire n1034_o;
  wire n1035_o;
  wire [3:0] n1036_o;
  wire [3:0] n1037_o;
  wire [3:0] n1038_o;
  wire [3:0] n1039_o;
  wire [3:0] n1040_o;
  wire [3:0] n1041_o;
  wire [3:0] n1042_o;
  wire [3:0] n1043_o;
  wire [2:0] n1044_o;
  wire [15:0] n1045_o;
  wire [15:0] n1046_o;
  wire [34:0] n1047_o;
  wire [34:0] n1048_o;
  wire [35:0] n1049_o;
  wire [34:0] n1050_o;
  wire n1051_o;
  wire n1052_o;
  wire n1053_o;
  wire n1054_o;
  wire n1055_o;
  wire n1056_o;
  wire n1057_o;
  wire n1058_o;
  wire n1059_o;
  wire n1060_o;
  wire n1061_o;
  wire n1062_o;
  wire n1063_o;
  wire n1064_o;
  wire n1065_o;
  wire n1066_o;
  wire n1067_o;
  wire n1068_o;
  wire n1069_o;
  wire n1070_o;
  wire n1071_o;
  wire n1072_o;
  wire n1073_o;
  wire n1074_o;
  wire n1075_o;
  wire n1076_o;
  wire n1077_o;
  wire n1078_o;
  wire n1079_o;
  wire n1080_o;
  wire n1081_o;
  wire n1082_o;
  wire n1083_o;
  wire n1084_o;
  wire n1085_o;
  wire [3:0] n1086_o;
  wire [3:0] n1087_o;
  wire [3:0] n1088_o;
  wire [3:0] n1089_o;
  wire [3:0] n1090_o;
  wire [3:0] n1091_o;
  wire [3:0] n1092_o;
  wire [3:0] n1093_o;
  wire [2:0] n1094_o;
  wire [15:0] n1095_o;
  wire [15:0] n1096_o;
  wire [34:0] n1097_o;
  wire [34:0] n1098_o;
  wire [34:0] n1099_o;
  wire [35:0] n1100_o;
  wire [34:0] n1101_o;
  wire n1102_o;
  wire n1103_o;
  wire n1104_o;
  wire n1105_o;
  wire n1106_o;
  wire n1107_o;
  wire n1108_o;
  wire n1109_o;
  wire n1110_o;
  wire n1111_o;
  wire n1112_o;
  wire n1113_o;
  wire n1114_o;
  wire n1115_o;
  wire n1116_o;
  wire n1117_o;
  wire n1118_o;
  wire n1119_o;
  wire n1120_o;
  wire n1121_o;
  wire n1122_o;
  wire n1123_o;
  wire n1124_o;
  wire n1125_o;
  wire n1126_o;
  wire n1127_o;
  wire n1128_o;
  wire n1129_o;
  wire n1130_o;
  wire n1131_o;
  wire n1132_o;
  wire n1133_o;
  wire n1134_o;
  wire n1135_o;
  wire n1136_o;
  wire [3:0] n1137_o;
  wire [3:0] n1138_o;
  wire [3:0] n1139_o;
  wire [3:0] n1140_o;
  wire [3:0] n1141_o;
  wire [3:0] n1142_o;
  wire [3:0] n1143_o;
  wire [3:0] n1144_o;
  wire [2:0] n1145_o;
  wire [15:0] n1146_o;
  wire [15:0] n1147_o;
  wire [34:0] n1148_o;
  wire [34:0] n1149_o;
  wire [34:0] n1150_o;
  wire [35:0] n1151_o;
  wire [34:0] n1152_o;
  wire n1153_o;
  wire n1154_o;
  wire n1155_o;
  wire n1156_o;
  wire n1157_o;
  wire n1158_o;
  wire n1159_o;
  wire n1160_o;
  wire n1161_o;
  wire n1162_o;
  wire n1163_o;
  wire n1164_o;
  wire n1165_o;
  wire n1166_o;
  wire n1167_o;
  wire n1168_o;
  wire n1169_o;
  wire n1170_o;
  wire n1171_o;
  wire n1172_o;
  wire n1173_o;
  wire n1174_o;
  wire n1175_o;
  wire n1176_o;
  wire n1177_o;
  wire n1178_o;
  wire n1179_o;
  wire n1180_o;
  wire n1181_o;
  wire n1182_o;
  wire n1183_o;
  wire n1184_o;
  wire n1185_o;
  wire n1186_o;
  wire n1187_o;
  wire [3:0] n1188_o;
  wire [3:0] n1189_o;
  wire [3:0] n1190_o;
  wire [3:0] n1191_o;
  wire [3:0] n1192_o;
  wire [3:0] n1193_o;
  wire [3:0] n1194_o;
  wire [3:0] n1195_o;
  wire [2:0] n1196_o;
  wire [15:0] n1197_o;
  wire [15:0] n1198_o;
  wire [34:0] n1199_o;
  wire [34:0] n1200_o;
  wire [34:0] n1201_o;
  wire [179:0] n1207_o;
  assign outport = n1207_o;
  /* routers/synchronous/xbar.vhd:59:16  */
  assign sel0 = n182_o; // (signal)
  /* routers/synchronous/xbar.vhd:59:22  */
  assign sel1 = n183_o; // (signal)
  /* routers/synchronous/xbar.vhd:59:28  */
  assign sel2 = n184_o; // (signal)
  /* routers/synchronous/xbar.vhd:59:34  */
  assign sel3 = n185_o; // (signal)
  /* routers/synchronous/xbar.vhd:59:40  */
  assign sel4 = n186_o; // (signal)
  /* routers/synchronous/xbar.vhd:61:21  */
  assign n182_o = func[3:0];
  /* routers/synchronous/xbar.vhd:62:21  */
  assign n183_o = func[7:4];
  /* routers/synchronous/xbar.vhd:63:21  */
  assign n184_o = func[11:8];
  /* routers/synchronous/xbar.vhd:64:21  */
  assign n185_o = func[15:12];
  /* routers/synchronous/xbar.vhd:65:21  */
  assign n186_o = func[19:16];
  /* routers/synchronous/xbar.vhd:67:35  */
  assign n187_o = inport[71:36];
  /* routers/synchronous/xbar.vhd:67:39  */
  assign n188_o = n187_o[35:1];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n189_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n190_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n191_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n192_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n193_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n194_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n195_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n196_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n197_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n198_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n199_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n200_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n201_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n202_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n203_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n204_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n205_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n206_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n207_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n208_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n209_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n210_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n211_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n212_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n213_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n214_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n215_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n216_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n217_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n218_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n219_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n220_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n221_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n222_o = sel1[0];
  /* routers/synchronous/xbar.vhd:67:67  */
  assign n223_o = sel1[0];
  assign n224_o = {n223_o, n222_o, n221_o, n220_o};
  assign n225_o = {n219_o, n218_o, n217_o, n216_o};
  assign n226_o = {n215_o, n214_o, n213_o, n212_o};
  assign n227_o = {n211_o, n210_o, n209_o, n208_o};
  assign n228_o = {n207_o, n206_o, n205_o, n204_o};
  assign n229_o = {n203_o, n202_o, n201_o, n200_o};
  assign n230_o = {n199_o, n198_o, n197_o, n196_o};
  assign n231_o = {n195_o, n194_o, n193_o, n192_o};
  assign n232_o = {n191_o, n190_o, n189_o};
  assign n233_o = {n224_o, n225_o, n226_o, n227_o};
  assign n234_o = {n228_o, n229_o, n230_o, n231_o};
  assign n235_o = {n233_o, n234_o, n232_o};
  /* routers/synchronous/xbar.vhd:67:44  */
  assign n236_o = n188_o & n235_o;
  /* routers/synchronous/xbar.vhd:68:42  */
  assign n237_o = inport[107:72];
  /* routers/synchronous/xbar.vhd:68:46  */
  assign n238_o = n237_o[35:1];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n239_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n240_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n241_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n242_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n243_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n244_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n245_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n246_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n247_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n248_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n249_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n250_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n251_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n252_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n253_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n254_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n255_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n256_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n257_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n258_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n259_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n260_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n261_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n262_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n263_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n264_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n265_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n266_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n267_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n268_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n269_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n270_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n271_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n272_o = sel2[0];
  /* routers/synchronous/xbar.vhd:68:74  */
  assign n273_o = sel2[0];
  assign n274_o = {n273_o, n272_o, n271_o, n270_o};
  assign n275_o = {n269_o, n268_o, n267_o, n266_o};
  assign n276_o = {n265_o, n264_o, n263_o, n262_o};
  assign n277_o = {n261_o, n260_o, n259_o, n258_o};
  assign n278_o = {n257_o, n256_o, n255_o, n254_o};
  assign n279_o = {n253_o, n252_o, n251_o, n250_o};
  assign n280_o = {n249_o, n248_o, n247_o, n246_o};
  assign n281_o = {n245_o, n244_o, n243_o, n242_o};
  assign n282_o = {n241_o, n240_o, n239_o};
  assign n283_o = {n274_o, n275_o, n276_o, n277_o};
  assign n284_o = {n278_o, n279_o, n280_o, n281_o};
  assign n285_o = {n283_o, n284_o, n282_o};
  /* routers/synchronous/xbar.vhd:68:51  */
  assign n286_o = n238_o & n285_o;
  /* routers/synchronous/xbar.vhd:67:73  */
  assign n287_o = n236_o | n286_o;
  /* routers/synchronous/xbar.vhd:69:42  */
  assign n288_o = inport[143:108];
  /* routers/synchronous/xbar.vhd:69:46  */
  assign n289_o = n288_o[35:1];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n290_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n291_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n292_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n293_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n294_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n295_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n296_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n297_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n298_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n299_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n300_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n301_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n302_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n303_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n304_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n305_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n306_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n307_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n308_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n309_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n310_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n311_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n312_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n313_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n314_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n315_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n316_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n317_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n318_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n319_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n320_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n321_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n322_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n323_o = sel3[0];
  /* routers/synchronous/xbar.vhd:69:74  */
  assign n324_o = sel3[0];
  assign n325_o = {n324_o, n323_o, n322_o, n321_o};
  assign n326_o = {n320_o, n319_o, n318_o, n317_o};
  assign n327_o = {n316_o, n315_o, n314_o, n313_o};
  assign n328_o = {n312_o, n311_o, n310_o, n309_o};
  assign n329_o = {n308_o, n307_o, n306_o, n305_o};
  assign n330_o = {n304_o, n303_o, n302_o, n301_o};
  assign n331_o = {n300_o, n299_o, n298_o, n297_o};
  assign n332_o = {n296_o, n295_o, n294_o, n293_o};
  assign n333_o = {n292_o, n291_o, n290_o};
  assign n334_o = {n325_o, n326_o, n327_o, n328_o};
  assign n335_o = {n329_o, n330_o, n331_o, n332_o};
  assign n336_o = {n334_o, n335_o, n333_o};
  /* routers/synchronous/xbar.vhd:69:51  */
  assign n337_o = n289_o & n336_o;
  /* routers/synchronous/xbar.vhd:68:80  */
  assign n338_o = n287_o | n337_o;
  /* routers/synchronous/xbar.vhd:70:42  */
  assign n339_o = inport[179:144];
  /* routers/synchronous/xbar.vhd:70:46  */
  assign n340_o = n339_o[35:1];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n341_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n342_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n343_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n344_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n345_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n346_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n347_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n348_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n349_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n350_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n351_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n352_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n353_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n354_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n355_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n356_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n357_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n358_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n359_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n360_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n361_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n362_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n363_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n364_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n365_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n366_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n367_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n368_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n369_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n370_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n371_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n372_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n373_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n374_o = sel4[0];
  /* routers/synchronous/xbar.vhd:70:74  */
  assign n375_o = sel4[0];
  assign n376_o = {n375_o, n374_o, n373_o, n372_o};
  assign n377_o = {n371_o, n370_o, n369_o, n368_o};
  assign n378_o = {n367_o, n366_o, n365_o, n364_o};
  assign n379_o = {n363_o, n362_o, n361_o, n360_o};
  assign n380_o = {n359_o, n358_o, n357_o, n356_o};
  assign n381_o = {n355_o, n354_o, n353_o, n352_o};
  assign n382_o = {n351_o, n350_o, n349_o, n348_o};
  assign n383_o = {n347_o, n346_o, n345_o, n344_o};
  assign n384_o = {n343_o, n342_o, n341_o};
  assign n385_o = {n376_o, n377_o, n378_o, n379_o};
  assign n386_o = {n380_o, n381_o, n382_o, n383_o};
  assign n387_o = {n385_o, n386_o, n384_o};
  /* routers/synchronous/xbar.vhd:70:51  */
  assign n388_o = n340_o & n387_o;
  /* routers/synchronous/xbar.vhd:69:80  */
  assign n389_o = n338_o | n388_o;
  /* routers/synchronous/xbar.vhd:71:35  */
  assign n390_o = inport[35:0];
  /* routers/synchronous/xbar.vhd:71:39  */
  assign n391_o = n390_o[35:1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n392_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n393_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n394_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n395_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n396_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n397_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n398_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n399_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n400_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n401_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n402_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n403_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n404_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n405_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n406_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n407_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n408_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n409_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n410_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n411_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n412_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n413_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n414_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n415_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n416_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n417_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n418_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n419_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n420_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n421_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n422_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n423_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n424_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n425_o = sel0[1];
  /* routers/synchronous/xbar.vhd:71:67  */
  assign n426_o = sel0[1];
  assign n427_o = {n426_o, n425_o, n424_o, n423_o};
  assign n428_o = {n422_o, n421_o, n420_o, n419_o};
  assign n429_o = {n418_o, n417_o, n416_o, n415_o};
  assign n430_o = {n414_o, n413_o, n412_o, n411_o};
  assign n431_o = {n410_o, n409_o, n408_o, n407_o};
  assign n432_o = {n406_o, n405_o, n404_o, n403_o};
  assign n433_o = {n402_o, n401_o, n400_o, n399_o};
  assign n434_o = {n398_o, n397_o, n396_o, n395_o};
  assign n435_o = {n394_o, n393_o, n392_o};
  assign n436_o = {n427_o, n428_o, n429_o, n430_o};
  assign n437_o = {n431_o, n432_o, n433_o, n434_o};
  assign n438_o = {n436_o, n437_o, n435_o};
  /* routers/synchronous/xbar.vhd:71:44  */
  assign n439_o = n391_o & n438_o;
  /* routers/synchronous/xbar.vhd:72:42  */
  assign n440_o = inport[107:72];
  /* routers/synchronous/xbar.vhd:72:46  */
  assign n441_o = n440_o[35:1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n442_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n443_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n444_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n445_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n446_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n447_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n448_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n449_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n450_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n451_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n452_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n453_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n454_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n455_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n456_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n457_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n458_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n459_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n460_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n461_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n462_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n463_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n464_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n465_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n466_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n467_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n468_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n469_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n470_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n471_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n472_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n473_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n474_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n475_o = sel2[1];
  /* routers/synchronous/xbar.vhd:72:74  */
  assign n476_o = sel2[1];
  assign n477_o = {n476_o, n475_o, n474_o, n473_o};
  assign n478_o = {n472_o, n471_o, n470_o, n469_o};
  assign n479_o = {n468_o, n467_o, n466_o, n465_o};
  assign n480_o = {n464_o, n463_o, n462_o, n461_o};
  assign n481_o = {n460_o, n459_o, n458_o, n457_o};
  assign n482_o = {n456_o, n455_o, n454_o, n453_o};
  assign n483_o = {n452_o, n451_o, n450_o, n449_o};
  assign n484_o = {n448_o, n447_o, n446_o, n445_o};
  assign n485_o = {n444_o, n443_o, n442_o};
  assign n486_o = {n477_o, n478_o, n479_o, n480_o};
  assign n487_o = {n481_o, n482_o, n483_o, n484_o};
  assign n488_o = {n486_o, n487_o, n485_o};
  /* routers/synchronous/xbar.vhd:72:51  */
  assign n489_o = n441_o & n488_o;
  /* routers/synchronous/xbar.vhd:71:73  */
  assign n490_o = n439_o | n489_o;
  /* routers/synchronous/xbar.vhd:73:42  */
  assign n491_o = inport[143:108];
  /* routers/synchronous/xbar.vhd:73:46  */
  assign n492_o = n491_o[35:1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n493_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n494_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n495_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n496_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n497_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n498_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n499_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n500_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n501_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n502_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n503_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n504_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n505_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n506_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n507_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n508_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n509_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n510_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n511_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n512_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n513_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n514_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n515_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n516_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n517_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n518_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n519_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n520_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n521_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n522_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n523_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n524_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n525_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n526_o = sel3[1];
  /* routers/synchronous/xbar.vhd:73:74  */
  assign n527_o = sel3[1];
  assign n528_o = {n527_o, n526_o, n525_o, n524_o};
  assign n529_o = {n523_o, n522_o, n521_o, n520_o};
  assign n530_o = {n519_o, n518_o, n517_o, n516_o};
  assign n531_o = {n515_o, n514_o, n513_o, n512_o};
  assign n532_o = {n511_o, n510_o, n509_o, n508_o};
  assign n533_o = {n507_o, n506_o, n505_o, n504_o};
  assign n534_o = {n503_o, n502_o, n501_o, n500_o};
  assign n535_o = {n499_o, n498_o, n497_o, n496_o};
  assign n536_o = {n495_o, n494_o, n493_o};
  assign n537_o = {n528_o, n529_o, n530_o, n531_o};
  assign n538_o = {n532_o, n533_o, n534_o, n535_o};
  assign n539_o = {n537_o, n538_o, n536_o};
  /* routers/synchronous/xbar.vhd:73:51  */
  assign n540_o = n492_o & n539_o;
  /* routers/synchronous/xbar.vhd:72:80  */
  assign n541_o = n490_o | n540_o;
  /* routers/synchronous/xbar.vhd:74:42  */
  assign n542_o = inport[179:144];
  /* routers/synchronous/xbar.vhd:74:46  */
  assign n543_o = n542_o[35:1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n544_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n545_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n546_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n547_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n548_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n549_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n550_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n551_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n552_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n553_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n554_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n555_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n556_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n557_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n558_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n559_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n560_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n561_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n562_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n563_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n564_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n565_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n566_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n567_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n568_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n569_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n570_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n571_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n572_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n573_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n574_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n575_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n576_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n577_o = sel4[1];
  /* routers/synchronous/xbar.vhd:74:74  */
  assign n578_o = sel4[1];
  assign n579_o = {n578_o, n577_o, n576_o, n575_o};
  assign n580_o = {n574_o, n573_o, n572_o, n571_o};
  assign n581_o = {n570_o, n569_o, n568_o, n567_o};
  assign n582_o = {n566_o, n565_o, n564_o, n563_o};
  assign n583_o = {n562_o, n561_o, n560_o, n559_o};
  assign n584_o = {n558_o, n557_o, n556_o, n555_o};
  assign n585_o = {n554_o, n553_o, n552_o, n551_o};
  assign n586_o = {n550_o, n549_o, n548_o, n547_o};
  assign n587_o = {n546_o, n545_o, n544_o};
  assign n588_o = {n579_o, n580_o, n581_o, n582_o};
  assign n589_o = {n583_o, n584_o, n585_o, n586_o};
  assign n590_o = {n588_o, n589_o, n587_o};
  /* routers/synchronous/xbar.vhd:74:51  */
  assign n591_o = n543_o & n590_o;
  /* routers/synchronous/xbar.vhd:73:80  */
  assign n592_o = n541_o | n591_o;
  /* routers/synchronous/xbar.vhd:75:35  */
  assign n593_o = inport[35:0];
  /* routers/synchronous/xbar.vhd:75:39  */
  assign n594_o = n593_o[35:1];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n595_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n596_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n597_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n598_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n599_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n600_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n601_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n602_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n603_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n604_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n605_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n606_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n607_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n608_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n609_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n610_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n611_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n612_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n613_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n614_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n615_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n616_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n617_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n618_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n619_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n620_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n621_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n622_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n623_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n624_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n625_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n626_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n627_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n628_o = sel0[2];
  /* routers/synchronous/xbar.vhd:75:67  */
  assign n629_o = sel0[2];
  assign n630_o = {n629_o, n628_o, n627_o, n626_o};
  assign n631_o = {n625_o, n624_o, n623_o, n622_o};
  assign n632_o = {n621_o, n620_o, n619_o, n618_o};
  assign n633_o = {n617_o, n616_o, n615_o, n614_o};
  assign n634_o = {n613_o, n612_o, n611_o, n610_o};
  assign n635_o = {n609_o, n608_o, n607_o, n606_o};
  assign n636_o = {n605_o, n604_o, n603_o, n602_o};
  assign n637_o = {n601_o, n600_o, n599_o, n598_o};
  assign n638_o = {n597_o, n596_o, n595_o};
  assign n639_o = {n630_o, n631_o, n632_o, n633_o};
  assign n640_o = {n634_o, n635_o, n636_o, n637_o};
  assign n641_o = {n639_o, n640_o, n638_o};
  /* routers/synchronous/xbar.vhd:75:44  */
  assign n642_o = n594_o & n641_o;
  /* routers/synchronous/xbar.vhd:76:42  */
  assign n643_o = inport[71:36];
  /* routers/synchronous/xbar.vhd:76:46  */
  assign n644_o = n643_o[35:1];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n645_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n646_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n647_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n648_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n649_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n650_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n651_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n652_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n653_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n654_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n655_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n656_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n657_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n658_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n659_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n660_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n661_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n662_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n663_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n664_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n665_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n666_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n667_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n668_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n669_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n670_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n671_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n672_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n673_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n674_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n675_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n676_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n677_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n678_o = sel1[2];
  /* routers/synchronous/xbar.vhd:76:74  */
  assign n679_o = sel1[2];
  assign n680_o = {n679_o, n678_o, n677_o, n676_o};
  assign n681_o = {n675_o, n674_o, n673_o, n672_o};
  assign n682_o = {n671_o, n670_o, n669_o, n668_o};
  assign n683_o = {n667_o, n666_o, n665_o, n664_o};
  assign n684_o = {n663_o, n662_o, n661_o, n660_o};
  assign n685_o = {n659_o, n658_o, n657_o, n656_o};
  assign n686_o = {n655_o, n654_o, n653_o, n652_o};
  assign n687_o = {n651_o, n650_o, n649_o, n648_o};
  assign n688_o = {n647_o, n646_o, n645_o};
  assign n689_o = {n680_o, n681_o, n682_o, n683_o};
  assign n690_o = {n684_o, n685_o, n686_o, n687_o};
  assign n691_o = {n689_o, n690_o, n688_o};
  /* routers/synchronous/xbar.vhd:76:51  */
  assign n692_o = n644_o & n691_o;
  /* routers/synchronous/xbar.vhd:75:73  */
  assign n693_o = n642_o | n692_o;
  /* routers/synchronous/xbar.vhd:77:42  */
  assign n694_o = inport[143:108];
  /* routers/synchronous/xbar.vhd:77:46  */
  assign n695_o = n694_o[35:1];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n696_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n697_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n698_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n699_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n700_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n701_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n702_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n703_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n704_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n705_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n706_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n707_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n708_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n709_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n710_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n711_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n712_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n713_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n714_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n715_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n716_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n717_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n718_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n719_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n720_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n721_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n722_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n723_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n724_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n725_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n726_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n727_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n728_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n729_o = sel3[2];
  /* routers/synchronous/xbar.vhd:77:74  */
  assign n730_o = sel3[2];
  assign n731_o = {n730_o, n729_o, n728_o, n727_o};
  assign n732_o = {n726_o, n725_o, n724_o, n723_o};
  assign n733_o = {n722_o, n721_o, n720_o, n719_o};
  assign n734_o = {n718_o, n717_o, n716_o, n715_o};
  assign n735_o = {n714_o, n713_o, n712_o, n711_o};
  assign n736_o = {n710_o, n709_o, n708_o, n707_o};
  assign n737_o = {n706_o, n705_o, n704_o, n703_o};
  assign n738_o = {n702_o, n701_o, n700_o, n699_o};
  assign n739_o = {n698_o, n697_o, n696_o};
  assign n740_o = {n731_o, n732_o, n733_o, n734_o};
  assign n741_o = {n735_o, n736_o, n737_o, n738_o};
  assign n742_o = {n740_o, n741_o, n739_o};
  /* routers/synchronous/xbar.vhd:77:51  */
  assign n743_o = n695_o & n742_o;
  /* routers/synchronous/xbar.vhd:76:80  */
  assign n744_o = n693_o | n743_o;
  /* routers/synchronous/xbar.vhd:78:42  */
  assign n745_o = inport[179:144];
  /* routers/synchronous/xbar.vhd:78:46  */
  assign n746_o = n745_o[35:1];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n747_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n748_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n749_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n750_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n751_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n752_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n753_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n754_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n755_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n756_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n757_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n758_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n759_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n760_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n761_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n762_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n763_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n764_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n765_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n766_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n767_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n768_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n769_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n770_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n771_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n772_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n773_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n774_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n775_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n776_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n777_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n778_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n779_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n780_o = sel4[2];
  /* routers/synchronous/xbar.vhd:78:74  */
  assign n781_o = sel4[2];
  assign n782_o = {n781_o, n780_o, n779_o, n778_o};
  assign n783_o = {n777_o, n776_o, n775_o, n774_o};
  assign n784_o = {n773_o, n772_o, n771_o, n770_o};
  assign n785_o = {n769_o, n768_o, n767_o, n766_o};
  assign n786_o = {n765_o, n764_o, n763_o, n762_o};
  assign n787_o = {n761_o, n760_o, n759_o, n758_o};
  assign n788_o = {n757_o, n756_o, n755_o, n754_o};
  assign n789_o = {n753_o, n752_o, n751_o, n750_o};
  assign n790_o = {n749_o, n748_o, n747_o};
  assign n791_o = {n782_o, n783_o, n784_o, n785_o};
  assign n792_o = {n786_o, n787_o, n788_o, n789_o};
  assign n793_o = {n791_o, n792_o, n790_o};
  /* routers/synchronous/xbar.vhd:78:51  */
  assign n794_o = n746_o & n793_o;
  /* routers/synchronous/xbar.vhd:77:80  */
  assign n795_o = n744_o | n794_o;
  /* routers/synchronous/xbar.vhd:79:35  */
  assign n796_o = inport[35:0];
  /* routers/synchronous/xbar.vhd:79:39  */
  assign n797_o = n796_o[35:1];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n798_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n799_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n800_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n801_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n802_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n803_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n804_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n805_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n806_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n807_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n808_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n809_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n810_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n811_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n812_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n813_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n814_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n815_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n816_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n817_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n818_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n819_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n820_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n821_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n822_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n823_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n824_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n825_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n826_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n827_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n828_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n829_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n830_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n831_o = sel0[3];
  /* routers/synchronous/xbar.vhd:79:67  */
  assign n832_o = sel0[3];
  assign n833_o = {n832_o, n831_o, n830_o, n829_o};
  assign n834_o = {n828_o, n827_o, n826_o, n825_o};
  assign n835_o = {n824_o, n823_o, n822_o, n821_o};
  assign n836_o = {n820_o, n819_o, n818_o, n817_o};
  assign n837_o = {n816_o, n815_o, n814_o, n813_o};
  assign n838_o = {n812_o, n811_o, n810_o, n809_o};
  assign n839_o = {n808_o, n807_o, n806_o, n805_o};
  assign n840_o = {n804_o, n803_o, n802_o, n801_o};
  assign n841_o = {n800_o, n799_o, n798_o};
  assign n842_o = {n833_o, n834_o, n835_o, n836_o};
  assign n843_o = {n837_o, n838_o, n839_o, n840_o};
  assign n844_o = {n842_o, n843_o, n841_o};
  /* routers/synchronous/xbar.vhd:79:44  */
  assign n845_o = n797_o & n844_o;
  /* routers/synchronous/xbar.vhd:80:42  */
  assign n846_o = inport[71:36];
  /* routers/synchronous/xbar.vhd:80:46  */
  assign n847_o = n846_o[35:1];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n848_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n849_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n850_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n851_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n852_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n853_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n854_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n855_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n856_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n857_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n858_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n859_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n860_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n861_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n862_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n863_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n864_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n865_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n866_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n867_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n868_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n869_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n870_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n871_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n872_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n873_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n874_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n875_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n876_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n877_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n878_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n879_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n880_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n881_o = sel1[3];
  /* routers/synchronous/xbar.vhd:80:74  */
  assign n882_o = sel1[3];
  assign n883_o = {n882_o, n881_o, n880_o, n879_o};
  assign n884_o = {n878_o, n877_o, n876_o, n875_o};
  assign n885_o = {n874_o, n873_o, n872_o, n871_o};
  assign n886_o = {n870_o, n869_o, n868_o, n867_o};
  assign n887_o = {n866_o, n865_o, n864_o, n863_o};
  assign n888_o = {n862_o, n861_o, n860_o, n859_o};
  assign n889_o = {n858_o, n857_o, n856_o, n855_o};
  assign n890_o = {n854_o, n853_o, n852_o, n851_o};
  assign n891_o = {n850_o, n849_o, n848_o};
  assign n892_o = {n883_o, n884_o, n885_o, n886_o};
  assign n893_o = {n887_o, n888_o, n889_o, n890_o};
  assign n894_o = {n892_o, n893_o, n891_o};
  /* routers/synchronous/xbar.vhd:80:51  */
  assign n895_o = n847_o & n894_o;
  /* routers/synchronous/xbar.vhd:79:73  */
  assign n896_o = n845_o | n895_o;
  /* routers/synchronous/xbar.vhd:81:42  */
  assign n897_o = inport[107:72];
  /* routers/synchronous/xbar.vhd:81:46  */
  assign n898_o = n897_o[35:1];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n899_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n900_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n901_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n902_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n903_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n904_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n905_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n906_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n907_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n908_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n909_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n910_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n911_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n912_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n913_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n914_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n915_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n916_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n917_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n918_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n919_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n920_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n921_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n922_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n923_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n924_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n925_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n926_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n927_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n928_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n929_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n930_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n931_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n932_o = sel2[3];
  /* routers/synchronous/xbar.vhd:81:74  */
  assign n933_o = sel2[3];
  assign n934_o = {n933_o, n932_o, n931_o, n930_o};
  assign n935_o = {n929_o, n928_o, n927_o, n926_o};
  assign n936_o = {n925_o, n924_o, n923_o, n922_o};
  assign n937_o = {n921_o, n920_o, n919_o, n918_o};
  assign n938_o = {n917_o, n916_o, n915_o, n914_o};
  assign n939_o = {n913_o, n912_o, n911_o, n910_o};
  assign n940_o = {n909_o, n908_o, n907_o, n906_o};
  assign n941_o = {n905_o, n904_o, n903_o, n902_o};
  assign n942_o = {n901_o, n900_o, n899_o};
  assign n943_o = {n934_o, n935_o, n936_o, n937_o};
  assign n944_o = {n938_o, n939_o, n940_o, n941_o};
  assign n945_o = {n943_o, n944_o, n942_o};
  /* routers/synchronous/xbar.vhd:81:51  */
  assign n946_o = n898_o & n945_o;
  /* routers/synchronous/xbar.vhd:80:80  */
  assign n947_o = n896_o | n946_o;
  /* routers/synchronous/xbar.vhd:82:42  */
  assign n948_o = inport[179:144];
  /* routers/synchronous/xbar.vhd:82:46  */
  assign n949_o = n948_o[35:1];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n950_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n951_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n952_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n953_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n954_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n955_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n956_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n957_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n958_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n959_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n960_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n961_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n962_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n963_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n964_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n965_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n966_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n967_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n968_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n969_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n970_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n971_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n972_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n973_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n974_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n975_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n976_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n977_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n978_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n979_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n980_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n981_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n982_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n983_o = sel4[3];
  /* routers/synchronous/xbar.vhd:82:74  */
  assign n984_o = sel4[3];
  assign n985_o = {n984_o, n983_o, n982_o, n981_o};
  assign n986_o = {n980_o, n979_o, n978_o, n977_o};
  assign n987_o = {n976_o, n975_o, n974_o, n973_o};
  assign n988_o = {n972_o, n971_o, n970_o, n969_o};
  assign n989_o = {n968_o, n967_o, n966_o, n965_o};
  assign n990_o = {n964_o, n963_o, n962_o, n961_o};
  assign n991_o = {n960_o, n959_o, n958_o, n957_o};
  assign n992_o = {n956_o, n955_o, n954_o, n953_o};
  assign n993_o = {n952_o, n951_o, n950_o};
  assign n994_o = {n985_o, n986_o, n987_o, n988_o};
  assign n995_o = {n989_o, n990_o, n991_o, n992_o};
  assign n996_o = {n994_o, n995_o, n993_o};
  /* routers/synchronous/xbar.vhd:82:51  */
  assign n997_o = n949_o & n996_o;
  /* routers/synchronous/xbar.vhd:81:80  */
  assign n998_o = n947_o | n997_o;
  /* routers/synchronous/xbar.vhd:83:35  */
  assign n999_o = inport[35:0];
  /* routers/synchronous/xbar.vhd:83:39  */
  assign n1000_o = n999_o[35:1];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1001_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1002_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1003_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1004_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1005_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1006_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1007_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1008_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1009_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1010_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1011_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1012_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1013_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1014_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1015_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1016_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1017_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1018_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1019_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1020_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1021_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1022_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1023_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1024_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1025_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1026_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1027_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1028_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1029_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1030_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1031_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1032_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1033_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1034_o = sel0[0];
  /* routers/synchronous/xbar.vhd:83:67  */
  assign n1035_o = sel0[0];
  assign n1036_o = {n1035_o, n1034_o, n1033_o, n1032_o};
  assign n1037_o = {n1031_o, n1030_o, n1029_o, n1028_o};
  assign n1038_o = {n1027_o, n1026_o, n1025_o, n1024_o};
  assign n1039_o = {n1023_o, n1022_o, n1021_o, n1020_o};
  assign n1040_o = {n1019_o, n1018_o, n1017_o, n1016_o};
  assign n1041_o = {n1015_o, n1014_o, n1013_o, n1012_o};
  assign n1042_o = {n1011_o, n1010_o, n1009_o, n1008_o};
  assign n1043_o = {n1007_o, n1006_o, n1005_o, n1004_o};
  assign n1044_o = {n1003_o, n1002_o, n1001_o};
  assign n1045_o = {n1036_o, n1037_o, n1038_o, n1039_o};
  assign n1046_o = {n1040_o, n1041_o, n1042_o, n1043_o};
  assign n1047_o = {n1045_o, n1046_o, n1044_o};
  /* routers/synchronous/xbar.vhd:83:44  */
  assign n1048_o = n1000_o & n1047_o;
  /* routers/synchronous/xbar.vhd:84:42  */
  assign n1049_o = inport[71:36];
  /* routers/synchronous/xbar.vhd:84:46  */
  assign n1050_o = n1049_o[35:1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1051_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1052_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1053_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1054_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1055_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1056_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1057_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1058_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1059_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1060_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1061_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1062_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1063_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1064_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1065_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1066_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1067_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1068_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1069_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1070_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1071_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1072_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1073_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1074_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1075_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1076_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1077_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1078_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1079_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1080_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1081_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1082_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1083_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1084_o = sel1[1];
  /* routers/synchronous/xbar.vhd:84:74  */
  assign n1085_o = sel1[1];
  assign n1086_o = {n1085_o, n1084_o, n1083_o, n1082_o};
  assign n1087_o = {n1081_o, n1080_o, n1079_o, n1078_o};
  assign n1088_o = {n1077_o, n1076_o, n1075_o, n1074_o};
  assign n1089_o = {n1073_o, n1072_o, n1071_o, n1070_o};
  assign n1090_o = {n1069_o, n1068_o, n1067_o, n1066_o};
  assign n1091_o = {n1065_o, n1064_o, n1063_o, n1062_o};
  assign n1092_o = {n1061_o, n1060_o, n1059_o, n1058_o};
  assign n1093_o = {n1057_o, n1056_o, n1055_o, n1054_o};
  assign n1094_o = {n1053_o, n1052_o, n1051_o};
  assign n1095_o = {n1086_o, n1087_o, n1088_o, n1089_o};
  assign n1096_o = {n1090_o, n1091_o, n1092_o, n1093_o};
  assign n1097_o = {n1095_o, n1096_o, n1094_o};
  /* routers/synchronous/xbar.vhd:84:51  */
  assign n1098_o = n1050_o & n1097_o;
  /* routers/synchronous/xbar.vhd:83:73  */
  assign n1099_o = n1048_o | n1098_o;
  /* routers/synchronous/xbar.vhd:85:42  */
  assign n1100_o = inport[107:72];
  /* routers/synchronous/xbar.vhd:85:46  */
  assign n1101_o = n1100_o[35:1];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1102_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1103_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1104_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1105_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1106_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1107_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1108_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1109_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1110_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1111_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1112_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1113_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1114_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1115_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1116_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1117_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1118_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1119_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1120_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1121_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1122_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1123_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1124_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1125_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1126_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1127_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1128_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1129_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1130_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1131_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1132_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1133_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1134_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1135_o = sel2[2];
  /* routers/synchronous/xbar.vhd:85:74  */
  assign n1136_o = sel2[2];
  assign n1137_o = {n1136_o, n1135_o, n1134_o, n1133_o};
  assign n1138_o = {n1132_o, n1131_o, n1130_o, n1129_o};
  assign n1139_o = {n1128_o, n1127_o, n1126_o, n1125_o};
  assign n1140_o = {n1124_o, n1123_o, n1122_o, n1121_o};
  assign n1141_o = {n1120_o, n1119_o, n1118_o, n1117_o};
  assign n1142_o = {n1116_o, n1115_o, n1114_o, n1113_o};
  assign n1143_o = {n1112_o, n1111_o, n1110_o, n1109_o};
  assign n1144_o = {n1108_o, n1107_o, n1106_o, n1105_o};
  assign n1145_o = {n1104_o, n1103_o, n1102_o};
  assign n1146_o = {n1137_o, n1138_o, n1139_o, n1140_o};
  assign n1147_o = {n1141_o, n1142_o, n1143_o, n1144_o};
  assign n1148_o = {n1146_o, n1147_o, n1145_o};
  /* routers/synchronous/xbar.vhd:85:51  */
  assign n1149_o = n1101_o & n1148_o;
  /* routers/synchronous/xbar.vhd:84:80  */
  assign n1150_o = n1099_o | n1149_o;
  /* routers/synchronous/xbar.vhd:86:42  */
  assign n1151_o = inport[143:108];
  /* routers/synchronous/xbar.vhd:86:46  */
  assign n1152_o = n1151_o[35:1];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1153_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1154_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1155_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1156_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1157_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1158_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1159_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1160_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1161_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1162_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1163_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1164_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1165_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1166_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1167_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1168_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1169_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1170_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1171_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1172_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1173_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1174_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1175_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1176_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1177_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1178_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1179_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1180_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1181_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1182_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1183_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1184_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1185_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1186_o = sel3[3];
  /* routers/synchronous/xbar.vhd:86:74  */
  assign n1187_o = sel3[3];
  assign n1188_o = {n1187_o, n1186_o, n1185_o, n1184_o};
  assign n1189_o = {n1183_o, n1182_o, n1181_o, n1180_o};
  assign n1190_o = {n1179_o, n1178_o, n1177_o, n1176_o};
  assign n1191_o = {n1175_o, n1174_o, n1173_o, n1172_o};
  assign n1192_o = {n1171_o, n1170_o, n1169_o, n1168_o};
  assign n1193_o = {n1167_o, n1166_o, n1165_o, n1164_o};
  assign n1194_o = {n1163_o, n1162_o, n1161_o, n1160_o};
  assign n1195_o = {n1159_o, n1158_o, n1157_o, n1156_o};
  assign n1196_o = {n1155_o, n1154_o, n1153_o};
  assign n1197_o = {n1188_o, n1189_o, n1190_o, n1191_o};
  assign n1198_o = {n1192_o, n1193_o, n1194_o, n1195_o};
  assign n1199_o = {n1197_o, n1198_o, n1196_o};
  /* routers/synchronous/xbar.vhd:86:51  */
  assign n1200_o = n1152_o & n1199_o;
  /* routers/synchronous/xbar.vhd:85:80  */
  assign n1201_o = n1150_o | n1200_o;
  assign n1207_o = {n1201_o, 1'bZ, n998_o, 1'bZ, n795_o, 1'bZ, n592_o, 1'bZ, n389_o, 1'bZ};
endmodule

module hpu
  (input  clk,
   input  reset,
   input  inline_req,
   input  [34:0] inline_data,
   output outline_req,
   output [34:0] outline_data,
   output [3:0] sel);
  wire [35:0] n120_o;
  wire n122_o;
  wire [34:0] n123_o;
  wire vld;
  wire sop;
  wire eop;
  wire [1:0] dest;
  wire [3:0] selint;
  wire [3:0] selintnext;
  wire [3:0] decodedsel;
  wire [34:0] outint;
  wire n125_o;
  wire n126_o;
  wire n127_o;
  wire [1:0] n128_o;
  wire n131_o;
  wire n132_o;
  wire n136_o;
  wire n137_o;
  wire n141_o;
  wire n142_o;
  wire n146_o;
  wire n147_o;
  wire [3:0] n149_o;
  wire n150_o;
  wire n151_o;
  wire n152_o;
  wire n153_o;
  wire [3:0] n154_o;
  wire [3:0] n155_o;
  wire n156_o;
  wire n157_o;
  wire n158_o;
  wire [3:0] n159_o;
  wire [15:0] n160_o;
  wire [18:0] n162_o;
  wire [20:0] n164_o;
  wire [13:0] n165_o;
  wire [34:0] n166_o;
  wire [34:0] n167_o;
  wire [34:0] n168_o;
  reg [3:0] n176_q;
  wire [3:0] n178_o;
  wire [35:0] n180_o;
  assign outline_req = n122_o;
  assign outline_data = n123_o;
  assign sel = n159_o;
  /* routers/synchronous/router.vhd:101:9  */
  assign n120_o = {inline_data, inline_req};
  /* routers/synchronous/router.vhd:97:77  */
  assign n122_o = n180_o[0];
  /* routers/synchronous/router.vhd:96:9  */
  assign n123_o = n180_o[35:1];
  /* routers/synchronous/hpu.vhd:56:16  */
  assign vld = n125_o; // (signal)
  /* routers/synchronous/hpu.vhd:57:16  */
  assign sop = n126_o; // (signal)
  /* routers/synchronous/hpu.vhd:59:16  */
  assign eop = n127_o; // (signal)
  /* routers/synchronous/hpu.vhd:60:16  */
  assign dest = n128_o; // (signal)
  /* routers/synchronous/hpu.vhd:62:16  */
  assign selint = n176_q; // (signal)
  /* routers/synchronous/hpu.vhd:62:24  */
  assign selintnext = n149_o; // (signal)
  /* routers/synchronous/hpu.vhd:63:16  */
  assign decodedsel = n178_o; // (signal)
  /* routers/synchronous/hpu.vhd:64:16  */
  assign outint = n167_o; // (signal)
  /* routers/synchronous/hpu.vhd:66:27  */
  assign n125_o = n120_o[35];
  /* routers/synchronous/hpu.vhd:67:27  */
  assign n126_o = n120_o[34];
  /* routers/synchronous/hpu.vhd:69:27  */
  assign n127_o = n120_o[33];
  /* routers/synchronous/hpu.vhd:70:28  */
  assign n128_o = n120_o[2:1];
  /* routers/synchronous/hpu.vhd:74:40  */
  assign n131_o = dest == 2'b00;
  /* routers/synchronous/hpu.vhd:74:30  */
  assign n132_o = n131_o ? 1'b1 : 1'b0;
  /* routers/synchronous/hpu.vhd:75:40  */
  assign n136_o = dest == 2'b01;
  /* routers/synchronous/hpu.vhd:75:30  */
  assign n137_o = n136_o ? 1'b1 : 1'b0;
  /* routers/synchronous/hpu.vhd:76:40  */
  assign n141_o = dest == 2'b10;
  /* routers/synchronous/hpu.vhd:76:30  */
  assign n142_o = n141_o ? 1'b1 : 1'b0;
  /* routers/synchronous/hpu.vhd:77:40  */
  assign n146_o = dest == 2'b11;
  /* routers/synchronous/hpu.vhd:77:30  */
  assign n147_o = n146_o ? 1'b1 : 1'b0;
  /* routers/synchronous/hpu.vhd:79:34  */
  assign n149_o = sop ? decodedsel : n155_o;
  /* routers/synchronous/hpu.vhd:79:86  */
  assign n150_o = vld | eop;
  /* routers/synchronous/hpu.vhd:79:86  */
  assign n151_o = vld | eop;
  /* routers/synchronous/hpu.vhd:79:86  */
  assign n152_o = vld | eop;
  /* routers/synchronous/hpu.vhd:79:86  */
  assign n153_o = vld | eop;
  assign n154_o = {n153_o, n152_o, n151_o, n150_o};
  /* routers/synchronous/hpu.vhd:79:62  */
  assign n155_o = selint & n154_o;
  /* routers/synchronous/hpu.vhd:80:38  */
  assign n156_o = eop | vld;
  /* routers/synchronous/hpu.vhd:80:57  */
  assign n157_o = ~sop;
  /* routers/synchronous/hpu.vhd:80:50  */
  assign n158_o = n156_o & n157_o;
  /* routers/synchronous/hpu.vhd:80:23  */
  assign n159_o = n158_o ? selint : selintnext;
  /* routers/synchronous/hpu.vhd:81:38  */
  assign n160_o = n120_o[32:17];
  /* routers/synchronous/hpu.vhd:81:25  */
  assign n162_o = {3'b110, n160_o};
  /* routers/synchronous/hpu.vhd:81:53  */
  assign n164_o = {n162_o, 2'b00};
  /* routers/synchronous/hpu.vhd:81:73  */
  assign n165_o = n120_o[16:3];
  /* routers/synchronous/hpu.vhd:81:60  */
  assign n166_o = {n164_o, n165_o};
  /* routers/synchronous/hpu.vhd:81:87  */
  assign n167_o = sop ? n166_o : n168_o;
  /* routers/synchronous/hpu.vhd:81:114  */
  assign n168_o = n120_o[35:1];
  /* routers/synchronous/hpu.vhd:87:17  */
  always @(posedge clk or posedge reset)
    if (reset)
      n176_q <= 4'b0000;
    else
      n176_q <= selintnext;
  assign n178_o = {n147_o, n142_o, n137_o, n132_o};
  assign n180_o = {outint, 1'bZ};
endmodule

module router
  (input  clk,
   input  reset,
   input  [179:0] inPort_f,
   input  [4:0] outPort_b,
   output [4:0] inPort_b,
   output [179:0] outPort_f);
  wire [3:0] sel0;
  wire [3:0] sel1;
  wire [3:0] sel2;
  wire [3:0] sel3;
  wire [3:0] sel4;
  wire [19:0] xbarsel;
  wire [19:0] xbarselnext;
  wire [179:0] xbarout;
  wire [179:0] xbaroutnext;
  wire [179:0] hpuout;
  wire [179:0] hpuoutnext;
  wire [179:0] hpuin;
  wire [35:0] n2_o;
  wire [35:0] port0_n3;
  wire [3:0] port0_n4;
  wire port0_outline_req;
  wire [34:0] port0_outline_data;
  wire [3:0] port0_sel;
  wire n5_o;
  wire [34:0] n6_o;
  wire [35:0] n7_o;
  wire [35:0] n12_o;
  wire [35:0] port1_n13;
  wire [3:0] port1_n14;
  wire port1_outline_req;
  wire [34:0] port1_outline_data;
  wire [3:0] port1_sel;
  wire n15_o;
  wire [34:0] n16_o;
  wire [35:0] n17_o;
  wire [35:0] n22_o;
  wire [35:0] port2_n23;
  wire [3:0] port2_n24;
  wire port2_outline_req;
  wire [34:0] port2_outline_data;
  wire [3:0] port2_sel;
  wire n25_o;
  wire [34:0] n26_o;
  wire [35:0] n27_o;
  wire [35:0] n32_o;
  wire [35:0] port3_n33;
  wire [3:0] port3_n34;
  wire port3_outline_req;
  wire [34:0] port3_outline_data;
  wire [3:0] port3_sel;
  wire n35_o;
  wire [34:0] n36_o;
  wire [35:0] n37_o;
  wire [35:0] n42_o;
  wire [35:0] port4_n43;
  wire [3:0] port4_n44;
  wire port4_outline_req;
  wire [34:0] port4_outline_data;
  wire [3:0] port4_sel;
  wire n45_o;
  wire [34:0] n46_o;
  wire [35:0] n47_o;
  wire [7:0] n52_o;
  wire [11:0] n53_o;
  wire [15:0] n54_o;
  wire [19:0] n55_o;
  wire [179:0] xbarinst_n56;
  wire [179:0] xbarinst_outport;
  wire [179:0] n107_o;
  wire [179:0] n109_o;
  wire [179:0] n111_o;
  reg [19:0] n114_q;
  reg [179:0] n115_q;
  reg [179:0] n116_q;
  reg [179:0] n117_q;
  wire [179:0] n118_o;
  localparam [4:0] n119_o = 5'bZ;
  assign inPort_b = n119_o;
  assign outPort_f = xbarout;
  /* routers/synchronous/router.vhd:78:8  */
  assign sel0 = port0_n4; // (signal)
  /* routers/synchronous/router.vhd:78:14  */
  assign sel1 = port1_n14; // (signal)
  /* routers/synchronous/router.vhd:78:20  */
  assign sel2 = port2_n24; // (signal)
  /* routers/synchronous/router.vhd:78:26  */
  assign sel3 = port3_n34; // (signal)
  /* routers/synchronous/router.vhd:78:32  */
  assign sel4 = port4_n44; // (signal)
  /* routers/synchronous/router.vhd:81:8  */
  assign xbarsel = n114_q; // (signal)
  /* routers/synchronous/router.vhd:81:17  */
  assign xbarselnext = n55_o; // (signal)
  /* routers/synchronous/router.vhd:82:8  */
  assign xbarout = n115_q; // (signal)
  /* routers/synchronous/router.vhd:82:17  */
  assign xbaroutnext = xbarinst_n56; // (signal)
  /* routers/synchronous/router.vhd:83:8  */
  assign hpuout = n116_q; // (signal)
  /* routers/synchronous/router.vhd:84:8  */
  assign hpuoutnext = n118_o; // (signal)
  /* routers/synchronous/router.vhd:85:8  */
  assign hpuin = n117_q; // (signal)
  /* routers/synchronous/router.vhd:89:63  */
  assign n2_o = hpuin[35:0];
  /* routers/synchronous/router.vhd:89:77  */
  assign port0_n3 = n7_o; // (signal)
  /* routers/synchronous/router.vhd:89:97  */
  assign port0_n4 = port0_sel; // (signal)
  /* routers/synchronous/router.vhd:88:9  */
  hpu port0 (
    .clk(clk),
    .reset(reset),
    .inline_req(n5_o),
    .inline_data(n6_o),
    .outline_req(port0_outline_req),
    .outline_data(port0_outline_data),
    .sel(port0_sel));
  assign n5_o = n2_o[0];
  assign n6_o = n2_o[35:1];
  assign n7_o = {port0_outline_data, port0_outline_req};
  /* routers/synchronous/router.vhd:91:63  */
  assign n12_o = hpuin[71:36];
  /* routers/synchronous/router.vhd:91:77  */
  assign port1_n13 = n17_o; // (signal)
  /* routers/synchronous/router.vhd:91:97  */
  assign port1_n14 = port1_sel; // (signal)
  /* routers/synchronous/router.vhd:90:9  */
  hpu port1 (
    .clk(clk),
    .reset(reset),
    .inline_req(n15_o),
    .inline_data(n16_o),
    .outline_req(port1_outline_req),
    .outline_data(port1_outline_data),
    .sel(port1_sel));
  assign n15_o = n12_o[0];
  assign n16_o = n12_o[35:1];
  assign n17_o = {port1_outline_data, port1_outline_req};
  /* routers/synchronous/router.vhd:93:63  */
  assign n22_o = hpuin[107:72];
  /* routers/synchronous/router.vhd:93:77  */
  assign port2_n23 = n27_o; // (signal)
  /* routers/synchronous/router.vhd:93:97  */
  assign port2_n24 = port2_sel; // (signal)
  /* routers/synchronous/router.vhd:92:9  */
  hpu port2 (
    .clk(clk),
    .reset(reset),
    .inline_req(n25_o),
    .inline_data(n26_o),
    .outline_req(port2_outline_req),
    .outline_data(port2_outline_data),
    .sel(port2_sel));
  assign n25_o = n22_o[0];
  assign n26_o = n22_o[35:1];
  assign n27_o = {port2_outline_data, port2_outline_req};
  /* routers/synchronous/router.vhd:95:63  */
  assign n32_o = hpuin[143:108];
  /* routers/synchronous/router.vhd:95:77  */
  assign port3_n33 = n37_o; // (signal)
  /* routers/synchronous/router.vhd:95:97  */
  assign port3_n34 = port3_sel; // (signal)
  /* routers/synchronous/router.vhd:94:9  */
  hpu port3 (
    .clk(clk),
    .reset(reset),
    .inline_req(n35_o),
    .inline_data(n36_o),
    .outline_req(port3_outline_req),
    .outline_data(port3_outline_data),
    .sel(port3_sel));
  assign n35_o = n32_o[0];
  assign n36_o = n32_o[35:1];
  assign n37_o = {port3_outline_data, port3_outline_req};
  /* routers/synchronous/router.vhd:97:63  */
  assign n42_o = hpuin[179:144];
  /* routers/synchronous/router.vhd:97:77  */
  assign port4_n43 = n47_o; // (signal)
  /* routers/synchronous/router.vhd:97:97  */
  assign port4_n44 = port4_sel; // (signal)
  /* routers/synchronous/router.vhd:96:9  */
  hpu port4 (
    .clk(clk),
    .reset(reset),
    .inline_req(n45_o),
    .inline_data(n46_o),
    .outline_req(port4_outline_req),
    .outline_data(port4_outline_data),
    .sel(port4_sel));
  assign n45_o = n42_o[0];
  assign n46_o = n42_o[35:1];
  assign n47_o = {port4_outline_data, port4_outline_req};
  /* routers/synchronous/router.vhd:99:29  */
  assign n52_o = {sel4, sel3};
  /* routers/synchronous/router.vhd:99:36  */
  assign n53_o = {n52_o, sel2};
  /* routers/synchronous/router.vhd:99:43  */
  assign n54_o = {n53_o, sel1};
  /* routers/synchronous/router.vhd:99:50  */
  assign n55_o = {n54_o, sel0};
  /* routers/synchronous/router.vhd:102:74  */
  assign xbarinst_n56 = xbarinst_outport; // (signal)
  /* routers/synchronous/router.vhd:101:9  */
  xbar xbarinst (
    .func(xbarsel),
    .inport(hpuout),
    .outport(xbarinst_outport));
  assign n107_o = {35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0};
  assign n109_o = {35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0};
  assign n111_o = {35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0, 35'b00000000000000000000000000000000000, 1'b0};
  /* routers/synchronous/router.vhd:113:17  */
  always @(posedge clk or posedge reset)
    if (reset)
      n114_q <= 20'b00000000000000000000;
    else
      n114_q <= xbarselnext;
  /* routers/synchronous/router.vhd:113:17  */
  always @(posedge clk or posedge reset)
    if (reset)
      n115_q <= n107_o;
    else
      n115_q <= xbaroutnext;
  /* routers/synchronous/router.vhd:113:17  */
  always @(posedge clk or posedge reset)
    if (reset)
      n116_q <= n109_o;
    else
      n116_q <= hpuoutnext;
  /* routers/synchronous/router.vhd:113:17  */
  always @(posedge clk or posedge reset)
    if (reset)
      n117_q <= n111_o;
    else
      n117_q <= inPort_f;
  /* routers/synchronous/router.vhd:108:17  */
  assign n118_o = {port4_n43, port3_n33, port2_n23, port1_n13, port0_n3};
endmodule

