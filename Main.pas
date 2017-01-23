{------------------------------------------}
{                                          }
{             (c) 2017 by Aone             }
{                                          }
{              QQ: 1467948783              }
{                                          }
{      http://www.cnblogs.com/onechen      }
{                                          }
{------------------------------------------}
{            Start: 2017.01.23             }
{------------------------------------------}

unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.EditBox, FMX.SpinBox, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Selection1: TSelection;
    ToolBar1: TToolBar;
    SpinBox1: TSpinBox;
    Label1: TLabel;
    procedure SpinBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
  private
    RetinaScale: Single;
    Bitmap: TBitmap;
    procedure Render(const Width, Height: Single);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
     RetinaScale := Self.Canvas.Scale;

     Bitmap := TBitmap.Create;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
begin
     Render(PaintBox1.Width, PaintBox1.Height);
     Canvas.DrawBitmap(Bitmap, RectF(0, 0, Bitmap.Width, Bitmap.Height), PaintBox1.LocalRect, 1);
end;

procedure TForm1.Render(const Width, Height: Single);
var R: TRectF;
begin
     Bitmap.Resize(Trunc(Width * RetinaScale), Trunc(Height * RetinaScale));
     Bitmap.Clear(0);
     Bitmap.Canvas.BeginScene(nil);

     Bitmap.Canvas.Stroke.Thickness := SpinBox1.Value;

     R := RectF(0, 0, Bitmap.Width, Bitmap.Height);
     InflateRect(R, -SpinBox1.Value / 2, -SpinBox1.Value / 2);

     Bitmap.Canvas.DrawRect(R, 50, 50, AllCorners, 1);

     InflateRect(R, -10, -10);
     Bitmap.Canvas.DrawEllipse(R, 1);

     Bitmap.Canvas.EndScene;
end;

procedure TForm1.SpinBox1Change(Sender: TObject);
begin
     PaintBox1.Repaint;
end;

end.
