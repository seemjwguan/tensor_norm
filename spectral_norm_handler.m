function app = spectral_norm_handler(T, p, gamma)
    n1 = size(T, 1);
    H = Brieden_realpts(n1, p, gamma);
    H = H';
    num_hits = size(H, 2);

    app = 0;

    for hit = 1:num_hits

        temp = squeeze(nmodeproduct(T, H(:, hit)', 1));
        tempnorm = norm(temp);

        if tempnorm >= app
            app = tempnorm;
        end

    end

end
