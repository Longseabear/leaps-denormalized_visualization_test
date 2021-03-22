clear;
close all;

data_num = 100;
mu1 = 10;
sigma1 = 1;
datas = normrnd(mu1,sigma1,data_num,2);

mu2 = -5;
sigma2 = 5;
datas2 = normrnd(mu2,sigma2,data_num,2);

hold on
title("nomal plot")
scatter(datas(:,1), datas(:,2),[], 'MarkerFaceColor', 'r');
scatter(datas2(:,1), datas2(:,2),[], 'MarkerFaceColor', 'g');
hold off

figure, 
hold on
title("normalized plot")
datas = normalize(datas);
datas2 = normalize(datas2);
scatter(datas(:,1), datas(:,2),[], 'MarkerFaceColor', 'r');
scatter(datas2(:,1), datas2(:,2),[], 'MarkerFaceColor', 'g');
hold off

figure, 
hold on
title("denormalization")
a = datas .* sigma1 + mu1;
b = datas2 .* sigma1 + mu1;
scatter(a(:,1), a(:,2),[], 'MarkerFaceColor', 'r');
scatter(b(:,1), b(:,2),[], 'MarkerFaceColor', 'g');
hold off

figure, 
hold on
title("Adaptive denormalized")

de_mean(1:data_num/2,1:2) = mu1;
de_mean(data_num/2+1:data_num,1:2) = mu2;

de_sigma(1:data_num/2, 1:2) = sigma1;
de_sigma(data_num/2+1:data_num,1:2) = sigma2;


datas = datas .* de_sigma + de_mean;
datas2 = datas2 .* de_sigma + de_mean;
scatter(datas(:,1), datas(:,2),[], 'MarkerFaceColor', 'r');
scatter(datas2(:,1), datas2(:,2),[], 'MarkerFaceColor', 'g');
hold off


