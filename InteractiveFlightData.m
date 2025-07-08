positionData = out.position.Data;
attitudeData = -out.attitude.Data;

x = squeeze(positionData(1, 1, :));
y = squeeze(positionData(2, 1, :));
h = -squeeze(positionData(3, 1, :));

% Set up the figure
fig1 = figure; hold on;
view(3);
grid on;
set(fig1, 'Position', [100, 000, 1200, 700]);  % Wider and taller window

% Partition settings and UAV arm length
partition = size(x, 1) / 3;
lineLength = l * 100 / 2;  
dataLength = size(x, 1);

bounds = max([max(abs(x)), max(abs(y)), max(abs(h))]) + 5;

% Set axis limits explicitly so they remain constant throughout
xlim([-bounds, bounds]);
ylim([-bounds, bounds]);
zlim([-bounds, bounds]);

xlabel('X-axis');
ylabel('Y-axis');
zlabel('H-axis');
title('Flight Data of UAV');

% Plot the entire flight trajectory in the background
plot3(x, y, h, 'b-', 'LineWidth', 2);

% Plot the UAV in its initial position (one marker)
uavHandle = plot3(x(1), y(1), h(1), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 3);

% Initialize
sampleIndex = round(0 * dataLength / partition);
sampleIndex = min(max(sampleIndex, 1), dataLength);

roll = squeeze(attitudeData(1, 1, sampleIndex));
pitch = squeeze(attitudeData(2, 1, sampleIndex));
yaw = squeeze(attitudeData(3, 1, sampleIndex));
R = eul2rotm([yaw, pitch, roll], 'ZYX');

midpoint = [x(sampleIndex); y(sampleIndex); h(sampleIndex)];

% UAV arms (rotated according to its orientation)
uavArm1 = [[x(sampleIndex), x(sampleIndex) + lineLength/2];
           [y(sampleIndex), y(sampleIndex)];
           [h(sampleIndex), h(sampleIndex)]];
uavArm1 = rotatePoints(uavArm1, R, midpoint);

uavArm3 = [[x(sampleIndex) - lineLength/2, x(sampleIndex)];
           [y(sampleIndex), y(sampleIndex)];
           [h(sampleIndex), h(sampleIndex)]];
uavArm3 = rotatePoints(uavArm3, R, midpoint);

uavArm2 = [[x(sampleIndex), x(sampleIndex)];
           [y(sampleIndex) - lineLength/2, y(sampleIndex) + lineLength/2];
           [h(sampleIndex), h(sampleIndex)]];
uavArm2 = rotatePoints(uavArm2, R, midpoint);

% Propellers
circle1 = propellerPoints(midpoint, [lineLength / 2, 0], R);
circle2 = propellerPoints(midpoint, [-lineLength / 2, 0], R);
circle3 = propellerPoints(midpoint, [0, lineLength / 2], R);
circle4 = propellerPoints(midpoint, [0, -lineLength / 2], R);


% Pre-allocate handles for arms and propellers
arm1Handle = plot3(uavArm1(1, :), uavArm1(2, :), uavArm1(3, :), 'black', 'LineWidth', 2);  % Red line for arm1
arm2Handle = plot3(uavArm2(1, :), uavArm2(2, :), uavArm2(3, :), 'r-', 'LineWidth', 2);  % Red line for arm2
arm3Handle = plot3(uavArm3(1, :), uavArm3(2, :), uavArm3(3, :), 'r-', 'LineWidth', 2);  % Red line for arm2
propHandle1 = plot3(circle1(1, :), circle1(2, :), circle1(3, :), 'blue', 'MarkerSize', 5);  % Green dot for propeller1
propHandle2 = plot3(circle2(1, :), circle2(2, :), circle2(3, :), 'blue', 'MarkerSize', 5);  % Green dot for propeller2
propHandle3 = plot3(circle3(1, :), circle3(2, :), circle3(3, :), 'g.', 'MarkerSize', 5);  % Green dot for propeller3
propHandle4 = plot3(circle4(1, :), circle4(2, :), circle4(3, :), 'g.', 'MarkerSize', 5);  % Green dot for propeller4

disp(true)

% Loop to animate UAV movement
while true
    for part = 1: partition
        sampleIndex = round(part * dataLength / partition);
        sampleIndex = min(max(sampleIndex, 1), dataLength);
    
        roll = squeeze(attitudeData(1, 1, sampleIndex));
        pitch = squeeze(attitudeData(2, 1, sampleIndex));
        yaw = squeeze(attitudeData(3, 1, sampleIndex));
        R = [roll, pitch, yaw];
    
        midpoint = [x(sampleIndex); y(sampleIndex); h(sampleIndex)];
    
        % UAV arms (rotated according to its orientation)
        uavArm1 = [[x(sampleIndex), x(sampleIndex) + lineLength/2];
                   [y(sampleIndex), y(sampleIndex)];
                   [h(sampleIndex), h(sampleIndex)]];
        uavArm1 = rotatePoints(uavArm1, R, midpoint);
        
        uavArm3 = [[x(sampleIndex) - lineLength/2, x(sampleIndex)];
                   [y(sampleIndex), y(sampleIndex)];
                   [h(sampleIndex), h(sampleIndex)]];
        uavArm3 = rotatePoints(uavArm3, R, midpoint);
    
        uavArm2 = [[x(sampleIndex), x(sampleIndex)];
                   [y(sampleIndex) - lineLength/2, y(sampleIndex) + lineLength/2];
                   [h(sampleIndex), h(sampleIndex)]];
        uavArm2 = rotatePoints(uavArm2, R, midpoint);
        
        % Propellers
        circle1 = propellerPoints(midpoint, [lineLength / 2, 0], R);
        circle2 = propellerPoints(midpoint, [-lineLength / 2, 0], R);
        circle3 = propellerPoints(midpoint, [0, lineLength / 2], R);
        circle4 = propellerPoints(midpoint, [0, -lineLength / 2], R);
    
        % Update UAV position in the plot
        figure(fig1);
        set(uavHandle, 'XData', x(sampleIndex), 'YData', y(sampleIndex), 'ZData', h(sampleIndex));
    
        % Update the arms (as lines)
        set(arm1Handle, 'XData', uavArm1(1, :), 'YData', uavArm1(2, :), 'ZData', uavArm1(3, :));
        set(arm2Handle, 'XData', uavArm2(1, :), 'YData', uavArm2(2, :), 'ZData', uavArm2(3, :));
        set(arm3Handle, 'XData', uavArm3(1, :), 'YData', uavArm3(2, :), 'ZData', uavArm3(3, :));
    
        % Update the propellers (as circles or points)
        set(propHandle1, 'XData', circle1(1, :), 'YData', circle1(2, :), 'ZData', circle1(3, :));
        set(propHandle2, 'XData', circle2(1, :), 'YData', circle2(2, :), 'ZData', circle2(3, :));
        set(propHandle3, 'XData', circle3(1, :), 'YData', circle3(2, :), 'ZData', circle3(3, :));
        set(propHandle4, 'XData', circle4(1, :), 'YData', circle4(2, :), 'ZData', circle4(3, :));
    
        % Pause for animation effect
        pause(0.009);
    end
end
hold off;