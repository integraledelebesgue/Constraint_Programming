int: nodesNumber;
set of int: nodeRange = 1..nodesNumber;
array[nodeRange, nodeRange] of bool: edges;

array[nodeRange] of var nodeRange: nodes;
var 0..nodesNumber: colorsNumber;

constraint colorsNumber = max(nodes);
constraint forall(
  [ i == j \/ not edges[i, j] \/ nodes[i] != nodes[j]
    | i in nodeRange, j in nodeRange ]
);

solve minimize colorsNumber;

output [show(colorsNumber), " colors\n",] ++
       [show(nodes[i]) ++ " " | i in 1..nodesNumber]
