function connArd(dof, a, status, omega1, omega2, omega3, omega4)
%Recebe angulos do Manipulador, Graus de Liberdade e status e movimenta os
%servos
if status == 1
    servoAttach(a,11); 
    servoAttach(a,10); 
    servoAttach(a,9); 
    servoAttach(a,6); 
    servoAttach(a,5); 
    servoAttach(a,3);
end

if rad2deg(omega1) > 162 && rad2deg(omega1) <= 180
    servoWrite(a,11,round(rad2deg(omega1), 0));
else
    servoWrite(a,11,round(rad2deg(deg2rad(18)+omega1), 0));
end

if rad2deg(omega2) <= 0
    servoWrite(a, 10, round(0,0));
    servoWrite(a, 9, round(180,0));
elseif rad2deg(omega2) >= 180
    servoWrite(a, 10, round(180,0));
    servoWrite(a, 9, round(0,0));
else
    servoWrite(a,10,round(rad2deg(omega2),0));
    servoWrite(a,9,round(rad2deg(deg2rad(180)-omega2),0));
end

if (90-(rad2deg(omega3))) <= 0
    servoWrite(a,6,round((0),0));
elseif (90-(rad2deg(omega3))) >= 180
    servoWrite(a,6,round((180),0));
else
    servoWrite(a,6,round(rad2deg(deg2rad(90)-omega3),0));
end


if (90-(rad2deg(omega4))) <= 0
    servoWrite(a,5,round((0),0));
elseif (90-(rad2deg(omega4))) >= 180
    servoWrite(a,5,round((180),0));
else
    servoWrite(a,5,round(rad2deg(deg2rad(90)-omega4),0));
end

end
%delete(a);