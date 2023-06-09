function yT = gamReFun(K, A, B, TTP, TOA, RF, t)
    yP = (1 - RF) * gamFun(K, A, B, TTP, TOA, t);
    yR = RF * K * cumsum(yP) / sum(yP);
    yT = yP + yR;
end