function [p, iteration, evaluations] = newton_raphson_method2b()
    % Newton's method to find a solution to f(x) = 0

    disp("------------------NEWTONS-RAPHSON METHOD------------------\n")

    % inputs
    f = @(x) x + exp(-x^2) * cos(x);  % Function
    df = @(x) 1 - 2 * exp(-x^2) * x * cos(x) - exp(-x^2) * sin(x);     % Derivative
    p0 = 0;                             % Initial approximation
    TOL = 1e-8;                         % Tolerance for convergence
    N0 = 100;                           % Maximum number of iterations


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
