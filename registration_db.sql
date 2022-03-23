--
-- Database: `REGISTRATION_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `cid` varchar(8) NOT NULL,
  `title` varchar(256) NOT NULL,
  `dept_name` varchar(256) NOT NULL,
  `credits` int(11) NOT NULL
);

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`cid`, `title`, `dept_name`, `credits`) VALUES
('101001', 'Physics', 'Science', 3),
('101002', 'Mathematics', 'Science', 3),
('201001', 'Programming', 'Computer Engineering', 2),
('201002', 'Database Systems', 'Computer Engineering', 3),
('301001', 'Software Engineering', 'Computer Engineering', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Professor`
--

CREATE TABLE `Professor` (
  `pid` varchar(8) NOT NULL,
  `pname` varchar(256) NOT NULL,
  `salary` int(11) NOT NULL
);

--
-- Dumping data for table `Professor`
--

INSERT INTO `Professor` (`pid`, `pname`, `salary`) VALUES
('001', 'Michael', 35000),
('002', 'Simon', 40000),
('003', 'William', 25000),
('004', 'Ken', 40000),
('005', 'Steve', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `Section`
--

CREATE TABLE `Section` (
  `cid` varchar(8) NOT NULL,
  `sect_id` varchar(8) NOT NULL,
  `semester` varchar(16) NOT NULL,
  `year` year(4) NOT NULL,
  `building` varchar(256) NOT NULL,
  `room` varchar(16) NOT NULL,
  `timeslot_id` varchar(8) NOT NULL
);

--
-- Dumping data for table `Section`
--

INSERT INTO `Section` (`cid`, `sect_id`, `semester`, `year`, `building`, `room`, `timeslot_id`) VALUES
('101001', '1', '1', 2015, 'SCI 03', '512', '1'),
('101002', '1', '1', 2015, 'SCI 28', '418', '2'),
('101002', '2', '1', 2015, 'SCI 28', '317', '3'),
('201001', '1', 'summer', 2015, 'ENG 3', '305', '3'),
('201001', '2', 'summer', 2015, 'ENG 3', '405', '3'),
('201001', '3', 'summer', 2015, 'ENG 3', '309', '1'),
('201002', '1', '2', 2015, 'ENG 100', '405', '2'),
('301001', '1', '2', 2015, 'ENG 3', '309', '2'),
('301001', '2', '2', 2015, 'ENG 3', '305', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `student_id` varchar(16) NOT NULL,
  `name` varchar(256) NOT NULL,
  `year` int(11) NOT NULL,
  `email` varchar(256) DEFAULT NULL
);

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`student_id`, `name`, `year`, `email`) VALUES
('55489317', 'Zinnia', 3, '55489317@student.chula.ac.th'),
('55748896', 'Tulip', 3, '55748896@student.chula.ac.th'),
('56717931', 'Rose', 2, '56717931@student.chula.ac.th'),
('56756421', 'Orchid', 2, '56756421@student.chula.ac.th'),
('57712358', 'Lotus', 1, '57712358@student.chula.ac.th'),
('57723547', 'Jasmine', 1, '57723547@student.chula.ac.th');

-- --------------------------------------------------------

--
-- Table structure for table `Takes`
--

CREATE TABLE `Takes` (
  `student_id` varchar(16) NOT NULL,
  `cid` varchar(8) NOT NULL,
  `sect_id` varchar(8) NOT NULL,
  `semester` varchar(16) NOT NULL,
  `year` year(4) NOT NULL,
  `grade` varchar(10) DEFAULT NULL
);

--
-- Dumping data for table `Takes`
--

INSERT INTO `Takes` (`student_id`, `cid`, `sect_id`, `semester`, `year`, `grade`) VALUES
('55489317', '301001', '1', '2', 2015, 'C'),
('55748896', '201002', '1', '2', 2015, 'A'),
('56717931', '201001', '3', 'summer', 2015, 'B'),
('56756421', '201001', '1', 'summer', 2015, 'A'),
('57712358', '101001', '1', '1', 2015, 'A'),
('57712358', '101002', '2', '1', 2015, 'B'),
('57723547', '101001', '1', '1', 2015, 'A'),
('57723547', '101002', '1', '1', 2015, 'B+');

-- --------------------------------------------------------

--
-- Table structure for table `Teaches`
--

CREATE TABLE `Teaches` (
  `pid` varchar(8) NOT NULL,
  `cid` varchar(8) NOT NULL,
  `sect_id` varchar(8) NOT NULL,
  `semester` varchar(16) NOT NULL,
  `year` year(4) NOT NULL
);

--
-- Dumping data for table `Teaches`
--

INSERT INTO `Teaches` (`pid`, `cid`, `sect_id`, `semester`, `year`) VALUES
('001', '101001', '1', '1', 2015),
('002', '101002', '1', '1', 2015),
('002', '101002', '2', '1', 2015),
('003', '201001', '1', 'summer', 2015),
('003', '201001', '2', 'summer', 2015),
('003', '201001', '3', 'summer', 2015),
('004', '201002', '1', '2', 2015),
('005', '301001', '1', '2', 2015),
('005', '301001', '2', '2', 2015);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `Professor`
--
ALTER TABLE `Professor`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `Section`
--
ALTER TABLE `Section`
  ADD PRIMARY KEY (`cid`,`sect_id`,`semester`,`year`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `Takes`
--
ALTER TABLE `Takes`
  ADD PRIMARY KEY (`student_id`,`cid`,`sect_id`,`semester`,`year`),
  ADD KEY `takes_ibfk_2` (`cid`,`sect_id`,`semester`,`year`);

--
-- Indexes for table `Teaches`
--
ALTER TABLE `Teaches`
  ADD PRIMARY KEY (`pid`,`cid`,`sect_id`,`semester`,`year`),
  ADD KEY `teaches_ibfk_2` (`cid`,`sect_id`,`semester`,`year`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Section`
--
ALTER TABLE `Section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`);

--
-- Constraints for table `Takes`
--
ALTER TABLE `Takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`cid`,`sect_id`,`semester`,`year`) REFERENCES `Section` (`cid`, `sect_id`, `semester`, `year`);

--
-- Constraints for table `Teaches`
--
ALTER TABLE `Teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professor` (`pid`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`cid`,`sect_id`,`semester`,`year`) REFERENCES `section` (`cid`, `sect_id`, `semester`, `year`);
COMMIT;


