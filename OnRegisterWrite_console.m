function OnRegisterWrite_console(src,evtdata)
regAddressString = char(evtdata.regAddress);
regAddressInt32 = cast(evtdata.regAddress, 'int32');
regValueInt8 = int8(evtdata.regValue);
if (evtdata.success)
    fprintf('  MAX30101.RegWrite(0x%2.2x %s, 0x%2.2x);', ...
        regAddressInt32, regAddressString, regValueInt8);
    if (regAddressInt32 == 9) % 0x09 ModeConfiguration
        if (regValueInt8 == 128)
            fprintf(' // 0x80=SHDN');
        end
        if (regValueInt8 == 64)
            fprintf(' // 0x40=RESET');
        end
        if (regValueInt8 == 2)
            fprintf(' // MODE[2:0]=HR');
        end
        if (regValueInt8 == 3)
            fprintf(' // MODE[2:0]=SPO2');
        end
        if (regValueInt8 == 7)
            fprintf(' // MODE[2:0]=LED');
        end
    end
    fprintf('\n');
else
    fprintf('  MAX30101.RegWrite(0x%2.2x %s, 0x%2.2x?) failed\n', ...
        regAddressInt32, regAddressString, regValueInt8);
end
end