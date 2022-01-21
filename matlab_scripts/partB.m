clear
close all
clc

%% READ DATA FROM EXCEL
file = 'specmcf.csv';
data = readmatrix(file);

eat = data(:,7);

%% GRAPHS
l1D_size =["32KB" "64KB" "128KB" "256KB"];
EDAP = [eat(1) eat(2) eat(3) eat(4)];

figure(1)
clf
subplot(3,1,1);
plot(EDAP,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l1D_size);
title('L1Isize = 32KB, L2size = 512KB, L1D = L1I = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L1 data cache size');
ylabel('EDAP');

l1I_size =["32KB" "64KB" "128KB" "256KB"];
EDAP = [eat(5) eat(2) eat(6) eat(7)];

subplot(3,1,2);
plot(EDAP,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l1I_size);
title('L1Dsize = 64KB, L2size = 512KB, L1D = L1I = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L1 instruction cache size');
ylabel('EDAP');

l2_size =["256KB" "512KB" "1MB" "2MB" "4MB"];
EDAP = [eat(8) eat(9) eat(10) eat(11) eat(12)];

subplot(3,1,3);
plot(EDAP,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l2_size);
title('L1Dsize = 128KB, L1Isize = 128KB, L1D = L1I = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L2 cache size');
ylabel('EDAP');

l1D_associativity =["1-way" "2-way" "4-way"];
EDAP = [eat(10) eat(13) eat(14)];

figure(2)
clf
subplot(2,2,1);
plot(EDAP,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l1D_associativity);
title('L1Dsize = 128KB, L1Isize = 128KB, L2size=1MB, L1I = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L1 data cache associativity');
ylabel('EDAP');

l1I_associativity =["1-way" "2-way" "4-way"];
EDAP = [eat(10) eat(15) eat(16)];

subplot(2,2,2);
plot(EDAP,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l1I_associativity);
title('L1Dsize = 128KB, L1Isize = 128KB, L2size=1MB, L1D = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L1 instruction cache associativity');
ylabel('EDAP');

l2_associativity =["1-way" "2-way" "4-way"];
EDAP = [eat(17) eat(18) eat(19)];

subplot(2,2,3);
plot(EDAP,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l2_associativity);
title('L1Dsize = 128KB, L1Isize = 128KB, L2size=1MB, L1D = L1I = 2-way assoc, cacheline = 64');
xlabel('L2 cache associativity');
ylabel('EDAP');

cache_line =["32" "64" "128" "256"];
EDAP = [eat(20) eat(19) eat(21) eat(22)];

subplot(2,2,4);
plot(EDAP,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(cache_line);
title('L1Dsize = 128KB, L1Isize = 128KB, L2size=1MB, L1D = L1I = 2-way assoc, L2= 4-way assoc');
xlabel('Cache line (bytes)');
ylabel('EDAP');

figure(3)
clf
scatter((1:length(eat)) - 1, eat, 'filled');
hold on;
yline(eat(23),'--r');
xlabel('simulation number');
ylabel('EDAP');
title('Scatter diagram');