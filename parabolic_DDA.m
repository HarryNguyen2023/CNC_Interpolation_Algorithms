function coordinate = parabolic_DDA(start, stop, focal_len, reg_bit)
    % Get the maximum value of the register
    reg_max = 2^(reg_bit);
    
    % Initiate the registers
    Px = 2*focal_len;    % Px = 2p (constant)
    Py = start(1);       % Py = x0
    Qx = 0;
    Qy = 0;
    dzx = start(1);
    dzy = start(2);
    
    % Array of coordinate for debugging purpose
    X = [];
    Y = [];
    X = [X dzx];
    Y = [Y dzy];
    
    while (dzx < stop(1)) && (dzy < stop(2))
        % DDAX - Interagte Qx register until it is overflow
        Qx = Qx + Px;
        if Qx >= reg_max
            dzx = dzx + floor(Qx / reg_max);      % Output pulse for X axis
            Qx = mod(Qx, reg_max);
        end
        X = [X dzx];
        % DDAY
        Py = dzx;
        % Interagte Qy register until it is overflow
        Qy = Qy + Py;
        if Qy >= reg_max
            dzy = dzy + floor(Qy / reg_max);      % Output pulse for Y axis
            Qy = mod(Qy, reg_max);
        end
        Y = [Y dzy];
    end
    
    coordinate = [X' Y'];
end