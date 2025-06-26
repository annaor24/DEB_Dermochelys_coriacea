%% script for analyzing the results of the simulations of turtles in different food and temp (as calculated in phD)
% created: Nina Marn 2016/11/28
clear all
close all

load results_fTgrid2.mat
  K = simu.cPar.K; % 0.031 (for loggerhead 174!!) half-sat coefficient - characteristics of the organism from DEB pars
  T_ref=simu.par.T_ref; TA = simu.par.T_A; % ref temp (in K) and Arrhenius temp; characteristics of the organism from DEB pars
  T = Ts; % temps to Kelvins
  
  %%%  unpack variables, and transform them for plotting
  Li= imsc.Li'; Wi= imsc.Wi'/1000; Ri = imsc.Ri'; cumF= imsc.cumF';
 ap = imsc.ap' /365; Lp = imsc.Lp'; Wp= imsc.Wp'/1000 ; 
  
  T_now = T_env -273.15;
  f_now = simu.finit;
  
  % ========================================================
  %% print to screen tables with data
  % ========================================================
      fprintf (' **** DIFFERENT FOOD LEVELS ***** \n')      
      i_temp = limit; temp=Ts(i_temp)-273.15 % which row to print for temp
   fprintf (' mdfy,   f,     ap,    Lp,     Li,     Wi,      Ri  ,    cumF \n')     
   fprintf ('======================================================= \n')
        for ff = 1:length(mdfyX)
            mdfy = mdfyX(ff);
            if mdfy <= 1
                fprintf('%2.0f & %1.3f & %3.2f & %3.2f & %3.2f & %3.1f & %i & %i \\\\ \n',...
                    (mdfy-1)*100, f2(ff) , ap(i_temp,ff), Lp(i_temp,ff), Li(i_temp,ff),  Wi(i_temp,ff), round(Ri(i_temp,ff)), round(cumF(i_temp,ff)))               
             else
             fprintf('+%2.0f & %1.3f & %3.2f & %3.2f & %3.2f & %3.1f & %i & %i  \\\\ \n',...
                    (mdfy-1)*100, f2(ff) , ap(i_temp,ff), Lp(i_temp,ff), Li(i_temp,ff),  Wi(i_temp,ff), round(Ri(i_temp,ff)), round(cumF(i_temp,ff)))
             end
        end
        fprintf ('======================================================= \n')
            fprintf (' **** DIFFERENT TEMPERATURES ***** \n')      
            i_food = limit-1; food = f2(i_food)
        fprintf (' T,     ap,    Lp,     Li,     Wi,      Ri ,  cumF \n')     
       fprintf ('======================================================= \n')
       
        for tt = 1: length(Ts)            
                fprintf('%2.2f & %2.2f & %4.2f & %1.2f & %3.1f & %i & %i \\\\ \n',...
                   Ts(tt)-273.15, ap(tt,i_food), Lp(tt,i_food), Li(tt,i_food), Wi(tt,i_food), round(Ri(tt,i_food)), round(cumF(tt,i_food)))
        end
        fprintf ('======================================================= \n')
       
 % ========================================================
  %% plot figures
  % ========================================================
        
        
        
  
%   subplot (1,2,1)
%   % relation of change in X (expressed as X/X_ref) and f
%     plot (mdfyX-1, f2, '*')
%   %xlabel('change in X expressed as (X-X_{ref})/X_{ref}')
%   xlabel('change in X (%)')
%   ylabel('scaled functional response (f)') 
%   
%     subplot (1,2,2)
%   % relation of change in temperature T-T_ref (T_ref=293.15 K) and change in metabolic rates (equation 1.2 in [#Kooijman2010]:
%  % k(T)=k_ref * exp(TA/T_ref - TA/T ) --> k(T)/k_ref = exp(TA/T_ref - TA/T )
%   effectT = exp(TA/T_ref-TA./T);
%   plot((T-T_ref)/T_ref, effectT, '*')
% %   xlabel('change in T expressed as (T-T_{ref})/T_{ref}')
% xlabel('change in T (%)')
%   ylabel('effect on the metabolic rates') 
  
  
  
    %% to change what I plot as f or T, code here
 x_f = f2; label_f = 'f';
  %x_f = (mdfyX-1)*100; label_f = '(X-X_{ref})/X_{ref}';
    %
   x_T = Ts-273.15; label_T='T ({\circ}C)';
%  x_T = ((T-T_ref)/T_ref)*100 ; label_T='(T-T_{ref})/T_{ref}';

row=3; col = 2; % how many rows and columns for multiplot
fntSz = 10; %fontSize

figure  %% --> CAUTION!!! the imagesc plots misleading/wrong images
 subplot(row,col,1)
 imagesc([x_f(1), x_f(end)], [x_T(1), x_T(end)], ap)
%  xlabel(label_f)
% surf(x_f, x_T, ap)
%  ylabel(label_T)
 title('age at puberty (yr)','fontsize',fntSz)
 
 subplot(row,col,2)
 imagesc(x_f, x_T, Lp)
%  xlabel(label_f)
%  ylabel(label_T)
 title(['length at puberty', sprintf('\n'), ' SCL (cm)'],'fontsize',fntSz)
 
 subplot(row,col,5)
 imagesc(x_f, x_T, Ri)
%  xlabel(label_f)
%  ylabel(label_T)
 title(['maximum',sprintf('\n'),'reproductive output (#)'],'fontsize',fntSz);
 
 subplot(row,col,4)
 imagesc(x_f, x_T,Li)
%  xlabel(label_f)
%  ylabel(label_T)
 title(['ultimate length', sprintf('\n'), 'SCL (cm)'],'fontsize',fntSz)
 
 subplot(row,col,3)
 imagesc(x_f, x_T, Wi)
%  xlabel(label_f)
%  ylabel(label_T)
 title('ultimate weight (kg)','fontsize',fntSz)
 
 subplot(row,col,6)
 imagesc(x_f, x_T, cumF)
 title(['cummulative',sprintf('\n'),'reproductive output (#)'],'fontsize',fntSz);
 
%%% add colorbars
for sp = 1:6
    subplot(row,col,sp)
    hold on
%     colormap(gray)
    colorbar
    set(gca,'YDir','normal')
     plot([f_now f_now], [min(x_T) max(x_T)], 'k-', 'LineWidth',3)
     plot([min(x_f) max(x_f)], [T_now T_now], 'k-', 'LineWidth',3)
    plot(f_now, T_now, 'o',...
        'MarkerEdgeColor','k','MarkerFaceColor','w',...
        'MarkerSize',10)
%     xlabel(label_f, 'fontsize',30)
%     ylabel(label_T, 'fontsize',30) 
%      axes('fontsize',30)
end
%% saving the figure
set(gcf, 'paperunits', 'centimeters')
set(gcf, 'paperposition', [0 0 45 50], 'papersize', [45 50])
%  print('-r100','-dtiff','Fig-imagesc30-lin.tif');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure  %% --> SURFACE plots
 subplot(row,col,1)
 surf(x_f, x_T, ap)
%  ylabel(label_T)
 title('age at puberty (yr)','fontsize',fntSz)
 
 subplot(row,col,2)
 surf(x_f, x_T, Lp)
%  xlabel(label_f)
%  ylabel(label_T)
 title(['length at puberty', sprintf('\n'), ' SCL (cm)'],'fontsize',fntSz)
 
 subplot(row,col,5)
 surf(x_f, x_T, Ri)
%  xlabel(label_f)
%  ylabel(label_T)
 title(['maximum',sprintf('\n'),'reproductive output (#)'],'fontsize',fntSz);
 
 subplot(row,col,4)
 surf(x_f, x_T,Li)
%  xlabel(label_f)
%  ylabel(label_T)
 title(['ultimate length', sprintf('\n'), 'SCL (cm)'],'fontsize',fntSz)
 
 subplot(row,col,3)
 surf(x_f, x_T, Wi)
%  xlabel(label_f)
%  ylabel(label_T)
 title('ultimate weight (kg)','fontsize',fntSz)
 
 subplot(row,col,6)
 surf(x_f, x_T, cumF)
 title(['cummulative',sprintf('\n'),'reproductive output (#)'],'fontsize',fntSz);
 
%%% add colorbars
for sp = 1:6
    subplot(row,col,sp)
    hold on
%     colormap(gray)
    colorbar
    set(gca,'YDir','normal')
     xlabel(label_f, 'fontsize',10)
     ylabel(label_T, 'fontsize',10) 
%      axes('fontsize',30)
end
%% saving the figure
set(gcf, 'paperunits', 'centimeters')
set(gcf, 'paperposition', [0 0 45 50], 'papersize', [45 50])
%  print('-r100','-dtiff','Fig-imagesc30-lin.tif');


return 

  figure
 subplot(2,3,1)
 plot(x_f, Ap_f, '*')
 xlabel(label_f)
 ylabel('age at puberty , (yr)')
 subplot(2,3,2)
 plot(x_f, Lp_f, '*')
 xlabel(label_f)
 ylabel(' length at puberty, SCL (cm)')
 subplot(2,3,3)
 plot(x_f, F_f, '*')
 xlabel(label_f)
 ylabel('mex repro outpur (#)')
 subplot(2,3,4)
 plot(x_f, Li_f, '*')
 xlabel(label_f)
 ylabel('ultimate length SCL (cm)')
 subplot(2,3,5)
 plot(x_f, Wi_f, '*')
 xlabel(label_f)
 ylabel('ultimate weight (kg)')
 subplot(2,3,6)
 plot(x_f, cumF_f, '*')
 xlabel(label_f)
 ylabel('cummulative repro outpur (#)')
 %%%
 figure
 subplot(2,3,1)
 plot(x_T, Ap_T, '*')
 xlabel(label_T)
 ylabel('age at puberty , (yr)')
 subplot(2,3,2)
 plot(x_T, Lp_T, '*')
 xlabel(label_T)
 ylabel(' length at puberty, SCL (cm)')
 subplot(2,3,3)
 plot(x_T, F_T, '*')
 xlabel(label_T)
 ylabel('mex repro outpur (#)')
 subplot(2,3,4)
 plot(x_T, Li_T, '*')
 xlabel(label_T)
 ylabel('ultimate length SCL (cm)')
 subplot(2,3,5)
 plot(x_T, Wi_T, '*')
 xlabel(label_T)
 ylabel('ultimate weight (kg)')
 subplot(2,3,6)
 plot(x_T, cumF_T, '*')
 xlabel(label_T)
 ylabel('cummulative repro outpur (#)')