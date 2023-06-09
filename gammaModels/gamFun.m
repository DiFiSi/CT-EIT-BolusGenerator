function y = gamFun(K, A, B, TTP, TOA, t)
    y = (max(t - TOA, 0) / TTP) .^ (A - 1) .* exp((TTP - max(t - TOA, 0)) / B);
    y = K * y / max(y);
end