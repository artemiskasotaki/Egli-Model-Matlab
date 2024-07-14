function plot_fc_effect()
    HBS = 50; % Base station height in meters
    HMS = 2;  % Mobile station height in meters
    DISTANCE = 10; % Distance in km
    FC_VALUES = 900:50:1000; % Frequency range in MHz
    
    %received power
    Pr_values = zeros(1, length(FC_VALUES));
    for i = 1:length(FC_VALUES)
        Pr_values(i) = egli_model(FC_VALUES(i), HBS, HMS, DISTANCE);
    end
    
    % Plot
    figure;
    plot(FC_VALUES, Pr_values, '-o', 'LineWidth', 2);
    title('Effect of Frequency on Received Power');
    xlabel('Frequency (MHz)');
    ylabel('Received Power (dB)');
    grid on;
end
