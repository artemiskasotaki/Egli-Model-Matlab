function plot_hbs_effect()
    % Parameters
    FC = 950; % Frequency in MHz
    HMS = 2;  % Mobile station height in meters
    DISTANCE = 10; % Distance in km
    HBS_VALUES = 10:10:100; % Base station height range
    
    % received power
    Pr_values = zeros(1, length(HBS_VALUES));
    for i = 1:length(HBS_VALUES)
        Pr_values(i) = egli_model(FC, HBS_VALUES(i), HMS, DISTANCE);
    end
    
    % Plot
    figure;
    plot(HBS_VALUES, Pr_values, '-o', 'LineWidth', 2);
    title('Effect of Base Station Height on Received Power');
    xlabel('Base Station Height (m)');
    ylabel('Received Power (dB)');
    grid on;
end
