function [X,Y] = circular_stair_case(radius, start, stop)
    % For data plotting
    X = [];
    Y = [];
    x = start(1);
    y = start(2);
    X = [X x];
    Y = [Y y];
    % Initiate parameters
    Xf = abs(stop(1) - start(1));
    Yf = abs(stop(2) - start(2));
    deltaX = 2*start(1) + 1;
    deltaY = -2*start(2) + 1;
    D = 0;
    % Main procedure
    while ~(Xf == 0 && Yf == 0)
        if D > 0
            D = D + deltaY;
            deltaY = deltaY + 2;
            Yf = Yf - 1;
            y = y - 1;
        else
            D = D + deltaX;
            deltaX = deltaX + 2;
            Xf = Xf - 1;
            x = x + 1;
        end
        X = [X x];
        Y = [Y y];
    end
end