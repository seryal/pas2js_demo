unit utestweb;

{$mode objfpc}

interface

uses
  Classes, SysUtils, browserapp, web;

type

  { TTestWeb }

  TTestWeb = class(TComponent)
  private
    // interval for check data
    FInterval: NativeInt;
    FBodyTag: TJSHTMLElement;
    FTimerTag: TJSHTMLElement;
    procedure DoTimerTick;
    procedure EnableTick;
  public
    constructor Create(aOwner: TComponent); override;
    procedure Start;
  end;


implementation


{ TTestWeb }

procedure TTestWeb.DoTimerTick;
begin
  FTimerTag.innerHTML := TimeToStr(time);
end;

procedure TTestWeb.EnableTick;
begin
  FInterval := window.setInterval(@DoTimerTick, FInterval);
end;

constructor TTestWeb.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FInterval := 1000;
end;

procedure TTestWeb.Start;
begin
  FBodyTag := TJSHTMLElement(document.getElementsByTagName('body')[0]);
  FTimerTag := TJSHTMLElement(document.getElementById('mydiv'));
  FTimerTag.innerHTML := TimeToStr(time);
  EnableTick;
end;

initialization


end.




