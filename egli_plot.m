function egli_plot()
    % Parameters
    FC = 950; % Frequency in MHz
    HMS = 2;  % Mobile station height in meters
    DISTANCE = [1:0.1:2 2.2:0.2:5 5.5:0.5:20]; % Distance in km
    HBS = [20, 50, 100]; % Different base station heights
    
    % Colors for the plot
    colors = ['r', 'g', 'b'];
    
    % Plot
    figure;
    hold on;
    
    for i = 1:length(HBS)
        Pr_values = zeros(1, length(DISTANCE));
        for j = 1:length(DISTANCE)
            Pr_values(j) = egli_model(FC, HBS(i), ...
                HMS, DISTANCE(j));
        end
        plot(DISTANCE, Pr_values, 'LineWidth', 2,...
            'Color', colors(i), 'DisplayName', ...
            sprintf('H_{BS} = %d m', HBS(i)));
    end
    
    % Add labels and title
    title('Received Power vs. Distance for Different Base Station Heights');
    xlabel('Distance (km)');
    ylabel('Received Power (dB)');
    legend show;
    grid on;
end
