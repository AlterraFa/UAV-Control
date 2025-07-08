function circle = propellerPoints(origin, sepLength, rotMat)
    theta = linspace(0, 2*pi, 100);
    r = 2;
    x = origin(1);
    y = origin(2);
    z = origin(3);

    circleX = r * cos(theta) + x - sepLength(1);
    circleY = r * sin(theta) + y - sepLength(2);
    circleH = z * ones(size(theta));  % Keep the height constant
    circle = rotatePoints([circleX; circleY; circleH], rotMat, origin);