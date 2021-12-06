unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    StatusBar: TStatusBar;
    SaveDialog1: TSaveDialog;
    pgcMain: TPageControl;
    ts1: TTabSheet;
    FPSLabel: TLabel;
    btnRecBtn: TButton;
    chk1: TCheckBox;
    btnStopBtn: TButton;
    ts2: TTabSheet;
    Label1: TLabel;
    cbbvcodec: TComboBox;
    trackbar: TTrackBar;
    ts3: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    procedure TrackBar1Change(Sender: TObject);
    procedure btnRecBtnClick(Sender: TObject);
    procedure btnStopBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  FPSLabel.Caption:='FPS: ' + IntToStr(trackbar.Position)
end;

function CreateProc(const FileName, Params: string; WindowState: Word): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
  h : HWND;
  pid: DWord;
begin
  CmdLine := '"' + FileName + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb:= SizeOf(SUInfo);
    dwFlags:= CREATE_NO_WINDOW;
    wShowWindow:= WindowState;
  end;

  Result:=CreateProcess(nil, PChar(CmdLine), nil, nil, False, CREATE_NEW_PROCESS_GROUP or NORMAL_PRIORITY_CLASS, nil, PChar(ExtractFilePath(FileName)), SUInfo, ProcInfo);
end;

procedure TForm1.btnRecBtnClick(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + 'ffmpeg.exe') then
  begin
   MessageDlg('FFmpeg not found', mtError, [mbOK], 0);
   Exit;
  end
  else
  begin
  if not SaveDialog1.Execute then Exit;
  StatusBar.SimpleText:='Recording...';
  ShellExecute(handle,'open', PAnsiChar(ExtractFilePath(ParamStr(0)) + 'ffmpeg.exe'), PAnsiChar('-y -rtbufsize 100M -f gdigrab -framerate ' + IntToStr(trackbar.Position) + ' -probesize 10M -draw_mouse ' + IntToStr(Integer(chk1.Checked)) + ' -i desktop -vcodec ' + cbbvcodec.Text + ' ' + '-r 30 -preset ultrafast -tune zerolatency -crf 25 -pix_fmt yuv420p "' + SaveDialog1.FileName + '"'), nil, SW_HIDE);
  btnRecBtn.Enabled:=false;
  btnStopBtn.Enabled:=true;
  end;

end;

procedure TForm1.btnStopBtnClick(Sender: TObject);
var
  ffmpegWindow: HWND;
begin
  StatusBar.SimpleText:='Stopped';
  ffmpegWindow:=FindWindow(nil, PAnsiChar(ExtractFilePath(ParamStr(0)) + 'ffmpeg.exe'));
  SendMessage(ffmpegWindow, WM_CLOSE, 0, 0);
  SendMessage(ffmpegWindow, WM_CLOSE, 0, 0);

  btnStopBtn.Enabled:=false;
  btnRecBtn.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.Title:=Caption;
end;

end.
