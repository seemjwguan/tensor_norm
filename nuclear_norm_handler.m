function app = nuclear_norm_handler(T, p, gamma)
    n1 = size(T, 1);
    n2 = size(T, 2);
    n3 = size(T, 3);
    H = Brieden_realpts(n1, p, gamma);
    H = H';
    num_hits = size(H, 2);

    % cvx_solver mosek
    cvx_begin sdp
    variable Z(n1, n2, n3)
    maximize dot(T(:), Z(:))
    subject to

    for hit = 1:num_hits

        temp = squeeze(nmodeproduct(Z, H(:, hit)', 1));
        [eye(n2, n2), temp; temp', eye(n3, n3)] >= 0;

    end

    cvx_end

    app = cvx_optval;

end
