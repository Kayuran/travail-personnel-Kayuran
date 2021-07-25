-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 19, 2019 at 02:38 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `moviesdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ranking` tinyint(1) DEFAULT NULL,
  `FK_idIMDB` varchar(25) NOT NULL,
  `FK_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`ranking`, `FK_idIMDB`, `FK_idUser`) VALUES
(1, 'tt0080684', 9),
(1, 'tt0080684', 11),
(1, 'tt0087332', 9),
(1, 'tt0087332', 10),
(1, 'tt0088763', 9),
(1, 'tt0093409', 9),
(1, 'tt0095016', 9),
(1, 'tt0096874', 9),
(1, 'tt0096895', 9),
(1, 'tt0097576', 9),
(-1, 'tt0099785', 9),
(1, 'tt0103639', 9),
(1, 'tt0107290', 9),
(1, 'tt0110475', 9),
(1, 'tt0114709', 9),
(-1, 'tt0116629', 9),
(1, 'tt0119116', 9),
(-1, 'tt0120591', 9),
(1, 'tt0120623', 11),
(-1, 'tt0120685', 9),
(-1, 'tt0120855', 9),
(1, 'tt0126029', 9),
(1, 'tt0126029', 11),
(-1, 'tt0195714', 9),
(0, 'tt0287978', 9),
(1, 'tt0289043', 9),
(0, 'tt0315327', 9),
(-1, 'tt0319262', 9),
(0, 'tt0325980', 9),
(0, 'tt0360717', 9),
(1, 'tt0360717', 10),
(-1, 'tt0369610', 9),
(1, 'tt0371746', 9),
(-1, 'tt0418279', 9),
(1, 'tt0451279', 9),
(1, 'tt0451279', 11),
(0, 'tt0478970', 9),
(1, 'tt0478970', 13),
(0, 'tt0831387', 9),
(1, 'tt0848228', 9),
(1, 'tt0959324', 13),
(1, 'tt1119646', 9),
(0, 'tt1386697', 9),
(-1, 'tt1431045', 9),
(0, 'tt1440129', 9),
(1, 'tt1440129', 10),
(0, 'tt1490017', 9),
(1, 'tt1490017', 11),
(1, 'tt1700841', 9),
(1, 'tt2015381', 9),
(1, 'tt2015381', 11),
(0, 'tt2094766', 9),
(-1, 'tt2779318', 9),
(1, 'tt2779318', 10),
(1, 'tt2802144', 11),
(1, 'tt3183660', 13),
(1, 'tt3731562', 9),
(0, 'tt3748528', 9),
(1, 'tt3748528', 11),
(1, 'tt3896198', 9),
(1, 'tt3896198', 10),
(1, 'tt3896198', 11),
(0, 'tt4116284', 9),
(1, 'tt4624424', 9);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `idIMDB` varchar(25) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `summary` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`idIMDB`, `title`, `year`, `rating`, `picture`, `duration`, `summary`) VALUES
('tt0080684', 'The Empire Strikes Back', 1980, 8.2, './movies/6u1fYtxG5eqjhtCPDx04pJphQRW.jpg', 124, 'The epic saga continues as Luke Skywalker, in hopes of defeating the evil Galactic Empire, learns the ways of the Jedi from aging master Yoda. But Darth Vader is more determined than ever to capture Luke. Meanwhile, rebel leader Princess Leia, cocky Han Solo, Chewbacca, and droids C-3PO and R2-D2 are thrown into various stages of capture, betrayal and despair.'),
('tt0087277', 'Footloose', 1984, 6.3, './movies/79iEen28ai1rsXvOVWRJuHrsexO.jpg', 107, 'Classic tale of teen rebellion and repression features a delightful combination of dance choreography and realistic and touching performances. When teenager Ren and his family move from big-city Chicago to a small town in the West, he\'s in for a real case of culture shock.'),
('tt0087332', 'Ghostbusters', 1984, 7.3, './movies/3FS3oBdorgczgfCkFi2u8ZTFfpS.jpg', 107, 'After losing their academic posts at a prestigious university, a team of parapsychologists goes into business as proton-pack-toting \"ghostbusters\" who exterminate ghouls, hobgoblins and supernatural pests of all stripes. An ad campaign pays off when a knockout cellist hires the squad to purge her swanky digs of demons that appear to be living in her refrigerator.'),
('tt0088763', 'Back to the Future', 1985, 7.9, './movies/pTpxQB1N0waaSc3OSn0e9oc8kx9.jpg', 116, 'Eighties teenager Marty McFly is accidentally sent back in time to 1955, inadvertently disrupting his parents\' first meeting and attracting his mother\'s romantic interest. Marty must repair the damage to history by rekindling his parents\' romance and - with the help of his eccentric inventor friend Doc Brown - return to 1985.'),
('tt0093409', 'Lethal Weapon', 1987, 6.9, './movies/r4njF5h9IN0y1ZKFP1hYFmZU3Rk.jpg', 110, 'Veteran buttoned-down LAPD detective Roger Murtaugh is partnered with unhinged cop Martin Riggs, who -- distraught after his wife\'s death -- has a death wish and takes unnecessary risks with criminals at every turn. The odd couple embark on their first homicide investigation as partners, involving a young woman known to Murtaugh with ties to a drug and prostitution ring.'),
('tt0095016', 'Die Hard', 1988, 7.4, './movies/mc7MubOLcIw3MDvnuQFrO9psfCa.jpg', 131, 'NYPD cop, John McClane\'s plan to reconcile with his estranged wife is thrown for a serious loop when minutes after he arrives at her office, the entire building is overtaken by a group of terrorists. With little help from the LAPD, wisecracking McClane sets out to single-handedly rescue the hostages and bring the bad guys down.'),
('tt0096874', 'Back to the Future Part II', 1989, 7.4, './movies/k5dzvCQkXU2CAhLtlj9BHE7xmyK.jpg', 108, 'Marty and Doc are at it again in this wacky sequel to the 1985 blockbuster as the time-traveling duo head to 2015 to nip some McFly family woes in the bud. But things go awry thanks to bully Biff Tannen and a pesky sports almanac. In a last-ditch attempt to set things straight, Marty finds himself bound for 1955 and face to face with his teenage parents -- again.'),
('tt0096895', 'Batman', 1989, 7, './movies/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg', 126, 'The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham\'s underworld.'),
('tt0097576', 'Indiana Jones and the Last Crusade', 1989, 7.6, './movies/4p1N2Qrt8j0H8xMHMHvtRxv9weZ.jpg', 127, 'When Dr. Henry Jones Sr. suddenly goes missing while pursuing the Holy Grail, eminent archaeologist Indiana must team up with Marcus Brody, Sallah and Elsa Schneider to follow in his father\'s footsteps and stop the Nazis from recovering the power of eternal life.'),
('tt0099785', 'Home Alone', 1990, 7, './movies/8IWPBT1rkAaI8Kpk5V3WfQRklJ7.jpg', 103, 'Eight-year-old Kevin McCallister makes the most of the situation after his family unwittingly leaves him behind when they go on Christmas vacation. But when a pair of bungling burglars set their sights on Kevin\'s house, the plucky kid stands ready to defend his territory. By planting booby traps galore, adorably mischievous Kevin stands his ground as his frantic mother attempts to race home before.'),
('tt0103639', 'Aladdin', 1992, 7.4, './movies/qsHpmqekgeQKMKL8PWnFsrXTXGs.jpg', 90, 'Princess Jasmine grows tired of being forced to remain in the palace and she sneaks out into the marketplace  in disguise where she meets street-urchin Aladdin and the two fall in love, although she may only marry a prince. After being thrown in jail, Aladdin and becomes embroiled in a plot to find a mysterious lamp with which the evil Jafar hopes to rule the land.'),
('tt0107290', 'Jurassic Park', 1993, 7.5, './movies/c414cDeQ9b6qLPLeKmiJuLDUREJ.jpg', 127, 'A wealthy entrepreneur secretly creates a theme park featuring living dinosaurs drawn from prehistoric DNA. Before opening day, he invites a team of experts and his two eager grandchildren to experience the park and help calm anxious investors. However, the park is anything but amusing as the security systems go off-line and the dinosaurs escape.'),
('tt0109830', 'Forrest Gump', 1994, 8.1, './movies/yE5d3BUhE8hCnkMUJOo1QDoOGNz.jpg', 142, 'A man with a low IQ has accomplished great things in his life and been present during significant historic events - in each case, far exceeding what anyone imagined he could do. Yet, despite all the things he has attained, his one true love eludes him. \'Forrest Gump\' is the story of a man who rose above his challenges, and who proved that determination, courage, and love are more important than ability.'),
('tt0110475', 'The Mask', 1994, 6.6, './movies/v8x8p441l1Bep8p82pAG6rduBoK.jpg', 101, 'When timid bank clerk Stanley Ipkiss discovers a magical mask containing the spirit of the Norse god Loki, his entire life changes. While wearing the mask, Ipkiss becomes a supernatural playboy exuding charm and confidence which allows him to catch the eye of local nightclub singer Tina Carlyle. Unfortunately, under the mask\'s influence, Ipkiss also robs a bank, which angers junior crime lord Dorian Tyrell, whose goons get blamed for the heist.'),
('tt0114709', 'Toy Story', 1995, 7.6, './movies/rhIRbceoE9lR4veEXuwCC2wARtG.jpg', 81, 'Led by Woody, Andy\'s toys live happily in his room until Andy\'s birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy\'s heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.'),
('tt0116629', 'Independence Day', 1996, 6.7, './movies/bqLlWZJdhrS0knfEJRkquW7L8z2.jpg', 145, 'On July 2, a giant alien mothership enters orbit around Earth and deploys several dozen saucer-shaped \'destroyer\' spacecraft that quickly lay waste to major cities around the planet. On July 3, the United States conducts a coordinated counterattack that fails. On July 4 the a plan is devised to gain access to the interior of the alien mothership in space in order to plant a nuclear missile.'),
('tt0117705', 'Space Jam', 1996, 6.4, './movies/bJhVLribUKCrKv1h1WFqv4QmRWM.jpg', 88, 'In a desperate attempt to win a basketball match and earn their freedom, the Looney Tunes seek the aid of retired basketball champion, Michael Jordan.'),
('tt0119116', 'The Fifth Element', 1997, 7.2, './movies/zaFa1NRZEnFgRTv5OVXkNIZO78O.jpg', 126, 'In 2257, a taxi driver is unintentionally given the task of saving a young girl who is part of the key that will ensure the survival of humanity.'),
('tt0120591', 'Armageddon', 1998, 6.4, './movies/coINnuCzcw5FMHBty8hcudMOBnO.jpg', 151, 'When an asteroid threatens to collide with Earth, NASA honcho Dan Truman determines the only way to stop it is to drill into its surface and detonate a nuclear bomb. This leads him to renowned driller Harry Stamper, who agrees to helm the dangerous space mission provided he can bring along his own hotshot crew. Among them is the cocksure A.J. who Harry thinks isn\'t good enough for his daughter, until the mission proves otherwise.'),
('tt0120623', 'A Bug\'s Life', 1998, 6.8, './movies/u9qGMRwcPwP0WETxulS5hKUsEum.jpg', 95, 'On behalf of \"oppressed bugs everywhere,\" an inventive ant named Flik hires a troupe of warrior bugs to defend his bustling colony from a horde of freeloading grasshoppers led by the evil-minded Hopper.'),
('tt0120685', 'Godzilla', 1998, 5.2, './movies/5axr56XqJH2xqkzI4j5sjzgV1Hu.jpg', 139, 'When a freighter is viciously attacked in the Pacific Ocean, a team of experts -- including biologist Niko Tatopoulos and scientists Elsie Chapman and Mendel Craven -- concludes that an oversized reptile is the culprit. Before long, the giant lizard is loose in Manhattan, destroying everything within its reach. The team chases the monster to Madison Square Garden, where a brutal battle ensues.'),
('tt0120812', 'Rush Hour', 1998, 6.8, './movies/jdfxpW5LF36sHsHjyH8CMBEG4TF.jpg', 98, 'When Hong Kong Inspector Lee is summoned to Los Angeles to investigate a kidnapping, the FBI doesn\'t want any outside help and assigns cocky LAPD Detective James Carter to distract Lee from the case. Not content to watch the action from the sidelines, Lee and Carter form an unlikely partnership and investigate the case themselves.'),
('tt0120855', 'Tarzan', 1999, 7.1, './movies/hnTrfKJmnPLMTajHw2RDgv6hVyH.jpg', 88, 'Tarzan was a small orphan who was raised by an ape named Kala since he was a child. He believed that this was his family, but on an expedition Jane Porter is rescued by Tarzan. He then finds out that he\'s human. Now Tarzan must make the decision as to which family he should belong to...'),
('tt0126029', 'Shrek', 2001, 7.3, './movies/140ewbWv8qHStD3mlBDvvGd0Zvu.jpg', 90, 'It ain\'t easy bein\' green -- especially if you\'re a likable (albeit smelly) ogre named Shrek. On a mission to retrieve a gorgeous princess from the clutches of a fire-breathing dragon, Shrek teams up with an unlikely compatriot -- a wisecracking donkey.'),
('tt0165982', 'Sinbad: Legend of the Seven Seas', 2003, 6.5, './movies/6LELf4ZzVBJwR9mNq86Mf5QVERS.jpg', 86, 'The sailor of legend is framed by the goddess Eris for the theft of the Book of Peace, and must travel to her realm at the end of the world to retrieve it and save the life of his childhood friend Prince Proteus.'),
('tt0175142', 'Scary Movie', 2000, 5.9, './movies/bvVmVFBVQLytK1H4TJTFdnhvf4T.jpg', 88, 'Following on the heels of popular teen-scream horror movies, with uproarious comedy and biting satire. Marlon and Shawn Wayans, Shannon Elizabeth and Carmen Electra pitch in to skewer some of Hollywood\'s biggest blockbusters, including Scream, I Know What You Did Last Summer, The Matrix, American Pie and The Blair Witch Project.'),
('tt0195714', 'Final Destination', 2000, 6.4, './movies/nW6JfCIWqUpIESlras0nrVy4pCl.jpg', 98, 'After a teenager has a terrifying vision of him and his friends dying in a plane crash, he prevents the accident only to have Death hunt them down, one by one.'),
('tt0287978', 'Daredevil', 2003, 5, './movies/dNVEqwgIdrwWQL3zXI5mQG60oM5.jpg', 103, 'He dwells in a world of eternal night, but the blackness is filled with sounds and scents, tastes and textures that most cannot perceive. Although attorney Matt Murdock is blind, his other four senses function with superhuman sharpness. By day, Murdock represents the downtrodden. At night he is Daredevil, a masked vigilante stalking the dark streets of the city, a relentless avenger of justice.'),
('tt0289043', '28 Days Later', 2002, 7, './movies/xaYdxi1PBEAYvqknvAmMPK5Eff3.jpg', 113, 'Twenty-eight days after a killer virus was accidentally unleashed from a British research facility, a small group of London survivors are caught in a desperate struggle to protect themselves from the infected. Carried by animals and humans, the virus turns those it infects into homicidal maniacs -- and it\'s absolutely impossible to contain.'),
('tt0315327', 'Bruce Almighty', 2003, 6.4, './movies/y5TEe8Qbgn91dwqVm9FqE2PEL4Q.jpg', 101, 'Bruce Nolan toils as a \"human interest\" television reporter in Buffalo, N.Y. Despite his high ratings and the love of his beautiful girlfriend, Grace, Bruce remains unfulfilled. At the end of the worst day in his life, he angrily ridicules God -- and the Almighty responds, endowing Bruce with all of His divine powers.'),
('tt0319262', 'The Day After Tomorrow', 2004, 6.2, './movies/qbEzEau8a7Tf0aVs3gMi5ylMrf1.jpg', 124, 'After years of increases in the greenhouse effect,  havoc is wreaked globally in the form of catastrophic hurricanes, tornadoes, tidal waves, floods and the beginning of a new Ice Age. Paleoclimatologist, Jack Hall tries to warn the world while also shepherding to safety his son, trapped in New York after the city is overwhelmed by the start of the new big freeze.'),
('tt0325980', 'Pirates of the Caribbean: The Curse of the Black Pearl', 2003, 7.4, './movies/tkt9xR1kNX5R9rCebASKck44si2.jpg', 143, 'Jack Sparrow, a freewheeling 17th-century pirate who roams the Caribbean Sea, butts heads with a rival pirate bent on pillaging the village of Port Royal. When the governor\'s daughter is kidnapped, Sparrow decides to help the girl\'s love save her. But their seafaring mission is hardly simple.'),
('tt0327850', 'The Rundown', 2003, 6.3, './movies/jPkfNgTuVdj8hp2znt5MxIAz5W7.jpg', 104, 'When Trfeedback, the mouthy son of a criminal, disappears in the Amazon in search of a treasured artifact, his father sends in Beck, who becomes Trfeedback\'s rival for the affections of Mariana, a mysterious Brazilian woman. With his steely disposition, Beck is a man of few words -- but it takes him all the discipline he can muster to work with Trfeedback to nab a tyrant who\'s after the same treasure.'),
('tt0351283', 'Madagascar', 2005, 6.5, './movies/2YiESGB68BGQSAFvfJxBi774sc4.jpg', 86, 'Zoo animals leave the comforts of man-made habitats for exotic adventure in this animated family film. After escaping from the zoo, four friends -- a lion, a hippo, a zebra and a giraffe -- are sent back to Africa. When their ship capsizes, stranding them on Madagascar, an island populated by crazy critters, the pals must adapt to jungle life and their new roles as wild animals.'),
('tt0360717', 'King Kong', 2005, 6.6, './movies/iQYMVoI9QE2wQCOSrxhiBYd4v0w.jpg', 187, 'In 1933 New York, an overly ambitious movie producer coerces his cast and hired ship crew to travel to mysterious Skull Island, where they encounter Kong, a giant ape who is immediately smitten with the leading lady.'),
('tt0366548', 'Happy Feet', 2006, 5.9, './movies/8RLEzftZK87S2usLsQoYtyNYzoV.jpg', 108, 'Into the world of the Emperor Penguins, who find their soul mates through song, a penguin is born who cannot sing. But he can tap dance something fierce!'),
('tt0369610', 'Jurassic World', 2015, 6.5, './movies/jjBgi2r5cRt36xF6iNUEhzscEcb.jpg', 124, 'Twenty-two years after the events of Jurassic Park, Isla Nublar now features a fully functioning dinosaur theme park, Jurassic World, as originally envisioned by John Hammond.'),
('tt0371746', 'Iron Man', 2008, 7.3, './movies/s2IG9qXfhJYxIttKyroYFBsHwzQ.jpg', 126, 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.'),
('tt0373051', 'Journey to the Center of the Earth', 2008, 5.7, './movies/nlYk34gpPfM6KFujxB9HTHZyeiL.jpg', 93, 'On a quest to find out what happened to his missing brother, a scientist, his nephew and their mountain guide discover a fantastic and dangerous lost world in the center of the earth.'),
('tt0400717', 'Open Season', 2006, 6.1, './movies/9TY3wQPNhZ60Mng0JetKEOfXqxU.jpg', 83, 'Boog, a domesticated 900lb. Grizzly bear finds himself stranded in the woods 3 days before Open Season. Forced to rely on Elliot, a fast-talking mule deer, the two form an unlikely friendship and must quickly rally other forest animals if they are to form a rag-tag army against the hunters.'),
('tt0418279', 'Transformers', 2007, 6.6, './movies/bgSHbGEA1OM6qDs3Qba4VlSZsNG.jpg', 144, 'Young teenager, Sam Witwicky becomes involved in the ancient struggle between two extraterrestrial factions of transforming robots – the heroic Autobots and the evil Decepticons. Sam holds the clue to unimaginable power and the Decepticons will stop at nothing to retrieve it.'),
('tt0451279', 'Wonder Woman', 2017, 7.1, './movies/gfJGlDaHuWimErCr5Ql0I8x9QSy.jpg', 141, 'An Amazon princess comes to the world of Man to become the greatest of the female superheroes.'),
('tt0478970', 'Ant-Man', 2015, 7, './movies/D6e8RJf2qUstnfkTslTXNTUAlT.jpg', 117, 'Armed with the astonishing ability to shrink in scale but increase in strength, master thief Scott Lang must embrace his inner-hero and help his mentor, Doctor Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.'),
('tt0831387', 'Godzilla', 2014, 6.1, './movies/szVwkB4H5yyOJBVuQ432b9boO0N.jpg', 123, 'Fifteen years after an \'incident\' at a Japanese nuclear power plant, physicist Joe Brody joins forces with his soldier son Ford to discover for themselves what really happened.  What they uncover is prelude to global-threatening devastation.  An epic rebirth to Toho\'s iconic Godzilla, this spectacular adventure pits the world\'s most famous monster against malevolent creatures who, bolstered by humanity\'s scientific arrogance, threaten our very existence.'),
('tt0848228', 'The Avengers', 2012, 7.4, './movies/cezWGskPY5x7GaglTTRN4Fugfb8.jpg', 143, 'When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!'),
('tt0959324', 'Max & Co', 2007, 6.8, './movies/y49r5d1B09WBHKtFomb5h2xnhzd.jpg', 76, '15-year-old Max is in search of his father, the famous troubadour Johnny Bigoude, who disappeared shortly after Max\'s birth. He reaches Saint-Hilare where Madam Doudou, the old teacher, takes care of him and finds him a job as elevator musician in the fly swatter factory Bzzz &amp; Co. But the factory doesn\'t run well and half of the village gets fired. To boost the swatter sales, a dangerous scientist creates a mass production of flies. Soon, a thick cloud of insects attacks the village...'),
('tt1119646', 'The Hangover', 2009, 7.1, './movies/uluhlXubGu1VxU63X9VHCLWDAYP.jpg', 100, 'When three friends finally come to after a raucous night of bachelor-party revelry, they find a baby in the closet and a tiger in the bathroom. But they can\'t seem to locate their best friend, Doug – who\'s supposed to be tying the knot. Launching a frantic search for Doug, the trio perseveres through a nasty hangover to try to make it to the church on time.'),
('tt1185834', 'Star Wars: The Clone Wars', 2008, 5.9, './movies/xd6yhmtS6mEURZLwUDT5raEMbf.jpg', 98, 'Set between Episode II and III the Clone Wars is the first computer animated Star Wars film. Anakin and Obi Wan must find out who kidnapped Jabba the Hutts son and return him safely. The Seperatists will try anything to stop them and ruin any chance of a diplomatic agreement between the Hutt\'s and the Republic.'),
('tt1386697', 'Suicide Squad', 2016, 5.9, './movies/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg', 123, 'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.'),
('tt1430626', 'The Pirates! In an Adventure with Scientists!', 2012, 6.4, './movies/w5NquAU73QRayUB4ZfF6F6eyY2e.jpg', 88, 'In The Pirates! Band of Misfits, Hugh Grant stars in his first animated role as the luxuriantly bearded Pirate Captain – a boundlessly enthusiastic, if somewhat less-than-successful, terror of the High Seas. With a rag-tag crew at his side (Martin Freeman, Brendan Gleeson, Russell Tovey, and Ashley Jensen), and seemingly blind to the impossible odds stacked against him, the Captain has one dream: to beat his bitter rivals Black Bellamy (Jeremy Piven) and Cutlass Liz (Salma Hayek) to the much cov'),
('tt1431045', 'Deadpool', 2016, 7.3, './movies/inVq3FRqcYIRl2la8iZikYYxFNR.jpg', 108, 'Based upon Marvel Comics’ most unconventional anti-hero, DEADPOOL tells the origin story of former Special Forces operative turned mercenary Wade Wilson, who after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life.'),
('tt1440129', 'Battleship', 2012, 5.5, './movies/7hN6WtMepoMZyeHZU2DM21cEj3z.jpg', 131, 'When mankind beams a radio signal into space, a reply comes from ‘Planet G’, in the form of several alien crafts that splash down in the waters off Hawaii. Lieutenant Alex Hopper is a weapons officer assigned to the USS John Paul Jones, part of an international naval coalition which becomes the world\'s last hope for survival as they engage the hostile alien force of unimaginable strength. While taking on the invaders, Hopper must also try to live up to the potential his brother, and his fiancée\''),
('tt1490017', 'The Lego Movie', 2014, 7.5, './movies/lMHbadNmznKs5vgBAkHxKGHulOa.jpg', 100, 'An ordinary Lego mini-figure, mistakenly thought to be the extraordinary MasterBuilder, is recruited to join a quest to stop an evil Lego tyrant from gluing the universe together.'),
('tt1700841', 'Sausage Party', 2016, 5.7, './movies/w90cORtNWQAd2k93aFlIBbpQYTC.jpg', 83, 'Sausage Party, the first R-rated CG animated movie, is about one sausage leading a group of supermarket products on a quest to discover the truth about their existence and what really happens when they become chosen to leave the grocery store.'),
('tt2015381', 'Guardians of the Galaxy', 2014, 7.9, './movies/y31QB9kn3XSudA15tV7UWQ9XLuW.jpg', 121, 'Light years from Earth, 26 years after being abducted, Peter Quill finds himself the prime target of a manhunt after discovering an orb wanted by Ronan the Accuser.'),
('tt2094766', 'Assassin\'s Creed', 2016, 5.4, './movies/tIKFBxBZhSXpIITiiB5Ws8VGXjt.jpg', 115, 'Through unlocked genetic memories that allow him to relive the adventures of his ancestor in 15th century Spain, Callum Lynch discovers he\'s a descendant of the secret \'Assassins\' society. After gaining incredible knowledge and skills, he is now poised to take on the oppressive Knights Templar in the present day.'),
('tt2779318', 'Doctor Who: The Day of the Doctor', 2013, 8.2, './movies/lQy2QVcacuH55k37K9Ox0gw3YpZ.jpg', 77, 'In 2013, something terrible is awakening in London\'s National Gallery; in 1562, a murderous plot is afoot in Elizabethan England; and somewhere in space an ancient battle reaches its devastating conclusion. All of reality is at stake as the Doctor\'s own dangerous past comes back to haunt him.'),
('tt2802144', 'Kingsman: The Secret Service', 2015, 7.6, './movies/8x7ej0LnHdKUqilNNJXYOeyB6L9.jpg', 130, 'The story of a super-secret spy organization that recruits an unrefined but promising street kid into the agency\'s ultra-competitive training program just as a global threat emerges from a twisted tech genius.'),
('tt3183660', 'Fantastic Beasts and Where to Find Them', 2016, 7.1, './movies/gri0DDxsERr6B2sOR1fGLxLpSLx.jpg', 133, 'In 1926, Newt Scamander arrives at the Magical Congress of the United States of America with a magically expanded briefcase, which houses a number of dangerous creatures and their habitats. When the creatures escape from the briefcase, it sends the American wizarding authorities after Newt, and threatens to strain even further the state of magical and non-magical relations.'),
('tt3731562', 'Kong: Skull Island', 2017, 6, './movies/r2517Vz9EhDhj88qwbDVj8DCRZN.jpg', 118, 'Explore the mysterious and dangerous home of the king of the apes as a team of explorers ventures deep inside the treacherous, primordial island.'),
('tt3748528', 'Rogue One: A Star Wars Story', 2016, 7.3, './movies/qjiskwlV1qQzRCjpV0cL9pEMF9a.jpg', 133, 'A rogue band of resistance fighters unite for a mission to steal the Death Star plans and bring a new hope to the galaxy.'),
('tt3896198', 'Guardians of the Galaxy Vol. 2', 2017, 7.8, './movies/gaHepzSTMkGwsSKAqiBgroSCf07.jpg', 137, 'The Guardians must fight to keep their newfound family together as they unravel the mysteries of Peter Quill\'s true parentage.'),
('tt4116284', 'The Lego Batman Movie', 2017, 7.2, './movies/1pHOqpdCYNmtRVJs6pGKQKttrPm.jpg', 104, 'In the irreverent spirit of fun that made “The Lego Movie” a worldwide phenomenon, the self-described leading man of that ensemble—Lego Batman—stars in his own big-screen adventure. But there are big changes brewing in Gotham, and if he wants to save the city from The Joker’s hostile takeover, Batman may have to drop the lone vigilante thing, try to work with others and maybe, just maybe, learn to lighten up.'),
('tt4624424', 'Storks', 2016, 6.7, './movies/5qVD5TD1CiALR5vUsMzh2BschVU.jpg', 87, 'Storks deliver babies…or at least they used to. Now they deliver packages for a global internet retail giant. Junior, the company’s top delivery stork, is about to be promoted when he accidentally activates the Baby Making Machine, producing an adorable and wholly unauthorized baby girl...');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `eMail` varchar(256) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `eMail`, `password`) VALUES
(9, 'me@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(10, 'fontaine@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(11, 'batard@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(12, 'quilan@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(13, 'ramos@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(14, 'blanvill@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(19, 'toto@gmail.com', '0b9c2625dc21ef05f6ad4ddf47c5f203837aa32c'),
(22, 'titi@gmail.com', 'f7e79ca8eb0b31ee4d5d6c181416667ffee528ed'),
(23, 'asdf@gmail.com', 'f55627ebc3997247413a4972baa5525d6d730370');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FK_idIMDB`,`FK_idUser`),
  ADD KEY `FK_feedback_idUser` (`FK_idUser`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`idIMDB`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `eMail` (`eMail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK_feedback_idIMDB` FOREIGN KEY (`FK_idIMDB`) REFERENCES `movies` (`idIMDB`),
  ADD CONSTRAINT `FK_feedback_idUser` FOREIGN KEY (`FK_idUser`) REFERENCES `users` (`idUser`);
