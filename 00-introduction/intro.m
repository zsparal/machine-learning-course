clear;

function J = costFunction(X, y, theta)
  m = size(X, 1);
  predictions = X * theta;
  squareErrors = (predictions - y) .^ 2;
  J = 1 / (2 * m) * sum(squareErrors);
end

function newTheta = gradientDescentStep(X, y, theta, alpha)
  m = size(X, 1);
  predictions = X * theta;
  newTheta = theta - (alpha / m) * X' * (predictions - y);
end

function newTheta = gradientDescent(X, y, theta, alpha)
  steps = 100;
  newTheta = theta;
  j = [costFunction(X, y, newTheta)];
  for i=1:steps,
    newTheta = gradientDescentStep(X, y, newTheta, alpha);
    j = [j, costFunction(X, y, newTheta)];
  endfor
  plot(1:(steps + 1), j);
end

X = [1 1; 1 2; 1 3; 1 4];
y = [1; 2; 3; 4];

theta = [0; 0.9];
gradientDescent(X, y, theta, 0.2);
# costFunction(X, y, theta);

[1 2; 3 4] / 4