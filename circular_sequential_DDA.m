function coordinate = circular_sequential_DDA(radius, start, stop)
    % Initiate some array for storing value
    X = [];
    Y = [];
    % Initiate main registers for calculation
    x = start(1);
    y = start(2);
    X = [X x];
    Y = [Y y];
    int_x = x;
    int_y = y;
    % Input the start point
    while y >= stop(2)
        % Integrate y until it is larger then R
        int_x = int_x + y;
        if int_x >= radius
            int_x = int_x - radius;
            x = x + 1;
        end
        X = [X x];
        % Integrate x until it is larger then R
        int_y = int_y + x;
        if int_y >= radius
            int_y = int_y - radius;
            y = y - 1;
        end
        Y = [Y y];
    end
    coordinate = [X' Y'];
end