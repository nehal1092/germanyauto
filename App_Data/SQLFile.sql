--
-- Table structure for table `addresses`
--

CREATE TABLE addresses (
  `addressID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `line1` varchar(60) NOT NULL,
  `line2` varchar(60) DEFAULT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO addresses (`addressID`, `customerID`, `line1`, `line2`, `city`, `state`, `zipCode`, `phone`, `disabled`) VALUES
(1, 1, '100 East Ridgewood Ave.', '', 'Paramus', 'NJ', '07652', '201-653-4472', 0),
(2, 1, '21 Rosewood Rd.', '', 'Woodcliff Lake', 'NJ', '07677', '201-653-4472', 0),
(3, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(4, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(5, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(6, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(7, 4, '897', 'brooke ', 'delta', 'bc', 'v4c678', '8979866', 0),
(8, 4, '897', 'brooke ', 'delta', 'bc', 'v4c678', '8979866', 0);

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE administrators (
  `adminID` int(11) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrators`
--

INSERT INTO administrators (`adminID`, `emailAddress`, `password`, `firstName`, `lastName`) VALUES
(1, 'admin@myguitarshop.com', '6a718fbd768c2378b511f8249b54897f940e9022', 'Admin', 'User'),
(2, 'joel@murach.com', '971e95957d3b74d70d79c20c94e9cd91b85f7aae', 'Joel', 'Murach'),
(3, 'mike@murach.com', '3f2975c819cefc686282456aeae3a137bf896ee8', 'Mike', 'Murach');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE categories (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO categories (`categoryID`, `categoryName`) VALUES
(1, 'All Season Tires'),
(2, 'Engine Parts'),
(3, 'Wheels'),
(4, 'MotoMaster Battery Chargers\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE customers (
  `customerID` int(11) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstName` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `shipAddressID` int(11) DEFAULT NULL,
  `billingAddressID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO customers (`customerID`, `emailAddress`, `password`, `firstName`, `lastName`, `shipAddressID`, `billingAddressID`) VALUES
(1, 'allan.sherwood@yahoo.com', '650215acec746f0e32bdfff387439eefc1358737', 'Allan', 'Sherwood', 1, 2),
(2, 'barryz@gmail.com', '3f563468d42a448cb1e56924529f6e7bbe529cc7', 'Barry', 'Zimmer', 3, 4),
(3, 'christineb@solarone.com', 'ed19f5c0833094026a2f1e9e6f08a35d26037066', 'Christine', 'Brown', 5, 6),
(4, 'nehal1092@yahoo.ca', '69224748cdd59bec9bb63c46ffd7e286d7a5b1da', 'nehal', 'alameer', 7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE orderitems (
  `itemID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `itemPrice` decimal(10,2) NOT NULL,
  `discountAmount` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitems`
--

INSERT INTO orderitems (`itemID`, `orderID`, `productID`, `itemPrice`, `discountAmount`, `quantity`) VALUES
(1, 1, 2, '399.00', '39.90', 1),
(2, 2, 4, '699.00', '69.90', 1),
(3, 3, 3, '499.00', '49.90', 1),
(4, 3, 6, '549.99', '0.00', 1),
(5, 4, 17, '201.97', '0.00', 1),
(6, 4, 1, '156.99', '15.70', 1),
(7, 5, 8, '54.99', '5.50', 1),
(8, 6, 5, '146.99', '0.00', 1),
(9, 6, 7, '197.99', '19.80', 1),
(10, 7, 1, '156.99', '15.70', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE orders (
  `orderID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `orderDate` datetime NOT NULL,
  `shipAmount` decimal(10,2) NOT NULL,
  `taxAmount` decimal(10,2) NOT NULL,
  `shipDate` datetime DEFAULT NULL,
  `shipAddressID` int(11) NOT NULL,
  `cardType` int(11) NOT NULL,
  `cardNumber` char(16) NOT NULL,
  `cardExpires` char(7) NOT NULL,
  `billingAddressID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO orders (`orderID`, `customerID`, `orderDate`, `shipAmount`, `taxAmount`, `shipDate`, `shipAddressID`, `cardType`, `cardNumber`, `cardExpires`, `billingAddressID`) VALUES
(1, 1, '2014-05-30 09:40:28', '5.00', '32.32', '2014-06-01 09:43:13', 1, 2, '4111111111111111', '04/2019', 2),
(2, 2, '2014-06-01 11:23:20', '5.00', '0.00', NULL, 3, 2, '4111111111111111', '08/2018', 4),
(3, 1, '2014-06-03 09:44:58', '10.00', '89.92', NULL, 1, 2, '4111111111111111', '04/2019', 2),
(4, 4, '2015-11-23 01:41:18', '10.00', '0.00', NULL, 7, 1, '5191230179462713', '12/2018', 8),
(5, 4, '2015-11-23 06:54:00', '5.00', '0.00', NULL, 7, 1, '1234567891023456', '10/2016', 8),
(6, 4, '2015-11-27 02:11:34', '10.00', '0.00', NULL, 7, 1, '1234567891012345', '09/2018', 8),
(7, 4, '2015-11-27 02:19:33', '5.00', '0.00', NULL, 7, 1, '1234567891023456', '10/2018', 8);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE products (
  `productID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `productCode` varchar(10) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `listPrice` decimal(10,2) NOT NULL,
  `discountPercent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `dateAdded` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO products (`productID`, `categoryID`, `productCode`, `productName`, `description`, `listPrice`, `discountPercent`, `dateAdded`) VALUES
(1, 1, 'Dunlopall', 'Dunlop Signature CS allseason', 'Premium touring tire that provides a great ride and style for crossover utility vehicles. Jointless Band Technology help to maintain the tire''s shape at highway speeds, while VersaLoad technology provides a consistent handling and ride. ', '156.99', '10.00', '2013-10-30 09:32:40'),
(2, 1, 'Goodall', 'Goodyear Eagle NCT 5 ROF allseason', 'Impressive OE Fitments On European And Asian High-Performance Vehicles. These tires offer temporary extended mobility in the event a puncture allows complete pressure loss.', '398.99', '20.00', '2013-12-05 16:33:13'),
(3, 1, 'Hanall', 'Hankook Optimo H725 allseason', '- Optimo H725 features predictable handling and sporty looks. Offers great handling on wet or dry surfaces including light snow.\r\n\r\n- The symettrical tread pattern offers a smooth comfortable ride throughout the life of the tire.\r\n\r\n- Features an independent block tread that provides excellent handling on dry and wet roads. ', '91.99', '32.00', '2014-02-04 11:04:31'),
(4, 1, 'Michall', 'Michelin Defender allseason', 'The Defender tire stops up to 9 meters shorter and lasts up to 33,000 km longer than comparable tires. Designed with an all-season tread compound that is great for wet performance, and is equal to HydroEdge. With innovative IntelliSipe technology, it adds tread block rigidity with interlocking action that maximizes the number of sipes within the tire, giving it a longer life. Its biting edges give you added traction for rainy and light snow days. Provides great fuel efficiency, and a quiet comfortable ride. The Defender’s all weather traction and Michelin Green X design gives you added safety, enhanced fuel economy, and low rolling resistance. ', '110.99', '28.00', '2014-06-01 11:12:59'),
(5, 1, 'Pirall', 'Pirelli Cinturato P7 All Season Tire allseason', '- The Cinturaro P7 All Seasons are the all-season version of the Green Performance Cinturato P7 tire. It provides a high level of performance in all season conditions.\r\n\r\n- Up to 20% less rolling resistance as a result of the improved tread compound, sidewall geometry and internal tire structure.\r\n\r\n- A reduction in noise is achieved by a specialized tread pattern, construction design and compound selection. The result is a 30% decrease in subjectively perceived tire noise.\r\n\r\n- Optimized tread contact area, compound and profile design increase performance and maintain safety, all while extending average tire life.', '146.99', '0.00', '2014-07-30 13:58:35'),
(6, 2, 'bwdsensor', 'BWD Cylinder Head Temperature Sensor', 'This product carries a 1 year exchange warranty redeemable at any Germany Engine Parts store.', '54.99', '10.00', '2014-07-30 14:12:41'),
(7, 2, 'spectraoil', 'Spectra Engine Oil Pan', 'This product carries a 3 year exchange warranty redeemable at Germany Engine Parts store.', '197.99', '10.00', '2014-06-01 11:29:35'),
(8, 2, 'canvas', 'Anchor Transmission Bracket', 'This product carries a 1 year exchange warranty redeemable at any Germany Engine Parts store.', '54.99', '10.00', '2014-07-30 14:18:33'),
(9, 2, 'rebuildkit', 'Edelmann Power Steering Repair Kit - Gear Rebuild Kit', 'This product carries a 1 year exchange warranty redeemable at any Germany Engine Parts store.', '65.59', '10.00', '2014-07-30 12:46:40'),
(10, 2, 'ringset', 'Sealed Power Piston Ring Set', 'This product carries a 1 year exchange warranty redeemable at any Germany Engine Parts store.\r\n', '69.99', '10.00', '2014-07-30 13:14:15'),
(11, 3, 'akitarace', 'Akita Racing AK-7 wheel with Hypersilver Finish\r\n', 'Custom passenger car wheel. Exposed lug nut design.\r\n\r\nPrice includes wheels only.\r\n\r\nInstallation hardware including lug nuts, hub rings and spacers, and optional accessories such as wheel locks are an additional charge.\r\n', '144.99', '0.00', '0000-00-00 00:00:00'),
(12, 3, 'detroitwh', 'Detroit Wheels Style 840\r\n', 'Custom passenger car wheel. Polished finish.\r\n\r\nAftermarket alloy rims may require different lug nuts than originally equipped on your vehicle. In addition, hub rings may be necessary for proper installation. Please see store for details. Extra charges may apply ', '249.99', '0.00', '0000-00-00 00:00:00'),
(13, 3, 'mazzi', 'Mazzi Hulk 755 wheel with Chrome Finish\r\n', 'Custom truck and SUV wheel. Exposed lug nut design.\r\n\r\nAftermarket alloy wheels may require different lug nuts than originally equipped on your vehicle. In addition, hub rings may be necessary for proper installation. Please see store for details. Extra charges may apply. \r\n', '389.99', '0.00', '0000-00-00 00:00:00'),
(14, 3, 'ion', 'Ion Alloy Style 183\r\n', 'Custom truck and SUV wheel. Matte black finish.\r\n\r\nAftermarket alloy rims may require different lug nuts than originally equipped on your vehicle. In addition, hub rings may be necessary for proper installation. Please see store for details. Extra charges may apply ', '199.99', '0.00', '0000-00-00 00:00:00'),
(15, 3, 'ridler', 'Ridler Style 695 Wheel in Grey with Machined Lip\r\n', 'Custom passenger car wheel. Classic car design.\r\n\r\nAftermarket alloy rims may require different lug nuts than originally equipped on your vehicle. In addition, hub rings may be necessary for proper installation. Please see store for details. Extra charges may apply ', '209.99', '0.00', '0000-00-00 00:00:00'),
(16, 4, 'moto', 'Eliminator Wheeled 55/20/2A Battery Charger with 150A Engine Start', '- Fully automatic, multi stage charging for 12V batteries\r\n\r\n- Built-in intelligent microprocessor makes charging faster, easier and safer\r\n\r\n- Select 55A express charge or 20A fast charge for charging large batteries, or select 2A trickle charge for charging small batteries\r\n\r\n- 150A engine start feature boosts your vehicles dead battery to get you back on the road right away!\r\n\r\n- Automatically switches from full charge to maintenance mode to maintain batteries during prolonged periods of storage without overcharging or damaging the battery\r\n\r\n- Timer Controlled manual charging. Allows advanced users to select desired charge time\r\n\r\n- Battery reconditioning feature reverses sulphate build-up on battery plates and helps restore battery capacity\r\n\r\n- Battery and Alternator tester. Provides easy check of battery and alternator voltage.\r\n\r\n- Battery voltage diagnostics continuously monitor battery voltage to detect potential defects\r\n\r\n- Features reverse polarity, short circuit and overheat protection to prevent damage to battery or charger\r\n\r\n- Suitable for all types of 12V lead acid batteries including AGM, deep cycle and gel cell.\r\n\r\n', '219.99', '0.00', '0000-00-00 00:00:00'),
(17, 4, 'enginesta', '40/10/2A Battery Charger with 200A Engine Start', '- Can manually charge 6V and 12V batteries\r\n\r\n- 6V batteries can be charged with a 40A rapid charge or 100A "engine start" charge\r\n\r\n- 12V batteries can be charged using 2A trickle charge, 10A fast charge, 40A rapid charge or 200A "engine start" charge\r\n\r\n- Amp charging gauge displays charging rate\r\n\r\n- Volt gauge measures voltage of battery\r\n\r\n- Timer controlled operation allows for timer to be set up to 2¼ hours for automatic charger shut off\r\n\r\n- "Hold" position on timer switch allows for continuous charging\r\n\r\n- Wheels and handle allow for easy mobility\r\n\r\n- Includes clamp style leads\r\n\r\n', '239.99', '0.00', '0000-00-00 00:00:00'),
(18, 4, 'auto', '15/2A Automatic and Manual Battery Charger with 100A Engine Start', '- 15/2A Automatic and Manual Battery Charger with 100A Engine Start has a time tested transformer based design which delivers a constant rate of charge throughout the duration of the charge cycle\r\n    \r\n- 15A fast charge and 2A slow charge rates\r\n    \r\n- 100A engine start feature gets you back on the road quickly\r\n    \r\n- Automatically shuts off when charging is complete\r\n    \r\n- Suitable for all 6 and 12V conventional, deep cycle and AGM batteries\r\n    \r\n- 6'' (1.8 m) power cord and output cables for up to 12'' (3.7 m) of reach\r\n\r\n\r\n', '139.99', '0.00', '0000-00-00 00:00:00'),
(19, 4, 'charger', '12/2A Automatic Battery Charger with 75A Engine', '- 12/2A Automatic Battery Charger with 75A Engine Start has a time tested transformer based design which delivers a constant rate of charge throughout the duration of the charge cycle\r\n    \r\n- 12A fast charge and 2A slow charge rates\r\n    \r\n- 75A engine start feature gets you back on the road quickly\r\n    \r\n- Automatically shuts off when charging is complete\r\n    \r\n- Suitable for all 12V conventional, deep cycle and AGM batteries\r\n    \r\n- 6'' (1.8 m) power cord and output cables for up to 12'' (3.7 m) of reach\r\n\r\n', '109.99', '0.00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE addresses
  ADD PRIMARY KEY (`addressID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `administrators`
--
ALTER TABLE administrators
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `categories`
--
ALTER TABLE categories
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `customers`
--
ALTER TABLE customers
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `emailAddress` (`emailAddress`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE orderitems
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE orders
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `products`
--
ALTER TABLE products
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `productCode` (`productCode`),
  ADD KEY `categoryID` (`categoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE addresses
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE administrators
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE categories
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE customers
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE orderitems
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE orders
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE products
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;

