function OnStreamingEnded(src,evtdata,label)
myMAX30101 = src; % the MAX30101 object that fired the event
label.Text = 'Not Monitoring'
%
% Optional: EVKIT diagnostic LEDs Red ON, Green Off (Not Monitoring)
myMAX30101.MAX30101EVKITdiagnosticLED(1, 0);
end