function secant_method2()
    % Define the function f(x) for which you want to find roots
    f = @(x) x^4 - 2 * x^2 - 4;

    % Initial approximations and parameters
    p0 = 2;
    p1 = 3;
    tol = 1e-6;
    max_iter = 34;

    % Call the Secant method function
    [p, iter, function_values] = secant_method_with_values(p0, p1, tol, max_iter, f);
end

function [p, iter, function_values] = secant_method_with_values(p0, p1, tol, max_iter, f)
    % Input: initial approximations p0, p1; tolerance tol;
    %        maximum number of iterations max_iter; function f.
    % Output: approximate solution p, iteration count iter, and function values.
    % Initialize variables
    q0 = f(p0);
    q1 = f(p1);

    % Initialize array to store function values at each iteration
    function_values = zeros(1, max_iter);
    function_values(1) = q0;
    function_values(2) = q1;

    % Display iteration information header
    fprintf("------------------Secant Method-------------------------")
    fprintf("\nIteration(n)   Approximation(p0)   Evaluation(pn)\n");
    fprintf("--------------------------------------------------------\n");

    % Iterate
    for iter = 2:max_iter
        p = p1 - q1 * (p1 - p0) / (q1 - q0); % Secant formula

        % Store function value at the current approximation
        function_values(iter + 1) = f(p);

        % Display iteration information
        fprintf("    %d            %.8f         %.8f\n", iter - 1, p, f(p));

        % Check for convergence
        if abs(p - p1) < tol
         fprintf('Solution found after %d iterations\n', iter-1);
            fprintf('Approximate root is p = %.8f, f(p) = %.8f\n', p, f(p));
            return;
        end

        % Update variables for the next iteration
        p0 = p1;
        q0 = q1;
        p1 = p;
        q1 = f(p);
    end

    % Display failure message
    fprintf('The method failed after %d iterations.\n', max_iter);
end