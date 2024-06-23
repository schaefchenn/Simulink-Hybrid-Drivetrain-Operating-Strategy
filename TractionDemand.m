classdef TractionDemand < matlab.System
    % TractionDemand derived from vehicle velocity and vehicle acceleration.

    % Public, nontunable properties
    properties (Nontunable)
        CarChoice = 'Audi RS6';            % Choose a Car or create a custom one
        mass double = 1000;                % Mass [kg]
        projectedSurface double = 2;       % Projected Surface [m^2]
        coefficientOfDrag double = 0.31;   % Coefficient of Drag
        lambda double = 1.1;               % Lambda
        dynamicRadius double = 0.100;        % Dynamic Wheel Radius [m]
        frictionResistance double = 0.01;     % Friction Resistance
    end

    properties (Hidden, Constant)
        %carData = readmatrix('Fahrzeugauflistung 1.xlsx');
        CarChoiceSet = matlab.system.StringSet({'Audi RS6', 'BMW G80 M3', 'Hyundai i30','Honda CRZ', 'Custom'});
    end

    % Traction properties
    properties
        gravitationConstant double = 9.81  % Gravitation [m/s^2]
        gradient double = 0;               % Gradient [%]
        airDensity double = 1.199;         % Air Density [kg/m^3]
    end


    methods (Access = protected)
        %% Calculation and Reset
        function [torque, wheelSpeed] = stepImpl(obj, velocity, acceleration)

            % Calculate the angle derived from the gradient
            alpha = atan(obj.gradient / 100);

            % Calculate forces
            if velocity == 0
                wheelResistance = 0;
            else
                wheelResistance = obj.frictionResistance * obj.mass * obj.gravitationConstant * cos(alpha); % in N
            end

            airResistance = 0.5 * obj.airDensity * obj.coefficientOfDrag * obj.projectedSurface * velocity^2; % in N
            gradientResistance = obj.mass * obj.gravitationConstant * sin(alpha); % in N
            accelerationResistance = obj.lambda * obj.mass * acceleration;

            % Calculate the traction demand
            tractionDemand = wheelResistance + airResistance + gradientResistance + accelerationResistance; % in N

            % Calculate outputs
            wheelSpeed = (velocity / (obj.dynamicRadius * 2 * pi)) * (60); % in rpm
            torque = tractionDemand * obj.dynamicRadius; % in Nm
        end

        %% Output Specifications
        function [out, out2] = getOutputSizeImpl(~)
            % Return size for each output port
            out = [1, 1];
            out2 = [1, 1];
        end

        function [out, out2] = getOutputDataTypeImpl(~)
            % Return data type for each output port
            out = 'double';
            out2 = 'double';
        end

        function [out, out2] = isOutputComplexImpl(~)
            % Return true for each output port with complex data
            out = false;
            out2 = false;
        end

        function [out, out2] = isOutputFixedSizeImpl(~)
            % Return true for each output port with fixed size
            out = true;
            out2 = true;
        end
    end
end
