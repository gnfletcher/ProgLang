% OVERALL TEST GOES HERE
test :- test1, not(test2), test3, not(test4).

% True
test1 :- jobs_ok(
   [
	[park, dunbar, khan, lloyd],
	[bashir, trivedi, ramos, franklin],
	[schmidt, nakamura, andrews, chen],
	[evans, goldberg, macmillan, ortiz]],
   [
	[andrews, 1, 1, 1],
	[bashir, 1, 1, 1],
	[chen, 1, 1, 1],
	[dunbar, 1, 1, 1],
	[evans, 1, 1, 1],
	[franklin, 1, 1, 1],
	[goldberg, 1, 1, 1],
	[jefferson, 1, 1, 1],
	[khan, 1, 1, 1],
	[lloyd, 1, 1, 1],
	[macmillan, 1, 1, 1],
	[nakamura, 1, 1, 1],
	[ortiz, 1, 1, 1],
	[park, 1, 1, 1],
	[ramos, 1, 1, 1],
	[schmidt, 1, 1, 1],
	[trivedi, 1, 1, 1]]).

% False
test2 :- jobs_ok(
   [
	[young, collins, vieira, liu],
	[davis, ericson, kelly, singh],
	[fitzgerald, gutierrez, martinez, tortorella],
	[hughes, jones, patel, zimmerman]],
   [
	[aziz, 1, 0, 0],
	[blumenthal, 0, 1, 1],
	[collins, 1, 1, 1],
	[davis, 1, 0, 0],
	[ericson, 1, 0, 0],
	[fitzgerald, 1, 0, 1],
	[gutierrez, 1, 0, 1],
	[hughes, 1, 0, 0],
	[jones, 1, 1, 1],
	[kelly, 0, 1, 1],
	[liu, 1, 0, 1],
	[martinez, 0, 1, 1],
	[patel, 1, 1, 1],
	[qureshi, 1, 1, 0],
	[rodriguez, 1, 0, 0],
	[singh, 0, 1, 1],
	[tortorella, 0, 0, 1],
	[williams, 1, 0, 0],
	[vieira, 0, 1, 0],
	[young, 0, 1, 0],
	[zimmerman, 1, 1, 1]]).

% True
test3 :-    jobs_ok([
	[aziz, collins, vieira, liu],
	[davis, ericson, kelly, singh],
	[fitzgerald, gutierrez, martinez, tortorella],
	[hughes, jones, patel, zimmerman]],
   [
	[aziz, 1, 0, 0],
	[blumenthal, 0, 1, 1],
	[collins, 1, 1, 1],
	[davis, 1, 0, 0],
	[ericson, 1, 0, 0],
	[fitzgerald, 1, 0, 1],
	[gutierrez, 1, 0, 1],
	[hughes, 1, 0, 0],
	[jones, 1, 1, 1],
	[kelly, 0, 1, 1],
	[liu, 1, 0, 1],
	[martinez, 0, 1, 1],
	[patel, 1, 1, 1],
	[qureshi, 1, 1, 0],
	[rodriguez, 1, 0, 0],
	[singh, 0, 1, 1],
	[tortorella, 0, 0, 1],
	[williams, 1, 0, 0],
	[vieira, 0, 1, 0],
	[young, 0, 1, 0],
	[zimmerman, 1, 1, 1]]).

% False
test4 :- 	jobs_ok([[aziz, collins, vieira, liu],
	[davis, aziz, kelly, singh],
	[fitzgerald, gutierrez, martinez, tortorella],
	[hughes, jones, patel, zimmerman]],
   [
	[aziz, 1, 0, 0],
	[blumenthal, 0, 1, 1],
	[collins, 1, 1, 1],
	[davis, 1, 0, 0],
	[ericson, 1, 0, 0],
	[fitzgerald, 1, 0, 1],
	[gutierrez, 1, 0, 1],
	[hughes, 1, 0, 0],
	[jones, 1, 1, 1],
	[kelly, 0, 1, 1],
	[liu, 1, 0, 1],
	[martinez, 0, 1, 1],
	[patel, 1, 1, 1],
	[qureshi, 1, 1, 0],
	[rodriguez, 1, 0, 0],
	[singh, 0, 1, 1],
	[tortorella, 0, 0, 1],
	[williams, 1, 0, 0],
	[vieira, 0, 1, 0],
	[young, 0, 1, 0],
	[zimmerman, 1, 1, 1]]).

