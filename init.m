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


end



%| --- ORK Data ---
otime = ork.data(:, 1);
oalt = ork.data(:, 2);
ovv = ork.data(:, 3);
ovt = ork.data(:, 4);