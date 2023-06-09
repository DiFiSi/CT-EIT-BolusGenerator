function y = mkArtCT(kAct,y,f,t)
    % yVessel first column, yTissue second column
    Act = kAct * (y(:,1) - y(:, 2));
    y = (Act / 2) .* (sin(2 * pi * f(1) * t) + sin(2 * pi * f(2) * t));
end

