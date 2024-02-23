unit Unit1;

{$mode delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  GLScene, GLViewer, GLCadencer, GLHUDObjects, GLBitmapFont, GLWindowsFont,
  GLObjects, GLVectortypes, GLVectorGeometry, Types, LCLType, StdCtrls, Buttons,
  TAGraph, TASeries, GlKeyboard, GLVectorFileObjects,
  Inifiles, utypes,math,
  ubfgs,
  glfile3ds,glfileobj,
  DateUtils;

const
  nb_VICON_Mkr=41;       //Nb de marqueurs VICON

type

  TSIDE=(LEFT,RIGHT);

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit_Folder_Processing: TButton;
    CBLTH: TCheckBox;
    CBRTH: TCheckBox;
    CBLSH: TCheckBox;
    CBRSH: TCheckBox;
    CheckBox11: TCheckBox;
    CheckGroup2: TCheckGroup;
    GroupBox13: TGroupBox;
    IKRFoot_ref: TGLDummyCube;
    IKLFoot_ref: TGLDummyCube;
    IKRTibia_ref: TGLDummyCube;
    IKLTibia_ref: TGLDummyCube;
    IKRFemur_ref: TGLDummyCube;
    IKLFemur_ref: TGLDummyCube;
    IKHip_ref: TGLDummyCube;
    GLFemur_R: TGLFreeForm;
    GLFoot_R: TGLFreeForm;
    GLFemur_L: TGLFreeForm;
    GLFoot_L: TGLFreeForm;
    GLTibia_L: TGLFreeForm;
    GLHip: TGLFreeForm;
    GLTibia_R: TGLFreeForm;
    FolderEdit: TLabeledEdit;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    CheckBox10: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    frame_nb_edit: TEdit;
    lbl_LTHI: TGLAbsoluteHUDText;
    lbl_RTHI: TGLAbsoluteHUDText;
    GLLTHI: TGLSphere;
    GLRTHI: TGLSphere;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    RealRKNEE: TGLCube;
    RealLKnee: TGLCube;
    RKnee_Center: TGLDummyCube;
    LKnee_Center: TGLDummyCube;
    GLLLeg: TGLLines;
    GLRLeg: TGLLines;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox9: TGroupBox;
    Edit_Run_Joint_Angles: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckGroup1: TCheckGroup;
    Label1: TLabel;
    lbl_RANK: TGLAbsoluteHUDText;
    lbl_RHEE: TGLAbsoluteHUDText;
    lbl_LKNEE: TGLAbsoluteHUDText;
    lbl_RKNEE: TGLAbsoluteHUDText;
    LMAnkleButton: TButton;
    LMKneeButton: TButton;
    LMPatellaButton: TButton;
    L_Knee_Shift: TLabeledEdit;
    R_Knee_Shift: TLabeledEdit;
    SAVEAnkle1: TButton;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    StatusBar1: TStatusBar;
    SAVEAnkle: TButton;
    ChartButton: TButton;
    SAVECapella: TButton;
    lbl_LANK: TGLAbsoluteHUDText;
    lbl_LTOE: TGLAbsoluteHUDText;
    lbl_LHEE: TGLAbsoluteHUDText;
    lbl_LMT5: TGLAbsoluteHUDText;
    lbl_RTOE: TGLAbsoluteHUDText;
    lbl_RMT5: TGLAbsoluteHUDText;
    GLLANK: TGLSphere;
    GLLTOE: TGLSphere;
    GLLHEE: TGLSphere;
    GLLMT5: TGLSphere;
    GLRANK: TGLSphere;
    GLRTOE: TGLSphere;
    GLRHEE: TGLSphere;
    GLRMT5: TGLSphere;
    R_Ankle: TGLCube;
    L_Ankle: TGLCube;
    RFoot_Center: TGLDummyCube;
    LFoot_Center: TGLDummyCube;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    BFGS_OptPatellaButton: TButton;
    Chart1: TChart;
    GroupBox3: TGroupBox;
    LineSeries1: TLineSeries;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BFGS_OptAnkleButton: TButton;
    L_rot_x: TLabeledEdit;
    L_rot: TGLCube;
    L_Ankle_x: TLabeledEdit;
    L_Ankle_y: TLabeledEdit;
    L_Ankle_z: TLabeledEdit;
    R_rot_x: TLabeledEdit;
    R_Ankle_x: TLabeledEdit;
    R_rot_y: TLabeledEdit;
    L_rot_z: TLabeledEdit;
    L_rot_y: TLabeledEdit;
    R_Ankle_y: TLabeledEdit;
    R_rot_z: TLabeledEdit;
    R_rot: TGLCube;
    lbl_zaxis: TGLAbsoluteHUDText;
    lbl_yaxis: TGLAbsoluteHUDText;
    lbl_xaxis: TGLAbsoluteHUDText;
    lbl_RASI: TGLAbsoluteHUDText;
    lbl_Root: TGLAbsoluteHUDText;
    lbl_LPSI: TGLAbsoluteHUDText;
    Lbl_LASI: TGLAbsoluteHUDText;
    GLCadencer1: TGLCadencer;
    GLCamera1: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLDummyCube2: TGLDummyCube;
    GLWindowsBitmapFont1: TGLWindowsBitmapFont;
    pelvis_center: TGLDummyCube;
    GLLightSource1: TGLLightSource;
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLLASI: TGLSphere;
    GLRASI: TGLSphere;
    GLroot: TGLSphere;
    GLLPSI: TGLSphere;
    GLLKNEE: TGLSphere;
    GLRKNEE: TGLSphere;
    MoCapFileEdit: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    R_Ankle_z: TLabeledEdit;
    ToggleBox1: TToggleBox;
    ToggleBox2: TToggleBox;
    TrackBar1: TTrackBar;
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit_Folder_ProcessingClick(Sender: TObject);
    procedure DisplayOptionChange(Sender: TObject);
    procedure FolderEditDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Edit_Run_Joint_AnglesClick(Sender: TObject);
    procedure ChartButtonClick(Sender: TObject);
    procedure CheckBoxChange(Sender: TObject);
    procedure LMKneeButtonClick(Sender: TObject);
    procedure L_Knee_ShiftChange(Sender: TObject);
    procedure R_Knee_ShiftChange(Sender: TObject);
    procedure SAVEAnkle1Click(Sender: TObject);
    procedure SAVEAnkleClick(Sender: TObject);
    procedure SAVECapellaClick(Sender: TObject);
    procedure BFGS_Opt(Option:Integer);
    procedure FormCreate(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,newTime: Double);
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure GLSceneViewer1MouseWheel(Sender: TObject; Shift: TShiftState;WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure BFGS_OptAnkleButtonClick(Sender: TObject);
    procedure BFGS_OptPatellaButtonClick(Sender: TObject);
    procedure L_Ankle_xChange(Sender: TObject);
    procedure L_Ankle_yChange(Sender: TObject);
    procedure L_Ankle_zChange(Sender: TObject);
    procedure L_rot_xChange(Sender: TObject);
    procedure L_rot_yChange(Sender: TObject);
    procedure L_rot_zChange(Sender: TObject);
    procedure MoCapFileEditDblClick(Sender: TObject);
    procedure R_Ankle_xChange(Sender: TObject);
    procedure R_Ankle_yChange(Sender: TObject);
    procedure R_Ankle_zChange(Sender: TObject);
    procedure R_rot_xChange(Sender: TObject);
    procedure R_rot_yChange(Sender: TObject);
    procedure R_rot_zChange(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure ToggleBox2Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    procedure init_EditBoxes;
    procedure Calcul_Angles_articulaires(filename:string);
    Procedure Fill_Joints_Center_Tabs;
    procedure scale_bones;
    procedure Update_Body_Lines;
    procedure Load_Exp_marker_Coords(Sender: TObject);
    procedure update_pelvis_Frame;
    procedure update_LFoot_Frame;
    procedure update_RFoot_Frame;
    procedure update_LKnee_Frame;
    procedure update_RKnee_Frame;
    procedure load_ini;
    procedure save_ini(Option:Integer);
    procedure Make3DFiles(fname, filename: string);
  public
  end;

var
  Form1: TForm1;
  mx,my : integer;
  nom_mocap,nom_ik,Folder_Name:string;
  nb_blocs :integer;
  RASI,LASI,root,LPSI,RKNEE,LKNEE,LANK,LTOE,LHEE,LMT5,RANK,RTOE,RHEE,RMT5,LTHI,RTHI:array of GLVectorgeometry.Tvector;
  Lrot_TAB,Rrot_TAB,LAnkl_TAB,Rankl_TAB:Array of GLVectorgeometry.tvector;
  OPT_OPT:Integer;      //Option d'optimisation
  NVAR:Integer;
  centers_updated:boolean=TRUE;
  Folder_out_Name,Start_Folder:string;

  Function Func(Population :TVector):double;
  Function calc_localFrame_Knee(i:integer;side:TSIDE):GLVectorgeometry.TMatrix;
  Function Build_Shifted_Knee(i:integer;shift:double;side:TSIDE):GLVectorgeometry.Tvector;
  Function calc_Hip_Matrix(i:integer):GLVectorgeometry.TMatrix;

implementation

{$R *.lfm}

//{$i numhess.inc}
{$i numgrad.inc}


{ TForm1 }

procedure TForm1.Make3DFiles(fname, filename: string);
// Extracts the embedded WAV files from the compiled EXE and then
// saves them to the Application folder.
// Only called at start-up if one or more of the WAV files are missing
var
  S: TResourceStream;
  F: TFileStream;
begin
  // create a resource stream which points to our resource
  S := TResourceStream.Create(HInstance, fname, RT_RCDATA);
  if (S = nil) or (S.Size = 0) then
  begin
    ShowMessage(Format('Cannot load resouce named %s', [fname]));
    Exit;
  end;
  // Todo: handle case when stream is empty...
  try
    // create a file in the application directory
    F := TFileStream.Create(ExtractFilePath(ParamStr(0)) + filename, fmCreate);
    try
      F.CopyFrom(S, S.Size); // copy data from the resource stream to file stream
    finally
      F.Free; // destroy the file stream
    end;
  finally
    S.Free; // destroy the resource stream
  end;

end;

procedure TForm1.load_ini;
var
     config:tinifile;
     Mrkr_rad,Knee_Mrkr_rad,Center_size:double;

begin
   config := Tinifile.Create('config.ini');

   L_rot_x.text:=config.ReadString('LEFT ROTULE COORDS','X','0');
   L_rot_y.text:=config.ReadString('LEFT ROTULE COORDS','Y','0');
   L_rot_z.text:=config.ReadString('LEFT ROTULE COORDS','Z','0');
   R_rot_x.text:=config.ReadString('RIGHT ROTULE COORDS','X','0');
   R_rot_y.text:=config.ReadString('RIGHT ROTULE COORDS','Y','0');
   R_rot_z.text:=config.ReadString('RIGHT ROTULE COORDS','Z','0');

   L_Ankle_x.text:=config.ReadString('LEFT ANKLE COORDS','X','0');
   L_Ankle_y.text:=config.ReadString('LEFT ANKLE COORDS','Y','0');
   L_Ankle_z.text:=config.ReadString('LEFT ANKLE COORDS','Z','0');
   R_Ankle_x.text:=config.ReadString('RIGHT ANKLE COORDS','X','0');
   R_Ankle_y.text:=config.ReadString('RIGHT ANKLE COORDS','Y','0');
   R_Ankle_z.text:=config.ReadString('RIGHT ANKLE COORDS','Z','0');

   L_Knee_Shift.text:=config.ReadString('KNEE TRANSVERSE SHIFT','LEFT','0');
   R_Knee_Shift.text:=config.ReadString('KNEE TRANSVERSE SHIFT','RIGHT','0');

   Mrkr_rad:=config.ReadFloat('DISPLAY','MARKER RADIUS',0.01);
   Knee_Mrkr_rad:=config.ReadFloat('DISPLAY','KNEE MARKER RADIUS',0.02);
   Center_size:=config.ReadFloat('DISPLAY','CENTER MARKER SIZE',0.01);
   GLLASI.Radius:=Mrkr_rad;
   GLRASI.Radius:=Mrkr_rad;
   GLRoot.Radius:=Mrkr_rad;
   GLLPSI.Radius:=Mrkr_rad;
   GLLANK.Radius:=Mrkr_rad;
   GLLTOE.Radius:=Mrkr_rad;
   GLLHEE.Radius:=Mrkr_rad;
   GLLMT5.Radius:=Mrkr_rad;
   GLRANK.Radius:=Mrkr_rad;
   GLRTOE.Radius:=Mrkr_rad;
   GLRHEE.Radius:=Mrkr_rad;
   GLRMT5.Radius:=Mrkr_rad;
   GLLTHI.Radius:=Mrkr_rad;
   GLRTHI.Radius:=Mrkr_rad;
   GLLKNEE.Radius:=Knee_Mrkr_rad;
   GLRKNEE.Radius:=Knee_Mrkr_rad;
   RealRKNEE.CubeDepth:=Center_size;RealRKNEE.CubeHeight:=Center_size;RealRKNEE.CubeWidth:=Center_size;
   RealLKnee.CubeDepth:=Center_size;RealLKnee.CubeHeight:=Center_size;RealLKnee.CubeWidth:=Center_size;
   L_Ankle.CubeDepth:=Center_size;L_Ankle.CubeHeight:=Center_size;L_Ankle.CubeWidth:=Center_size;
   R_Ankle.CubeDepth:=Center_size;R_Ankle.CubeHeight:=Center_size;R_Ankle.CubeWidth:=Center_size;
   L_Rot.CubeDepth:=Center_size;L_Rot.CubeHeight:=Center_size;L_Rot.CubeWidth:=Center_size;
   R_Rot.CubeDepth:=Center_size;R_Rot.CubeHeight:=Center_size;R_Rot.CubeWidth:=Center_size;

   GLdummycube1.Position.x:=config.ReadFloat('DISPLAY','CAMERA TARGET POSITION X',0);
   GLdummycube1.Position.y:=config.ReadFloat('DISPLAY','CAMERA TARGET POSITION Y',0);
   GLdummycube1.Position.z:=config.ReadFloat('DISPLAY','CAMERA TARGET POSITION Z',0);

   checkbox1.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX1',TRUE);
   checkbox2.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX2',TRUE);
   checkbox3.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX3',TRUE);
   checkbox4.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX4',TRUE);
   checkbox5.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX5',TRUE);
   checkbox6.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX6',TRUE);
   checkbox7.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX7',TRUE);
   checkbox8.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX8',TRUE);
   checkbox9.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX9',TRUE);
   checkbox10.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX10',TRUE);
   checkbox11.Checked:=config.readbool('SHOW/HIDE SETTINGS','CHECKBOX11',TRUE);

   Folder_out_Name:=config.ReadString('RESULT FOLDER','NAME','');

   config.free;
end;

procedure TForm1.save_ini(Option:Integer);
var
     config:tinifile;

begin
   config := Tinifile.Create('config.ini');

   case Option of
   1:
   begin
     config.WriteString('LEFT ROTULE COORDS','X',L_rot_x.text);
     config.WriteString('LEFT ROTULE COORDS','Y',L_rot_y.text);
     config.WriteString('LEFT ROTULE COORDS','Z',L_rot_z.text);
     config.WriteString('RIGHT ROTULE COORDS','X',R_rot_x.text);
     config.WriteString('RIGHT ROTULE COORDS','Y',R_rot_y.text);
     config.WriteString('RIGHT ROTULE COORDS','Z',R_rot_z.text);
   end;
   2:
   begin
     config.WriteString('LEFT ANKLE COORDS','X',L_Ankle_x.text);
     config.WriteString('LEFT ANKLE COORDS','Y',L_Ankle_y.text);
     config.WriteString('LEFT ANKLE COORDS','Z',L_Ankle_z.text);
     config.WriteString('RIGHT ANKLE COORDS','X',R_Ankle_x.text);
     config.WriteString('RIGHT ANKLE COORDS','Y',R_Ankle_y.text);
     config.WriteString('RIGHT ANKLE COORDS','Z',R_Ankle_z.text);
   end;
   3:
   begin
     config.WriteString('KNEE TRANSVERSE SHIFT','LEFT',L_Knee_Shift.text);
     config.WriteString('KNEE TRANSVERSE SHIFT','RIGHT',R_Knee_Shift.text);
   end;
   end;

   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX1',checkbox1.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX2',checkbox2.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX3',checkbox3.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX4',checkbox4.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX5',checkbox5.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX6',checkbox6.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX7',checkbox7.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX8',checkbox8.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX9',checkbox9.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX10',checkbox10.Checked);
   config.writebool('SHOW/HIDE SETTINGS','CHECKBOX11',checkbox11.Checked);

   config.free;
end;

procedure TForm1.MoCapFileEditDblClick(Sender: TObject);
begin
     if OpenDialog1.Execute then
     begin
      nom_mocap := OpenDialog1.FileName;
      MoCapFileEdit.Text:=OpenDialog1.FileName;
      Load_Exp_marker_Coords(sender);
     end;
end;

procedure TForm1.L_Ankle_xChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then L_Ankle.position.x:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.L_Ankle_yChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then L_Ankle.position.y:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.L_Ankle_zChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then L_Ankle.position.z:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.L_rot_xChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then L_rot.position.x:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.L_rot_yChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then L_rot.position.y:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.L_rot_zChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then L_rot.position.z:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.R_Ankle_xChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then R_Ankle.position.x:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.R_Ankle_yChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then R_Ankle.position.y:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.R_Ankle_zChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then R_Ankle.position.z:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.R_rot_xChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then R_rot.position.x:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.R_rot_yChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then R_rot.position.y:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.R_rot_zChange(Sender: TObject);
var
  out:double;
begin
    if TryStrToFloat(Tlabelededit(Sender).text,out) then R_rot.position.z:=out;
    centers_updated:=TRUE;
end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin
 L_rot_x.text:='0';
 L_rot_y.text:='0';
 L_rot_z.text:='0';
 R_rot_x.text:='0';
 R_rot_y.text:='0';
 R_rot_z.text:='0';
end;

procedure TForm1.ToggleBox2Change(Sender: TObject);
begin
 L_Ankle_x.text:='0';
 L_Ankle_y.text:='0';
 L_Ankle_z.text:='0';
 R_Ankle_x.text:='0';
 R_Ankle_y.text:='0';
 R_Ankle_z.text:='0';
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
var
  M,LShank,RShank,LThigh,RThigh:GLVectorgeometry.Tmatrix;
  temp:double;

begin
   if  nb_blocs=Trackbar1.max+1 then
   begin
     GLRASI.Position.AsVector:=RASI[Trackbar1.Position];
     GLLASI.Position.AsVector:=LASI[Trackbar1.Position];
     GLLPSI.Position.AsVector:=LPSI[Trackbar1.Position];
     GLRoot.Position.AsVector:=Root[Trackbar1.Position];
     GLLKNEE.Position.AsVector:=LKNEE[Trackbar1.Position];
     GLRKNEE.Position.AsVector:=RKNEE[Trackbar1.Position];

     GLLANK.Position.AsVector:=LANK[Trackbar1.Position];
     GLLTOE.Position.AsVector:=LTOE[Trackbar1.Position];
     GLLHEE.Position.AsVector:=LHEE[Trackbar1.Position];
     GLLMT5.Position.AsVector:=LMT5[Trackbar1.Position];

     GLRANK.Position.AsVector:=RANK[Trackbar1.Position];
     GLRTOE.Position.AsVector:=RTOE[Trackbar1.Position];
     GLRHEE.Position.AsVector:=RHEE[Trackbar1.Position];
     GLRMT5.Position.AsVector:=RMT5[Trackbar1.Position];

     GLRTHI.Position.AsVector:=RTHI[Trackbar1.Position];
     GLLTHI.Position.AsVector:=LTHI[Trackbar1.Position];

     if  centers_updated then
     begin
       Fill_Joints_Center_Tabs;
       centers_updated:=FALSE;
       scale_bones;
     end;

     update_pelvis_Frame;
     update_LFoot_Frame;
     update_RFoot_Frame;
     update_LKnee_Frame;
     update_RKnee_Frame;

     RealLKnee.Position.AsVector:=Build_Shifted_Knee(Trackbar1.Position,strtofloat(L_Knee_Shift.Text),TSIDE.LEFT);
     M:=LKnee_Center.Matrix;
     invertmatrix(M);
     RealLKnee.Position.AsVector:=VectorTransform(RealLKnee.Position.AsVector,M);

     RealRKnee.Position.AsVector:=Build_Shifted_Knee(Trackbar1.Position,strtofloat(R_Knee_Shift.Text),TSIDE.RIGHT);
     M:=RKnee_Center.Matrix;
     invertmatrix(M);
     RealRKnee.Position.AsVector:=VectorTransform(RealRKnee.Position.AsVector,M);

     if CheckBox4.Checked then Update_Body_Lines;

     if checkbox11.Checked then
     begin

      IKHip_ref.Position:=pelvis_center.Position;
      IKHip_ref.Direction:=pelvis_center.direction;
      IKHip_ref.up:=pelvis_center.up;

      LThigh.X:=Vectornormalize(Vectorsubtract(RealLKNEE.AbsolutePosition,L_rot.AbsolutePosition));
      LShank.X:=Vectornormalize(Vectorsubtract(L_Ankle.AbsolutePosition,RealLKNEE.AbsolutePosition));
      LThigh.Y:=Vectornormalize(VectorCrossProduct(LThigh.X,Vectoradd(LShank.X,LThigh.X)));
      LShank.Y:=LThigh.Y;
      LThigh.Z:=Vectornormalize(VectorCrossProduct(LThigh.X,LThigh.Y));
      LShank.Z:=Vectornormalize(VectorCrossProduct(LShank.X,LShank.Y));

      RThigh.X:=Vectornormalize(Vectorsubtract(RealRKNEE.AbsolutePosition,R_rot.AbsolutePosition));
      RShank.X:=Vectornormalize(Vectorsubtract(R_Ankle.AbsolutePosition,RealRKNEE.AbsolutePosition));
      RThigh.Y:=Vectornormalize(VectorCrossProduct(RThigh.X,Vectoradd(RShank.X,RThigh.X)));
      RShank.Y:=RThigh.Y;
      RThigh.Z:=Vectornormalize(VectorCrossProduct(RThigh.X,RThigh.Y));
      RShank.Z:=Vectornormalize(VectorCrossProduct(RShank.X,RShank.Y));


      //chgt de coords GLDummyCube2 -> GLDummyCube1   :  Y1=-Z2 ; Z1=Y2 ; + Shift Camera
      Temp:=LThigh.X.Y;LThigh.X.Y:=-LThigh.X.Z;LThigh.X.Z:=Temp;
      Temp:=LThigh.Y.Y;LThigh.Y.Y:=-LThigh.Y.Z;LThigh.Y.Z:=Temp;
      Temp:=LThigh.Z.Y;LThigh.Z.Y:=-LThigh.Z.Z;LThigh.Z.Z:=Temp;
      Temp:=RThigh.X.Y;RThigh.X.Y:=-RThigh.X.Z;RThigh.X.Z:=Temp;
      Temp:=RThigh.Y.Y;RThigh.Y.Y:=-RThigh.Y.Z;RThigh.Y.Z:=Temp;
      Temp:=RThigh.Z.Y;RThigh.Z.Y:=-RThigh.Z.Z;RThigh.Z.Z:=Temp;
      Temp:=LShank.X.Y;LShank.X.Y:=-LShank.X.Z;LShank.X.Z:=Temp;
      Temp:=LShank.Y.Y;LShank.Y.Y:=-LShank.Y.Z;LShank.Y.Z:=Temp;
      Temp:=LShank.Z.Y;LShank.Z.Y:=-LShank.Z.Z;LShank.Z.Z:=Temp;
      Temp:=RShank.X.Y;RShank.X.Y:=-RShank.X.Z;RShank.X.Z:=Temp;
      Temp:=RShank.Y.Y;RShank.Y.Y:=-RShank.Y.Z;RShank.Y.Z:=Temp;
      Temp:=RShank.Z.Y;RShank.Z.Y:=-RShank.Z.Z;RShank.Z.Z:=Temp;

      M:=IKHip_ref.Matrix;
      InvertMatrix(M);
      LThigh:=MatrixMultiply(LThigh,M);
      Lthigh.W:=L_rot.Position.AsVector;

      IKLFemur_ref.Position.AsVector:=LThigh.W;
      IKLFemur_ref.Direction.AsVector:=vectorscale(LThigh.x,-1);
      IKLFemur_ref.Up.AsVector:=LThigh.y;

      RThigh:=MatrixMultiply(RThigh,M);
      RThigh.W:=R_rot.Position.AsVector;

      IKRFemur_ref.Position.AsVector:=RThigh.W;
      IKRFemur_ref.Direction.AsVector:=vectorscale(RThigh.x,-1);
      IKRFemur_ref.Up.AsVector:=RThigh.y;

      M:=MatrixMultiply(IKLFemur_ref.Matrix,IKHip_ref.Matrix);
      InvertMatrix(M);
      LShank:=MatrixMultiply(LShank,M);
      LShank.W:=vectormake(0,0,-9.8*GLFemur_L.Scale.x);

      IKLTibia_ref.Position.AsVector:=LShank.W;
      IKLTibia_ref.Direction.AsVector:=vectorscale(LShank.x,-1);
      IKLTibia_ref.Up.AsVector:=LShank.y;

      M:=MatrixMultiply(IKRFemur_ref.Matrix,IKHip_ref.Matrix);
      InvertMatrix(M);
      RShank:=MatrixMultiply(RShank,M);
      RShank.W:=vectormake(0,0,-9.8*GLFemur_R.Scale.x);

      IKRTibia_ref.Position.AsVector:=RShank.W;
      IKRTibia_ref.Direction.AsVector:=vectorscale(RShank.x,-1);
      IKRTibia_ref.Up.AsVector:=RShank.y;

      M:=MatrixMultiply(IKLFemur_ref.Matrix,IKHip_ref.Matrix);
      M:=MatrixMultiply(IKLTibia_ref.Matrix,M);
      InvertMatrix(M);
      M:=MatrixMultiply(LFoot_center.Matrix,M);
      IKLFoot_ref.Direction.asvector:=M.Z;
      IKLFoot_ref.up.asvector:=M.Y;
      IKLFoot_ref.Position.asvector:=vectormake(0,0,-9.8*GLTibia_L.Scale.x);

      M:=MatrixMultiply(IKRFemur_ref.Matrix,IKHip_ref.Matrix);
      M:=MatrixMultiply(IKRTibia_ref.Matrix,M);
      InvertMatrix(M);
      M:=MatrixMultiply(RFoot_center.Matrix,M);
      IKRFoot_ref.Direction.asvector:=M.Z;
      IKRFoot_ref.up.asvector:=M.Y;
      IKRFoot_ref.Position.asvector:=vectormake(0,0,-9.8*GLTibia_L.Scale.x);

     end;
   end;

   CheckBoxChange(self);
   frame_nb_edit.Text:=inttostr(Trackbar1.Position);

end;

procedure TForm1.Update_Body_Lines;
begin
 GLLLeg.Nodes.Items[0].X:=L_rot.AbsolutePosition.x;
 GLLLeg.Nodes.Items[0].Y:=L_rot.AbsolutePosition.Y;
 GLLLeg.Nodes.Items[0].Z:=L_rot.AbsolutePosition.Z;
 GLLLeg.Nodes.Items[1].X:=RealLKNEE.AbsolutePosition.X;
 GLLLeg.Nodes.Items[1].Y:=RealLKNEE.AbsolutePosition.Y;
 GLLLeg.Nodes.Items[1].Z:=RealLKNEE.AbsolutePosition.Z;
 GLLLeg.Nodes.Items[2].X:=L_Ankle.AbsolutePosition.X;
 GLLLeg.Nodes.Items[2].Y:=L_Ankle.AbsolutePosition.Y;
 GLLLeg.Nodes.Items[2].Z:=L_Ankle.AbsolutePosition.Z;

 GLRLeg.Nodes.Items[0].X:=R_rot.AbsolutePosition.x;
 GLRLeg.Nodes.Items[0].Y:=R_rot.AbsolutePosition.Y;
 GLRLeg.Nodes.Items[0].Z:=R_rot.AbsolutePosition.Z;
 GLRLeg.Nodes.Items[1].X:=RealRKnee.AbsolutePosition.X;
 GLRLeg.Nodes.Items[1].Y:=RealRKnee.AbsolutePosition.Y;
 GLRLeg.Nodes.Items[1].Z:=RealRKnee.AbsolutePosition.Z;
 GLRLeg.Nodes.Items[2].X:=R_Ankle.AbsolutePosition.X;
 GLRLeg.Nodes.Items[2].Y:=R_Ankle.AbsolutePosition.Y;
 GLRLeg.Nodes.Items[2].Z:=R_Ankle.AbsolutePosition.Z;
end;

procedure TForm1.update_pelvis_Frame;
var
  xaxis,yaxis,zaxis:GLVectorgeometry.Tvector;
begin
   pelvis_center.Position.AsVector:=vectorscale(vectoradd(vectoradd(GLRASI.Position.AsVector,GLLASI.Position.AsVector),
   vectoradd(GLLPSI.Position.AsVector,GLRoot.Position.AsVector)),0.25);
   yaxis:=Vectornormalize(VectorSubtract(GLLASI.Position.AsVector,GLRASI.Position.AsVector));
   zaxis:=Vectornormalize(vectorscale(VectorCrossProduct(yaxis,VectorSubtract(GLLASI.Position.AsVector,GLroot.Position.AsVector)),-1));
   xaxis:=VectorCrossProduct(yaxis,zaxis);
   pelvis_center.Direction.AsVector:=zaxis;
   pelvis_center.Up.AsVector:=yaxis;
end;

procedure TForm1.update_LFoot_Frame;
var
  xaxis,yaxis,zaxis:GLVectorgeometry.Tvector;
begin
   LFoot_center.Position.AsVector:=vectorscale(vectoradd(vectoradd(GLLTOE.Position.AsVector,GLLMT5.Position.AsVector),
   GLLHEE.Position.AsVector),1/3);
   xaxis:=Vectornormalize(VectorSubtract(vectorscale(vectoradd(GLLMT5.Position.AsVector,GLLTOE.Position.AsVector),0.5),GLLHEE.Position.AsVector));
   zaxis:=Vectornormalize(VectorCrossProduct(VectorSubtract(GLLTOE.Position.AsVector,GLLMT5.Position.AsVector),xaxis));
   yaxis:=VectorCrossProduct(zaxis,xaxis);
   LFoot_center.Direction.AsVector:=zaxis;
   LFoot_center.Up.AsVector:=yaxis;
end;

procedure TForm1.update_RFoot_Frame;
var
  xaxis,yaxis,zaxis:GLVectorgeometry.Tvector;
begin
   RFoot_center.Position.AsVector:=vectorscale(vectoradd(vectoradd(GLRTOE.Position.AsVector,GLRMT5.Position.AsVector),
   GLRHEE.Position.AsVector),1/3);
   xaxis:=Vectornormalize(VectorSubtract(vectorscale(vectoradd(GLRMT5.Position.AsVector,GLRTOE.Position.AsVector),0.5),GLRHEE.Position.AsVector));
   zaxis:=Vectornormalize(VectorCrossProduct(xaxis,VectorSubtract(GLRTOE.Position.AsVector,GLRMT5.Position.AsVector)));
   yaxis:=VectorCrossProduct(zaxis,xaxis);
   RFoot_center.Direction.AsVector:=zaxis;
   RFoot_center.Up.AsVector:=yaxis;
end;

procedure TForm1.update_RKnee_Frame;
var
  xaxis,yaxis,zaxis,v:GLVectorgeometry.Tvector;
begin
   RKnee_Center.Position:=GLRKNEE.Position;
   v:=Vectornormalize(VectorSubtract(GLRKNEE.AbsolutePosition,R_rot.AbsolutePosition));
   xaxis:=Vectormake(v.X,-v.Z,v.Y);
   zaxis:=Vectornormalize(VectorCrossProduct(xaxis,VectorSubtract(GLRTHI.Position.AsVector,GLRKNEE.Position.AsVector)));
   yaxis:=VectorCrossProduct(zaxis,xaxis);
   RKnee_Center.Direction.AsVector:=zaxis;
   RKnee_Center.Up.AsVector:=yaxis;
end;

procedure TForm1.update_LKnee_Frame;
var
  xaxis,yaxis,zaxis,v:GLVectorgeometry.Tvector;
begin
   LKnee_Center.Position:=GLLKNEE.Position;
   v:=Vectornormalize(VectorSubtract(GLLKNEE.AbsolutePosition,L_rot.AbsolutePosition));
   xaxis:=Vectormake(v.X,-v.Z,v.Y);
   zaxis:=Vectornormalize(VectorCrossProduct(xaxis,VectorSubtract(GLLTHI.Position.AsVector,GLLKNEE.Position.AsVector)));
   yaxis:=VectorCrossProduct(zaxis,xaxis);
   LKnee_Center.Direction.AsVector:=zaxis;
   LKnee_Center.Up.AsVector:=yaxis;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

     Make3DFiles('HIP', 'hip.obj');
     Make3DFiles('THIGH_L', 'thigh_l.obj');
     Make3DFiles('THIGH_R', 'thigh_r.obj');
     Make3DFiles('SHANK_L', 'shank_r.obj');
     Make3DFiles('SHANK_R', 'shank_l.obj');
     Make3DFiles('FOOT_L', 'foot_l.obj');
     Make3DFiles('FOOT_R', 'foot_r.obj');

    Decimalseparator:='.';
    load_ini;
    GLFemur_R.LoadFromFile('thigh_R.obj');
    GLFemur_L.LoadFromFile('thigh_L.obj');
    GLTibia_R.LoadFromFile('shank_R.obj');
    GLTibia_L.LoadFromFile('shank_L.obj');
    GLFoot_R.LoadFromFile('foot_R.obj');
    GLFoot_L.LoadFromFile('foot_L.obj');
    GLhip.LoadFromFile('hip.obj');

    GLFemur_R.Scale.AsVector:=Vectormake(0.0,0.0,0.0);
    GLFemur_L.Scale.AsVector:=Vectormake(0.0,0.0,0.0);
    GLTibia_R.Scale.AsVector:=Vectormake(0.0,0.0,0.0);
    GLTibia_L.Scale.AsVector:=Vectormake(0.0,0.0,0.0);
    GLFoot_R.Scale.AsVector:=Vectormake(0.0,0.0,0.0);
    GLFoot_L.Scale.AsVector:=Vectormake(0.0,0.0,0.0);
    GLhip.Scale.AsVector:=Vectormake(0.0,0.0,0.0);

    Start_Folder:=ExtractFilePath(application.ExeName);
end;

procedure TForm1.scale_bones;
var
  i,nb_echantillons_valides:integer;
   l_inter_Rot,shift_center_hip,lift_center_hip,scale:double;
   scale_thigh_L,scale_thigh_R,scale_shank_L,scale_shank_R:double;
  LKN,RKN:GLVectorgeometry.tvector;

begin

    l_inter_Rot:=0;
    shift_center_hip:=0;
    lift_center_hip:=0;
    for i:=0 to High(Root) do
    begin
       l_inter_Rot:=l_inter_Rot+vectorlength(vectorsubtract(L_rot.position.AsVector,R_rot.position.asvector));
       shift_center_hip:=shift_center_hip+(L_rot.Position.x+R_rot.Position.x)/2;
       lift_center_hip:=lift_center_hip+(L_rot.Position.z+R_rot.Position.z)/2;
    end;
    l_inter_Rot:=l_inter_Rot/Length(root);
    shift_center_hip:=shift_center_hip/Length(root);
    lift_center_hip:=lift_center_hip/Length(root);
    scale:=l_inter_Rot/4.75;
    GLhip.Scale.AsVector:=Vectormake(scale,scale,scale);
    GLhip.Position.x:=0.33*scale+shift_center_hip;
    GLhip.Position.z:=2.25*scale+lift_center_hip;

    Fill_Joints_Center_Tabs;

    scale_thigh_L:=0;
    scale_thigh_R:=0;
    scale_shank_L:=0;
    scale_shank_R:=0;
    nb_echantillons_valides:=Length(root);
    for i:=0 to high(root) do
    if not(vectorequals(LRot_TAB[i],NullHmgVector)) AND not(vectorequals(LAnkl_TAB[i],NullHmgVector))
      AND not(vectorequals(RRot_TAB[i],NullHmgVector)) AND not(vectorequals(RAnkl_TAB[i],NullHmgVector)) then
    begin
     LKN:=Build_Shifted_Knee(i,strtofloat(L_Knee_Shift.Text),TSIDE.LEFT);
     scale_thigh_L:=scale_thigh_L+vectorlength(vectorsubtract(LKN,LRot_TAB[i]));
     scale_shank_L:=scale_shank_L+vectorlength(vectorsubtract(LKN,LAnkl_TAB[i]));
     RKN:=Build_Shifted_Knee(i,strtofloat(R_Knee_Shift.Text),TSIDE.RIGHT);
     scale_thigh_R:=scale_thigh_R+vectorlength(vectorsubtract(RKN,RRot_TAB[i]));
     scale_shank_R:=scale_shank_R+vectorlength(vectorsubtract(RKN,RAnkl_TAB[i]));
    end
    else
    dec(nb_echantillons_valides);
    scale_thigh_L:=scale_thigh_L/nb_echantillons_valides/9.8;
    scale_thigh_R:=scale_thigh_R/nb_echantillons_valides/9.8;
    scale_shank_L:=scale_shank_L/nb_echantillons_valides/9.8;
    scale_shank_R:=scale_shank_R/nb_echantillons_valides/9.8;

    GLFemur_L.Scale.AsVector:=Vectormake(scale_thigh_L,scale_thigh_L,scale_thigh_L);
    GLFemur_R.Scale.AsVector:=Vectormake(scale_thigh_R,scale_thigh_R,scale_thigh_R);
    GLTibia_L.Scale.AsVector:=Vectormake(scale_shank_L,scale_shank_L,scale_shank_L);
    GLTibia_R.Scale.AsVector:=Vectormake(scale_shank_R,scale_shank_R,scale_shank_R);

    nb_echantillons_valides:=Length(root);
    scale:=0;
    for i:=0 to High(Root) do
    if not(vectorequals(LTOE[i],NullHmgVector)) AND not(vectorequals(LHEE[i],NullHmgVector)) then
    scale:=scale+vectorlength(vectorsubtract(LTOE[i],LHEE[i]))
    else
    dec(nb_echantillons_valides);
    scale:=scale/nb_echantillons_valides/4.9;
    GLFoot_L.Scale.AsVector:=Vectorscale(Vectormake(scale,scale,scale),1);
    GLFoot_R.Scale.AsVector:=Vectorscale(Vectormake(scale,scale,scale),1);

    GLFemur_L.Direction.AsVector:=vectormake(0,0,1);
    GLFemur_L.up.AsVector:=vectormake(0,1,0);
    GLFemur_R.Direction.AsVector:=vectormake(0,0,1);
    GLFemur_R.up.AsVector:=vectormake(0,1,0);
    GLFemur_L.Turn(5);
    GLFemur_R.Turn(5);

    GLTibia_L.Direction.AsVector:=vectormake(0,0,1);
    GLTibia_L.up.AsVector:=vectormake(0,1,0);
    GLTibia_R.Direction.AsVector:=vectormake(0,0,1);
    GLTibia_R.up.AsVector:=vectormake(0,1,0);
    GLTibia_L.turn(5);
    GLTibia_R.turn(5);
end;

procedure TForm1.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
   if iskeydown(VK_NUMPAD4) then GLdummycube1.Position.x:=GLdummycube1.Position.x+0.01;
   if iskeydown(VK_NUMPAD6) then GLdummycube1.Position.x:=GLdummycube1.Position.x-0.01;
   if iskeydown(VK_NUMPAD9) then GLdummycube1.Position.z:=GLdummycube1.Position.z+0.01;
   if iskeydown(VK_NUMPAD7) then GLdummycube1.Position.z:=GLdummycube1.Position.z-0.01;
   if iskeydown(VK_NUMPAD2) then GLdummycube1.Position.y:=GLdummycube1.Position.y+0.01;
   if iskeydown(VK_NUMPAD8) then GLdummycube1.Position.y:=GLdummycube1.Position.y-0.01;
end;

procedure TForm1.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if ssLeft in shift then GLCamera1.MoveAroundTarget(my-y,mx-x);
   mx:=x;
   my:=y;
end;

procedure TForm1.GLSceneViewer1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
    if Assigned(glCamera1) then
    glCamera1.AdjustDistanceToTarget(Power(1.1, WheelDelta / 240 * 1)) ;
end;

procedure TForm1.BFGS_OptAnkleButtonClick(Sender: TObject);
begin
    if nb_blocs>0 then
    begin
      BFGS_Opt(2);
      TrackBar1Change(self);
    end;
end;

procedure TForm1.BFGS_OptPatellaButtonClick(Sender: TObject);
begin
    if nb_blocs>0 then
    begin
      BFGS_Opt(1);
      TrackBar1Change(self);
    end;
end;

procedure TForm1.Load_Exp_marker_Coords(Sender: TObject);
var
 i,j,nb_separateurs:integer;
 charArray : Array[0..0] of Char;
 stra:  Array of String;
 ligne:Tstringlist;
begin
   charArray[0]:=',';
   nb_blocs:=0;
   try
     begin
       ligne := TStringList.Create;
       ligne.LoadFromFile(nom_mocap);
       nb_separateurs:=0; while ligne[nb_separateurs]<>'###' do inc(nb_separateurs);
       inc(nb_separateurs);
       nb_blocs:=round(ligne.Count/nb_separateurs);
       for i:=0 to nb_VICON_Mkr-1 do for j:=0 to 2 do
       begin
         setlength(RASI,nb_blocs);
         setlength(LASI,nb_blocs);
         setlength(LPSI,nb_blocs);
         setlength(root,nb_blocs);
         setlength(RKNEE,nb_blocs);
         setlength(LKNEE,nb_blocs);
         setlength(LANK,nb_blocs);
         setlength(LTOE,nb_blocs);
         setlength(LHEE,nb_blocs);
         setlength(LMT5,nb_blocs);
         setlength(RANK,nb_blocs);
         setlength(RTOE,nb_blocs);
         setlength(RHEE,nb_blocs);
         setlength(RMT5,nb_blocs);
         setlength(LTHI,nb_blocs);
         setlength(RTHI,nb_blocs);
         setlength(LRot_TAB,length(Root));
         setlength(RRot_TAB,length(Root));
         setlength(LAnkl_TAB,length(Root));
         setlength(RAnkl_TAB,length(Root));
       end;
       for j:=0 to nb_blocs-1  do
       begin
         stra:=ligne[23+j*nb_separateurs].split(charArray);
         LASI[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LASI[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LASI[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[24+j*nb_separateurs].split(charArray);
         RASI[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RASI[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RASI[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[25+j*nb_separateurs].split(charArray);
         LPSI[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LPSI[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LPSI[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[26+j*nb_separateurs].split(charArray);
         Root[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         Root[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         Root[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[28+j*nb_separateurs].split(charArray);
         LKNEE[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LKNEE[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LKNEE[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[35+j*nb_separateurs].split(charArray);
         RKNEE[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RKNEE[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RKNEE[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[30+j*nb_separateurs].split(charArray);
         LANK[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LANK[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LANK[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[32+j*nb_separateurs].split(charArray);
         LTOE[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LTOE[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LTOE[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[31+j*nb_separateurs].split(charArray);
         LHEE[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LHEE[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LHEE[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[33+j*nb_separateurs].split(charArray);
         LMT5[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LMT5[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LMT5[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[37+j*nb_separateurs].split(charArray);
         RANK[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RANK[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RANK[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[39+j*nb_separateurs].split(charArray);
         RTOE[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RTOE[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RTOE[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[38+j*nb_separateurs].split(charArray);
         RHEE[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RHEE[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RHEE[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[40+j*nb_separateurs].split(charArray);
         RMT5[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RMT5[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RMT5[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[27+j*nb_separateurs].split(charArray);
         LTHI[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LTHI[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         LTHI[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         stra:=ligne[34+j*nb_separateurs].split(charArray);
         RTHI[j].X:=strtofloat(StringReplace(stra[0], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RTHI[j].Y:=strtofloat(StringReplace(stra[1], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;
         RTHI[j].Z:=strtofloat(StringReplace(stra[2], ' ', '',[rfReplaceAll, rfIgnoreCase]))/1000;

       end;
       ligne.free;
       trackbar1.Max:=nb_blocs-1;
       trackbar1.Position:=trackbar1.Max;
     end;
   finally
   end;
end;

Function calc_Hip_Matrix(i:integer):GLVectorgeometry.TMatrix;    //calcule la matrix des markeurs LASI, RASI, Root, LPSI considérés comme appartenant à un même rigid body
var
  xaxis,yaxis,zaxis,center:GLVectorgeometry.Tvector;
begin
    center:=vectorscale(vectoradd(vectoradd(RASI[i],LASI[i]),vectoradd(LPSI[i],Root[i])),0.25);
    yaxis:=Vectornormalize(VectorSubtract(LASI[i],RASI[i]));
    zaxis:=Vectornormalize(vectorscale(VectorCrossProduct(yaxis,VectorSubtract(LASI[i],Root[i])),-1));
    xaxis:=VectorCrossProduct(yaxis,zaxis);
    result.X:=xaxis;
    result.Y:=yaxis;
    result.Z:=zaxis;
    result.W:=center;
    result.W.w:=1;
end;

Function calc_dist2Patellas(i:integer;v1,v2:GLVectorgeometry.tvector;s:TSIDE):Double;
var
  Lrot,Rrot:GLVectorgeometry.Tvector;
  M:GLVectorgeometry.Tmatrix;
begin
   M:=calc_Hip_Matrix(i);
   case s of
   TSide.LEFT :
   begin
    Lrot:=v1;Lrot.W:=1;
    Lrot:=VectorTransform(Lrot,M);
    if vectorisnull(RASI[i]) or vectorisnull(LASI[i]) or vectorisnull(Root[i]) or vectorisnull(LPSI[i]) or vectorisnull(LKNEE[i]) then result:=-1
    else
    result:=VectorLength(vectorsubtract(LKNEE[i],Lrot));
    end;
   TSide.RIGHT :
   begin
    Rrot:=v2;Rrot.W:=1;
    Rrot:=VectorTransform(Rrot,M);
    if vectorisnull(RASI[i]) or vectorisnull(LASI[i]) or vectorisnull(Root[i]) or vectorisnull(LPSI[i]) or vectorisnull(RKNEE[i]) then result:=-1
    else
    result:=VectorLength(vectorsubtract(RKNEE[i],Rrot));
   end;
   end;
end;

Function calc_dist2ankles(i:integer;v1,v2:GLVectorgeometry.tvector;s:TSIDE):Double;
var
  xaxis,yaxis,zaxis,LCenter,RCenter,LAnkl,RAnkl:GLVectorgeometry.Tvector;
  M:GLVectorgeometry.Tmatrix;
begin
 M:=calc_Hip_Matrix(i);
 case s of
 TSide.LEFT :
 begin
    Lcenter:=vectorscale(vectoradd(vectoradd(LTOE[i],LMT5[i]),LHEE[i]),1/3);
    xaxis:=Vectornormalize(VectorSubtract(vectorscale(vectoradd(LMT5[i],LTOE[i]),0.5),LHEE[i]));
    zaxis:=Vectornormalize(VectorCrossProduct(VectorSubtract(LTOE[i],LMT5[i]),xaxis));
    yaxis:=VectorCrossProduct(zaxis,xaxis);
    M.X:=xaxis;M.Y:=yaxis;M.Z:=zaxis;M.W:=Lcenter;
    LAnkl:=v1;LAnkl.W:=1;
    LAnkl:=VectorTransform(LAnkl,M);
    if vectorisnull(LKNEE[i]) or vectorisnull(LHEE[i]) or vectorisnull(LTOE[i]) or vectorisnull(LMT5[i]) then result:=-1
    else
    result:=VectorLength(vectorsubtract(LKNEE[i],LAnkl));
 end;
 TSide.RIGHT :
 begin
    Rcenter:=vectorscale(vectoradd(vectoradd(RTOE[i],RMT5[i]),RHEE[i]),1/3);
    xaxis:=Vectornormalize(VectorSubtract(vectorscale(vectoradd(RMT5[i],RTOE[i]),0.5),RHEE[i]));
    zaxis:=Vectornormalize(VectorCrossProduct(xaxis,VectorSubtract(RTOE[i],RMT5[i])));
    yaxis:=VectorCrossProduct(zaxis,xaxis);
    M.X:=xaxis;M.Y:=yaxis;M.Z:=zaxis;M.W:=Rcenter;
    RAnkl:=v2;RAnkl.W:=1;
    RAnkl:=VectorTransform(RAnkl,M);
    if vectorisnull(RKNEE[i]) or vectorisnull(RHEE[i]) or vectorisnull(RTOE[i]) or vectorisnull(RMT5[i]) then result:=-1
    else
    result:=VectorLength(vectorsubtract(RKNEE[i],RAnkl));
 end;
 end;
end;

Function calc_localFrame_Knee(i:integer;side:TSIDE):GLVectorgeometry.TMatrix;   //Calcule le repère local centré sur KNEE et orienté par THI exprimé dans GLDummycube1
var
  xaxis,yaxis,zaxis,center:GLVectorgeometry.Tvector;
begin
    case side of
    TSIDE(LEFT) :
      begin
        center:=LKNEE[i];
        center.w:=1;
        xaxis:=Vectornormalize(VectorSubtract(LKNEE[i],LROT_TAB[i]));
        zaxis:=Vectornormalize(VectorCrossProduct(xaxis,VectorSubtract(LTHI[i],LKNEE[i])));
        yaxis:=Vectornormalize(VectorCrossProduct(zaxis,xaxis));
      end;
    TSIDE(RIGHT) :
      begin
        center:=RKNEE[i];
        center.w:=1;
        xaxis:=Vectornormalize(VectorSubtract(RKNEE[i],RROT_TAB[i]));
        zaxis:=Vectornormalize(VectorCrossProduct(xaxis,VectorSubtract(RTHI[i],RKNEE[i])));
        yaxis:=Vectornormalize(VectorCrossProduct(zaxis,xaxis));
      end
    end;
    result.X:=xaxis;result.Y:=yaxis;result.Z:=zaxis;result.W:=center;
end;

Function Build_Shifted_Knee(i:integer;shift:double;side:TSIDE):GLVectorgeometry.Tvector; //calcule la position du marker KNEE après rotation dans le repère GLDummycube1 conduisant à un ecart (shift) donné
var
  Axis,Center,Rot_Ankle_direction,Center_Knee_direction:GLVectorgeometry.Tvector;
  Rayon,angle:double;

begin

 case side of
 TSIDE(LEFT) :
   begin
    Rot_Ankle_direction:=VectorNormalize(vectorsubtract(LANKL_TAB[i],LROT_TAB[i]));
    Center:=vectorscale(vectoradd(LKNEE[i],vectoradd(LROT_TAB[i],vectorscale(Rot_Ankle_direction,PointProject(LKNEE[i],LROT_TAB[i],Rot_Ankle_direction)))),0.5);
    Center_Knee_direction:=vectorsubtract(LKNEE[i],Center);
   end;
  TSIDE(RIGHT) :
   begin
    Rot_Ankle_direction:=VectorNormalize(vectorsubtract(RANKL_TAB[i],RROT_TAB[i]));
    Center:=vectorscale(vectoradd(RKNEE[i],vectoradd(RROT_TAB[i],vectorscale(Rot_Ankle_direction,PointProject(RKNEE[i],RROT_TAB[i],Rot_Ankle_direction)))),0.5);
    Center_Knee_direction:=vectorsubtract(RKNEE[i],Center);
   end;
  end;

  Rayon:=vectorlength(Center_Knee_direction);
  Axis:=Rot_Ankle_direction;
  if abs((shift/rayon/2))<=1 then
  begin
   Angle:=pi-2*Arccos(shift/rayon/2);      //voir théorème de l'angle au centre
   RotateVector(Center_Knee_direction,Axis,angle);
   result:=vectoradd(Center,Center_Knee_direction);
  end
  else
  result:=WHmgVector;

end;

Function calc_Leg_Length(i:integer;L_LocalCoords,R_LocalCoords:GLVectorgeometry.Tvector):Double;     //calcule la longueur totale des jambes
var
  LrealKNEE,RrealKNEE:GLVectorgeometry.Tvector;
  M:GLVectorgeometry.Tmatrix;
begin
  M:=calc_localFrame_Knee(i,TSide.LEFT);
  LrealKNEE:=VectorTransform(L_LocalCoords,M);
  M:=calc_localFrame_Knee(i,TSide.RIGHT);
  RrealKNEE:=VectorTransform(R_LocalCoords,M);
  result:=VectorLength(vectorsubtract(LrealKNEE,Lrot_TAB[i]))+VectorLength(vectorsubtract(LrealKNEE,LAnkl_TAB[i]));
  result:=result+VectorLength(vectorsubtract(RrealKNEE,Rrot_TAB[i]))+VectorLength(vectorsubtract(RrealKNEE,RAnkl_TAB[i]));
end;

Function calc_Leg_Length2(i:integer;L_LocalCoords,R_LocalCoords:Double):Double;     //calcule la longueur totale des jambes
var
  LrealKNEE,RrealKNEE:GLVectorgeometry.Tvector;
begin
  LrealKNEE:=Build_Shifted_Knee(i,L_LocalCoords,TSIDE.LEFT);
  RrealKNEE:=Build_Shifted_Knee(i,R_LocalCoords,TSIDE.RIGHT);

  result:=VectorLength(vectorsubtract(LrealKNEE,Lrot_TAB[i]))+VectorLength(vectorsubtract(LrealKNEE,LAnkl_TAB[i]));
  result:=result+VectorLength(vectorsubtract(RrealKNEE,Rrot_TAB[i]))+VectorLength(vectorsubtract(RrealKNEE,RAnkl_TAB[i]));
end;

Function Func(Population :TVector):double;
var
  vec1,vec2:GLVectorgeometry.Tvector;
  i,nb_echantillons_valides:integer;
  moyenne_L,ecart_type_L,moyenne_R,ecart_type_R,d_L,d_R:double;
begin

    moyenne_L:=0;
    moyenne_R:=0;
    Vec1:=vectormake(Population[1],Population[2],Population[3]);
    Vec2:=vectormake(Population[4],Population[5],Population[6]);
    nb_echantillons_valides:=Length(root);

    for i:=0 to High(root) do
    begin
      if OPT_OPT=1 then
      begin
        d_L:=calc_dist2Patellas(i,Vec1,Vec2,TSIDE.LEFT);
        d_R:=calc_dist2Patellas(i,Vec1,Vec2,TSIDE.RIGHT);
      end
      else
      begin
        d_L:=calc_dist2Ankles(i,Vec1,Vec2,TSIDE.LEFT);
        d_R:=calc_dist2Ankles(i,Vec1,Vec2,TSIDE.RIGHT);
      end;
      if (d_R<>-1) AND (d_L<>-1) then
      begin
        moyenne_L:=moyenne_L+d_L;
        moyenne_R:=moyenne_R+d_R;
      end
        else dec(nb_echantillons_valides);
    end;
    moyenne_L:=moyenne_L/nb_echantillons_valides;
    moyenne_R:=moyenne_R/nb_echantillons_valides;

    ecart_type_L:=0;
    ecart_type_R:=0;
    for i:=0 to High(root) do
    begin
      if OPT_OPT=1 then
      begin
        d_L:=calc_dist2Patellas(i,Vec1,Vec2,TSIDE.LEFT);
        d_R:=calc_dist2Patellas(i,Vec1,Vec2,TSIDE.RIGHT);
      end
      else
      begin
        d_L:=calc_dist2Ankles(i,Vec1,Vec2,TSIDE.LEFT);
        d_R:=calc_dist2Ankles(i,Vec1,Vec2,TSIDE.RIGHT);
      end;
      if (d_R<>-1) AND (d_L<>-1) then
      begin
        ecart_type_L:=ecart_type_L+sqr(d_L-moyenne_L);
        ecart_type_R:=ecart_type_R+sqr(d_R-moyenne_R);
      end;
    end;
    ecart_type_L:=ecart_type_L/nb_echantillons_valides;
    ecart_type_L:=sqrt(ecart_type_L);
    ecart_type_R:=ecart_type_R/nb_echantillons_valides;
    ecart_type_R:=sqrt(ecart_type_R);
    result:=1000*(ecart_type_L+ecart_type_R);
end;

Procedure TForm1.Fill_Joints_Center_Tabs;  //calcule les positions exactes (dans le repère GLDummycube1) des articulations de HIP et ANKLE pour chaque FRAME

var
  i:integer;
  M:GLVectorgeometry.Tmatrix;
  xaxis,yaxis,zaxis,Lcenter,Rcenter:GLVectorgeometry.tvector;
  v1,v2,v3,v4:GLVectorgeometry.tvector;

begin
 decimalseparator:='.';
 v1:=vectormake(strtofloat(L_rot_x.Text),strtofloat(L_rot_y.Text),strtofloat(L_rot_z.Text));
 v2:=vectormake(strtofloat(R_rot_x.Text),strtofloat(R_rot_y.Text),strtofloat(R_rot_z.Text));
 v3:=vectormake(strtofloat(L_Ankle_x.Text),strtofloat(L_Ankle_y.Text),strtofloat(L_Ankle_z.Text));
 v4:=vectormake(strtofloat(R_Ankle_x.Text),strtofloat(R_Ankle_y.Text),strtofloat(R_Ankle_z.Text));

 for i:=0 to High(root) do
   begin
     M:=calc_Hip_Matrix(i);
     Lrot_TAB[i]:=v1;Lrot_TAB[i].W:=1;
     Lrot_TAB[i]:=VectorTransform(Lrot_TAB[i],M);
     Rrot_TAB[i]:=v2;Rrot_TAB[i].W:=1;
     Rrot_TAB[i]:=VectorTransform(Rrot_TAB[i],M);

     Lcenter:=vectorscale(vectoradd(vectoradd(LTOE[i],LMT5[i]),LHEE[i]),1/3);
     xaxis:=Vectornormalize(VectorSubtract(vectorscale(vectoradd(LMT5[i],LTOE[i]),0.5),LHEE[i]));
     zaxis:=Vectornormalize(VectorCrossProduct(VectorSubtract(LTOE[i],LMT5[i]),xaxis));
     yaxis:=VectorCrossProduct(zaxis,xaxis);
     M.X:=xaxis;M.Y:=yaxis;M.Z:=zaxis;M.W:=Lcenter;
     LAnkl_TAB[i]:=v3;LAnkl_TAB[i].W:=1;
     LAnkl_TAB[i]:=VectorTransform(LAnkl_TAB[i],M);

     Rcenter:=vectorscale(vectoradd(vectoradd(RTOE[i],RMT5[i]),RHEE[i]),1/3);
     xaxis:=Vectornormalize(VectorSubtract(vectorscale(vectoradd(RMT5[i],RTOE[i]),0.5),RHEE[i]));
     zaxis:=Vectornormalize(VectorCrossProduct(xaxis,VectorSubtract(RTOE[i],RMT5[i])));
     yaxis:=VectorCrossProduct(zaxis,xaxis);
     M.X:=xaxis;M.Y:=yaxis;M.Z:=zaxis;M.W:=Rcenter;
     RAnkl_TAB[i]:=v4;RAnkl_TAB[i].W:=1;
     RAnkl_TAB[i]:=VectorTransform(RAnkl_TAB[i],M);
   end;
end;

procedure TForm1.SAVECapellaClick(Sender: TObject);
begin
    save_ini(1);
end;

procedure TForm1.ChartButtonClick(Sender: TObject);
var
  LKN,RKN:array of GLVectorgeometry.tvector;
  i:integer;
begin
   Fill_Joints_Center_Tabs;

   setlength(LKN,length(root));
   setlength(RKN,length(root));
   for i:=0 to high(root) do
   begin
    LKN[i]:=Build_Shifted_Knee(i,strtofloat(L_Knee_Shift.Text),TSIDE.LEFT);
    RKN[i]:=Build_Shifted_Knee(i,strtofloat(R_Knee_Shift.Text),TSIDE.RIGHT);
   end;

   Lineseries1.Clear;
   Lineseries2.Clear;
   Lineseries3.Clear;
   Lineseries4.Clear;

   for i:=0 to High(Root) do Lineseries1.AddXY(i,1000*vectorlength(vectorsubtract(LRot_TAB[i],LKN[i])),'',clLime);
   for i:=0 to High(Root) do Lineseries2.AddXY(i,1000*vectorlength(vectorsubtract(RRot_TAB[i],RKN[i])),'',clAqua);
   for i:=0 to High(Root) do Lineseries3.AddXY(i,1000*vectorlength(vectorsubtract(LAnkl_TAB[i],LKN[i])),'',clFuchsia);
   for i:=0 to High(Root) do Lineseries4.AddXY(i,1000*vectorlength(vectorsubtract(RAnkl_TAB[i],RKN[i])),'',clblue);

   Lineseries1.Active:=CBLTH.Checked;
   Lineseries2.Active:=CBRTH.Checked;
   Lineseries3.Active:=CBLSH.Checked;
   Lineseries4.Active:=CBRSH.Checked;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
     config:tinifile;
begin
   config := Tinifile.Create('config.ini');
   config.WriteFloat('DISPLAY','CAMERA TARGET POSITION X',GLdummycube1.Position.x);
   config.WriteFloat('DISPLAY','CAMERA TARGET POSITION Y',GLdummycube1.Position.y);
   config.WriteFloat('DISPLAY','CAMERA TARGET POSITION Z',GLdummycube1.Position.z);
   config.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  x:Tvector;
begin
      decimalseparator:='.';
      OPT_OPT:=1;
      DimVector(x,6);
      X[1]:=strtofloat(L_rot_x.Text);
      X[2]:=strtofloat(L_rot_y.Text);
      X[3]:=strtofloat(L_rot_z.Text);
      X[4]:=strtofloat(R_rot_x.Text);
      X[5]:=strtofloat(R_rot_y.Text);
      X[6]:=strtofloat(R_rot_z.Text);
      caption:=floattostr(func(X));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  x:Tvector;
begin
      decimalseparator:='.';
      OPT_OPT:=2;
      DimVector(x,6);
      X[1]:=strtofloat(L_Ankle_x.Text);
      X[2]:=strtofloat(L_Ankle_y.Text);
      X[3]:=strtofloat(L_Ankle_z.Text);
      X[4]:=strtofloat(R_Ankle_x.Text);
      X[5]:=strtofloat(R_Ankle_y.Text);
      X[6]:=strtofloat(R_Ankle_z.Text);
      caption:=floattostr(func(X));
end;

procedure TForm1.Edit_Folder_ProcessingClick(Sender: TObject);
var
   File_List:Tstringlist;
   Info   : TSearchRec;
   i:integer;
   ElapsedTime: TDateTime;
   Y,Mo,D,H,Mi,S,MS : Word;

begin

   ElapsedTime := Now;

   File_List := TStringList.Create;
   If FindFirst(Folder_Name+'\*.csv',faAnyFile,Info)=0 Then
   Begin
      Repeat
       File_List.Add(Info.Name);
      Until
      FindNext(Info)<>0;
      FindClose(Info);
   End;

   for i:=0 to File_List.Count-1 do
   begin
      nom_mocap:=Folder_Name+'\'+File_List[i];
      nb_blocs:=0;
      Load_Exp_marker_Coords(sender);
      init_EditBoxes;
      if nb_blocs>0 then
      begin
       BFGS_Opt(1);
       BFGS_Opt(2);
       LMKneeButtonClick(Sender);
       Calcul_Angles_articulaires(nom_mocap);
       caption:=nom_mocap;
      end;
   end;
  File_List.free;
  ElapsedTime := Now-ElapsedTime;
  DecodeDateTime(ElapsedTime,Y,Mo,D,H,Mi,S,MS);
//  caption:=DateTimeToStr(ElapsedTime);
  caption:='Elapsed Time : '+inttostr(H)+' Hours, '+inttostr(Mi)+' Minutes, '+inttostr(S)+' Seconds, '+inttostr(Ms)+' Milliseconds';

end;

procedure TForm1.init_EditBoxes;
begin
 L_rot_x.Text:='0';
 L_rot_y.Text:='0';
 L_rot_z.Text:='0';
 R_rot_x.Text:='0';
 R_rot_y.Text:='0';
 R_rot_z.Text:='0';
 L_Ankle_x.Text:='0';
 L_Ankle_y.Text:='0';
 L_Ankle_z.Text:='0';
 R_Ankle_x.Text:='0';
 R_Ankle_y.Text:='0';
 R_Ankle_z.Text:='0';
end;

procedure TForm1.DisplayOptionChange(Sender: TObject);
begin
 Lineseries1.Active:=CBLTH.Checked;
 Lineseries2.Active:=CBRTH.Checked;
 Lineseries3.Active:=CBLSH.Checked;
 Lineseries4.Active:=CBRSH.Checked;
end;

procedure TForm1.FolderEditDblClick(Sender: TObject);
begin
     if SelectDirectoryDialog1.Execute then
     begin
      folder_name := SelectDirectoryDialog1.FileName;
      FolderEdit.Text:=folder_name;
     end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  save_ini(0);
end;

procedure TForm1.Edit_Run_Joint_AnglesClick(Sender: TObject);
begin
    Calcul_Angles_articulaires(nom_mocap);
end;

procedure TForm1.Calcul_Angles_articulaires(filename:string);
var
  xaxis,yaxis,zaxis,LCenter,RCenter:GLVectorgeometry.Tvector;
  M,LShank,RShank,LThigh,RThigh:GLVectorgeometry.Tmatrix;
  outputfile:textfile;
  Q:TQuaternion;
  i:integer;
  LKN,RKN:array of GLVectorgeometry.tvector;
  LEN_LSH,LEN_RSH,LEN_LTH,LEN_RTH:double;
  LKNEE_ANGLE,RKNEE_ANGLE:double;
  v1,v2,v3,v4:GLVectorgeometry.tvector;


begin

  //Folder_out_Name:='\\ssanasva2\pierre.lemerle\OUT\';
  //Folder_out_Name:='\\ssanasva2\Video_PMT$\VICON DATA MOBY DECK\IK results\';

  v1:=vectormake(strtofloat(L_rot_x.Text),strtofloat(L_rot_y.Text),strtofloat(L_rot_z.Text));
  v2:=vectormake(strtofloat(R_rot_x.Text),strtofloat(R_rot_y.Text),strtofloat(R_rot_z.Text));
  v3:=vectormake(strtofloat(L_Ankle_x.Text),strtofloat(L_Ankle_y.Text),strtofloat(L_Ankle_z.Text));
  v4:=vectormake(strtofloat(R_Ankle_x.Text),strtofloat(R_Ankle_y.Text),strtofloat(R_Ankle_z.Text));

  //MAJ des positions des articulations calculées.
  Fill_Joints_Center_Tabs;

  setlength(LKN,length(root));
  setlength(RKN,length(root));

  //Calcul des positions réelles des genoux
  for i:=0 to high(root) do
  begin
   LKN[i]:=Build_Shifted_Knee(i,strtofloat(L_Knee_Shift.Text),TSIDE.LEFT);
   RKN[i]:=Build_Shifted_Knee(i,strtofloat(R_Knee_Shift.Text),TSIDE.RIGHT);
  end;

  if Folder_out_Name='' then
  nom_ik:=Start_Folder+extractfilename(ChangeFileExt(filename,'.ik'))
  else
  nom_ik:=Folder_out_Name+extractfilename(ChangeFileExt(filename,'.ik'));

  assignfile(outputfile,nom_ik);
  rewrite(outputfile);

  Writeln(outputfile,'HIP FRAME : Center=Barycenter(LASI,RASI,Root,LPSI); Y=LASI-RASI; Z=(LASI-Root)^Y; X=Y^Z');
  Writeln(outputfile,'LEFT ANKLE FRAME : Center=Barycenter(LTOE,LMT5,LHEE); X=Center(LMT5,LTOE)-LHEE; Z=(LTOE-LMT5)^X; Y=Z^X');
  Writeln(outputfile,'RIGHT ANKLE FRAME : Center=Barycenter(RTOE,RMT5,RHEE); X=Center(RMT5,RTOE)-RHEE; Z=X^(RTOE-RMT5); Y=Z^X');
  Writeln(outputfile,'');
  Writeln(outputfile,'LEFT FEMORAL HEAD POSITION (LOCAL COORD / HIP FRAME) : '+floattostrf(v1.X,fffixed,6,4)+'  '+floattostrf(v1.Y,fffixed,6,4)+'  '+floattostrf(v1.Z,fffixed,6,4));
  Writeln(outputfile,'RIGHT FEMORAL HEAD POSITION (LOCAL COORD / HIP FRAME) : '+floattostrf(v2.X,fffixed,6,4)+'  '+floattostrf(v2.Y,fffixed,6,4)+'  '+floattostrf(v2.Z,fffixed,6,4));
  Writeln(outputfile,'LEFT ANKLE POSITION (LOCAL COORD/ LEFT ANKLE FRAME) : '+floattostrf(v3.X,fffixed,6,4)+'  '+floattostrf(v3.Y,fffixed,6,4)+'  '+floattostrf(v3.Z,fffixed,6,4));
  Writeln(outputfile,'RIGHT ANKLE POSITION (LOCAL COORD/ RIGHT ANKLE FRAME) : '+floattostrf(v4.X,fffixed,6,4)+'  '+floattostrf(v4.Y,fffixed,6,4)+'  '+floattostrf(v4.Z,fffixed,6,4));
  Writeln(outputfile,'');
  Writeln(outputfile,'LEFT KNEE SHIFT (ALONG KNEE PIVOT JOINT) : '+L_Knee_Shift.Text);
  Writeln(outputfile,'RIGHT KNEE SHIFT (ALONG KNEE PIVOT JOINT) : '+R_Knee_Shift.Text);
  Writeln(outputfile,'');

  LEN_LSH:=0;
  LEN_RSH:=0;
  LEN_LTH:=0;
  LEN_RTH:=0;

  for i:=0 to High(root) do
  begin
    LEN_LTH:=LEN_LTH+VectorLength(vectorsubtract(LKN[i],Lrot_TAB[i]));
    LEN_RTH:=LEN_RTH+VectorLength(vectorsubtract(RKN[i],Rrot_TAB[i]));
    LEN_LSH:=LEN_LSH+VectorLength(vectorsubtract(LKN[i],LAnkl_TAB[i]));
    LEN_RSH:=LEN_RSH+VectorLength(vectorsubtract(RKN[i],RAnkl_TAB[i]));
  end;

  LEN_LTH:=LEN_LTH/Length(root);
  LEN_RTH:=LEN_RTH/Length(root);
  LEN_LSH:=LEN_LSH/Length(root);
  LEN_RSH:=LEN_RSH/Length(root);

  //Calcul des longueurs
  //Fémur Gauche
  Writeln(outputfile,'LEFT FEMOR LENGTH : '+'  '+floattostrf(LEN_LTH,fffixed,6,4));
  //Fémur Droit
  Writeln(outputfile,'RIGHT FEMOR LENGTH : '+'  '+floattostrf(LEN_RTH,fffixed,6,4));
  //Tibia Gauche
  Writeln(outputfile,'LEFT TIBIA LENGTH : '+'  '+floattostrf(LEN_LSH,fffixed,6,4));
  //Tibia Droit
  Writeln(outputfile,'RIGHT TIBIA LENGTH : '+'  '+floattostrf(LEN_RSH,fffixed,6,4));

  Writeln(outputfile,'');

 for i:=0 to high(Root) do
  begin
    writeln(outputfile,'TIMESTEP : '+inttostr(i));

    LThigh.X:=Vectornormalize(Vectorsubtract(LKN[i],Lrot_TAB[i]));
    LShank.X:=Vectornormalize(Vectorsubtract(LAnkl_TAB[i],LKN[i]));
    LThigh.Y:=Vectornormalize(VectorCrossProduct(LThigh.X,Vectoradd(LShank.X,LThigh.X)));
    LShank.Y:=LThigh.Y;
    LThigh.Z:=Vectornormalize(VectorCrossProduct(LThigh.X,LThigh.Y));
    LShank.Z:=Vectornormalize(VectorCrossProduct(LShank.X,LShank.Y));

    RThigh.X:=Vectornormalize(Vectorsubtract(RKN[i],Rrot_TAB[i]));
    RShank.X:=Vectornormalize(Vectorsubtract(RAnkl_TAB[i],RKN[i]));
    RThigh.Y:=Vectornormalize(VectorCrossProduct(RThigh.X,Vectoradd(RShank.X,RThigh.X)));
    RShank.Y:=RThigh.Y;
    RThigh.Z:=Vectornormalize(VectorCrossProduct(RThigh.X,RThigh.Y));
    RShank.Z:=Vectornormalize(VectorCrossProduct(RShank.X,RShank.Y));

    LKNEE_ANGLE:=RadtoDeg(GLVectorGeometry.ArcCos(VectorAngleCosine(LThigh.X,LShank.X)));
    RKNEE_ANGLE:=RadtoDeg(GLVectorGeometry.ArcCos(VectorAngleCosine(RThigh.X,RShank.X)));

    M:=calc_Hip_Matrix(i);
    Q:=QuaternionFromMatrix(M);
    Writeln(outputfile,' ');
    Writeln(outputfile,'HIP MATRIX : '+'  '+floattostr(M.x.x)+'  '+floattostr(M.y.x)+'  '+floattostr(M.z.x));
    Writeln(outputfile,'                  : '+'  '+floattostr(M.x.y)+'  '+floattostr(M.y.y)+'  '+floattostr(M.z.y));
    Writeln(outputfile,'                  : '+'  '+floattostr(M.x.z)+'  '+floattostr(M.y.z)+'  '+floattostr(M.z.z));
    Writeln(outputfile,' ');
    Writeln(outputfile,'HIP QUATERNION : '+'  '+floattostr(Q.RealPart)+'  '+floattostr(Q.ImagPart.X)+'  '+floattostr(Q.ImagPart.Y)+'  '+floattostr(Q.ImagPart.Z));

    InvertMatrix(M);
    LThigh:=MatrixMultiply(LThigh,M);
    Q:=QuaternionFromMatrix(LThigh);
    Writeln(outputfile,' ');
    Writeln(outputfile,'LEFT THIGH MATRIX : '+'  '+floattostr(LThigh.x.x)+'  '+floattostr(LThigh.y.x)+'  '+floattostr(LThigh.z.x));
    Writeln(outputfile,'                  : '+'  '+floattostr(LThigh.x.y)+'  '+floattostr(LThigh.y.y)+'  '+floattostr(LThigh.z.y));
    Writeln(outputfile,'                  : '+'  '+floattostr(LThigh.x.z)+'  '+floattostr(LThigh.y.z)+'  '+floattostr(LThigh.z.z));
    Writeln(outputfile,' ');
    Writeln(outputfile,'LEFT THIGH QUATERNION : '+'  '+floattostr(Q.RealPart)+'  '+floattostr(Q.ImagPart.X)+'  '+floattostr(Q.ImagPart.Y)+'  '+floattostr(Q.ImagPart.Z));

    RThigh:=MatrixMultiply(RThigh,M);
    Q:=QuaternionFromMatrix(RThigh);
    Writeln(outputfile,' ');
    Writeln(outputfile,'RIGHT THIGH MATRIX : '+'  '+floattostr(RThigh.x.x)+'  '+floattostr(RThigh.y.x)+'  '+floattostr(RThigh.z.x));
    Writeln(outputfile,'                  : '+'  '+floattostr(RThigh.x.y)+'  '+floattostr(RThigh.y.y)+'  '+floattostr(RThigh.z.y));
    Writeln(outputfile,'                  : '+'  '+floattostr(RThigh.x.z)+'  '+floattostr(RThigh.y.z)+'  '+floattostr(RThigh.z.z));
    Writeln(outputfile,' ');
    Writeln(outputfile,'RIGHT THIGH QUATERNION : '+'  '+floattostr(Q.RealPart)+'  '+floattostr(Q.ImagPart.X)+'  '+floattostr(Q.ImagPart.Y)+'  '+floattostr(Q.ImagPart.Z));

    Writeln(outputfile,'LEFT KNEE ANGLE : '+floattostr(LKNEE_ANGLE));
    Writeln(outputfile,'RIGHT KNEE ANGLE : '+floattostr(RKNEE_ANGLE));

    Lcenter:=vectorscale(vectoradd(vectoradd(LTOE[i],LMT5[i]),LHEE[i]),1/3);
    xaxis:=Vectornormalize(VectorSubtract(vectorscale(vectoradd(LMT5[i],LTOE[i]),0.5),LHEE[i]));
    zaxis:=Vectornormalize(VectorCrossProduct(VectorSubtract(LTOE[i],LMT5[i]),xaxis));
    yaxis:=VectorCrossProduct(zaxis,xaxis);
    M.X:=xaxis;M.Y:=yaxis;M.Z:=zaxis;M.W:=Lcenter;M.W.W:=1;
    InvertMatrix(LShank);
    M:=MatrixMultiply(M,LShank);
    Q:=QuaternionFromMatrix(M);
    Writeln(outputfile,'LEFT ANKLE QUATERNION : '+'  '+floattostr(Q.RealPart)+'  '+floattostr(Q.ImagPart.X)+'  '+floattostr(Q.ImagPart.Y)+'  '+floattostr(Q.ImagPart.Z));

    Rcenter:=vectorscale(vectoradd(vectoradd(RTOE[i],RMT5[i]),RHEE[i]),1/3);
    xaxis:=Vectornormalize(VectorSubtract(vectorscale(vectoradd(RMT5[i],RTOE[i]),0.5),RHEE[i]));
    zaxis:=Vectornormalize(VectorCrossProduct(xaxis,VectorSubtract(RTOE[i],RMT5[i])));
    yaxis:=VectorCrossProduct(zaxis,xaxis);
    M.X:=xaxis;M.Y:=yaxis;M.Z:=zaxis;M.W:=Rcenter;M.W.W:=1;
    InvertMatrix(RShank);
    M:=MatrixMultiply(M,RShank);
    Q:=QuaternionFromMatrix(M);
    Writeln(outputfile,'RIGHT ANKLE QUATERNION : '+'  '+floattostr(Q.RealPart)+'  '+floattostr(Q.ImagPart.X)+'  '+floattostr(Q.ImagPart.Y)+'  '+floattostr(Q.ImagPart.Z));

  end;
  closefile(outputfile);
end;

procedure TForm1.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
     s:string;
     begin
 if button = mbRight then
 begin
   s:='1) Charger un fichier de Motion Capture VICON au format .csv en double-cliquant dans la boîte d''édition "Input Mocap File"'
   +char(13)
   +char(13)
  +'2) Déterminer les positions des têtes de fémur : cliquer sur "Broyden-Fletcher-Golfarb-Shanno" '+
  ' dans l''encart "Hip Joint Centers"'
  +char(13)
  +char(13)
  +'3) Déterminer les positions des chevilles : cliquer sur "Broyden-Fletcher-Golfarb-Shanno" '+
  ' dans l''encart "Ankle Centers"'
  +char(13)
  +char(13)
  +'4) Déterminer les positions réelles des genoux : cliquer sur "Find Max Feasible Shift" '+
  ' dans l''encart "Knee Joint Centers". Les marqueurs VICON sont positionnés sur la peau, on doit donc les décaler sur'+
  ' les axes de rotation des genoux pour les replacer aux centres des genoux."'
  +char(13)
  +char(13)
  +'5) Cliquer sur "Compute Joint Angles" pour sauvegarder l''évolution des variables cinématiques de l''essai dans un fichier homonyme du fichier Mocap'
  +' avec l''extension .ik. '
  +char(13)
  +char(13)
  +'6) Cliquer sur ''Folder Processing'' pour effectuer l''analyse complète (calcul automatiques des centres d''articulations '
  +' et sauvegarde des données cinématiques) pour tous les fichiers MoCap présents dans le dossier "MoCap Data Folder" et '
  +'sauvegarder les résultats dans le dossier spécifié dans le fichier ''config.ini'' (voir [RESULT FOLDER]).'
  +char(13)
  +char(13)
  +'Cliquer sur "Display Lower limb''s Length" pour visualiser la longueur du membre de la jambe (cuisse ou tibia)'
  +'calculée à partir des centres de rotation optimisés (pelvis ou cheviles)';
 end
else
begin
 s:='1) Load a VICON MoCap file by double-clicking the edit box named "Input Mocap File"'
 +char(13)
  +char(13)
  +'2) In the "Ankle Centers" box, press "Broyden-Fletcher-Golfarb-Shanno" to compute the rotation centers of the hip.'
  +char(13)
  +char(13)
  +'3) In the "Hip Joint Centers" box, press "Broyden-Fletcher-Golfarb-Shanno" to compute the rotation centers of the ankles'
 +char(13)
 +char(13)
  +'4) In the "Knee Joint Centers" box, click on "Find Max Feasible Shift" to compute the rotation center shifts of the knees '+
  'along the pivot pins (the VICON markers are set on the skin then not exactly on the pin centers of the knees). This optimization '+
  'computes the exact shift to move the marker in the center of the knee.'
  +char(13)
  +char(13)
  +'5) Click on  "Compute Joint Angles" to compute the kinematics variables of the whole test and save it in a file with the extension .ik. '
  +char(13)
  +char(13)
  +'6) Click on ''Folder Processing'' to process all the files present in the selected folder ("MoCap Data Folder"). '+
  'This means for each Mocap File in the folder, optimize all the Center positions and save the kinematics variables in the corresponding output files '
  +'in the folder specified in the config file ''config.ini'' (see section [RESULT FOLDER])).'
  +char(13)
  +char(13)
  +'Press "Display Lower limb''s Length" to visualize the variation of the leg''s lenght (shank body or thigh body) all along the experimental test and'
  +' given the set of coordinates for the rotation centers.';
 end;
 showmessage(s);
end;

procedure TForm1.CheckBoxChange(Sender: TObject);
begin
  pelvis_center.ShowAxes:=checkbox1.Checked;
  LFoot_center.ShowAxes:=checkbox2.Checked;
  RFoot_center.ShowAxes:=checkbox3.Checked;
  LKnee_Center.ShowAxes:=checkbox5.Checked;
  RKnee_Center.ShowAxes:=checkbox6.Checked;
  GLLASI.visible:=checkbox7.Checked;
  GLRASI.visible:=checkbox7.Checked;
  GLRoot.visible:=checkbox7.Checked;
  GLLPSI.visible:=checkbox7.Checked;
  GLLANK.visible:=checkbox8.Checked;
  GLLTOE.visible:=checkbox8.Checked;
  GLLMT5.visible:=checkbox8.Checked;
  GLLHEE.visible:=checkbox8.Checked;
  GLRANK.visible:=checkbox8.Checked;
  GLRTOE.visible:=checkbox8.Checked;
  GLRMT5.visible:=checkbox8.Checked;
  GLRHEE.visible:=checkbox8.Checked;
  GLLKNEE.visible:=checkbox9.Checked;
  GLRKNEE.visible:=checkbox9.Checked;
  GLLTHI.visible:=checkbox10.Checked;
  GLRTHI.visible:=checkbox10.Checked;
  RealLKNEE.Visible:=checkbox4.Checked;
  RealRKNEE.Visible:=checkbox4.Checked;
  GLLLeg.Visible:=checkbox4.Checked;
  GLRLeg.Visible:=checkbox4.Checked;
  GLFemur_R.Visible:=checkbox11.Checked;
  GLFemur_L.Visible:=checkbox11.Checked;
  GLTibia_R.Visible:=checkbox11.Checked;
  GLTibia_L.Visible:=checkbox11.Checked;
  GLFoot_R.Visible:=checkbox11.Checked;
  GLFoot_L.Visible:=checkbox11.Checked;
  GLhip.Visible:=checkbox11.Checked;
end;

procedure TForm1.LMKneeButtonClick(Sender: TObject);
var
  shift_L:double=0;
  shift_R:double=0;
  step:double;
  feasible:boolean;
  i:integer;
  v:GLVectorgeometry.tvector;

begin
   step:=0.001;
   if nb_blocs>0 then
   begin
     Fill_Joints_Center_Tabs;
     feasible:=TRUE;
     while feasible AND (abs(shift_L)<1) do
     begin
      shift_L:=shift_L-step;
      for i:=0 to High(root) do
      begin
        v:=Build_Shifted_Knee(i,shift_L,TSIDE.LEFT);
        if vectorequals(v,WHmgVector) then feasible:=FALSE;
      end;
     end;
     feasible:=TRUE;
     while feasible AND (abs(shift_R)<1)  do
     begin
      shift_R:=shift_R+step;
      for i:=0 to High(root) do
      begin
        v:=Build_Shifted_Knee(i,shift_R,TSIDE.RIGHT);
        if vectorequals(v,WHmgVector) then feasible:=FALSE;
      end;
     end;
     L_Knee_Shift.Text:=floattostrf(shift_L+step,fffixed,6,4);
     R_Knee_Shift.Text:=floattostrf(shift_R-step,fffixed,6,4);
     TrackBar1Change(self);
   end;
end;

procedure TForm1.L_Knee_ShiftChange(Sender: TObject);
var
  out:double;
begin
   if not(TryStrToFloat(Tlabelededit(Sender).text,out)) then L_Knee_Shift.Text:='0';
      centers_updated:=TRUE;
end;

procedure TForm1.R_Knee_ShiftChange(Sender: TObject);
var
  out:double;
begin
   if not(TryStrToFloat(Tlabelededit(Sender).text,out)) then R_Knee_Shift.Text:='0';
      centers_updated:=TRUE;
end;

procedure TForm1.SAVEAnkle1Click(Sender: TObject);
begin
  save_ini(3);
end;

procedure TForm1.SAVEAnkleClick(Sender: TObject);
begin
  save_ini(2);
end;

procedure TForm1.BFGS_Opt(Option:Integer);
CONST
  // constantes de Dmath
    MaxIter = 3000;    { Max number of iterations }
    Tol     = 1.0E-6;  { Required precision }

var
  X:TVector;
  Center:TVector;
  H_inv : TMatrix;  { Inverse Hessian matrix }
  F_min : double;    { Function value at minimum }
  //Det   : double;    { Determinant of hessian }

begin

    decimalseparator:='.';

    OPT_OPt:=Option;
    NVar:=6;
    DimVector(X, Nvar);
    DimVector(Center, Nvar);
    DimMatrix(H_inv, Nvar, Nvar);

    case Option of
    1:
    begin
      X[1]:=strtofloat(L_rot_x.Text);
      X[2]:=strtofloat(L_rot_y.Text);
      X[3]:=strtofloat(L_rot_z.Text);
      X[4]:=strtofloat(R_rot_x.Text);
      X[5]:=strtofloat(R_rot_y.Text);
      X[6]:=strtofloat(R_rot_z.Text);
    end;
    2:
    begin
      X[1]:=strtofloat(L_Ankle_x.Text);
      X[2]:=strtofloat(L_Ankle_y.Text);
      X[3]:=strtofloat(L_Ankle_z.Text);
      X[4]:=strtofloat(R_Ankle_x.Text);
      X[5]:=strtofloat(R_Ankle_y.Text);
      X[6]:=strtofloat(R_Ankle_z.Text);
    end;
    end;

  //SaveBFGS('bfgs.txt');
  BFGS(Func, Gradient, X, 1, Nvar, MaxIter, Tol, F_min, Center, H_inv);
  {if MathErr = OptNonConv then
    begin
      showmessage('Non-convergence!');
      Halt;
    end; }

  {
  SaveMarquardt('marquard.txt');
  Marquardt(Func, HessGrad, X, 1, Nvar, MaxIter, Tol, F_min, Center, H_inv, Det);
  case MathErr of
  OptNonConv :
    begin
      showmessage('Non-convergence!');
      Halt;
    end;
  OptSing :
    begin
      showmessage('Singular Hessian matrix!');
      Halt;
    end;
  OptBigLambda :
    begin
      showmessage('Too high Marquardt parameter!');
      Halt;
    end;
  end;
  }
  {
  SaveSimplex('SaveSimplex.txt');
  Simplex(Func, X, 1,Nvar, MaxIter, Tol, F_min);
  if MathErr = OptNonConv then
    begin
      showmessage('Non-convergence!');
      Halt;
    end;
    }

    case Option of
    1:
    begin
      L_rot_x.Text:=floattostrf(X[1],fffixed,6,4);
      L_rot_y.Text:=floattostrf(X[2],fffixed,6,4);
      L_rot_z.Text:=floattostrf(X[3],fffixed,6,4);
      R_rot_x.Text:=floattostrf(X[4],fffixed,6,4);
      R_rot_y.Text:=floattostrf(X[5],fffixed,6,4);
      R_rot_z.Text:=floattostrf(X[6],fffixed,6,4);
    end;
    2:
    begin
      L_Ankle_x.Text:=floattostrf(X[1],fffixed,6,4);
      L_Ankle_y.Text:=floattostrf(X[2],fffixed,6,4);
      L_Ankle_z.Text:=floattostrf(X[3],fffixed,6,4);
      R_Ankle_x.Text:=floattostrf(X[4],fffixed,6,4);
      R_Ankle_y.Text:=floattostrf(X[5],fffixed,6,4);
      R_Ankle_z.Text:=floattostrf(X[6],fffixed,6,4);
    end;

    end;

//  caption:=floattostr(Func(X));

end;

end.

