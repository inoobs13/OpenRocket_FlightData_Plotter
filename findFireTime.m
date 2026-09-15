function [time] = findFireTime(channelBool, flightTime)

index = find(diff(channelBool) == 1, 1);

if isempty(index)
    time = NaN; % Handle case where no event is found
else
    eventTime = flightTime(index + 1);
    time = eventTime;
end
