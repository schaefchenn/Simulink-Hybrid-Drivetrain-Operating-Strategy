% Get the value of the dropdown menu
% Get the current value of the CarChoice parameter
carChoice = get_param(gcb, 'CarChoice');

% Set 'mass' based on the dropdown selection
if strcmp(carChoice, 'Custom')
    set_param(gcb, 'mass', 'Enable', 'off');
else
    set_param(gcb, 'mass', 'Enable', 'on');
end