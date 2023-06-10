function y = mkArtEIT(K, loc)
    switch(loc)
        case 'heart'
            load('eitArts\heartCRS.mat','heart');
            y = K * normalize(heart,"range");
        case 'lung'
            load('eitArts\lungCRS.mat','lung');
            y = K * normalize(lung,"range");
        case 'trans'
            load('eitArts\transCRS.mat','trans');
            y = K * normalize(trans,"range");
        case 'center'
            load('eitArts\centerCRS.mat','center');
            y = K * normalize(center,"range");
        otherwise
            load('eitArts\heartCRS.mat','heart');
            y = K * normalize(heart,"range");
    end
end