--YP Great work! 100%
--test Presidents 
--test for The first president's term began in 1789 soon after the Constitution was ratified. 
insert president(Num, FirstName, LastName, Party, dateBorn, DateDied, TermStart, TermEnd)
      select 77, 'George', 'Washington', 'None, Federalist', '1732-02-22', '1799-12-14', 1788, 1797
      --test for   Term end cannot be before term start.
      insert president(Num, FirstName, LastName, Party, dateBorn, DateDied, TermStart, TermEnd)
      select 77, 'George', 'Washington', 'None, Federalist', '1732-02-22', '1799-12-14', 1798, 1797
      --test for A president must be at least 35 years old.
        insert president(Num, FirstName, LastName, Party, dateBorn, DateDied, TermStart, TermEnd)
      select 77, 'George', 'Washington', 'None, Federalist', '1800-02-22', '1890-12-14', 1834, 1838
      --test for null
      insert president(Num, FirstName, LastName, Party, dateBorn, DateDied, TermStart, TermEnd)
      select 77, null, 'Washington', 'None, Federalist', '1732-02-22', '1799-12-14', 1788, 1798
      --test for blank column
      insert president(Num, FirstName, LastName, Party, dateBorn, DateDied, TermStart, TermEnd)
      select 77, '', 'Washington', 'None, Federalist', '1732-02-22', '1799-12-14', 1788, 1798
      --test for cannot be zero
      insert president(Num, FirstName, LastName, Party, dateBorn, DateDied, TermStart, TermEnd)
      select 0, 'George', 'Washington', 'None, Federalist', '1732-02-22', '1799-12-14', 1788, 1798