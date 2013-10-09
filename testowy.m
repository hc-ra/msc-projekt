A = ones(90,90); 
B = tril(A,-2); 
C = triu(A, 2); 
D = B + C; 
D(1,90) = 0; 
D(90,1) = 0; 
D(find(D == 1)) = 2 
D(find(D == 0)) = 1; 
D(find(D == 2)) = 0; 