function Polt_Bspline(M, N, X, Y, Z)

k = 1; 
l = 1;
n = N - 1;
m = M - 1;
piece_u = 30;   % Anzahl von x-richtung knotenvektor
piece_v = 30;
Base_u = zeros(n+1, 1);  % initial für Basefunction
Base_v = zeros(m+1, 1);

% x-richtung verteilung
NodeVector_u = linspace(0, 1, n+k+2);     % homogen B-spline
u = linspace(1/(n+k+1), (n+1)/(n+k+1), piece_u);    % u向节点分成若干份

X_M_piece = zeros(M, piece_u);    % 沿着u方向的网格，M * piece
Y_M_piece = zeros(M, piece_u);
Z_M_piece = zeros(M, piece_u);
for i = 1 : M
    for j = 1 : piece_u
        for ii = 0 : 1: n
            Base_u(ii+1, 1) = BaseFunction(ii, k , u(j), NodeVector_u);
        end
        X_M_piece(i, j) = X(i, :) * Base_u;
        Y_M_piece(i, j) = Y(i, :) * Base_u;
        Z_M_piece(i, j) = Z(i, :) * Base_u;
    end
end
 
% y-richtung Verteilung
NodeVector_v = linspace(0, 1, m+l+2);     
v = linspace(l/(m+l+1), (m+1)/(m+l+1), piece_v);    
X_MN_piece = zeros(piece_v, piece_u);
Y_MN_piece = zeros(piece_v, piece_u);
Z_MN_piece = zeros(piece_v, piece_u);
for i = 1 : piece_u
    for j = 1 : piece_v
        for ii = 0 : 1 : m
            Base_v(ii+1, 1) = BaseFunction(ii, l, v(j), NodeVector_v);
        end
    X_MN_piece(j, i) = Base_v' * X_M_piece(:, i);
    Y_MN_piece(j, i) = Base_v' * Y_M_piece(:, i);
    Z_MN_piece(j, i) = Base_v' * Z_M_piece(:, i);
    end
end


for j = 1 : piece_u
    for i = 1 : piece_v -1
        plot3([X_MN_piece(i, j) X_MN_piece(i+1, j)],...
            [Y_MN_piece(i, j) Y_MN_piece(i+1, j)],...
            [Z_MN_piece(i, j) Z_MN_piece(i+1, j)], 'b-');
    end
end
for i = 1 : piece_v
    for j = 1 : piece_u -1
        %hold on
        plot3([X_MN_piece(i, j) X_MN_piece(i, j+1)],...
            [Y_MN_piece(i, j) Y_MN_piece(i, j+1)],...
            [Z_MN_piece(i, j) Z_MN_piece(i, j+1)], 'b-');
    end
end