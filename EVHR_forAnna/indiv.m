function tEVHR = indiv(simu)
 %---------------------------------------------------------------
  % Compute model predictions (numerical integration)
  %  
  % simu: 1-structure with individual features (parameters, env...),;
  %             see init.m
  %
  % tEVHR : (nt,4) matrix with time and state variables
  %         t, d, time
  %         E , J, reserve energy
  %         V , cm^3, structural volume
  %         E_H , J , cumulated energy inversted into maturity
  %         E_R , J, reproduction buffer
  
  % possible to include events
  %         
  % called by : main.m
  % calls : fluxes.m
  %
  % 2016/1/29 - Nina Marn (modified); 2013/03/15 - Laure Pecquerie(created)
  %--------------------------------------------------------------
  
  par = simu.par; 
  tc = simu.t0; % set current time to initial time
  EVHR_tc = simu.EVHR_init; % set current values of state variables to initial values
  
  tEVHR = zeros(0,5); % initialize outputs
  i = 0; % initialize year index
  while tc < simu.tm
      i = i + 2; % nesting every two years
      tnext = simu.ts + 365*i; % integrate two nesting dates (one nesting each year)
      if tnext > simu.tm
          tnext  = simu.tm;
      end 
      
      
      % % seting the rules - events or not; see subfunction for details
      options = odeset; % start with default options
      %options = odeset(options, 'Events',@eventsfun); % add an events
      %function  -> does not work!
      
      t = [tc; tnext]';
      % call the ODE solver
      if isempty(options.Events) % if no events function is specified ...
          [t, EVHR] = ode45(@(t, EVHR)flux(t, EVHR, simu), t, EVHR_tc, options); % integrate
          %   [t, EVHR] = ode45(flux(t, EVHR, simu), t, EVHR_tc) % integrate
          TE = 0; % dummy for time of events
      else % with an events functions ...
          [t, EVHR, TE, YE, IE] = ode45(@(t, EVHR)flux(t, EVHR, simu), t, EVHR_tc, options );
          % additional output arguments for events:
          % TE catches the time of an event, YE the states at the event, and IE the number of the event
      end
      
      if isempty(TE) % if there is no event caught
          TE = +inf; % return infinity
      end
      
 
      tEVHR = [tEVHR; [t,EVHR]]; % append to output
      E_Hc = EVHR(end,3);
      if E_Hc >= par(14) % E_Hp
                    EVHR(end,4) = 0;
      end
      
      EVHR_tc = EVHR(end, :)'; tc = t(end);
      
  end
  
  function [value,isterminal,direction] = eventsfun(t, EVHR,  simu )

% This subfunction catches the `events`: in this case, it looks for the
% moment when maturity at puberty is reached. This function should be
% adapted to the problem you are modelling.
%
% Note that the eventsfun has the same inputs, in the same sequence, as
% flux.m

EH_p      = simu.par(14); % maturity at puberty
nevents = 1;         % number of events that we try to catch

value       = zeros(nevents,1); % initialise with zeros
value(1)    = EVHR(3) - EH_p;        % thing to follow is level of maturity (state 1) minus threshold
isterminal  = zeros(nevents,1); % do NOT stop the solver at an event
direction   = zeros(nevents,1); % catch ALL zero crossing when function is increasing or decreasing
  
  