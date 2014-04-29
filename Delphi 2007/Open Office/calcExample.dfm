object Calc_frm: TCalc_frm
  Left = 0
  Top = 0
  Caption = 'OpenOffice Calc Example'
  ClientHeight = 78
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 63
    Height = 13
    Caption = 'Select a Tab:'
  end
  object Tabs_cbx: TComboBox
    Left = 8
    Top = 32
    Width = 214
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'Tabs_cbx'
  end
  object send_btn: TButton
    Left = 228
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Send'
    ModalResult = 1
    TabOrder = 1
  end
end
