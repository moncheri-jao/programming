function e = err(x,y)
    dx = 1;
    d = gradient(y)/dx;
    e = d.*x;
    subplot(2,1,1);
    plot(x,y);
    grid on;
    subplot(2,1,2);
    plot(e);
    grid on
end
