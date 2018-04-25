function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

for i = 1:3
    for j = 1:3
        A1 = P1(mod(j+1, 3)+1, 2) - P1(mod(j, 3)+1, 2);
        B1 = P1(mod(j, 3)+1, 1) - P1(mod(j+1, 3)+1, 1);
        C1 = A1*P1(mod(j, 3)+1, 1)+B1*P1(mod(j, 3)+1, 2);

        A2 = P2(mod(i+1, 3)+1, 2) - P2(mod(i, 3)+1, 2);
        B2 = P2(mod(i, 3)+1, 1) - P2(mod(i+1, 3)+1, 1);
        C2 = A2*P2(mod(i, 3)+1, 1)+B2*P2(mod(i, 3)+1, 2);

        det = A1*B2 - A2*B1;

        if det == 0
            x = inf;
            y = inf;
        else
            x = (B2*C1 - B1*C2)/det;
            y = (A1*C2 - A2*C1)/det;
        end

        if (min(P1(mod(j, 3)+1, 1), P1(mod(j+1, 3)+1, 1)) <= x) && (x <= max(P1(mod(j, 3)+1, 1), P1(mod(j+1, 3)+1, 1))) && (min(P1(mod(j+1, 3)+1, 2), P1(mod(j, 3)+1, 2)) <= y) && (y <= max(P1(mod(j+1, 3)+1, 2), P1(mod(j, 3)+1, 2)))
            if (min(P2(mod(i, 3)+1, 1), P2(mod(i+1, 3)+1, 1)) <= x) && (x <= max(P2(mod(i, 3)+1, 1), P2(mod(i+1, 3)+1, 1))) && (min(P2(mod(i+1, 3)+1, 2), P2(mod(i, 3)+1, 2)) <= y) && (y <= max(P2(mod(i+1, 3)+1, 2), P2(mod(i, 3)+1, 2)))
            flag1 = true;
            break;
            end
        else
            flag1 = false;
        end
    end
    if flag1 == true;
        break;
    end
end

%% Judge whether a point lies inside of a triangle

for i = 1:3
    b1 = sign(P2(i, :), P1(1, :), P1(2, :)) < 0.0;
    b2 = sign(P2(i, :), P1(2, :), P1(3, :)) < 0.0;
    b3 = sign(P2(i, :), P1(3, :), P1(1, :)) < 0.0;

    flag2 =  ((b1 == b2) && (b2 == b3));
    if flag2
        break;
    end
end

for i = 1:3
    b1 = sign(P1(i, :), P2(1, :), P2(2, :)) < 0.0;
    b2 = sign(P1(i, :), P2(2, :), P2(3, :)) < 0.0;
    b3 = sign(P1(i, :), P2(3, :), P2(1, :)) < 0.0;

    flag3 =  ((b1 == b2) && (b2 == b3));
    if flag3
        break;
    end
end

if flag1 || flag2 || flag3
    flag = true;
else 
    flag = false;
end

end

function result = sign(p1, p2, p3)
    result =  (p1(1) - p3(1)) * (p2(2) - p3(2)) - (p2(1) - p3(1)) * (p1(2) - p3(2));
end