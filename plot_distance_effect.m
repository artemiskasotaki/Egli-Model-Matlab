function plot_distance_effect()
    FC = 950; % Frequency in MHz
    HBS = 50; % Base station height in meters
    HMS = 2;  % Mobile station height in meters
    DISTANCE_VALUES = 1:1:20; % Distance range in km
    
    %received power
    Pr_values = zeros(1, length(DISTANCE_VALUES));
    for i = 1:length(DISTANCE_VALUES)
        Pr_values(i) = egli_model(FC, HBS, HMS, DISTANCE_VALUES(i));
    end
    
    % Plot
    figure;
    plot(DISTANCE_VALUES, Pr_values, '-o', 'LineWidth', 2);
    title('Effect of Distance on Received Power');
    xlabel('Distance (km)');
    ylabel('Received Power (dB)');
    grid on;
end
