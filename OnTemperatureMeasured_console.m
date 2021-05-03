function OnTemperatureMeasured_console(src,evtdata)
global temperature;
fprintf('Event OnTemperatureMeasured(temperatureDegreesC = %1.3f)\n', evtdata.temperatureDegreesC);
temperature = evtdata.temperatureDegreesC;
end