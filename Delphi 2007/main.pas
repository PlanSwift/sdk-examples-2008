{
  SDK Demo's are copyright by Tech Unlimited, Inc.  All rights reserved.
  Use of this source code is subject to the same terms and conditions
  as the PlanSwift Programs and material.  Unauthorized distribution
  without written permission is a violation of these terms and is forbidden.

  MS Office type libraries based on Office 2007, if you have an earlier version,
  you may have to reimport and tweek the code a bit.

  MS Word Template 'Work Order.dotx' will need to be copied from the source folder
  into your templates folder for the Export to Word function to work properly.

  DAH 2008 ...everything is relative, including my level of insanity.
}

unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  planswift_tlb, XPMan, excelform, office_tlb, Word_TLB,
  Excel_TLB, outlook_tlb, autocad_tlb, ComCtrls;

type
  TForm1 = class(TForm)
    excelbtn: TButton;
    Label1: TLabel;
    XPManifest1: TXPManifest;
    Label2: TLabel;
    wordbtn: TButton;
    outlookbtn: TButton;
    Label3: TLabel;
    pb: TProgressBar;
    Label4: TLabel;
    autocadbtn: TButton;
    procedure excelbtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wordbtnClick(Sender: TObject);
    procedure outlookbtnClick(Sender: TObject);
    procedure autocadbtnClick(Sender: TObject);
  private
    { Private declarations }
    Procedure ItemtoExcel(itm: iitem);
    Procedure ItemtoWord(itm: iitem);
    Procedure ItemtoOutlook(itm: iitem);
    Procedure ItemtoAutoCad(itm: iitem);
    Procedure ExcelItems(itm: iitem);
    Procedure WordItems(itm: iitem);
    Procedure OutlookItems(itm: iitem);
    Procedure AutoCadItems(itm: iitem);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pc: IPlanCenter;
  sheet: ExcelWorkSheet;
  wtable: word_tlb.Table;
  rowndx: integer;
  olstr: string;
  ms: AcadModelSpace;

implementation

{$R *.dfm}
uses
  comobj;

{$REGION 'Outlook Stuff'}

  procedure TForm1.outlookbtnClick(Sender: TObject);
  var
    ndx: integer;
    ol: OutlookApplication;
    otab: Planswift_tlb.ITab;  // fully qualify to avoid conflict with excel tab.
    em: outlook_tlb.MailItem;
  begin
    try
      if not pc.JobOpened then
        if not pc.OpenJobEx then
          begin
            showmessage('You must open a job to use this example');
            exit;
          end;
      form2 := tform2.Create(nil);
      for ndx := 0 to pc.Tabs.Count - 1 do
        if pc.Tabs[ndx].TabType = ttJob then
          form2.tabselect.Items.Add(pc.Tabs[ndx].Name);
      form2.tabselect.itemindex := 0;
      form2.Caption := 'Export to Outlook';
      if form2.ShowModal = mrOK then
        begin
          cursor := crhourglass;
          refresh;
          otab := pc.Tabs.ByName(form2.tabselect.Text);
          otab.MakeActive;
          pb.Max := otab.count;
          olstr := '<body><table style="width:7.5in"><tr><td style="width:1in">Qty</td><td style="width:4.5in">Description</td><td style="width:1in">Price Each</td><td style="width:1in">Price Total</td></tr>';
          for ndx := 0 to otab.Count - 1 do
            begin
              pb.Position := ndx + 1;
              Refresh;
              outlookitems(otab[ndx]);
            end;
          ol := cooutlookapplication.Create;
          em := ol.CreateItem(olMailItem) as MailItem;
          em.Subject := pc.JobName + ' - ( ' + pc.JobNumber + ' )';
          em.HTMLBody := olstr + '</table></body>';
          em.Display(false);
  
          pb.position := 0;
        end;
    finally
      cursor := crdefault;
  //    folder := nil;
  //    ns := nil;
      em := nil;
      ol := nil;
      if form2 <> nil then
        form2.free;
    end;
  
  end;
  
  Procedure TForm1.ItemtoOutlook(itm: iitem);
  var
    oprop: iProperties;
  begin
    oprop := itm.Properties;
    if itm.ItemType <> itfolder then
      olstr := olstr + '<tr><td>' + oprop.ByName('Qty').value + '</td><td>' + itm.name + '</td><td>' +
               oprop.ByName('Price Each').Value + '</td><td>' + oprop.byname('Price Total').value + '</td></tr>';
  end;
  
  Procedure TForm1.OutlookItems(itm: iitem);
  var
    ndx: integer;
  begin
  //  inc(rowndx);
    itemtooutlook(itm);
    for ndx := 0 to itm.Count - 1 do
      outlookitems(itm[ndx]);
  end;
  
{$ENDREGION}

{$REGION 'Word Stuff'}

  Procedure TForm1.ItemtoWord(itm: iitem);
  var
    oprop: iProperties;
  begin
    oprop := itm.Properties;
    try
      wtable.cell(rowndx,1).Range.Text := oprop.ByName('Qty').Value;
      wtable.cell(rowndx,2).range.text := itm.name;
      wtable.cell(rowndx,3).range.text := oprop.byname('Price Each').value;
      wtable.cell(rowndx,4).range.text := oprop.byname('Price Total'). value;
    except
      // nothing
    end;
  end;
  
  Procedure TForm1.WordItems(itm: iitem);
  var
    ndx: integer;
  begin
    if itm.ItemType <> itFolder then
    begin
      inc(rowndx);
      if rowndx > 19 then
        wtable.Rows.Add(emptyparam);
      itemtoword(itm);
    end;
      for ndx := 0 to itm.Count - 1 do
      worditems(itm[ndx]);
  end;
  
  procedure TForm1.wordbtnClick(Sender: TObject);
  var
    ndx: integer;
    otab: Planswift_tlb.ITab;  // fully qualify to avoid conflict with excel tab.
    oWord : TWordApplication;
    oDoc: Word_tlb._Document;
    template, newtemplate, doctype, isvisible: olevariant;
  begin
    try
      if not pc.JobOpened then
        if not pc.OpenJobEx then
          begin
            showmessage('You must open a job to use this example');
            exit;
          end;
      form2 := tform2.Create(nil);
      for ndx := 0 to pc.Tabs.Count - 1 do
        if pc.Tabs[ndx].TabType = ttJob then
          form2.tabselect.Items.Add(pc.Tabs[ndx].Name);
      form2.tabselect.itemindex := 0;
      form2.Caption := 'Export to MS Word';
      if form2.ShowModal = mrOK then
        begin
  //        lcid := getuserdefaultlcid;
          cursor := crhourglass;
          refresh;
          rowndx := 1;
          otab := pc.Tabs.ByName(form2.tabselect.Text);
          otab.MakeActive;
          oWord := TWordApplication.Create(nil);
          oWord.Connect;
          oword.Visible := true;
          template := 'Work Order.dotx';
          newtemplate := false;
          doctype := wdNewBlankDocument;
          isvisible := true;
          odoc := oword.Documents.Add(template, newtemplate, doctype, isvisible);
          wtable := odoc.Tables.Item(2);
          pb.max := otab.count;
          for ndx := 0 to otab.Count - 1 do
            begin
              pb.position := ndx + 1;
              Refresh;
              worditems(otab[ndx]);
            end;
          template := 'Medium Shading 1 - Accent 1';
          wtable.Set_Style(template);
          wtable.Columns.Item(3).width := 40;
          wtable.columns.Item(4).width := 70;
          pb.position := 0;
        end;
    finally
      cursor := crdefault;
      if oWord <> nil then    
        oword.Free;
      if form2 <> nil then
        form2.free;
    end;
  end;
  
{$ENDREGION}

{$REGION 'Excel Stuff'}

  procedure TForm1.ItemtoExcel(itm: iitem);
  var
    oprops: IProperties;
  begin
    oprops := itm.Properties;
    sheet.Cells.Item[rowndx,1].value := itm.Tab.Name;
    sheet.cells.item[rowndx,2].value := oprops.ByName('Name').Value;
    if itm.ItemType <> itFolder then
      begin
        sheet.cells.item[rowndx,3].value := oprops.ByName('Item #').value;
        sheet.cells.item[rowndx,4].value := oprops.ByName('Qty').value;
        sheet.cells.item[rowndx,5].value := oprops.byname('Price Each').value;
        sheet.cells.item[rowndx,6].value := oprops.byname('Price Total').Value;
      end;
    case itm.ItemType of
      itpart: sheet.cells.item[rowndx,7].value := 'Part';
      itAssembly: sheet.cells.item[rowndx,7].value := 'Assembly';
      itFolder: sheet.cells.item[rowndx,7].value := 'Folder';
      itNone: sheet.cells.item[rowndx,7].value := 'None';
    end;
  end;
  
  procedure TForm1.ExcelItems(itm: iitem);
  var
    ndx: integer;
  begin
    inc(rowndx);
    itemtoexcel(itm);
    for ndx := 0 to itm.Count - 1 do
      excelitems(itm[ndx]);
  end;
  
  procedure TForm1.excelbtnClick(Sender: TObject);
  var
    ndx: integer;
    otab: Planswift_tlb.ITab;  // fully qualify to avoid conflict with excel tab.
    xl: ExcelApplication;
    book: ExcelWorkBook;
    lcid: integer;
  begin
    try
      if not pc.JobOpened then
        if not pc.OpenJobEx then
          begin
            showmessage('You must open a job to use this example');
            exit;
          end;
      form2 := tform2.Create(nil);
      for ndx := 0 to pc.Tabs.Count - 1 do
        if pc.Tabs[ndx].TabType = ttJob then
          form2.tabselect.Items.Add(pc.Tabs[ndx].Name);
      form2.tabselect.itemindex := 0;
      form2.Caption := 'Export to Excel';
      if form2.ShowModal = mrOK then
        begin
          cursor := crhourglass;
          refresh;
          lcid := getuserdefaultlcid;
          otab := pc.Tabs.ByName(form2.tabselect.Text);
          otab.MakeActive;
          try
            xl := getactiveoleobject('Excel.Application') as ExcelApplication;
          except
            xl := createoleobject('Excel.Application') as ExcelApplication;
          end;
          xl.Visible[lcid] := true;
          book := xl.Workbooks.Add(emptyparam, lcid);
          sheet := book.Sheets[1] as excelworksheet;
          sheet.Range['A1', 'G1'].Font.Bold := true;
          sheet.cells.item[1,1].value := 'Tab';
          sheet.cells.Item[1,2].value := 'Name';
          sheet.cells.item[1,3].value := 'Item #';
          sheet.cells.item[1,4].value := 'Qty';
          sheet.cells.item[1,5].value := 'Price Each';
          sheet.cells.item[1,6].value := 'Price Total';
          sheet.cells.item[1,7].value := 'Item Type';
          rowndx := 1;
          pb.max := otab.count;
          for ndx := 0 to otab.Count - 1 do
            begin
              pb.position := ndx + 1;
              Refresh;
              excelitems(otab[ndx]);
            end;
          sheet.Columns.AutoFit;
          pb.position := 0;
        end;
    finally
      cursor := crdefault;
      sheet := nil;
      book := nil;
      xl := nil;
      if form2 <> nil then
        form2.free;
    end;
  end;

{$ENDREGION}

{$REGION 'AutoCad Stuff'}

  Procedure TForm1.ItemtoAutoCad(itm: iitem);
  var
    pt: olevariant;
    sectionndx, nodendx: integer;
    thissection: ISection;
    thisnode: INode;
    thisline: AcadLWPolyLine;
    startpoint, endpoint: planswift_tlb.ipoint; // avoid conflict with excel ipoint.
    isclosed: boolean;
    sx, sy: double;
  begin
    if (itm.ItemType <> itfolder) then
      begin
        case itm.DigiType of
{$REGION 'dgArea'}
            dgArea: for sectionndx := 0 to itm.Sections.Count - 1 do
                      begin
                        isclosed := false;
                        thissection := itm.Sections[sectionndx];
                        startpoint := thissection.nodes[0].Point;
                        endpoint := thissection.nodes[thissection.nodes.count -1].point;
                        sx := thissection.Page.ScaleX;
                        sy := thissection.page.scaley;
                        if (startpoint.x = endpoint.x) and (startpoint.y = endpoint.y) then
                          isclosed := true;
                        if isclosed then
                          pt := vararraycreate([0, ((thissection.nodes.count) * 2) - 1], varDouble)
                        else
                          pt := vararraycreate([0, ((thissection.nodes.count+1) * 2) - 1], varDouble);
                        for nodendx := 0 to thissection.nodes.Count - 1 do
                          begin
                            thisnode := thissection.Nodes[nodendx];
                            pt[nodendx*2] := (thisnode.x / sx) * 12;
                            pt[nodendx*2 + 1] := 0 - ((thisnode.y / sy) * 12);
                          end;
                        if not isclosed then
                          begin
                            pt[vararrayhighbound(pt,1) - 1] := (startpoint.x / sx) * 12;
                            pt[vararrayhighbound(pt,1)] := 0 - ((startpoint.y / sy) * 12);
                          end;
                        thisline := ms.AddLightWeightPolyline(pt);
                        thisline.color := acGreen;
                      end;
{$ENDREGION}
{$REGION 'Linear'}
            dgLinear: for sectionndx := 0 to itm.Sections.Count - 1 do
                      begin
                        thissection := itm.Sections[sectionndx];
                        startpoint := thissection.nodes[0].Point;
                        endpoint := thissection.nodes[thissection.nodes.count -1].point;
                        sx := thissection.Page.ScaleX;
                        sy := thissection.page.scaley;
                        pt := vararraycreate([0, ((thissection.nodes.count) * 2) - 1], varDouble);
                        for nodendx := 0 to thissection.nodes.Count - 1 do
                          begin
                            thisnode := thissection.Nodes[nodendx];
                            pt[nodendx*2] := (thisnode.x / sx) * 12;
                            pt[nodendx*2 + 1] := 0 - ((thisnode.y / sy) * 12);
                          end;
                        thisline := ms.AddLightWeightPolyline(pt);
                        thisline.color := acRed;
                      end;
{$ENDREGION}
{$REGION 'Segment'}
            dgSegment: for sectionndx := 0 to itm.Sections.Count - 1 do
                      begin
                        thissection := itm.Sections[sectionndx];
                        startpoint := thissection.nodes[0].Point;
                        endpoint := thissection.nodes[thissection.nodes.count -1].point;
                        sx := thissection.Page.ScaleX;
                        sy := thissection.page.scaley;
                        pt := vararraycreate([0, ((thissection.nodes.count) * 2) - 1], varDouble);
                        for nodendx := 0 to thissection.nodes.Count - 1 do
                          begin
                            thisnode := thissection.Nodes[nodendx];
                            pt[nodendx*2] := (thisnode.x / sx) * 12;
                            pt[nodendx*2 + 1] := 0 - ((thisnode.y / sy) * 12);
                          end;
                        thisline := ms.AddLightWeightPolyline(pt);
                        thisline.color := acWhite;
                      end;
{$ENDREGION}
        end;
      end;
    pt := unassigned;
    thissection := nil;
    thisnode := nil;
    thisline := nil;
    startpoint := nil;
    endpoint := nil;
  end;
  
  Procedure TForm1.AutoCadItems(itm: iitem);
  var
    ndx: integer;
  begin
    inc(rowndx);
    itemtoAutoCad(itm);
    for ndx := 0 to itm.Count - 1 do
      AutoCadItems(itm[ndx]);
  end;
  
  procedure TForm1.autocadbtnClick(Sender: TObject);
  var
    ndx: integer;
    otab: Planswift_tlb.ITab;  // fully qualify to avoid conflict with excel tab.
    acad: AcadApplication;
  begin
    try
      if not pc.JobOpened then
        if not pc.OpenJobEx then
          begin
            showmessage('You must open a job to use this example');
            exit;
          end;
      form2 := tform2.Create(nil);
      for ndx := 0 to pc.Tabs.Count - 1 do
        if pc.Tabs[ndx].TabType = ttJob then
          form2.tabselect.Items.Add(pc.Tabs[ndx].Name);
      form2.tabselect.itemindex := 0;
      form2.Caption := 'Export to Excel';
      if form2.ShowModal = mrOK then
        begin
          cursor := crhourglass;
          refresh;
          otab := pc.Tabs.ByName(form2.tabselect.Text);
          otab.MakeActive;
          acad := coacadapplication.Create;
          acad.Visible := true;
          ms := acad.ActiveDocument.ModelSpace;
          pb.max := otab.count;
          for ndx := 0 to otab.Count - 1 do
            begin
              pb.position := ndx + 1;
              Refresh;
              autocaditems(otab[ndx]);
            end;
          pb.position := 0;
          acad.ZoomExtents;
        end;
    finally
      cursor := crdefault;
      ms := nil;
      acad := nil;
      if form2 <> nil then
        form2.free;
    end;

  end;
  
{$ENDREGION}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  pc := nil;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    pc := getactiveoleobject('PlanSwift.PlanCenter') as IPlanCenter;
  except
    pc := createoleobject('PlanSwift.PlanCenter') as IPlanCenter;
  end;
end;

end.
