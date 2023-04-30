--AG Great job! 100% 
use RecordKeeperDB
delete ExecutiveOrders
delete president
delete party

insert Party(PartyName,YearStarted,Color)
select'Republican', 1854, 'Red' 
union select  'Democrat', 1828, 'Blue'
union select  'Federalist', 1791, 'Orange'
union select 'Whig', 1833, 'Yellow' 
union select 'None, Federalist', 1789, 'White'
union select 'National Union', 1864, 'Green'
union select'Democratic-Republican', 1792, 'purple'




insert president(Num, FirstName, LastName, partyID, DateBorn, DateDied, TermStart, TermEnd)
      select 1, 'George', 'Washington', (select z.PartyId from Party z where z.PartyName =  'None, Federalist'), '1732-02-22', '1799-12-14', 1789, 1797
union select 2, 'John', 'Adams', (select z.PartyId from Party z where z.PartyName =  'Federalist'), '1735-10-30', '1826-07-04', 1797, 1801
union select 3, 'Thomas', 'Jefferson', (select z.PartyId from Party z where z.PartyName ='Democratic-Republican'), '1743-04-13', '1826-07-04', 1801, 1809
union select 4, 'James', 'Madison', (select z.PartyId from Party z where z.PartyName ='Democratic-Republican'), '1751-03-16', '1836-06-28', 1809, 1817
union select 5, 'James', 'Monroe', (select z.PartyId from Party z where z.PartyName ='Democratic-Republican'), '1758-04-28', '1831-07-04', 1817, 1825
union select 6, 'John Quincy', 'Adams', (select z.PartyId from Party z where z.PartyName ='Democratic-Republican'), '1767-07-11', '1848-02-23', 1825, 1829
union select 7, 'Andrew', 'Jackson', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1767-03-15', '1845-06-08', 1829, 1837
union select 8, 'Martin', 'van Buren', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1782-12-05', '1862-07-24', 1837, 1841
union select 9, 'William H.', 'Harrison', (select z.PartyId from Party z where z.PartyName ='Whig'), '1773-02-09', '1841-04-04', 1841, 1841
union select 10, 'John', 'Tyler', (select z.PartyId from Party z where z.PartyName ='Whig'), '1790-03-29', '1862-01-18', 1841, 1845
union select 11, 'James K.', 'Polk', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1795-11-02', '1841-06-15', 1845, 1849
union select 12, 'Zachary', 'Taylor', (select z.PartyId from Party z where z.PartyName ='Whig'), '1784-11-24', '1850-07-09', 1849, 1850
union select 13, 'Millard', 'Fillmore', (select z.PartyId from Party z where z.PartyName ='Whig'), '1800-01-07', '1874-03-08', 1850, 1853
union select 14, 'Franklin', 'Pierce', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1804-11-23', '1869-10-08', 1853, 1857
union select 15, 'James', 'Buchanan', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1791-04-23', '1868-06-01', 1857, 1861
union select 16, 'Abraham', 'Lincoln', (select z.PartyId from Party z where z.PartyName ='Republican'), '1809-02-12', '1865-04-15', 1861, 1865
union select 17, 'Andrew', 'Johnson', (select z.PartyId from Party z where z.PartyName ='National Union'), '1808-12-29', '1875-07-31', 1865, 1869
union select 18, 'Ulysses S.', 'Grant', (select z.PartyId from Party z where z.PartyName ='Republican'), '1822-04-27', '1885-07-23', 1869, 1877
union select 19, 'Rutherford', 'Hayes', (select z.PartyId from Party z where z.PartyName ='Republican'), '1822-10-04', '1893-01-17', 1877, 1881
union select 20, 'James', 'Garfield', (select z.PartyId from Party z where z.PartyName ='Republican'), '1831-11-19', '1881-09-19', 1881, 1881
union select 21, 'Chester', 'Arthur', (select z.PartyId from Party z where z.PartyName ='Republican'), '1829-10-05', '1886-11-18', 1881, 1885
union select 22, 'Grover', 'Cleveland', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1837-03-18', '1908-06-24', 1885, 1889
union select 23, 'Benjamin', 'Harrison', (select z.PartyId from Party z where z.PartyName ='Republican'), '1833-08-20', '1901-03-13', 1889, 1893
union select 24, 'Grover', 'Cleveland', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1837-03-18', '1908-06-24', 1893, 1897
union select 25, 'William', 'McKinley', (select z.PartyId from Party z where z.PartyName ='Republican'), '1843-01-29', '1901-09-14', 1897, 1901
union select 26, 'Theodore', 'Roosevelt', (select z.PartyId from Party z where z.PartyName ='Republican'), '1858-10-27', '1919-01-06', 1901, 1909
union select 27, 'William', 'Taft', (select z.PartyId from Party z where z.PartyName ='Republican'), '1857-09-15', '1930-03-08', 1909, 1913
union select 28, 'Woodrow', 'Wilson', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1856-12-28', '1924-02-03', 1913, 1921
union select 29, 'Warren', 'Harding', (select z.PartyId from Party z where z.PartyName ='Republican'), '1865-11-02', '1923-08-02', 1921, 1923
union select 30, 'Calvin', 'Coolidge', (select z.PartyId from Party z where z.PartyName ='Republican'), '1872-07-04', '1933-01-05', 1923, 1929
union select 31, 'Herbert C.', 'Hoover', (select z.PartyId from Party z where z.PartyName ='Republican'), '1874-08-10', '1964-10-20', 1929, 1933
union select 32, 'Franklin Delano', 'Roosevelt', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1882-01-30', '1945-04-12', 1933, 1945
union select 33, 'Harry S', 'Truman', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1884-05-08', '1972-12-26', 1945, 1953
union select 34, 'Dwight David', 'Eisenhower', (select z.PartyId from Party z where z.PartyName ='Republican'), '1890-10-14', '1969-03-28', 1953, 1961
union select 35, 'John Fitzgerald', 'Kennedy', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1917-05-29', '1963-11-22', 1961, 1963
union select 36, 'Lyndon Baines', 'Johnson', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1908-08-27', '1973-01-22', 1963, 1969
union select 37, 'Richard Milhous', 'Nixon', (select z.PartyId from Party z where z.PartyName ='Republican'), '1913-01-09', '1994-04-22', 1969, 1974
union select 38, 'Gerald R.', 'Ford', (select z.PartyId from Party z where z.PartyName ='Republican'), '1913-07-14', '2006-12-26', 1974, 1977
union select 39, 'James Earl', 'Carter', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1924-10-01', null, 1977, 1981
union select 40, 'Ronald Wilson', 'Reagan', (select z.PartyId from Party z where z.PartyName ='Republican'), '1911-02-06', '2004-06-05', 1981, 1989
union select 41, 'George H. W.', 'Bush', (select z.PartyId from Party z where z.PartyName ='Republican'), '1924-06-12', '2018-11-30', 1989, 1993
union select 42, 'William Jefferson', 'Clinton', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1946-08-19', null, 1993, 2001
union select 43, 'George W.', 'Bush', (select z.PartyId from Party z where z.PartyName ='Republican'), '1946-07-06', null, 2001, 2009
union select 44, 'Barack', 'Obama', (select z.PartyId from Party z where z.PartyName =  'Democrat'), '1961-08-04', null, 2009, 2017
union select 45,'Donald','Trump',(select z.PartyId from Party z where z.PartyName ='Republican'),'1946-06-14',null,2017,2021
union select 46,'Joe','Biden',(select z.PartyId from Party z where z.PartyName =  'Democrat'),'1942-11-20',null,2021,null




insert ExecutiveOrders( PresidentId ,OrderNumber,PageNumber,YearIssued,OrderName,UpheldByCourt)
select (select p.PresidentId from president p where p.num = 32),6102,5,1993,'Forbidding the hoarding of gold coin, gold bullion, and gold certificates within the continental United States',1
union select (select p.PresidentId from president p where p.num = 33),9567,9617,1945,'Amending Executive Order No. 9095, as Amended by Executive Order No. 9193, To Define Further the Functions and Duties of the Alien Property Custodian With Respect to Property of Germany and Japan and Nationals Thereof',1
union select (select p.PresidentId from president p where p.num = 33),9568,6917,1945,'Providing for the Release of Scientific Information',1
union select (select p.PresidentId from president p where p.num = 33),9569,7235,1945,'Inspection by the Office of Price Administration of Corporation Statistical Transcript Cards Prepared From Income and Declared Value Excess Profits Tax Returns',1
union select (select p.PresidentId from president p where p.num = 33),10340,3139,1981,'Directing the Secretary of Commerce To Take Possession of and Operate the Plants and Facilities of Certain Steel Companies',0
union select (select p.PresidentId from president p where p.num = 44),13759,10135,2017,'Termination of the Wage and Price Regulatory Program',1
union select (select p.PresidentId from president p where p.num = 44),13762,5323,2017,'Designating the World Organisation for Animal Health as a Public International Organization Entitled to Enjoy Certain Privileges, Exemptions, and Immunities',1
union select (select p.PresidentId from president p where p.num = 40),12288,7619,2018,'Providing an Order of Succession Within the Department of Justice',1















