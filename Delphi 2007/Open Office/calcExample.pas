unit calcExample;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TCalc_frm = class(TForm)
    Tabs_cbx: TComboBox;
    send_btn: TButton;
    Label1: TLabel;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Calc_frm: TCalc_frm;



implementation

{$R *.dfm}

End.
