
function [lb,ub,dim,fobj] = Get_Functions_Details(F,DimValue)
if nargin == 1
    DimValue = 10;
end

switch F
      case 'F1'
        fobj = @F1;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F2'
        fobj = @F2;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F3'
        fobj = @F3;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F4'
        fobj = @F4;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F5'
        fobj = @F5;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F6'
        fobj = @F6;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F7'
        fobj = @F7;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F8'
        fobj = @F8;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F9'
        fobj = @F9;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F10'
        fobj = @F10;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F11'
        fobj = @F11;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F12'
        fobj = @F12;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F13'
        fobj = @F13;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F14'
        fobj = @F14;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F15'
        fobj = @F15;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F16'
        fobj = @F16;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F17'
        fobj = @F17;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F18'
        fobj = @F18;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F19'
        fobj = @F19;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F20'
        fobj = @F20;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F21'
        fobj = @F21;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F22'
        fobj = @F22;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F23'
        fobj = @F23;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F24'
        fobj = @F24;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F25'
        fobj = @F25;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F26'
        fobj = @F26;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F27'
        fobj = @F27;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F28'
        fobj = @F28;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F29'
        fobj = @F29;
        lb=-100;
        ub=100;
        dim=DimValue;
    case 'F30'
        fobj = @F30;
        lb=-100;
        ub=100;
        dim=DimValue;
end

end

%% ====================CEC2017============================
function o = F1(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',1);
end
function o = F2(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',2);
end
function o = F3(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',3);
end
function o = F4(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',4);
end
function o = F5(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',5);
end
function o = F6(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',6);
end
function o = F7(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',7);
end
function o = F8(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',8);
end
function o = F9(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',9);
end
function o = F10(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',10);
end
function o = F11(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',11);
end
function o = F12(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',12);
end
function o = F13(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',13);
end
function o = F14(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',14);
end
function o = F15(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',15);
end
function o = F16(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',16);
end
function o = F17(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',17);
end
function o = F18(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',18);
end
function o = F19(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',19);
end
function o = F20(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',20);
end
function o = F21(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',21);
end
function o = F22(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',22);
end
function o = F23(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',23);
end
function o = F24(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',24);
end
function o = F25(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',25);
end
function o = F26(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',26);
end
function o = F27(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',27);
end
function o = F28(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',28);
end
function o = F29(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',29);
end
function o = F30(x)
fhd=str2func('cec17_func');
o=feval(fhd,x',30);
end
