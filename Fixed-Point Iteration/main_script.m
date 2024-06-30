
%Function 1: g(x) = x^5 - 3*x^3 + 2*x^2 + 2
  g1 = @(x) x.^5 - 3*x.^3 + 2*x.^2 + 2;

%Function 2: g(x) = x^x - cos(x)
  g2 = @(x) x.^(x - cos(x));

%Initial guess for each function
  x0_g1 = 1;
  x0_g2 = 1;

%Fixed number of iterations
  num_iterations_g1 = 3;
  num_iterations_g2 = 3;

%Fixed tolerance
  tolerance = 1e-10;

%Perform fixed-point iteration for each function and display success flag
  fprintf('\n >> FIXED POINT METHOD <<\n');

%Function 1
  fprintf('\nFixed-point Iteration for;\n');
  printf ("Function 1: g(x) = x^5 - 3*x^3 + 2*x^2 + 2\n");
  success_flag_g1 = fixed_point_iteration(g1, x0_g1, tolerance, num_iterations_g1);
  fprintf('Convergence Flag for g1(x): %d\n', success_flag_g1);

%Function 2
  fprintf('\nFixed-point Iteration for;\n');
  printf ("Function 2: g(x) = x^x - cos(x)\n");
  success_flag_g2 = fixed_point_iteration(g2, x0_g2, tolerance, num_iterations_g2);
  fprintf('Convergence Flag for g2(x): %d\n', success_flag_g2);

%Plot function 1 and the line y = x
  figure;
  x_values_g1 = 1:num_iterations_g1;
  y_values_g1 = zeros(1, num_iterations_g1);
    for i = 1:num_iterations_g1
       y_values_g1(i) = feval(g1, x0_g1);
       x0_g1 = feval(g1, x0_g1);
    end
  plot(x_values_g1, y_values_g1, '-o', 'DisplayName', 'g1(x)');
  hold on;
  plot(x_values_g1, x_values_g1, '--', 'DisplayName', 'y = x');
  xlabel('Iteration');
  ylabel('Value');
  title('Graph of g1(x) Fixed Points');
  legend('g1(x)', 'y = x');
  grid on;
  hold off;

%Plot function 2 and the line y = x
  figure;
  x_values_g2 = 1:num_iterations_g2;
  y_values_g2 = zeros(1, num_iterations_g2);
    for i = 1:num_iterations_g2
      y_values_g2(i) = feval(g2, x0_g2);
      x0_g2 = feval(g2, x0_g2);
    end
  plot(x_values_g2, y_values_g2, '-o', 'DisplayName', 'g2(x)');
  hold on;
  plot(x_values_g2, x_values_g2, '--', 'DisplayName', 'y = x');
  xlabel('Iteration');
  ylabel('Value');
  title('Graph of g2(x) Fixed Points');
  legend('g2(x)', 'y = x');
  grid on;
  hold off;

