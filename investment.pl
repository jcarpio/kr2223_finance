/*

CD1s is an array that represent investment in CD1 for 6 months



Investment = [ [NCD11, NCD12, NCD13, NCD14, NCD15, NCD16], 
               [NCD21,     0,     0, NCD24,     0,     0],
               [NCD31,     0,     0,     0,     0,     0] 
             ]
			 
Max NCD3 = 100
Max NCD2 = 150
Max NCD1 = 200

Cash_by_month = [400000 - ( NCD11 * 2000 + NCD2 * 3000 + NCD3 * 5000) #>= 100000, 			 
			   PREV_REMAIN + NCD11*2000*0.01 + NCD11*2000 - NCD12*2000 #>=100000,
				 PREV_REMAIN + NCD12*2000*0.01 + NCD12*2000 - NCD13*2000 #>=100000,
				 PREV_REMAIN + NCD13*2000*0.01 + NCD13*2000 + NCD21*3000 + NCD21*3000*0.04  - NCD14* 2000 - NCD24*3000 #>=100000,
				 PREV_REMAIN + NCD14*2000*0.01 + NCD14*2000 - NCD15*2000 #>=100000,
				 PREV_REMAIN + NCD15*2000*0.01 + NCD15*2000 + NCD24*3000 + NCD24*3000*0.04 +  NCD31*5000 + NCD31*5000*0.09 #>=100000]
				 
				 
			 
			 

*/

:- use_module(library(clpfd)).

total_invest_ammount(400000).

invest_revenue_months(2000, 1, [1,1,1,1,1,1]).
invest_revenue_months(3000, 4, [1,0,0,1,0,0]).
invest_revenue_months(5000, 9, [1,0,0,0,0,0]).



minimun_cash(100000).

invest_ammounts(As) :- findall(I, invest_revenue_months(I, _Re, _M), As).

invest_revenues(Rs) :- findall(R, invest_revenue_months(_I, R, _M), Rs).

invest_months(Ms) :- findall(M, invest_revenue_months(_I, _Re, M), Ms).

pair(A, B, A-B).

solution(S):-
  invest_months(Ms), same_length(Ms, S),
  Ms = [M1|MTail],
  maplist(same_length(M1), S),
  append(S, Vs),
  transpose(Ms, TMs).
  % maplist(month_invest(As, Rs), TMs, R).
  
  
% check_max_invest(Ms, As, NCDs, Max,).
  
% total_month_ammount(Ms, As, Total).

total_month_ammount([],[], 0).
total_month_ammount([1|Ms], [A|As], [NCD|NCDs], TT):- 
  total_month_ammount(Ms, As, T),
  TT #= T + NCD*As.
total_month_ammount([0|Ms], [_|As], NCDs, T):- 
  total_month_ammount(Ms, As, T).
