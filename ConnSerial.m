%Function for connection with USB - Arduino
if exist('a','var') && isa(a,'arduino') && isvalid(a)
    
    delete(a);
end
delete(instrfind({'Port'},{'COM4'}))
a=arduino('COM4');
%servoAttach(a,11);
%servoAttach(a,10);
%servoAttach(a,9);
%servoAttach(a,6);
servoAttach(a,5);
servoAttach(a,3);

%servoWrite(a,11,90);
%servoWrite(a,10,90);
%servoWrite(a,9,180-90);
%servoWrite(a,6,90);
servoWrite(a,5,90);

servoWrite(a,3,70);