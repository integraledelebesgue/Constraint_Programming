% number of queens
int: N;

set of int: range = 1..N;
array[range] of var range: rows; 

% rows[i] = rows[j] (-/+) (j - i)                 
% matches queens placed on the same diagonal, where:
% - i,j - column index
% - rows[n] - queen's position in the nth col 

constraint forall(
  [
    i == j \/
    (rows[i] != rows[j] + j - i /\ rows[i] != rows[j] - j + i /\ rows[i] != rows[j])  
    | i in range, j in range
  ]
 );


solve satisfy; 

output [ if fix(rows[j]) == i then "|Q" else "|_" endif ++
  if j == N then "\n" else "" endif | i,j in 1..N];
