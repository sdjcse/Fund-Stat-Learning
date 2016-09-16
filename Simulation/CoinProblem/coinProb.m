n = 1000;
U = rand(1, n);
toss = (U < 0.5);
a = zeros(n + 1);
avg = zeros(n);
for i = 2 : n + 1
  a(i) = a(i-1) + toss(i-1);
  avg(i-1) = a(i)/(i-1);
end
plot(avg)
