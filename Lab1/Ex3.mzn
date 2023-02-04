% generic model with "maximize" goal

int: menu_length;
int: money_limit;

array[1..menu_length] of int: menu_prices; 
array[1..menu_length] of string: menu_names;
array[1..menu_length] of int: yumyum_factors; 

array[1..menu_length] of var int: order;

constraint forall([order[i] >= 0 | i in 1..menu_length]);
constraint sum([menu_prices[i]*order[i] | i in 1..menu_length]) <= money_limit;

solve maximize sum([order[i]*yumyum_factors[i] | i in 1..menu_length]);

output ["\(menu_names[i]): \(order[i]) \n" | i in 1..menu_length] ++ 
  ["Yum: \(sum([order[j]*yumyum_factors[j] | j in 1..menu_length]))\n"] ++
  ["Total: \(sum([order[j]*menu_prices[j] | j in 1..menu_length]))"];
