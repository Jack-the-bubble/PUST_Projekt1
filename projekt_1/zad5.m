%PUST Projekt 1
%Zadanie 5
%Doświadczalne dobranie parametrów regulatorów PID i DMC
%Skrypt uruchamia regulatory zaimplementowane w zad4.m i
%zad4DMCKamilMichal.m

%PID
% Parametry: K=0.7, Ti = 24, Td = 3
% Proces dobierania:
% 1. wyłączenie wszystkich parametrów i dobranie K najlepszego, K=0,6
% 2. włączenie całki i dobranie najlepszej całki, Ti = 36
% 3. włączenie rózniczki i dobranie najlepszej różniczki, Td = 3
% 4. dowolna modyfikacja K i Ti, tak by uzyskać lepszy rezultat

%DMC
% #TODO lepszy dobór parametrów dla DMC

clear all;

iterNum = 1270;
Umin = 0.9;
Umax = 1.3;
Ypp = 2;
Upp = 1.1;
deltaUmax = 0.05;

yZad = ones(iterNum, 1)*Ypp;
yZad(21:270) = 2.05;
yZad(271:520) = 1.95;
yZad(521:770) = 2.1;
yZad(771:1020) = 1.9;
yZad(1021:1270) = 2.15;
yZad = yZad - Ypp;

PID = fullfile('Zad4.m');
run(PID);
wskaznikPID = sum(((yZad+Ypp) - Ypid).^2);
disp("Wskaznik jakosci regulacji dla regulatora PID: "+ wskaznikPID);

%{
DMC = fullfile('Zad4DMCKamilMichal.m');
run(DMC);
wskaznikDMC = sum((yZad - Ydmc).^2);
disp("Wskaznik jakosci regulacji dla regulatora DMC: "+ wskaznikDMC);
%}


