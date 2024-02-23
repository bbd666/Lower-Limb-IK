unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  GLScene, GLViewer, GLObjects, GLGeomObjects, Types, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    GLCamera1: TGLCamera;
    GLDummyCube3: TGLDummyCube;
    GLFoot_R: TGLCube;
    GLLightSource1: TGLLightSource;
    GLShank_R: TGLCapsule;
    GLThigh_R: TGLCapsule;
    GLFoot_L: TGLCube;
    GLShank_L: TGLCapsule;
    GLThigh_L: TGLCapsule;
    GLDummyCube1: TGLDummyCube;
    GLDummyCube2: TGLDummyCube;
    GLHIP: TGLFrustrum;
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    LabeledEdit1: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GLSceneViewer1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure LabeledEdit1DblClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  mx,my:double;
  nom_mocap:string;

implementation

{$R *.lfm}

{ TForm1 }

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

procedure TForm1.LabeledEdit1DblClick(Sender: TObject);
begin
    if OpenDialog1.Execute then
     begin
      nom_mocap := OpenDialog1.FileName;
      LabeledEdit1.Text:=OpenDialog1.FileName;
    //  Load_Exp_marker_Coords(sender);
     end;
end;

end.

