function [p, iteration, evaluations] = newtons_raphson_method()
    % Newton's method to find a solution to f(x) = 0

    disp("------------------NEWTONS-RAPHSON METHOD------------------\n")
    disp("  Enter the values for following requirements:")
    disp("   - function f(x)")
    disp("   - derivative of f(x)")
    disp("   - initial approximation p0")
    disp("   - tolerance TOL")
    disp("   - maximum number of iterations N0")

    % User inputs
    f_str = input('Enter the function f(x): ', 's');
    df_str = input('Enter the derivative of f(x): ', 's');
    p0 = input('Enter the initial approximation p0: ');
    TOL = input('Enter the tolerance TOL: ');
    N0 = input('Enter the maximum number of iterations N0: ');

    % Convert input strings to function handles
    f = str2func(['@(x) ' f_str]);
    df = str2func(['@(x) ' df_str]);

    % Output initialization
    iteration = 1;
    p = p0;

    % Initialize array to store function evaluations
    evaluations = zeros(N0, 3);

    % Store initial guess in the first row of evaluations
    evaluations(1, 1) = 1;
    evaluations(1, 2) = p0;
    evaluations(1, 3) = f(p0);

    % Main loop
    while iteration <= N0
        % Newton's method iteration
        p = p0 - f(p0) / df(p0);

        % Store iteration, approximation, and function evaluation in array
        evaluations(iteration+1, 1) = iteration + 1;
        evaluations(iteration+1, 2) = p;
        evaluations(iteration+1, 3) = f(p);

        % Check convergence
        if abs(p - p0) < TOL
            fprintf('Approximate solution/root: %f\n', p);
            fprintf('Number of iterations: %d\n', iteration);
            fprintf('Function evaluations using approximations:\n');
            fprintf('Iteration(n)\tApproximation(pn)\tEvaluation(f(pn))\n');
            disp("--------------------------------------------------------\n")
            fprintf('%d\t\t%f\t\t%f\n', evaluations(1:iteration, :).');
            disp("--------------------------------------------------------\n")
            return;
        end

        % Update for the next iteration
        iteration = iteration + 1;
        p0 = p;
    end

    % Method failure
    fprintf('The method failed after %d iterations.\n', N0);
end
