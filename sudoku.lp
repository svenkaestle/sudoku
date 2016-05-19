% INSERT NAMES AND EMAIL ADDRESSES OF YOUR GROUP MEMBERS:
% Sven Kästle - skaestle@uni-potsdam.de
% Lukas Golombek - lgolombe@uni-potsdam.de

subgrid_size(3).

% HINTS:
% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

% Your implementation please...

% Domains
value(1..9).
border(1; 4; 7).

% initially cells
sudoku(X, Y, N) :- initial(X,Y,N).

% Only one number per cell
1 { sudoku(X,Y,N) : value(N) } 1 :- value(X), value(Y).

% The same number does not appear twice in the same column
1 { sudoku(X,Y,N) : value(X) } 1 :- value(Y), value(N).

% The same number does not appear twice in the same row
1 { sudoku(X,Y,N) : value(Y) } 1 :- value(X), value(N).

% The same number does not appear twice in the same subgrid
1 { sudoku(X,Y,N) : value(X), value(Y),
    X1<=X, X<=X1+2, Y1<=Y, Y<=Y1+2 } 1 :- value(N), border(X1), border(Y1).


#show sudoku/3.
