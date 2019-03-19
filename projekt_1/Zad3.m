%PUST Projekt 1
%Zadanie 3
%Przekszta�cenie odpowiedzi skokowej pod DMC
%Wzi�to ostatni� wyznaczon� odpowied� skokow� (Ukon = 1.25)
%TODO: po co w sumie generowa� wszystkie wcze�niejsze odpowiedzi skokowe?
Upp = 1.1;
Ypp = 2;
%iterNum = 300;
iterNumSkok = 300;
chwila_skoku_U = 12;
wartosc_skoku_U = 0.12;

U(1:(chwila_skoku_U-1)) = Upp;
Ukon = Upp + wartosc_skoku_U;

Y(1:iterNumSkok) = Ypp;
    
    U(chwila_skoku_U:iterNumSkok) = Ukon;
    
for k = 12:1:iterNumSkok
   Y(k) = symulacja_obiektu3Y(U(k-10),U(k-11),Y(k-1),Y(k-2));
end
    
%     subplot(2,1,1)
%     stairs(kwyk,Y)
%     hold on
%     
%     subplot(2,1,2)
%     plot(kwyk,U)
%     hold on

%     Ukon = Ukon + 0.03;

%end
%hold off

%normalizacja odpowiedzi skokowej
Ynorm = (Y - Ypp)./wartosc_skoku_U;
Ynorm=Ynorm(chwila_skoku_U:end);

%kwyk = 1:1:iterNumSkok;
%figure
%stairs(kwyk, Ynorm);
%matlab2tikz('wykresy_dane/odp_skokowaDMC.tex', 'showInfo', false);
%xlabel('k');
%ylabel('Y');

nazwa1 = 'odp_skok_projekt.txt';
 
file = fopen(nazwa1, 'w');
A = [(1:length(Ynorm));Ynorm];
fprintf(file, '%4.3f %.3f \n',A);
fclose(file);
% 
% file = fopen(nazwa2, 'w');
% B = [(1:iterNum);Y'];
% fprintf(file, '%4.3f %.3f \n',B);
% fclose(file);
% 
% file = fopen(nazwa3, 'w');
% C = [(1:iterNum);(yZad+Ypp)'];
% fprintf(file, '%4.3f %.3f \n',C);
% fclose(file);