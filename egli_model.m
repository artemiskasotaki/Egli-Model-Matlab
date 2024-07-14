function Pr_dB = egli_model(fc, hbs, hms, d)
% calculates the received power in dB.
% arguments:
%   fc    frequency carrier [900, 1000] MHz
%   hbs   base station antenna height (meters)
%   hms   mobile station antenna height (meters)
%   d     distance (km)
%
% returns the received power in dB (Pr_dB).

% Validate input parameters
arguments
    fc (1, 1) double {mustBeInRange(fc, 900, 1000)}
    hbs (1, 1) double {mustBePositive}
    hms (1, 1) double {mustBePositive}
    d (1, 1) double {mustBePositive}
end

    if fc < 900 || fc > 1000
        error('Frequency (f) must be between 900 and 1000 MHz');
    end
    if hbs <= 0 || hms <= 0 || d <= 0
        error('Heights and distance must be positive values');
    end

% Pr(d) in dB
Pr_dB = 20*log10(hbs * hms) - 40*log10(d) + 20*log10(40/fc);

end


