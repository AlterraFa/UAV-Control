function newPoint = rotatePoints(points, rotVar, midpoint)
    phi = rotVar(1);
    theta = rotVar(2);
    psi = rotVar(3);

    rotMat = [cos(theta)*cos(psi) sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi) cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);
              cos(theta)*sin(psi) sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi) cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi);
              -sin(theta)                                sin(phi)*cos(theta)                      cos(phi)*cos(theta)];
    translatedPoints = points - midpoint;
    rotatePoints = rotMat * translatedPoints;
    newPoint = rotatePoints + midpoint;