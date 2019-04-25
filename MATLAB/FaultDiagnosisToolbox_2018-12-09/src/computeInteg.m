function G = computeInteg(X)
% computeInteg  Compute M+_int
%
%    G = computeInteg(X)
%
%  Inputs:
%    X        - An incidence matrix
%
%  Output:
%   G         - A structure representing M+_int

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
  while ~stop
      % G = G^+
      dm = GetDMParts(G.X);
      G.row = G.row(dm.Mp.row);
      G.col = G.col(dm.Mp.col);
      G.X = G.X(dm.Mp.row,dm.Mp.col);
      
      % G1 = G - Ed
      G1 = G;
      G1.X = G.X > 0 & G.X < 3;
      
      % G = G - M(G,X(G1^-))
      dm = GetDMParts(G1.X);
      if ~isempty(G.X(:,dm.Mm.col))
          M = find(any(G.X(:,dm.Mm.col),2)==0);
          if length(M)==length(G.row)
              stop = 1;
          end
          G.row = G.row(M);
          G.X = G.X(M,:);
      else
          stop = 1;
      end
  end
end