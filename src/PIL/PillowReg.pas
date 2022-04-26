unit PillowReg;

interface

procedure Register;

implementation
uses Classes, PyCore, Pillow;

procedure Register;
begin
  RegisterComponents('Python - Data Science Ecosystem', [TPyImageLib]);
end;

end.
