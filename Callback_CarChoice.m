% Define car-specific parameters
carParameters.AudiRS6.mass = 1935;
carParameters.AudiRS6.projectedSurface = 2.5;
carParameters.AudiRS6.coefficientOfDrag = 0.32;
carParameters.AudiRS6.lambda = 1.2;

carParameters.BMWG80M3.mass = 1820;
carParameters.BMWG80M3.projectedSurface = 2.4;
carParameters.BMWG80M3.coefficientOfDrag = 0.34;
carParameters.BMWG80M3.lambda = 1.1;

carParameters.Hyundaii30.mass = 1450;
carParameters.Hyundaii30.projectedSurface = 2.2;
carParameters.Hyundaii30.coefficientOfDrag = 0.30;
carParameters.Hyundaii30.lambda = 1.0;

carParameters.HondaCRZ.mass = 1150;
carParameters.HondaCRZ.projectedSurface = 2.03;
carParameters.HondaCRZ.coefficientOfDrag = 0.30;
carParameters.HondaCRZ.lambda = 1.0;

% Define default parameters for custom or unknown cars
defaultParameters.mass = 1000;
defaultParameters.projectedSurface = 2;
defaultParameters.coefficientOfDrag = 0.31;
defaultParameters.lambda = 1.1;

% Get the current value of the CarChoice parameter
carChoice = get_param(gcb, 'CarChoice');

% Define the path to the icons
iconPath = 'Icon/'; % Adjust this path as necessary

% Initialize the parameters to default values
parameters = defaultParameters;

% Set the icon and parameters based on the CarChoice parameter
switch carChoice
    case 'Audi RS6'
        iconFile = 'Audi-RS6.png';
        parameters = carParameters.AudiRS6;
    case 'BMW G80 M3'
        iconFile = 'BMW-G80-M3.png';
        parameters = carParameters.BMWG80M3;
    case 'Hyundai i30'
        iconFile = 'Hyundai-i30.png';
        parameters = carParameters.Hyundaii30;
    case 'Honda CRZ'
        iconFile = 'Honda-CRZ.png';
        parameters = carParameters.HondaCRZ;
    case 'Custom'
        iconFile = 'default-icon.png';
        parameters = defaultParameters; % Use default parameters for custom car
    otherwise
        iconFile = 'default-icon.png';
        parameters = defaultParameters; % Use default parameters for unknown car
end

% Set the icon display with port labels
iconFullPath = fullfile(iconPath, iconFile);
maskDisplay = sprintf('image(''%s'')\n', iconFullPath);
set_param(gcb, 'MaskDisplay', maskDisplay);

% Update the parameters of the TractionDemand block
set_param(gcb, 'mass', num2str(parameters.mass));
set_param(gcb, 'projectedSurface', num2str(parameters.projectedSurface));
set_param(gcb, 'coefficientOfDrag', num2str(parameters.coefficientOfDrag));
set_param(gcb, 'lambda', num2str(parameters.lambda));