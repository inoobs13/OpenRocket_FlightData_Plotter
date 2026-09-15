clearvars;
close all;


%| --- Define Altimeter type here ---
%| --- Currently supported types:
%| --- FW Blue Raven 2 (define type as "raven")

altimeterType = "raven"; % Define the altimeter type


%| --- INPUT DATA CSV FILES HERE ---
ork_fileName = "L2_Ork_data.csv"; % Define name of ork csv file as a string
flight_fileName = "L2_Raven_data.csv"; % Define name of flight data csv



%| --- Sort data into relevant variables for the workspace ---

ork = importdata(ork_fileName, ",");
flight = readtable(flight_fileName, VariableNamingRule="preserve");


%| --- Altimeter data ---
if altimeterType == "raven"
    ftime = flight.("Flight_Time_(s)");
    falt = flight.("Baro_Altitude_AGL_(feet)");
    fvv = flight.Velocity_Up;
    fvt = sqrt(flight.Velocity_Up.^2 + flight.Velocity_DR.^2 + flight.Velocity_CR.^2);
    fbatt = flight.Batt_Volts;
    fmV = flight.Main_Volts; % Main Terminal Voltage
    faV = flight.Apo_Volts; % Apogee Terminal Voltage
    f3V = flight.("3rd_Volts"); % 3rd Terminal Voltage
    f4V = flight.("4th_Volts"); % 4rd Terminal Voltage
    fm_fired = findFireTime(flight.Main_fired, ftime);
    fa_fired = findFireTime(flight.Apo_fired, ftime);
    f3_fired = findFireTime(flight.("3rd_fired"), ftime);
    f4_fired = findFireTime(flight.("4th_fired"), ftime);
    fapogee = findFireTime(flight.Apogee, ftime);
    flight_events = ["Apogee"; "Main Charge"; "Drogue Charge"; "3rd Charge"; "4th Charge"];
    event_times = [fapogee; fm_fired; fa_fired; f3_fired; f4_fired];
    events = table(flight_events, event_times, 'VariableNames', {'Name', 'Time'});
end



%| --- ORK Data ---
otime = ork.data(:, 1);
oalt = ork.data(:, 2);
ovv = ork.data(:, 3);
ovt = ork.data(:, 4);