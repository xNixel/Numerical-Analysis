% User's guide for entering matrix values
disp("------------------------------GAUSSIAN ELIMINATION------------------------------\n")
disp("Guide for entering the values")
disp("   - Enter values in array form.")
disp("   - The values within a row are separated by either spaces or commas,")
disp("       and the different rows are separated by semicolons.")
disp("Example:")
disp("   Input: x = [1 4 −2; 3 0 −5] or x = [1, 4, −2,; 3, 0, −5]")
disp("   Output: | 1 4 −2 |")
disp("           | 3 0 −5 |\n")

% Ask user for matrix values
disp("Enter values of matrix [A] and matrix [b]")
A = input("Input values for Matrix [A]: ")
b = input("Input values for Matrix [b]: ")

% Function for Gaussian elimination and back-substitution
function [x] = Gaussian_Elimination(A, b)
    n = length(b);

    % Implementation of Gaussian Elimination Algorithm
    for i = 1 : n - 1
        % Check if the pivot is zero, swap rows if needed
        if A(i, i) == 0
            for k = i + 1 : n
                if A(k, i) ~= 0
                    % Swap rows i and k in both A and b
                    A([i, k], :) = A([k, i], :);
                    b([i, k]) = b([k, i]);
                    break;
                elseif k == n
                    % No unique solution exists if all entries in the column are zero
                    disp("no unique solution exists");
                    return;
                end
            end
        end

        % Eliminate entries below the pivot
        for j = i + 1 : n
            m = A(j, i) / A(i, i);
            A(j, :) = A(j, :) - m * A(i, :);
            b(j) = b(j) - m * b(i);
        end
    end

    % Check for zero pivot in the last row
    if A(n, n) == 0
        disp("no unique solution exists");
        return;
    else
        % Implementation of Back Substitution Algorithm
        X = zeros(n, 1);
        X(n) = b(n) / A(n, n);

        % Back-substitute to find the remaining solutions
        for i = n - 1 : -1 : 1
            X(i) = (b(i) - A(i, i+1:end) * X(i+1:end)) / A(i, i);
        end

        % Return the solution vector
        x = X;
    end
end

% Perform Gaussian elimination and back-substitution
result = Gaussian_Elimination(A, b); % Call the Gaussian Elimination Function

% Display the solution
disp("Output:");
disp(result);



