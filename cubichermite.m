function spline = hermite(n,m)
    disp(hDDT(m(1,1:2),m(1,1:2),m(3,1:2)));
    T = m(1,:);
    C = zeros(n-1,4);
    for(i=1:n-1)
        C(i,:) = hDDT(m(1,i:i+1),m(2,i:i+1),m(3,i:i+1));
    end
    C
    spline = mkpp(T,C);
end

function rowC = hDDT(xs,ys,yps)
    %first column
    D = zeros(4);
    D(1,1) = ys(1);
    D(2,1) = ys(1);
    D(3,1) = ys(2);
    D(4,1) = ys(2);
    
    %second column
    D(1,2) = yps(1);
    D(3,2) = yps(2);
    D(2,2) = (D(3,1)-D(2,1)) / (xs(2)-xs(1));
    
    %third column
    D(1,3) = (D(2,2)-D(1,2)) / (xs(2)-xs(1));
    D(2,3) = (D(3,2)-D(2,2)) / (xs(2)-xs(1));
    
    %fourth column
    D(1,4) = (D(2,3)-D(1,3)) / (xs(2)-xs(1));
    
    D
    %creating matrix C
    a = D(1,1);
    b = D(1,2);
    c = D(1,3);
    d = D(1,4);
    rowC = [d c+d*(xs(1)-xs(2)) b a];
end
