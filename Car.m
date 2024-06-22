classdef Car < handle
    properties
        brand string
        modell string
        mass double = 1000;               % Mass [kg]
        projectedSurface double = 2;      % Projected Surface [m^2]
        coefficientOfDrag double = 0.31;  % Coefficient of Drag
        lambda double = 1.1;              % Lambda
        CarChoice
    end

    methods
    end
end