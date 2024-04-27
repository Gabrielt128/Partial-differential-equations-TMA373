function [N,T,P]=mygrid(G,w)
    % Physical constants

    epsAir=8.85e-12;
    muAir=4*pi*1e-7;
    sigmaAir=0;
    
    epsChicken=4.43e-11;
    muChicken=4*pi*1e-7;
    sigmaChicken=3e-11;
    
    % Chicken in microwave oven
    if G==0
        N=[0 0;1 0;0 1;1 1 ];
        T=[1 2 3 1 0 1;2 4 3 1 1 0];
        P=[1 1];
    elseif G==1
        N=[0 0;1 0;0 1];
        T=[1 2 3 1 1 1];
        P=1;
    elseif G==2
        N=[0 0;.5 0;0 .3;.5 .3];
        T=[1 2 3 1 0 1;2 4 3 1 1 0];
        P=[1 1];
    elseif G==3                                         
        N=[.08 .09; .14 .04; .2  .03; .3  .03; .35 .04 % inside
         .4  .1 ; .35 .16; .3  .2 ; .25 .22; .2  .24 
         .14 .24; .1  .2 ; .05 .2 ; .03 .22; .02 .19 
         .03 .16; .05 .18; .1  .18; .13 .14; .15 .18
         .2  .2 ; .15 .1 ; .2  .1 ; .3  .1 ; .35 .1  
         0   0  ; .1  0  ; .2  0  ; .3  0  ; .4  0   % outside
         .5  0  ; .5  .3 ; .4  .3 ; .25 .3 ; .15 .3
         .08 .3 ; 0   .3 ; 0   .19; 0   .1 ; .5  .15];
        T=[13 14 15 0 0 0; 15 16 17 0 0 0; 15 17 13 0 0 0; 17 12 13 0 0 0
         17 18 12 0 0 0; 18 20 12 0 0 0; 18 19 20 0 0 0; 12 20 11 0 0 0
         20 21 11 0 0 0; 21 10 11 0 0 0; 21  9 10 0 0 0;  1 22 19 0 0 0
         22 20 19 0 0 0; 22 23 20 0 0 0;  2 22  1 0 0 0;  2 23 22 0 0 0
         20 23 21 0 0 0; 23  9 21 0 0 0;  2  3 23 0 0 0;  3 24 23 0 0 0
         23 24  9 0 0 0;  3  4 24 0 0 0; 24  8  9 0 0 0; 24  7  8 0 0 0 
         24 25  7 0 0 0; 24  5 25 0 0 0;  4  5 24 0 0 0;  5  6 25 0 0 0
          6  7 25 0 0 0; 26 27  1 1 0 0; 27  2  1 0 0 0; 27 28  2 1 0 0 
         28  3  2 0 0 0; 28 29  3 1 0 0; 29  4  3 0 0 0; 29 30  4 1 0 0
         30  5  4 0 0 0; 30  6  5 0 0 0; 30 31  6 1 0 0; 31 40  6 1 0 0
         32 33 40 1 0 1; 33  7  6 0 0 0; 33  8  7 0 0 0; 33 34  8 1 0 0
         34  9  8 0 0 0; 34 10  9 0 0 0; 34 35 10 1 0 0; 35 11 10 0 0 0
         35 36 11 1 0 0; 36 12 11 0 0 0; 36 13 12 0 0 0; 36 14 13 0 0 0
         36 37 14 1 0 0; 37 38 14 1 0 0; 38 15 14 0 0 0; 38 16 15 0 0 0
         38 39 16 1 0 0; 39  1 16 0 0 0;  1 17 16 0 0 0;  1 18 17 0 0 0
          1 19 18 0 0 0; 39 26  1 1 0 0; 40 33  6 0 0 0];  
        P=[muChicken*(epsChicken+sigmaChicken/pi/w)*ones(1,29) ...
         muAir*(epsAir+sigmaAir/pi/w)*ones(1,34)];
    else
        % N=null;
        % T=null;
        % P=null;
        fprintf('Wrong Selection')
    end