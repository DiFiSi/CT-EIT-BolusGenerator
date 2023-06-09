function [A,B,TTP,TOA] = prepVars(Tpeak,MTT,RD)
    A = 1 ./ RD;
    B = MTT .* RD;
    TTP = MTT - B;
    TOA = Tpeak - TTP;
end