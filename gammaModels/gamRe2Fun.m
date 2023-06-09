function y = gamRe2Fun(Npeaks, K, A, B, TTP, TOA, RF, t)
    y = Npeaks(1) * gamReFun(K(1), A(1), B(1), TTP(1), TOA(1), RF(1), t) +...
        Npeaks(2) * gamReFun(K(2), A(2), B(2), TTP(2), TOA(2), RF(2), t);
end

