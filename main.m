%|-----------------------------------------------------------------------
%|
%|------MAKE SURE TO RUN init.m WITH YOUR FILES IN THE INPUT VALUES------
%|------USE VARIABLES STATED IN README WHEN EXPORTING ORK .csv ----------
%|------ALSO, MAKE SURE YOUR .csv FILES ARE IN THE PATH OF THE PROGRAM---
%|------ONCE COMPLETED, RUN THIS SCRIPT TO PLOT THE FEATURES-------------
%|

close all;

%| --- Plot Functions --- 

plotFlightData(ftime, falt, "Flight", otime, oalt, "OpenRocket Sim", "Time (s)", ...
    "Altitude AGL (ft)", "Altitude Data", "Altitude", true, events) % Altitude
plotFlightData(ftime, fvv, "Flight", otime, ovv, "OpenRocket Sim", "Time (s)", ...
    "Vertical Velocity (ft/s)", "Vertical Velocity", "Vert Vel.", true, events) % Vertical Velocity
plotFlightData(ftime, fvt, "Flight", otime, ovt, "OpenRocket Sim", "Time (s)", ...
    "Total Velocity (ft/s)", "Total Velocity", "Total Vel.", true, events) % Total Velocity
