object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'PlanSwift Integration Example'
  ClientHeight = 349
  ClientWidth = 758
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
  object Label13: TLabel
    Left = 14
    Top = 28
    Width = 739
    Height = 49
    AutoSize = False
    Caption = 
      'This is a simple example of what a typical Estimating package ca' +
      'n do to pull digitized values from PlanSwift, as well as using P' +
      'lanSwift as an "audit trail" for where the values came from.  Th' +
      'e "Job #" and "Item GUID" fields are not normally shown, but are' +
      ' displayed here to graphically represent how the link to PlanSwi' +
      'ft works.'
    WordWrap = True
  end
  object Label16: TLabel
    Left = 14
    Top = 8
    Width = 76
    Height = 19
    Caption = 'Overview'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label14: TLabel
    Left = 12
    Top = 255
    Width = 108
    Height = 19
    Caption = 'Refresh Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label1: TLabel
    Left = 37
    Top = 136
    Width = 103
    Height = 16
    Caption = '2x6 Exterior Walls'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 11
    Top = 204
    Width = 129
    Height = 16
    Caption = 'Main Floor Sq Footage'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 39
    Top = 172
    Width = 101
    Height = 16
    Caption = '2x4 Interior Walls'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 12
    Top = 101
    Width = 139
    Height = 19
    Caption = 'Estimating Items'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 444
    Top = 99
    Width = 46
    Height = 19
    Caption = 'Job #'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 516
    Top = 99
    Width = 87
    Height = 19
    Caption = 'Item GUID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object jobnumber1: TLabel
    Left = 444
    Top = 138
    Width = 36
    Height = 13
    Caption = 'Not Set'
  end
  object linearguid: TLabel
    Left = 516
    Top = 137
    Width = 36
    Height = 13
    Caption = 'Not Set'
  end
  object jobnumber2: TLabel
    Left = 444
    Top = 173
    Width = 36
    Height = 13
    Caption = 'Not Set'
  end
  object segmentguid: TLabel
    Left = 516
    Top = 172
    Width = 36
    Height = 13
    Caption = 'Not Set'
  end
  object jobnumber3: TLabel
    Left = 444
    Top = 205
    Width = 36
    Height = 13
    Caption = 'Not Set'
  end
  object areaguid: TLabel
    Left = 516
    Top = 205
    Width = 36
    Height = 13
    Caption = 'Not Set'
  end
  object scriptsource: TLabel
    Left = 544
    Top = 253
    Width = 177
    Height = 16
    AutoSize = False
    Caption = 
      '// OnPropertiesChanged Event Script'#13'var'#13'  tmp: string;'#13#13'begin'#13'  ' +
      'tmp := itemproperty(itemid, '#39'AuditTrail'#39');'#13'  tmp := tmp + #13#10' +
      ' + '#39'Properties Changed on '#39' + datetimetostr(now) + '#39' by '#39' + curr' +
      'entuser;'#13'  setitemproperty(itemid, '#39'AuditTrail'#39', tmp);'#13'end;'
    Visible = False
  end
  object nodemovesource: TLabel
    Left = 544
    Top = 275
    Width = 153
    Height = 11
    AutoSize = False
    Caption = 
      '// OnNodeMoved Event Script'#13'var'#13'  tmp: string;'#13#13'begin'#13'  tmp := i' +
      'temproperty(itemid, '#39'AuditTrail'#39');'#13'  tmp := tmp + #13#10 + '#39'Node' +
      ' '#39' + inttostr(node) + '#39' on Section '#39' + inttostr(section) + '#39'  mo' +
      'ved on '#39' + datetimetostr(now) + '#39' by '#39' + currentuser;'#13'  setitemp' +
      'roperty(itemid, '#39'AuditTrail'#39', tmp);'#13'end;'
    Visible = False
  end
  object stoprecordingsource: TLabel
    Left = 544
    Top = 294
    Width = 172
    Height = 17
    AutoSize = False
    Caption = 
      '// OnStopRecordingEvent Script'#13'var'#13'  tmp: string;'#13#13'begin'#13'  tmp :' +
      '= itemproperty(itemid, '#39'AuditTrail'#39');'#13'  tmp := tmp + #13#10 + '#39'S' +
      'ection '#39' + inttostr(section) + '#39' recorded on '#39' + datetimetostr(n' +
      'ow) + '#39' by '#39' + currentuser;'#13'  setitemproperty(itemid, '#39'AuditTrai' +
      'l'#39', tmp);'#13'end;'
    Visible = False
  end
  object sectiondeletesource: TLabel
    Left = 544
    Top = 317
    Width = 172
    Height = 17
    AutoSize = False
    Caption = 
      '// OnSectionDeleteEvent Script'#13'var'#13'  tmp: string;'#13#13'begin'#13'  if se' +
      'ction = 0 then exit;'#13'  tmp := itemproperty(itemid, '#39'AuditTrail'#39')' +
      ';'#13'  tmp := tmp + #13#10 + '#39'Section '#39' + inttostr(section) + '#39' del' +
      'eted on '#39' + datetimetostr(now) + '#39' by '#39' + currentuser;'#13'  setitem' +
      'property(itemid, '#39'AuditTrail'#39', tmp);'#13'end;'
    Visible = False
  end
  object refreshbutton: TButton
    Left = 118
    Top = 307
    Width = 78
    Height = 22
    Caption = 'Refresh Now'
    TabOrder = 0
    OnClick = refreshbuttonClick
  end
  object autorefresh: TRadioButton
    Left = 12
    Top = 284
    Width = 195
    Height = 17
    Caption = 'Automatic Refresh (using Events)'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object manualrefresh: TRadioButton
    Left = 12
    Top = 307
    Width = 100
    Height = 17
    Caption = 'Manual Refresh'
    TabOrder = 2
  end
  object linearedit: TEdit
    Left = 146
    Top = 134
    Width = 114
    Height = 21
    TabOrder = 3
  end
  object segmentedit: TEdit
    Left = 146
    Top = 170
    Width = 114
    Height = 21
    TabOrder = 4
  end
  object areaedit: TEdit
    Left = 146
    Top = 203
    Width = 114
    Height = 21
    TabOrder = 5
  end
  object GetLinearButton: TButton
    Left = 264
    Top = 133
    Width = 104
    Height = 27
    Caption = 'Get from PlanSwift'
    TabOrder = 6
    OnClick = GetLinearButtonClick
  end
  object GetSegmentButton: TButton
    Tag = 1
    Left = 264
    Top = 166
    Width = 104
    Height = 27
    Caption = 'Get from PlanSwift'
    TabOrder = 7
    OnClick = GetSegmentButtonClick
  end
  object GetAreaButton: TButton
    Tag = 2
    Left = 264
    Top = 199
    Width = 104
    Height = 27
    Caption = 'Get from PlanSwift'
    TabOrder = 8
    OnClick = GetAreaButtonClick
  end
  object Button6: TButton
    Tag = 1
    Left = 371
    Top = 166
    Width = 63
    Height = 27
    Caption = 'Audit Trail'
    TabOrder = 9
    OnClick = auditlinearClick
  end
  object auditlinear: TButton
    Left = 371
    Top = 133
    Width = 63
    Height = 27
    Caption = 'Audit Trail'
    TabOrder = 10
    OnClick = auditlinearClick
  end
  object Button7: TButton
    Tag = 2
    Left = 371
    Top = 199
    Width = 63
    Height = 27
    Caption = 'Audit Trail'
    TabOrder = 11
    OnClick = auditlinearClick
  end
  object popupmenu: TPopupMenu
    Left = 632
    Top = 128
    object AuditTrail1: TMenuItem
      Caption = '&Audit Trail'
      OnClick = AuditTrail1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
end
