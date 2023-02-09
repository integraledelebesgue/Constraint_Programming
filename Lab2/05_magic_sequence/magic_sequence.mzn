% Length of the sequence
int: N;

set of int: NumberRange = 0..N-1;

array[NumberRange] of var NumberRange: magic;

constraint forall(i in NumberRange) (
  magic[i] = sum(
    [if magic[j] == i then 1 else 0 endif | j in NumberRange]
  )
);
  
  
solve satisfy;
  
output [ "magic sequence = ", show(magic),";\n"];
