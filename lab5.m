matCoef = [0.3, 0.25, 0.25, 0.1;
           0.4, 0.30, 0.30, 0.4;
           0.1, 0.40, 0.15, 0.4;
           0.2, 0.15, 0.30, 0.1];

matR = matCoef;
option = 4; 
T = 0;

for i = 1:option
    column = matCoef(:,i);
    disp('Initial column:'); disp(column);
    sorted = flip(tabulate(sort(column)));
    disp('Sorted column + frequency (+ percent)'); disp(sorted);
    value = sorted(:,1);
    %disp('Values:'); disp(value);
    freq = sorted(:,2);
    %disp('Frequencys:'); disp(freq);
    len = length(value); % length for different column (if values are equal)
    num = 1;
    weight = matR(:,i); 
    for j = 1:len
        num  = ceil(num);
        if freq(j)>1
            num = sum(num:(freq(j)+num-1)) / freq(j);
            weight(weight == value(j)) = num;
            T = T + (freq(j)^3 - freq(j)); 
        else
            weight(weight == value(j)) = num;
            num = num + 1; 
        end
    end
    matR(:,i) = weight;
end

S(option) = sum(matR(option,:));
FullS = sum(S);
d = sum((S-(FullS/option)).^2); 
Sogl = 12 * d / (option^2 * (option^3 - option) - option * T);
disp('Initial matrix of coefficent:'); disp(matCoef);
disp('Rangs:'); disp(matR);
disp('Coefficent:'); disp(Sogl);