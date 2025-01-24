function calig_X = Brieden_realpts(n, p, gamma)

    norm_bound = gamma * (n ^ (1 / p));

    gg = cell(1, n);
    [gg{:}] = ndgrid([-ceil(norm_bound):ceil(norm_bound)]);

    calig_X = [];

    for ind1 = 1:numel(gg{1})
        candidate = zeros(n, 1);

        for ind2 = 1:n
            candidate(ind2, 1) = gg{ind2}(ind1);
        end

        pnorm = norm(candidate, p);

        if pnorm > 0 & pnorm <= norm_bound
            calig_X = [calig_X; candidate'./pnorm];
        end

    end

end
