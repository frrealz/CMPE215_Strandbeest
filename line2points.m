function[] = line2points(start, finish, color, point)
    plot([start(1) finish(1)], [start(2) finish(2)], color);
    text(start(1),start(2),point);
end