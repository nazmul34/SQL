-- Seed data sized so every query in "query set 1..4" returns a meaningful, non-empty result.

------------------------------------------------------------------------------
-- COUNTRY
------------------------------------------------------------------------------
INSERT INTO country (code, name, continent, region, surfacearea, population, lifeexpectancy, gnp, governmentform, capital, code2) VALUES
('USA', 'United States',       'North America', 'North America',      9363520.00, 278357000, 77.1, 8510700.00, 'Federal Republic',          3813, 'US'),
('MEX', 'Mexico',              'North America', 'Central America',    1958201.00,  98881000, 71.5,  414972.00, 'Federal Republic',          2515, 'MX'),
('BRA', 'Brazil',              'South America', 'South America',      8547403.00, 170115000, 62.9,  776739.00, 'Federal Republic',           211, 'BR'),
('ARG', 'Argentina',           'South America', 'South America',      2780400.00,  37032000, 75.1,  340238.00, 'Federal Republic',           129, 'AR'),
('CHN', 'China',               'Asia',          'Eastern Asia',       9572900.00,1277558000, 71.4,  982268.00, 'People''s Republic',        1891, 'CN'),
('IND', 'India',               'Asia',          'Southern and Central Asia', 3287263.00,1013662000, 62.5, 447114.00, 'Federal Republic',    1109, 'IN'),
('JPN', 'Japan',               'Asia',          'Eastern Asia',        377829.00, 126714000, 80.7, 3787042.00, 'Constitutional Monarchy',   1532, 'JP'),
('IDN', 'Indonesia',           'Asia',          'Southeast Asia',     1904569.00, 212107000, 68.0,   84982.00, 'Republic',                   939, 'ID'),
('EGY', 'Egypt',               'Africa',        'Northern Africa',    1001449.00,  68470000, 63.3,   82710.00, 'Republic',                   608, 'EG'),
('NGA', 'Nigeria',             'Africa',        'Western Africa',      923768.00, 111506000, 51.6,   65707.00, 'Federal Republic',          2822, 'NG'),
('ZAF', 'South Africa',        'Africa',        'Southern Africa',    1221037.00,  40377000, 51.1,  116729.00, 'Republic',                  3222, 'ZA'),
('MAR', 'Morocco',             'Africa',        'Northern Africa',     446550.00,  28351000, 69.1,   36124.00, 'Constitutional Monarchy',   2464, 'MA'),
('DZA', 'Algeria',             'Africa',        'Northern Africa',    2381741.00,  31471000, 69.7,   49982.00, 'Republic',                    35, 'DZ'),
('GBR', 'United Kingdom',      'Europe',        'British Islands',      242900.00,  59623400, 77.7, 1378330.00, 'Constitutional Monarchy',   456, 'GB'),
('FRA', 'France',              'Europe',        'Western Europe',       551500.00,  59225700, 78.8, 1424285.00, 'Republic',                  653, 'FR'),
('DEU', 'Germany',             'Europe',        'Western Europe',       357022.00,  82164700, 77.4, 2133367.00, 'Federal Republic',          3068, 'DE'),
('RUS', 'Russian Federation',  'Europe',        'Eastern Europe',     17075400.00, 146934000, 67.2,  276608.00, 'Federal Republic',         2974, 'RU'),
('AUS', 'Australia',           'Oceania',       'Australia and New Zealand', 7741220.00, 18886000, 79.8, 351182.00, 'Constitutional Monarchy', 135, 'AU');

------------------------------------------------------------------------------
-- CITY
------------------------------------------------------------------------------
INSERT INTO city (id, name, countrycode, district, population) VALUES
-- Asia
(1532, 'Tokyo',            'JPN', 'Tokyo-to',      7980230),
(1533, 'Jokohama',         'JPN', 'Kanagawa',      3339594),
(1534, 'Osaka',            'JPN', 'Osaka',         2595674),
(1535, 'Nagoya',           'JPN', 'Aichi',         2154376),
(1661, 'Sayama',           'JPN', 'Saitama',        162472),  -- query set 1, #3
(1890, 'Shanghai',         'CHN', 'Shanghai',      9696300),
(1891, 'Peking',           'CHN', 'Peking',        7472000),
(1892, 'Chongqing',        'CHN', 'Chongqing',     6351600),
(1893, 'Tianjin',          'CHN', 'Tianjin',       5286800),
(1024, 'Mumbai',           'IND', 'Maharashtra',  10500000),
(1025, 'Delhi',            'IND', 'Delhi',         7206704),
(1026, 'Calcutta',         'IND', 'West Bengal',   4399819),
(1027, 'Chennai',          'IND', 'Tamil Nadu',    3841396),
(1109, 'New Delhi',        'IND', 'Delhi',          301297),
(939,  'Jakarta',          'IDN', 'Jakarta Raya',  9604900),
(940,  'Surabaya',         'IDN', 'East Java',     2663820),
-- Africa
(608,  'Cairo',            'EGY', 'Kairo',         6789479),
(609,  'Alexandria',       'EGY', 'Aleksandria',   3328196),
(610,  'Giza',             'EGY', 'Giza',          2221868),
(2822, 'Lagos',            'NGA', 'Lagos',         1518000),
(2823, 'Ibadan',           'NGA', 'Oyo & Osun',    1432000),
(2824, 'Kano',             'NGA', 'Kano & Jigawa',  674100),
(3222, 'Cape Town',        'ZAF', 'Western Cape',  2352121),
(3223, 'Soweto',           'ZAF', 'Gauteng',        904165),
(3224, 'Johannesburg',     'ZAF', 'Gauteng',        756653),
(2464, 'Casablanca',       'MAR', 'Casablanca',    2940623),
(2465, 'Rabat',            'MAR', 'Rabat-Sale-Zam', 623457),
(35,   'Alger',            'DZA', 'Alger',         2168000),
(36,   'Oran',             'DZA', 'Oran',           609940),
-- Europe
(456,  'London',           'GBR', 'England',       7285000),
(457,  'Birmingham',       'GBR', 'England',        1013000),
(653,  'Paris',            'FRA', 'Ile-de-France', 2125246),
(654,  'Marseille',        'FRA', 'Provence-Alpes-C', 798430),
(3068, 'Berlin',           'DEU', 'Berliini',      3386667),
(3069, 'Hamburg',          'DEU', 'Hamburg',       1704735),
(2974, 'Moscow',           'RUS', 'Moscow (City)', 8389200),
(2975, 'St Petersburg',    'RUS', 'Pietari',       4694000),
-- South America
(211,  'Sao Paulo',        'BRA', 'Sao Paulo',     9968485),
(212,  'Rio de Janeiro',   'BRA', 'Rio de Janeiro',5598953),
(129,  'Buenos Aires',     'ARG', 'Distrito Federal', 2982146),
(130,  'Cordoba',          'ARG', 'Cordoba',       1157507),
-- Oceania
(135,  'Sydney',           'AUS', 'New South Wales', 3276207),
(136,  'Melbourne',        'AUS', 'Victoria',      2865329),
-- North America (non-USA)
(2515, 'Ciudad de Mexico', 'MEX', 'Distrito Federal', 8591309),
(2516, 'Guadalajara',      'MEX', 'Jalisco',       1647720),
-- USA
(3793, 'New York',         'USA', 'New York',      8008278),
(3794, 'Los Angeles',      'USA', 'California',    3694820),
(3795, 'Chicago',          'USA', 'Illinois',      2896016),
(3796, 'Houston',          'USA', 'Texas',         1953631),
(3797, 'Philadelphia',     'USA', 'Pennsylvania',  1517550),
(3798, 'Phoenix',          'USA', 'Arizona',       1321045),
(3799, 'San Diego',        'USA', 'California',    1223400),
(3800, 'Dallas',           'USA', 'Texas',         1188580),
(3801, 'San Antonio',      'USA', 'Texas',         1144646),
(3802, 'Detroit',          'USA', 'Michigan',       951270),
(3803, 'San Jose',         'USA', 'California',     894943),
(3804, 'Indianapolis',     'USA', 'Indiana',        791926),
(3805, 'San Francisco',    'USA', 'California',     776733),
(3806, 'Jacksonville',     'USA', 'Florida',        735167),
(3807, 'Columbus',         'USA', 'Ohio',           711470),
(3808, 'Austin',           'USA', 'Texas',          656562),
(3809, 'Baltimore',        'USA', 'Maryland',       651154),
(3810, 'Memphis',          'USA', 'Tennessee',      650100),
(3811, 'Milwaukee',        'USA', 'Wisconsin',      596974),
(3812, 'Boston',           'USA', 'Massachusetts',  589141),
(3813, 'Washington',       'USA', 'District of Columbia', 572059),
(3814, 'El Paso',          'USA', 'Texas',          563662),
(3815, 'Seattle',          'USA', 'Washington',     563374),
(3816, 'Denver',           'USA', 'Colorado',       554636),
(3817, 'Charlotte',        'USA', 'North Carolina', 540828),
(3818, 'Fort Worth',       'USA', 'Texas',          534694),
(3819, 'Portland',         'USA', 'Oregon',         529121),
(3820, 'Oklahoma City',    'USA', 'Oklahoma',       506132),
(3821, 'Tucson',           'USA', 'Arizona',        486699),
(3822, 'New Orleans',      'USA', 'Louisiana',      484674),
(3823, 'Las Vegas',        'USA', 'Nevada',         478434),
(3824, 'Cleveland',        'USA', 'Ohio',           478403),
(3825, 'Long Beach',       'USA', 'California',     461522),
(3826, 'Albuquerque',      'USA', 'New Mexico',     448607),
(3827, 'Kansas City',      'USA', 'Missouri',       441545),
(3828, 'Fresno',           'USA', 'California',     427652),
(3829, 'Virginia Beach',   'USA', 'Virginia',       425257),
(3830, 'Atlanta',          'USA', 'Georgia',        416474),
(3831, 'Sacramento',       'USA', 'California',     407018),
(3832, 'Oakland',          'USA', 'California',     399484),
(3833, 'Mesa',             'USA', 'Arizona',        396375),
(3834, 'Tulsa',            'USA', 'Oklahoma',       393049),
(3835, 'Omaha',            'USA', 'Nebraska',       390007),
(3836, 'Minneapolis',      'USA', 'Minnesota',      382618),
(3837, 'Honolulu',         'USA', 'Hawaii',         371657),
(3838, 'Miami',            'USA', 'Florida',        362470),
(3839, 'Colorado Springs', 'USA', 'Colorado',       360890),
(3840, 'Saint Louis',      'USA', 'Missouri',       348189),
(3841, 'Wichita',          'USA', 'Kansas',         344284),
(3842, 'Santa Ana',        'USA', 'California',     337977),
(3843, 'Pittsburgh',       'USA', 'Pennsylvania',   334563),
(3844, 'Arlington',        'USA', 'Texas',          332969),
(3845, 'Cincinnati',       'USA', 'Ohio',           331285),
(3846, 'Anaheim',          'USA', 'California',     328014),
(3847, 'Toledo',           'USA', 'Ohio',           313619),
(3848, 'Tampa',            'USA', 'Florida',        303447),
(3849, 'Buffalo',          'USA', 'New York',       292648),
(3850, 'Saint Paul',       'USA', 'Minnesota',      287151),
(3851, 'Corpus Christi',   'USA', 'Texas',          277454),
(3852, 'Aurora',           'USA', 'Colorado',       276393),
(3853, 'Raleigh',          'USA', 'North Carolina', 276093),
(3854, 'Newark',           'USA', 'New Jersey',     273546),
(3855, 'Anchorage',        'USA', 'Alaska',         260283),
(3856, 'Louisville',       'USA', 'Kentucky',       256231),
(3857, 'Riverside',        'USA', 'California',     255166),
(3858, 'Bakersfield',      'USA', 'California',     247057),
(3859, 'Stockton',         'USA', 'California',     243771),
(3860, 'Birmingham',       'USA', 'Alabama',        242820),
(3861, 'Jersey City',      'USA', 'New Jersey',     240055),
(3862, 'Norfolk',          'USA', 'Virginia',       234403),
(3863, 'Baton Rouge',      'USA', 'Louisiana',      227818),
(3864, 'Hialeah',          'USA', 'Florida',        226419),
(3865, 'Lincoln',          'USA', 'Nebraska',       225581),
(3866, 'Greensboro',       'USA', 'North Carolina', 223891),
(3867, 'Plano',            'USA', 'Texas',          222030),
(3868, 'Rochester',        'USA', 'New York',       219773),
(3869, 'Glendale',         'USA', 'Arizona',        218812),
(3870, 'Akron',            'USA', 'Ohio',           217074),
(3871, 'Garland',          'USA', 'Texas',          215768),
(3872, 'Madison',          'USA', 'Wisconsin',      208054),
(3873, 'Fort Wayne',       'USA', 'Indiana',        205727),
(3874, 'Fremont',          'USA', 'California',     203413),
-- a few small USA cities, so the >100000 filter in query set 1 #1 actually filters
(3875, 'Scottsdale',       'USA', 'Arizona',         98000),
(3876, 'Berkeley',         'USA', 'California',      92000),
(3877, 'Cambridge',        'USA', 'Massachusetts',   88000);

------------------------------------------------------------------------------
-- STATION
--   contains: duplicate city names (#6), even ids (#5),
--   names starting/ending with vowels (#8..#14), lat_n spread (set 3 #1,#2)
------------------------------------------------------------------------------
INSERT INTO station (id, city, state, lat_n, long_w) VALUES
(1,  'Acampo',     'CA', 38.1234, 121.2755),
(2,  'Aguanga',    'CA', 33.4425, 116.8607),
(3,  'Alturas',    'CA', 41.4871, 120.5423),
(4,  'Anaheim',    'CA', 33.8353, 117.9145),
(5,  'Elmira',     'NY', 42.0898,  76.8077),
(6,  'Erie',       'PA', 42.1292,  80.0851),
(7,  'Elgin',      'IL', 42.0354,  88.2826),
(8,  'Ithaca',     'NY', 42.4440,  76.5019),
(9,  'Iowa City',  'IA', 41.6611,  91.5302),
(10, 'Omaha',      'NE', 41.2565,  95.9345),
(11, 'Orlando',    'FL', 28.5383,  81.3792),
(12, 'Ogden',      'UT', 41.2230, 111.9738),
(13, 'Utica',      'NY', 43.1009,  75.2327),
(14, 'Urbana',     'IL', 40.1106,  88.2073),
(15, 'Ukiah',      'CA', 39.1502, 123.2078),
(16, 'Boston',     'MA', 42.3601,  71.0589),
(17, 'Buffalo',    'NY', 42.8864,  78.8784),
(18, 'Chicago',    'IL', 41.8781,  87.6298),
(19, 'Denver',     'CO', 39.7392, 104.9903),
(20, 'Dallas',     'TX', 32.7767,  96.7970),
(21, 'Fargo',      'ND', 46.8772,  96.7898),
(22, 'Fresno',     'CA', 36.7378, 119.7871),
(23, 'Gary',       'IN', 41.5934,  87.3464),
(24, 'Helena',     'MT', 46.5891, 112.0391),
(25, 'Juneau',     'AK', 58.3019, 134.4197),
(26, 'Kokomo',     'IN', 40.4864,  86.1336),
(27, 'Laramie',    'WY', 41.3114, 105.5911),
(28, 'Madison',    'WI', 43.0731,  89.4012),
(29, 'Nashua',     'NH', 42.7654,  71.4676),
(30, 'Peoria',     'IL', 40.6936,  89.5890),
(31, 'Quincy',     'MA', 42.2529,  71.0023),
(32, 'Reno',       'NV', 39.5296, 119.8138),
(33, 'Salem',      'OR', 44.9429, 123.0351),
(34, 'Toledo',     'OH', 41.6528,  83.5379),
(35, 'Vernon',     'TX', 34.1548,  99.2661),
(36, 'Waco',       'TX', 31.5493,  97.1467),
(37, 'Xenia',      'OH', 39.6845,  83.9294),
(38, 'York',       'PA', 39.9626,  76.7277),
(39, 'Zanesville', 'OH', 39.9403,  82.0132),
(40, 'Boston',     'MA', 42.3601,  71.0589),   -- duplicate of id 16
(41, 'Denver',     'CO', 39.7392, 104.9903),   -- duplicate of id 19
(42, 'Omaha',      'NE', 41.2565,  95.9345);   -- duplicate of id 10

------------------------------------------------------------------------------
-- STUDENTS  (Bobby / Robby share the last 3 chars -> exercises the ID tiebreak)
------------------------------------------------------------------------------
INSERT INTO students (id, name, marks) VALUES
(1,  'Ashley',    81),
(2,  'Samantha',  75),
(3,  'Julia',     76),
(4,  'Belvet',    84),
(5,  'Bobby',     79),
(6,  'Robby',     79),
(7,  'Maria',     99),
(8,  'Scarlet',   80),
(9,  'Kristeen',  67),
(10, 'Amina',     89),
(11, 'Christene', 73),
(12, 'Meera',     95),
(13, 'Priya',     68),
(14, 'Priyanka',  77),
(15, 'Paige',     88);

------------------------------------------------------------------------------
-- EMPLOYEE  (Kimberly / Sarah / Kevin all earn 69952 -> tie in query set 3 #4)
------------------------------------------------------------------------------
INSERT INTO employee (employee_id, name, months, salary) VALUES
(12228, 'Rose',      15,  1968),
(12345, 'Sarah',      8,  8744),
(12346, 'Kevin',      4, 17488),
(33645, 'Angela',     1,  3443),
(45692, 'Frank',     17,  1608),
(56118, 'Patrick',    7,  1345),
(59725, 'Lisa',      11,  2330),
(74197, 'Kimberly',  16,  4372),
(78454, 'Bonnie',     8,  1771),
(83565, 'Michael',    6,  2017),
(98607, 'Todd',       5,  3396),
(99989, 'Joe',        9,  3573);

------------------------------------------------------------------------------
-- EMPLOYEES  (every salary contains at least one 0 -> query set 3 #3)
------------------------------------------------------------------------------
INSERT INTO employees (id, salary) VALUES
(1, 1420), (2, 4990), (3, 7040), (4, 3350), (5, 2280),
(6, 1090), (7, 8320), (8, 5060), (9, 3010), (10, 6870);

------------------------------------------------------------------------------
-- TRIANGLES  (one row per classification)
------------------------------------------------------------------------------
INSERT INTO triangles (a, b, c) VALUES
(20, 20, 23),   -- Isosceles
(20, 20, 20),   -- Equilateral
(20, 21, 22),   -- Scalene
(13, 14, 30);   -- Not A Triangle

------------------------------------------------------------------------------
-- OCCUPATIONS  (uneven counts -> the pivot in query set 4 #1 produces NULLs)
------------------------------------------------------------------------------
INSERT INTO occupations (name, occupation) VALUES
('Samantha',  'Doctor'),
('Jenny',     'Doctor'),
('Aamina',    'Doctor'),
('Priyanka',  'Doctor'),
('Julia',     'Actor'),
('Maria',     'Actor'),
('Jane',      'Actor'),
('Britney',   'Actor'),
('Eve',       'Actor'),
('Meera',     'Singer'),
('Priya',     'Singer'),
('Belvet',    'Singer'),
('Ashley',    'Professor'),
('Ketty',     'Professor'),
('Christeen', 'Professor'),
('Naomi',     'Professor');

------------------------------------------------------------------------------
-- BST         5
--           /   \
--          2     8
--         / \   / \
--        1   3 6   9
------------------------------------------------------------------------------
INSERT INTO bst (n, p) VALUES
(1, 2),
(3, 2),
(6, 8),
(9, 8),
(2, 5),
(8, 5),
(5, NULL);
