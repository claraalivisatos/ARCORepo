function G = computeDeriv(X)
% computeDerive  Compute M+_deriv
%
%    G = computeDeriv(X)
%
%  Inputs:
%    X        - An incidence matrix
%
%  Output:
%   G         - A structure representing M+_deriv

% Author(s): Erik Frisk, Mattias Krysander, Jan ?slund
% Revision: 0.1, Date: 2010/09/12

% Copyright (C) 2010 Erik Frisk, Mattias Krysander, and Jan ?slund
%
% This file is part of CausalIsolability.
% 
% CausalIsolability is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% CausalIsolability is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%   
% You should have received a copy of the GNU General Public License
% along with CausalIsolability; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

% init
  G.X = X;
  n = size(X);
  G.row = 1:n(1);
  G.col = 1:n(2);
  stop = 0;

  % Xc = \emptyset
  Xnc = G.col;

  while ~stop
    % G1 = G - Xc
    G1 = G;
    G1.col = G1.col(Xnc);
    G1.X = G1.X(:,Xnc);


    % G2 = G1 - M(G1,Ei)
    Ei = G1.X == 2;
    Mc = find(any(Ei,2)==0);
    G2 = G1;
    G2.row = G2.row(Mc);
    G2.X = G2.X(Mc,:);

    % Xc = Xc U X(G^+ U G^0)
    dm = GetDMParts(G2.X);
    Xnc = G2.col(dm.Mm.col);
    if length(Xnc)==length(G2.col)
        stop = 1;
    end
  end
  % G = G - M(G,X\Xc)
  Mc = find(any(G.X(:,Xnc),2)==0);
  Xc = setdiff(G.col,Xnc);
  G.row = G.row(Mc);
  G.col = G.col(Xc);
  G.X = G.X(Mc,Xc);

  % M_d^+ = M(G^+)
  dm = GetDMParts(G.X);
  G.row = G.row(dm.Mp.row);
  G.col = G.col(dm.Mp.col);
  G.X = G.X(dm.Mp.row,dm.Mp.col);
end