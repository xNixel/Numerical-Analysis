% User's guide for entering matrix values
disp("------------------------------LU FACTORIZATION------------------------------\n")
disp("Guide for entering the values")
disp("   - Enter values in array form.")
disp("   - The values within a row are separated by either spaces or commas,")
disp("       and the different rows are separated by semicolons.")
disp("Example:")
disp("   Input: x = [1 4 −2; 3 0 −5] or x = [1, 4, −2,; 3, 0, −5]")
disp("   Output: | 1 4 −2 |")
disp("           | 3 0 −5 |\n")

% Ask user for matrix values
disp("Enter values of matrix [A]")
A_str = input("Input values for Matrix [A]: ", 's');  % 's' flag for reading input as a string
A = str2num(A_str);  % Convert the string matrix to a numerical array
disp("A =");
disp(A);

% Function for LU Decomposition
function [L, U] = LU_Factorization(A)
    n = size(A, 1);
    L = eye(n); % Initialize L as an identity matrix; ones(1) in the diagonal and zeroes(0) elsewhere
    U = A;

    % Perform LU decomposition
    for k = 1:n-1
        for i = k+1:n
            L(i, k) = U(i, k) / U(k, k);
            U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n);
        end
    end
end

% Perform LU decomposition
[L, U] = LU_Factorization(A);

% Display the results
disp("\nOutput for Matrix [L]:");
disp(L);
disp("\nOutput for Matrix [U]:");
disp(U);

