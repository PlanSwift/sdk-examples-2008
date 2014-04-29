object Main: TMain
  Left = 0
  Top = 0
  Caption = 'OpenOffice Examples'
  ClientHeight = 55
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 159
    Top = 21
    Width = 191
    Height = 13
    Caption = 'Exports  Planswift Items to OpenOffice.'
  end
  object calc_btn: TButton
    Left = 8
    Top = 16
    Width = 145
    Height = 25
    Caption = 'Export to Calc'
    TabOrder = 0
    OnClick = calc_btnClick
  end
end
