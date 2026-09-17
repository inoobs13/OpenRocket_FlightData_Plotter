function [flightData, flightInfo] = importPF2(fileName)

%open file
fid = fopen(fileName, 'r');

if fid == -1
    error("Could not open file %s", filename);
end

%find beggining of primary data
while ~feof(fid)
    line = fgetl(fid);

    if strcmp(strtrim(line), 'Data: (Time, Altitude, Velocity, Temperature (F), Voltage)')
        break
    end
end

%Read primary data
dataArray = textscan(fid, '%f %f %f %f %f', 'Delimiter', ',', 'CollectOutput', true);

%close file
fclose(fid);

flightData = array2table(dataArray{1}, 'VariableNames',{'Time', 'Altitude', 'Velocity', 'Temperature', 'Voltage'});
flightInfo = nan; %| add flight info parse later

end