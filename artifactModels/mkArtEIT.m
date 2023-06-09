function y = mkArtEIT(K, loc)
    switch(loc)
        case 'heart'
            load('..\crsArts\heartCRS.mat','heart');
            y = K * heart;
        case 'lung'
            load('..\crsArts\lungCRS.mat','lung');
            y = K * lung;
        case 'trans'
            load('..\crsArts\transCRS.mat','trans');
            y = K * trans;
        case 'center'
            load('..\crsArts\centerCRS.mat','center');
            y = K * center;
        otherwise
            load('..\crsArts\heartCRS.mat','heart');
            y = K * heart;
    end
end