function OnFinalArrayIntAvailable(src,evtdata,axesir,axesred)
%myMAX30101 = src; % the MAX30101 object that fired the event
fprintf('Event OnFinalArrayIntAvailable(sampleNumberOffset=%d, ...)\n', evtdata.sampleNumberOffset);
%disp(evtdata);
%     disp(evtdata.sampleNumberOffset); % int sampleNumberOffset: Sequential index of the first sample.
%     disp(evtdata.rawRedData); % int[] rawRedData: Red channel (660nm) integer values in time sequence.
%     disp(evtdata.rawIRData); % int[] rawIRData: Infrared channel (880nm) integer values in time sequence.
%     disp(evtdata.rawGreenData); % int[] rawGreenData: Green channel (527nm) integer values in time sequence.
%     %
% evtdata.sampleNumberOffset should be 0, because sampling is complete.
%
% TODO: CUSTOMIZE: FinalArrayIntAvailable
% do something with the received optical data.
% "Your Algorithm Here"
subject = {};
red_data = zeros(1,System.Decimal.ToDouble(src.TimeLimit_seconds));
ir_data = red_data;
for i = 1:evtdata.rawRedData.Length
    red_data(i) = evtdata.rawRedData(i);
    ir_data(i) = evtdata.rawIRData(i);
end
plot(axesred,red_data,'r')
plot(axesir,ir_data,'k')
subject.Mode = string(src.Mode);
subject.pulse = src.PulseWidth_us;
subject.ADC = src.ADCFullScaleRange_nA;
subject.rc = src.RedLEDCurrent_mA;
subject.irc = src.IRLEDCurrent_mA;
subject.l1 = src.LEDslot1;
subject.l2 = src.LEDslot2;
subject.fsamp = src.SampleRate_Hz;
subject.time = System.Decimal.ToDouble(src.TimeLimit_seconds);
subject.red = red_data;
subject.ir = ir_data;

answer = questdlg('Do you want to save the data?');
if isequal(answer,'Yes')
    filename = cell2mat(inputdlg('Insert the name, without blanck space'));
    if length(filename) == 0
        l = length(dir('Signal'))-2;
        filename = ['default_',num2str(l+1),'.mat'];
    end
    save(['signal\',filename],'subject');
end

end