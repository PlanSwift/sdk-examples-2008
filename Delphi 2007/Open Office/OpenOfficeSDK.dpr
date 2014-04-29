program OpenOfficeSDK;

uses
  Forms,
  OOMain in 'OOMain.pas' {Main},
  calcExample in 'calcExample.pas' {Calc_frm},
  OOoConstants in 'OOoConstants.pas',
  OOoMessages in 'OOoMessages.pas',
  OOoTools in 'OOoTools.pas',
  OOoXray2 in '..\..\..\Desktop\Delphi_OOo_v12en\OOoXray2.pas' {xrayForm2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TCalc_frm, Calc_frm);
  Application.CreateForm(TxrayForm2, xrayForm2);
  Application.Run;
end.
