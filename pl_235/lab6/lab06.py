
from typing import List, Tuple, Dict, Optional, Union, Literal 
import random
from unittest import case


class WrongDate( Exception ) :
   def __init__( self, reason ) :
      self. __reason = reason

   def __repr__( self ) :
      return self.__reason 


class Date :
   year : int
   month : int
   day : int

   # In monthnames, the first name is the 'preferred name', which will be used
   # when printing. Any further names are optional names. 
   # One can also add different languages. 

   monthnames : Tuple[ List[ Union[ str, int ] ], ... ] = ( 
       [ 'january', 'jan', 1, '1' ], [ 'february', 'feb', '2', 2 ], 
       [ 'march', 3, '3' ],
       [ 'april', 4, '4' ],  [ 'may', 5, '5' ], [ 'june', 6, '6' ], 
       [ 'july', 7, '7' ],  [ 'august', 8, '8' ],
       [ 'september', 'sept', 9, '9' ], [ 'october', 'oct', 10, '10' ],
       [ 'november', 'nov', 11, '11' ],
       [ 'december', 'dec', 12, '12' ] )

   monthindex : Dict[ Union[ str, int ], int ] = { name : ind 
            for ind, names in enumerate( monthnames ) for name in names  } 
  
   normalyear = ( 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 )
   leapyear =   ( 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 )
    
   weekdays = ( 'sunday', 'monday', 'tuesday', 'wednesday', 
                'thursday', 'friday', 'saturday' ) 



   @classmethod
   def __init__( self, year : int, month : Union[ int, str ], day : int ) :
      
      if not (isinstance(year, int)):
         raise WrongDate ("Year must be int...")
      if not (isinstance(day, int)):
         raise WrongDate ("Day must be int...")
      if(year > 2100 or year < 1900):
         raise WrongDate ("Wrong year. Input between 1900 - 2100...")
      if not (month in self.monthindex):
         raise WrongDate ("Ooops, lokks like there is no such month...")
      if(self.isleapyear(year)):
         if (day < 1 or day > self.leapyear[self.monthindex[month] - 1]):
            raise WrongDate ("There is no such day...")
      if (day < 1 or day > self.normalyear[self.monthindex[month] - 1]):
            raise WrongDate ("There is no such day...")
      
      self.year = year
      self.month = self.monthindex[month] + 1
      self.day = day

   @classmethod
   def __repr__( self ) -> str :
      return "( {}, {}, {} )". format( self. year, self. month,
         self. day )

   @classmethod
   def __str__( self ) -> str :
      return "{}, {}, {}".format(self.year, self.monthnames[self.month - 1][1], self.day)

   @classmethod
   def weekday( self ) -> str :
      days = self.day
      print("days1 {}".format(days))
      if(self.isleapyear(self.year)):
         for i in self.leapyear[:self.monthindex[self.month]]:
            days += i
         print("leap")
      else:
         for i in self.normalyear[:self.monthindex[self.month]]:
            days += i
         print("norm")
      print("days2 {}".format(days))
      years = self.year
      while(years != 1900):
         print(years)
         if(self.isleapyear(years)):
            days += 366
            print(366)
         else:
            days += 365
            print(365)
         years -= 1
      print("days total: {}".format(days))
      return self.weekdays[days % 7]

   @staticmethod
   def isleapyear( y : int ) -> bool :
      if(y % 4 == 0 and ( y != 1900 or y != 2100 )):
         return True
      return False

def lucky_dates( ) :
   return [ ( 1956, 1, 31, 'tuesday', 'birthday of Guido Van Rossum' ),
     ( 1945, 'october', 24, 'wednesday', 'Founding of UN' ),
     ( 1969, 'july', 20, 'sunday', 'first moon landing' ),
     ( 1991, 'dec', 16, 'monday', 'independence of Kazakhstan' ),
     ( 1961, 'april', 12, 'wednesday', 'space flight of Yuri Gagarin' ), 
     ( 2022, 'september', 17, 'saturday', 'Nursultan renamed into Astana' ) ] 

def unlucky_dates( ) :
   return [ ( 1912, 'april', 15, 'monday', 'sinking of Titanic' ), 
     ( 1929, 'october', 29, 'tuesday',
                      'Wall Street Market Crash (Black Tuesday)' ), 
     ( 1959, 'february', 3, 'tuesday', 'the day the music died' ),
     ( 1977, 'march', 27, 'sunday', 'Los Rodeos collision' ),
     ( 2019, 'march', 23, 'saturday', 'Astana renamed into Nursultan' ), 
     ( 2022, 'october', 21, 'friday', '!! deadline of this exercise !!' ) ]


def tester( ) :
   '''
   for date in ( ( 'a', 1, 1 ), ( 2, 'x', 3 ), ( 3, 4, 'y' ), 
                 ( 1900, 'x', 12 ),
                 ( 1899, 1, 1 ), ( 1900, 1, 1 ), ( 1900, 'jan', 1 ),
                 ( 1910, 12, 31 ), ( 1911, 3.14, 8 ),
                 ( 1900, 'feb', 28 ), ( 1900, 'feb', 29 ) ) : 
      try :
         y,m,d = date
         print( "testing {} {} {}". format( y,m,d ))

         dt = Date(y,m,d) 
         print( "date = {}". format( dt )) 

      except WrongDate as w:
         print( "   exception {}". format(w) )
      print( "" ) 

   dates = lucky_dates( ) + unlucky_dates( ) 
   random. shuffle( dates )

   for date in dates: 
      y,m,d,w1, importance = date
      dt = Date(y,m,d) 
      w2 = dt. weekday( ) 
      print( "{} : {} ({})". format( importance, dt, w2 ))
      if w1 != w2 : 
         print( "function weekday returned {} but correct day is {} !!!". format( w2, w1 ))
      print( "" )
'''
   d = Date(1912, 4, 15)
   print(d.weekday())
   print( "tests finished" ) 

 
