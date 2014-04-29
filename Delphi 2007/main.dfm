object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'PlanSwift SDK Demo'
  ClientHeight = 196
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 16
    Width = 185
    Height = 25
    AutoSize = False
    Caption = 
      'Demonstrates exporting basic job information to an Excel spreads' +
      'heet'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 128
    Top = 56
    Width = 185
    Height = 25
    AutoSize = False
    Caption = 
      'Demonstrates exporting basic job information to an MS Word Docum' +
      'ent.'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 128
    Top = 96
    Width = 185
    Height = 25
    AutoSize = False
    Caption = 
      'Demonstrates exporting basic job information to an MS Outlook E-' +
      'Mail.'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 128
    Top = 136
    Width = 185
    Height = 25
    AutoSize = False
    Caption = 
      'Demonstrates drawing digiter objects in AutoCads Modelspace wind' +
      'ow.'
    WordWrap = True
  end
  object excelbtn: TButton
    Left = 13
    Top = 16
    Width = 106
    Height = 25
    Caption = 'Export To Excel'
    TabOrder = 0
    OnClick = excelbtnClick
  end
  object wordbtn: TButton
    Left = 13
    Top = 56
    Width = 106
    Height = 25
    Caption = 'Export To Word'
    TabOrder = 1
    OnClick = wordbtnClick
  end
  object outlookbtn: TButton
    Left = 13
    Top = 96
    Width = 106
    Height = 25
    Caption = 'Export To OutLook'
    TabOrder = 2
    OnClick = outlookbtnClick
  end
  object pb: TProgressBar
    Left = 0
    Top = 179
    Width = 339
    Height = 17
    Align = alBottom
    Step = 1
    TabOrder = 3
    ExplicitTop = 174
    ExplicitWidth = 337
  end
  object autocadbtn: TButton
    Left = 13
    Top = 136
    Width = 106
    Height = 25
    Caption = 'Export To AutoCad'
    TabOrder = 4
    OnClick = autocadbtnClick
  end
  object XPManifest1: TXPManifest
    Left = 304
    Top = 24
  end
end
