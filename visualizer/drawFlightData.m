positionData = out.position.Data;
attitudeData = -out.attitude.Data;

x = squeeze(positionData(1, 1, :));
y = squeeze(positionData(2, 1, :));
h = -squeeze(positionData(3, 1, :));

figure; hold on;
        
view(3);
partition = 10;
lineLength = l * 100 / 2;  
dataLength = size(x, 1);

for part = 1: partition
    sampleIndex = round(part * dataLength / partition);
    sampleIndex = min(max(sampleIndex, 1), dataLength);

    roll = squeeze(attitudeData(1, 1, sampleIndex));
    pitch = squeeze(attitudeData(2, 1, sampleIndex));
    yaw = squeeze(attitudeData(3, 1, sampleIndex));
    R = eul2rotm([yaw, pitch, roll], 'ZYX');

    midpoint = [x(sampleIndex); y(sampleIndex); h(sampleIndex)];

    uavArm1 = [[x(sampleIndex) - lineLength/2, x(sampleIndex) + lineLength/2];
               [y(sampleIndex), y(sampleIndex)];
               [h(sampleIndex), h(sampleIndex)];];
    uavArm1 = rotatePoints(uavArm1, R, midpoint);
    plot3(uavArm1(1, :), uavArm1(2, :), uavArm1(3, :), 'r-', 'LineWidth', 2); 

    uavArm2 = [[x(sampleIndex), x(sampleIndex)];
               [y(sampleIndex) - lineLength/2, y(sampleIndex) + lineLength/2];
               [h(sampleIndex), h(sampleIndex)];];
    uavArm1 = rotatePoints(uavArm1, R, midpoint);
    plot3(uavArm2(1, :), uavArm2(2, :), uavArm2(3, :), 'r-', 'LineWidth', 2); 
    

    circle1 = propellerPoints(midpoint, [lineLength / 2, 0], R);
    plot3(circle1(1, :), circle1(2, :), circle1(3, :), 'black', 'LineWidth', 2);

    circle2 = propellerPoints(midpoint, [-lineLength / 2, 0], R);
    plot3(circle2(1, :), circle2(2, :), circle2(3, :), 'black', 'LineWidth', 2);

    circle3 = propellerPoints(midpoint, [0, lineLength / 2], R);
    plot3(circle3(1, :), circle3(2, :), circle3(3, :), "Color", [0.5, 0.5, 0.5], 'LineWidth', 2);

    circle4 = propellerPoints(midpoint, [0, -lineLength / 2], R);
    plot3(circle4(1, :), circle4(2, :), circle4(3, :),"Color", [0.5, 0.5, 0.5], 'LineWidth', 2);
end



plot3(x, y, h, 'b-', 'LineWidth', 2);
grid on;
bounds = max([max(abs(x)), max(abs(y)), max(abs(h))]) + 5;

% Set axis limits explicitly so they remain constant throughout
xlim([-bounds, bounds]);
ylim([-bounds, bounds]);
zlim([-bounds, bounds]);

xlabel('X-axis');
ylabel('Y-axis');
zlabel('H-axis');
title('Flight Data with Moved Line');

hold off;
