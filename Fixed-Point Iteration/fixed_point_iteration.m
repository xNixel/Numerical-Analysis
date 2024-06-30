%fixed_point_iteration.m
 function success_flag = fixed_point_iteration(g, p0, TOL, chosen_iteration)
     fprintf('----------------------------------\n');
     fprintf(' n\t  p\t\t  f(p_n)\n');
     fprintf('----------------------------------\n');

     i = 0;
     while i < chosen_iteration
         f_p0 = feval(g, p0);

         fprintf('%2d\t%0.10f\t%0.10f\n', i, p0, f_p0);

        %Check for convergence
         if i > 0 && abs(p0 - f_p0) < TOL
             fprintf('Converged to %0.10f after %d iterations.\n', f_p0, i);
             success_flag = 1; %Indicate that the function converged
             return;
         end

         i = i + 1;
         p0 = f_p0; %Update p0
     end

     fprintf('Diverged after %d iterations.\n', chosen_iteration);
     success_flag = 0; %Indicate that the function did not converge
 end


