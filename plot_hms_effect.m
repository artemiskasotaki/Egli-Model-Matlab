function plot_hms_effect()
    FC = 950; % Frequency in MHz
    HBS = 50; % Base station height in meters
    DISTANCE = 10; % Distance in km
    HMS_VALUES = 1:1:10; % Mobile station height range
    
    %received power
    Pr_values = zeros(1, length(HMS_VALUES));
    for i = 1:length(HMS_VALUES)
        Pr_values(i) = egli_model(FC, HBS, HMS_VALUES(i), DISTANCE);
    end
    
    % Plot
    figure;
    plot(HMS_VALUES, Pr_values, '-o', 'LineWidth', 2);
    title('Effect of Mobile Station Height on Received Power');
    xlabel('Mobile Station Height (m)');
    ylabel('Received Power (dB)');
    grid on;
end





function egli_plot()
% egli_plot() plots the received power based on the Egli model with respect to the distance.
% Frequency is set between 900 MHz and 1000 MHz. Base station height is 50m. Mobile station height is 2m.
% Distance ranges from 1 km to 20 km.

% Close all open figures
close all;

% Plot parameters
LINEWIDTH = 2;
COLOR = 'b';
MARKER = 'o';
MARKERSIZE = 6;
FONTSIZE = 16;
FONTSIZE_TITLE = FONTSIZE + 10;
FONTSIZE_AXIS = FONTSIZE + 4;
FONTNAME = 'Calibri';

% Fixed parameters
FC = 950; % Frequency in MHz
HBS = 50; % Base station height in meters
HMS = 2;  % Mobile station height in meters
DISTANCES = [1:0.1:2 2.2:0.2:5 5.5:0.5:20]; % Distance in km

% Calculate received power
Pr_values = zeros(1, length(DISTANCES));
for iter = 1:length(DISTANCES)
    Pr_values(iter) = egli_model(FC, HBS, HMS, DISTANCES(iter));
end

% Plot received power
figure('Visible', 'on');
plot(DISTANCES, Pr_values, 'LineWidth', LINEWIDTH, 'Color', COLOR, ...
    'Marker', MARKER, 'MarkerSize', MARKERSIZE);

% Style plot
grid on;
set(gca, 'FontSize', FONTSIZE, 'FontName', FONTNAME);
title('Received Power Egli Model', 'FontSize', FONTSIZE_TITLE);
xlabel('Distance (km)', 'FontSize', FONTSIZE_AXIS);
ylabel('Received Power (dB)', 'FontSize', FONTSIZE_AXIS);

end
