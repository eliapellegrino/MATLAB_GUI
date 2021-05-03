function OnPartialArrayIntAvailable_console(src,evtdata,axesir,axesred)
fsamp = src.SampleRate_Hz;
try
    plot(axesred,evtdata.rawRedData,'r'),xlim(axesred,[evtdata.rawRedData.Length-2*fsamp, evtdata.rawRedData.Length+2*fsamp])
    plot(axesir,evtdata.rawIRData,'k'),xlim(axesir,[evtdata.rawIRData.Length-2*fsamp, evtdata.rawIRData.Length+2*fsamp])
catch
     plot(axesred,evtdata.rawRedData,'r')
     plot(axesir,evtdata.rawIRData,'k')
end
end