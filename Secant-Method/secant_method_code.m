function secant_method2()
    % Get user input for the function
    prompt = 'Enter the function f(x): ';
    f_input = input(prompt, 's');
    f = str2func(['@(x)' f_input]);

    % Get user input for tolerance, p0, p1, and maximum iterations
    tol = input('Enter the tolerance: ');
    p0 = input('Enter the initial approximation p0: ');
    p1 = input('Enter the initial approximation p1: ');
    max_iter = input('Enter the maximum number of iterations: ');

    % Call the Secant method function
    [p, iter, function_values] = secant_method_with_values(p0, p1, tol, max_iter, f);
end

function [p, iter, function_values] = secant_method_with_values(p0, p1, tol, max_iter, f)
    % Initialize variables
    q0 = f(p0);
    q1 = f(p1);

    % Initialize array to store function values at each iteration
    function_values = zeros(1, max_iter);
    function_values(1) = q0;
    function_values(2) = q1;

    % Display iteration information header
    fprintf("------------------Secant Method-------------------------")
    fprintf("\nIteration(n)   Approximation(pn)   Evaluation f(pn)\n");
    fprintf("--------------------------------------------------------\n");

    % Iterate
    for iter = 2:max_iter
        % Calculate p before using it
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

