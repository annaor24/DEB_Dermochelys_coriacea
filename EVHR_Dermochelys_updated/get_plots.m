function get_plots(simu)

style1 = '-';
style2 = '--';

simu.style=style1; 

  par = simu.par; cPar = simu.cPar; % parameters
  E_Hp = par.E_Hp;
  K = cPar.K; Em = cPar.E_m; % J/cm^3  [Em] = pAm / v

  % time , environmental forcing
  t = simu.tEVHR(:,1);
  t = t/365; %  show in years
  
  if simu.env == 1 
          X = repmat(simu.Xinit, 1, length( t ) );
          T = repmat(simu.Tinit, 1, length( t) ) - 273; % in DegC
  else
          X = food(t);
          T = temp(t) - 273;  
  end
  
  f = X ./ (X + K); %scaled functional response
  
  % state variables
  E = simu.tEVHR(:,2);
  V = simu.tEVHR(:,3);
  E_H = simu.tEVHR(:,4);
  E_R = simu.tEVHR(:,5);
  
  sc_res_dens = E ./ ( V * Em); % -, scaled reserve density e
  
  % spawning date indices
  i_sp = find(and((E_R == 0),(E_H>=E_Hp)));
  i_sp = i_sp - 1 ; % look at the preceding line with E_R value before spawning
  
   
  % observable quantities
  Lw = simu.obs(:,2);
  Ww = simu.obs(:,3);
  Ew = simu.obs(:,4);
  F  = simu.obs(:,5); % fecundity = reproduction in other script
    
  % graph
  figure(1)
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','in');
  %left bottom width height
  set(gcf,'PaperPosition',[0 0 14 10]); 
  
  
  subplot(3, 4, 1)
  hold on
  plot( t, T, 'Color',  simu.col, 'Linewidth',1.5)
  title('Temperature')
  xlabel('Time (yr)')
  ylabel('T (degC)')
  axis([0 t(end) 0 25])

  subplot(3,4, 2)
  hold on
  plot( t, X , 'Color',  simu.col, 'Linewidth',1.5)
  title('Food')
  xlabel('Time (yr)')	
  ylabel( 'Food density')
  
  
  subplot(3,4,4)
  hold on
  plot( t, f,'Color', simu.col, 'Linewidth',1.5)
  plot( t, sc_res_dens,'Color', simu.col, 'Linewidth',1.5)
  axis([0 t(end) 0 1.7])
  title('Scaled reserve density')
  xlabel('Time (yr)')
  ylabel('e (-)')
  
  % E Reserve energy
  subplot(3, 4, 5)
  hold on
  plot(t, E, 'Color', simu.col, 'Linewidth',1.5)
  title('Reserve energy')
  xlabel('Time (yr)')
  ylabel('E (J)')
  
  
  % V
  subplot(3, 4, 6)
  hold on
  plot(t, V,'Color', simu.col, 'Linewidth',1.5)
  title('Structural volume')
  xlabel('Time (yr)')
  ylabel('V (cm^3)')
  
  % E_H
  subplot(3, 4, 7)
  hold on
  plot(t, E_H,'Color', simu.col, 'Linewidth',1.5)
  title('Cumulated energy invested into maturation')
  xlabel('Time (yr)')
  ylabel('E_H (J)')
  
  % E_R
  subplot(3, 4, 8)
  hold on
  plot(t, E_R,'Color', simu.col , 'Linewidth',1.5)
  title('Reproduction buffer (J)')
  xlabel('Time (yr)')
  ylabel('E_R (J)')
  
  % Lw
  subplot(3, 4, 9)
  hold on
  plot(t, Lw,'Color', simu.col , 'Linewidth',1.5)
  title('Physical length (cm)')
  xlabel('Time (yr)')
  ylabel(' Lw (cm)')
  
 
  % Ww_
  subplot(3, 4, 10)
  hold on
  plot(Lw, Ww/1e3,'Color', simu.col , 'Linewidth',1.5)
  title('Weight-Length')
  xlabel('Lw (cm)')
  ylabel('Ww (kg)')
  
   % Ew
  subplot(3, 4, 11)
  hold on
  plot(t, Ew,'Color', simu.col , 'Linewidth',1.5)
  title('Weight-specific energy content (J/g)')
  xlabel('Time (yr)')
  ylabel('<Ew> (J.g^{-1})')

  % F
  subplot(3, 4, 12)
  hold on
  plot(Lw(i_sp), F(i_sp),'Color', simu.col, 'LineStyle', 'none', 'Marker', '+' , 'Linewidth',1.5)
  title('Fecundity-Length')
  xlabel('Lw (cm)')
  ylabel('F (#)')
 
  print -djpeg90 fig_DEB_standard.jpg 
  % other ways to save the graph
  % saveas(gcf, 'fig_DEB_standard.eps', 'psc2')
  % saveas(gcf, 'fig_DEB_standard.tiff', 'tiff')  
  
  
%   return
   % graph
   
   % podebljaj
   factor = 3.25;
   pop = 0; %working with both populations 
%    mark = 'none'; % marker default
   mark = 'o'; % marker default
   
%   figure(2)
%   set(gcf,'PaperPositionMode','manual');
%   set(gcf,'PaperUnits','in');
%   %left bottom width height
%   set(gcf,'PaperPosition',[0 0 14 10]); 
%   
  
%   subplot(3, 3, 0+pop)
%   hold on
%   plot( t, T,'Color', simu.col, 'Linewidth',factor*1.5)
%   title('Temperature')
%   xlabel('Time (yr)')
%   ylabel('T (degC)')
%   axis([0 t(end) 0 25])

%  subplot(3, 3, 1+pop)
%   hold on
%   plot( t, X ,'Color', simu.col,'LineStyle', simu.sty, 'Linewidth',factor*1.5, 'Marker', simu.mark)
%   title('Food')
%   xlabel('Time (yr)')	
%   ylabel( 'Food density')
%   xlim([0 70])
%   
%   subplot(3, 3, 2+pop)
%    
%    hold on
%   plot( t, f, 'Color',simu.col, 'LineStyle', simu.sty, 'Linewidth',factor*1.5, 'Marker', simu.mark)
%   plot( t, sc_res_dens,'Color', simu.col, 'LineStyle',':', 'Linewidth',factor*1.5)
%   axis([0 t(end) 0 1.7])
%   title('Scaled reserve density')
%   xlabel('Time (yr)')
%   ylabel('e (-)')
%   if pop ==1
%       xlim([0 70])
%   else
%       xlim([0 70])
%   end
%   
%    
%   subplot(3, 3, 3+pop)
  % E Reserve energy
%   hold on
%   plot(t, E, 'Color', simu.col,'LineStyle', simu.sty,  'Linewidth',factor*1.5, 'Marker', simu.mark)
%   title('Reserve energy')
%   xlabel('Time (yr)')
%   ylabel('E (J)')
%    xlim([0 70])
%   
  
%   figure(3)
% %    subplot(3, 3, 4+pop)
%    % V
%   hold on
%   plot(t, V,'Color', simu.col,'LineStyle', simu.sty,  'Linewidth',factor*1.5, 'Marker', simu.mark)
%   title('Structural volume')
%   xlabel('Time (yr)')
%   ylabel('V (cm^3)')
%     xlim([0 70])
%   
  
%  figure(4) 
% %  subplot(3, 3, 5+pop)
%   % Lw
%     hold on
%   plot(t, Lw, 'Color',simu.col , 'LineStyle', simu.sty, 'Linewidth',factor*1.5, 'Marker', simu.mark)
%   title('Physical length (cm)')
%   xlabel('Time (yr)')
%   ylabel(' Lw (cm)')
%       xlim([0 70])
     
  figure (5)
  %subplot(3, 3, 6+pop)
    % Ww_
   hold on
  plot(Lw, Ww/1e3,'Color', simu.col ,'LineStyle', 'none', 'Marker', 'x' , 'Linewidth', 2.5)
  title('Weight-Length')
  xlabel('L_w (cm)')
  ylabel('Ww (kg)')
%      
%   figure (6)
%  % subplot(3, 3, 7+pop)
%   % E_H
%   hold on
%   plot(t, E_H,'Color', simu.col,'LineStyle', simu.sty,  'Linewidth',factor*1.5, 'Marker', simu.mark)
%   title('Cumulated energy invested into maturation')
%   xlabel('Time (yr)')
%   ylabel('E_H (J)')
%       xlim([0 70])
%   
%   figure (7)
%  % subplot(3, 3, 8+pop)
%     % E_R
%    hold on
%   plot(t, E_R,'Color', simu.col ,'LineStyle', simu.sty,  'Linewidth',factor*1.5, 'Marker', simu.mark)
%   title('Reproduction buffer (J)')
%   xlabel('Time (yr)')
%   ylabel('E_R (J)')
%      xlim([0 70])
  
 
% subplot(3, 3, 9)

figure(8)
   % F
   hold on
   plot(Lw(i_sp), F(i_sp),'Color', simu.col, 'LineStyle', 'none', 'Marker', '+' , 'MarkerSize', 12, 'Linewidth',3.5)
   title('Fecundity-Length')
   xlabel('Lw (cm)')
   ylabel('F (#)')