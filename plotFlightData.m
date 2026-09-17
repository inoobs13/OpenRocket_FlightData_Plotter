function plotFlightData(time1, data1, label1, ...
                        time2, data2, label2, ...
                        xLabel, yLabel, plotTitle, figureName, eventsBool, events)

    figure("Name", figureName, 'NumberTitle', 'off');

    plot(time1, data1, 'LineWidth', 1.5, ...
        'DisplayName', label1)

    hold on

    plot(time2, data2, 'LineWidth', 1.5, ...
        'DisplayName', label2)

    hold off

    xlabel(xLabel)
    ylabel(yLabel)
    title(plotTitle)

    legend('Location', 'best')
    grid on
    grid minor

    if eventsBool == true
        for i=1:height(events)
            xline(events.Time(i), '--', events.Name(i), 'LabelVerticalAlignment','bottom')
        end
    else
        disp("Skipping Event markers, not currently supported for this altimeter type...")
    end
end