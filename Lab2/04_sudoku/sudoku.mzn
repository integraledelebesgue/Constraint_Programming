include "globals.mzn";

array[int,int] of int: board;
set of int: PuzzleRange = index_set_1of2(board);
int: N = max(PuzzleRange);
int: S = floor(sqrt(N));
set of int: SquareRange = 1..S;

constraint assert(index_set_2of2(board) = PuzzleRange, "The board should be a square array"); 
constraint assert(S * S == N, "The board size should be a square of a natural number");
constraint assert(min(board) = 0, "The board should contain at least one empty space and no negative values");
constraint assert(max(board) <= N, "The board shouldn't contain values bigger than the board size");

array[PuzzleRange, PuzzleRange] of var PuzzleRange: puzzle;

constraint forall(i, j in PuzzleRange) (
  board[i, j] == 0 \/ puzzle[i, j] = board[i, j]
);

constraint forall(i in PuzzleRange) (
  alldifferent(puzzle[i, ..])
);

constraint forall(i in PuzzleRange) (
  alldifferent(puzzle[.., i])
);

constraint forall(i, j in SquareRange) (
  alldifferent(puzzle[((i-1) * S + 1)..(i * S), ((j-1) * S + 1)..(j * S)])  
);


solve satisfy;

output [ show(puzzle[i,j]) ++ " " ++
  if j mod S == 0 then " " else "" endif ++ if j == N /\ i != N then
  if i mod S == 0 then "\n\n" else "\n" endif else "" endif
    | i,j in PuzzleRange ] ++ ["\n"];