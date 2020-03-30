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
    FXHR: TJSXMLHttpRequest;
    procedure DoTimerTick;
    procedure EnableTick;
    function onLoad(Event: TEventListenerEvent): boolean;
  public
    constructor Create(aOwner: TComponent); override;
    procedure Start;
  end;


implementation


{ TTestWeb }

procedure TTestWeb.DoTimerTick;
begin
  FTimerTag.innerHTML := TimeToStr(time);

  Fxhr := TJSXMLHttpRequest.New;
  Fxhr.addEventListener('load', @OnLoad);
  Fxhr.Open('GET', 'countries.json', True);
  Fxhr.send;
end;

procedure TTestWeb.EnableTick;
begin
  FInterval := window.setInterval(@DoTimerTick, FInterval);
end;

function TTestWeb.onLoad(Event: TEventListenerEvent): boolean;
begin
  Writeln(FXHR.Status);
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




