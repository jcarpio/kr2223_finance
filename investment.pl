/*


Investment = [ CD1s , CD2s, CD3s ]

CD1s is an array that represent investment in CD1 for 6 months



Investment = [ [NCD11, NCD12, NCD13, NCD14, NCD15, NCD16], 
               [NCD21,     0,     0, NCD24,     0,     0],
               [NCD31,     0,     0,     0,     0,     0] 
             ]
			 
Max NCD3 = 60
Max NCD2 = 
Max NCD1 = 

Cash_by_month = [400000 - ( NCD11 * 2000 + NCD2 * 3000 + NCD3 * 5000) #>= 100000, 			 
			   PREV_REMAIN + NCD11*2000*0.01 + NCD11*2000 - NCD12*2000 #>=100000,
				 PREV_REMAIN + NCD12*2000*0.01 + NCD12*2000 - NCD13*2000 #>=100000,
				 PREV_REMAIN + NCD13*2000*0.01 + NCD13*2000 + NCD21*3000 + NCD21*3000*0.04  - NCD14* 2000 - NCD24*3000 #>=100000,
				 PREV_REMAIN + NCD14*2000*0.01 + NCD14*2000 - NCD15*2000 #>=100000,
				 PREV_REMAIN + NCD15*2000*0.01 + NCD15*2000 + NCD24*3000 + NCD24*3000*0.04 +  NCD31*5000 + NCD31*5000*0.09 #>=100000]
				 
				 
			 
			 

*/
