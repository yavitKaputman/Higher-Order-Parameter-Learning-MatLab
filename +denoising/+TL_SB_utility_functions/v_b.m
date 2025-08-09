function [new_v, new_b] = v_b(u, b, alpha, theta)
    argument = discrete_operators.delta(u) + b;
    new_v = max(abs(argument)- alpha/theta, 0).*(sign(argument));
    new_b = argument - new_v;
end