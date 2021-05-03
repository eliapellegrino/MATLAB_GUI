function OnRegisterRead_console(src,evtdata)
regAddressString = char(evtdata.regAddress);
regAddressInt32 = cast(evtdata.regAddress, 'int32');
regValueInt8 = int8(evtdata.regValue);
if (evtdata.success)
    fprintf('  MAX30101.RegRead(0x%2.2x %s, 0x%2.2x);\n', ...
        regAddressInt32, regAddressString, regValueInt8);
else
    fprintf('  MAX30101.RegRead(0x%2.2x %s, 0x%2.2x?) failed\n', ...
        regAddressInt32, regAddressString, regValueInt8);
end
end
