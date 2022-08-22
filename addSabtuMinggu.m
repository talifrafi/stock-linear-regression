function out = addSabtuMinggu(x)
    counter = 0;
    out = ones(1);
    for R = 1: size(x)
        if mod(R, 5) ~= 0
            out(R+counter) = x(R);
        else
            out(R+counter) = x(R);
            out(R+1+counter) = x(R);
            out(R+2+counter) = x(R);
            counter = counter + 2;
        end
    end
    out = out';
end
