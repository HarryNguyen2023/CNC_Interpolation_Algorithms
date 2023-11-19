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
            Qx = Qx - reg_max;
            dzx = dzx + 1;      % Output pulse for X axis
        end
        X = [X dzx];
        % DDAY
        Py = dzx;
        % Interagte Qy register until it is overflow
        Qy = Qy + Py;
        if Qy >= reg_max
            Qy = Qy - reg_max;
            dzy = dzy + 1;      % Output pulse for Y axis
        end
        Y = [Y dzy];
    end
    
    coordinate = [X' Y'];
end