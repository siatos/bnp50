x=zeros(4,1)
y=ones(4,1)
for i=1:4
    x(i+1, 1) = x(i, 1) + 0.1       %% prepare next x
    y(i+1, 1) = (0.1*euler_method(x(i,1), y(i,1))) + y(i, 1)  %% calculate next y
end
