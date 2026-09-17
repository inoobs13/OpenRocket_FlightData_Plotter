%|-----------------------------------------------------------------------
%|
%|------MAKE SURE TO RUN init.m WITH YOUR FILES IN THE INPUT VALUES------
%|------USE VARIABLES STATED IN README WHEN EXPORTING ORK .csv ----------
%|------ALSO, MAKE SURE YOUR .csv FILES ARE IN THE PATH OF THE PROGRAM---
%|------ONCE COMPLETED, RUN THIS SCRIPT TO PLOT THE FEATURES-------------
%|

close all;

%| --- Plot Functions --- 

eventsSwitch = false;

plotFlightData(ftime, falt, "Flight", otime, oalt, "OpenRocket Sim", "Time (s)", ...
    "Altitude AGL (ft)", "Altitude Data", "Altitude", eventsSwitch, events) % Altitude

if exist('fvv', 'var')
    plotFlightData(ftime, fvv, "Flight", otime, ovv, "OpenRocket Sim", "Time (s)", ...
        "Vertical Velocity (ft/s)", "Vertical Velocity", "Vert Vel.", eventsSwitch, events) % Vertical Velocity
else
    disp("Skipping Vertical Velocity Chart, Flight data missing vertical velocity...")
end

plotFlightData(ftime, fvt, "Flight", otime, ovt, "OpenRocket Sim", "Time (s)", ...
    "Total Velocity (ft/s)", "Total Velocity", "Total Vel.", eventsSwitch, events) % Total Velocity
