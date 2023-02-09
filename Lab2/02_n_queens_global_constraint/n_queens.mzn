include "globals.mzn";

% number of queens
int: N;

set of int: range = 1..N;
array[range] of var range: rows;

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in range]);
constraint alldifferent([rows[i] - i | i in range]);

solve satisfy; 

output [ if fix(rows[j]) == i then "|Q" else "|_" endif ++
  if j == N then "\n" else "" endif | i,j in 1..N];
