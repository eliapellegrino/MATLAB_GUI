function OnStreamingStarted(src,evtdata,label)
myMAX30101 = src; % the MAX30101 object that fired the event
label.Text = 'Monitoring....'
% Optional: EVKIT diagnostic LEDs Red Off, Green ON
myMAX30101.MAX30101EVKITdiagnosticLED(0, 1);

end