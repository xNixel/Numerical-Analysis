function bisection_method()
    % Input your function here
    f = @(x) 1/(x - 2);

    % Define the interval
    a = 3;
    b = 7;

    % Set the tolerance
    tol = 1e-4;

    % Display header for the bisection method
    fprintf('--------------------------------------Bisection Method-------------------------------------------\n');
    drawnow;

    % Call the bisection method
    [solution, no_iterations] = bisection(f, a, b, tol);

    % Display results
    fprintf('Number of function calls: %d\n', no_iterations - 1);
    fprintf('An approximate solution/root is: %f\n', solution);
end

function [result1, result2] = bisection(f, x_L, x_R, tol)
    if f(x_L) * f(x_R) > 0
        fprintf('Error! Function does not have opposite signs at interval endpoints!\n');
        return;
    end

    fprintf('n\t\ta\t\t\tb\t\t\tp\t\t\tf(p)\n');

    iteration_counter = 1;
    while (x_R - x_L) > tol
        x_M = (x_L + x_R) / 2.0;
        f_L = f(x_L);
        f_R = f(x_R);
        f_M = f(x_M);

        fprintf('%d\t\t%f\t\t%f\t\t%f\t\t%f\n', iteration_counter, x_L, x_R, x_M, f_M);

        if f_M == 0
            break;
        elseif f_L * f_M < 0
            x_R = x_M;
        else
            x_L = x_M;
        end

        iteration_counter = iteration_counter + 1;
    end

    result1 = (x_L + x_R) / 2;
    result2 = iteration_counter;
end
