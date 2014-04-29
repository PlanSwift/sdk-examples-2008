program SDK_Demo;

uses
  Forms,
  main in 'main.pas' {Form1},
  excelform in 'excelform.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'PlanSwift SDK Demo';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
