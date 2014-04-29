program IntegrationExample;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SDK Integration Example';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
