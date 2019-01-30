unit procedure_module;

interface

type
    tFunc = function (x : extended):extended;

procedure inputData(var a, b, eps : double; var split1, split2 : integer);

procedure computingMethod1(a, b, eps : double; var split1, split2, it1, it2 : longint; var s1, s2: extended; func : tFunc);

procedure computingMethod2(a, b, eps : double; var split1, split2, it1, it2 : longint; var s1, s2: extended; func : tFunc);

procedure computingMethod3(a, b, eps : double; var split1, split2, it1, it2 : longint; var s1, s2: extended; func : tFunc);

procedure computingMethod4(a, b, eps : double; var split1, split2, it1, it2 : longint; var s1, s2: extended; func : tFunc);

function quadraticFunc(x : extended):extended;

function lnFunc(x : extended):extended;

function trigonometryFunc(x : extended):extended;

implementation

procedure inputData(var a, b, eps : double; var split1, split2 : integer);
          begin
               writeln('     1. Ввод данных. ');
               writeln('Для метода кубических парабол разбиение должно быть кратно 3,');
               writeln('а для метода Уэддля - кратно 6. ');
               writeln;
               write('Введите начало интервала: ');
               readln(a);
               write('Введите конец интервала: ');
               readln(b);
               write('Введите точность вычислений: ');
               readln(eps);
               write('Введите начальное разбиение 1: ');
               readln(split1);
               write('Введите начальное разбиение 2: ');
               readln(split2);
          end;

procedure computingMethod1(a, b, eps : double; var split1, split2, it1, it2 : longint; var s1, s2: extended; func : tFunc);
          var
             i : longint;
             h, s3, x : extended;
          begin
               s1:=0;
               s2:=0;
               it1:=0;
               it2:=0;
               repeat
                     inc(it1);
                     s3:=s1;
                     s1:=0;
                     h:=(b-a)/split1;
                     x:=a;
                     for i:=0 to split1-1 do begin
                         s1:=s1+func(x+h/2);
                         x:=x+h;
                     end;
                     s1:=s1*h;
                     split1:=split1*2;
               until (abs(s1-s3)<eps);
               repeat
                     inc(it2);
                     s3:=s2;
                     s2:=0;
                     h:=(b-a)/split2;
                     x:=a;
                     for i:=0 to split2-1 do begin
                         s2:=s2+func(x+h/2);
                         x:=x+h;
                     end;
                     s2:=s2*h;
                     split2:=split2*2;
               until (abs(s2-s3)<eps);
          end;

procedure computingMethod2(a, b, eps : double; var split1, split2, it1, it2 : longint; var s1, s2: extended; func : tFunc);
          var
              i : longint;
              h, s3, x : double;

          begin
               s1:=0;
               s2:=0;
               it1:=0;
               it2:=0;
               repeat
                     inc(it1);
                     s3:=s1;
                     s1:=0;
                     h:=(b-a)/split1;
                     x:=a;
                     for i:=1 to split1 do begin
                         s1:=s1+func(x);
                         x:=x+h;
                     end;
                     s1:=((func(a)+func(b))/2+s1)*h;
                     split1:=split1*2;
               until (abs(s1-s3)<eps);
               repeat
                     inc(it2);
                     s3:=s2;
                     s2:=0;
                     h:=(b-a)/split2;
                     x:=a;
                     for i:=1 to split2 do begin
                         s2:=s2+func(x);
                         x:=x+h;
                     end;
                     s2:=((func(a)+func(b))/2+s2)*h;
                     split2:=split2*2;
               until (abs(s2-s3)<eps);
          end;

procedure computingMethod3(a, b, eps : double; var split1, split2, it1, it2 : longint; var s1, s2: extended; func : tFunc);
          var
              i : longint;
              h, s3, x, t1, t2 : extended;

          begin
            if (split1 mod 3 = 0) and (split2 mod 3 = 0) then
                begin
                  s1:=0;
                  s2:=0;
                  it1:=0;
                  it2:=0;
                  repeat
                     t1:=0;
                     t2:=0;
                     inc(it1);
                     s3:=s1;
                     s1:=0;
                     h:=(b-a)/split1;
                     x:=a;
                     for i:=1 to split1-1 do begin
                          x:=x+h;
                         if i mod 3 = 0 then
                            t1:=t1+2*func(x)
                              else
                                t2:=t2+3*func(x);
                     end;
                     s1:=3*h/8*(func(a)+func(b)+t1+t2);
                     split1:=split1*2;
                  until (abs(s1-s3)<eps);
                   repeat
                     t1:=0;
                     t2:=0;
                     inc(it2);
                     s3:=s2;
                     s2:=0;
                     h:=(b-a)/split2;
                     x:=a;
                     for i:=1 to split2-1 do begin
                          x:=x+h;
                         if i mod 3 = 0 then
                            t1:=t1+2*func(x)
                              else
                                t2:=t2+3*func(x);

                     end;
                     s2:=3*h/8*(func(a)+func(b)+t1+t2);
                     split2:=split2*2;
                  until (abs(s2-s3)<eps);
                end
                  else
                    begin
                      writeln;
                      writeln('Вычисление по методу кубических парабол произведено не было! ');
                    end;
          end;

procedure computingMethod4(a, b, eps : double; var split1, split2, it1, it2 : longint; var s1, s2: extended; func : tFunc);
          var
              i : longint;
              h, s3, x, t1, t2, t3, t4 : extended;

          begin
           if (split1 mod 6 = 0) and (split2 mod 6 = 0) then
              begin
                  s1:=0;
                  s2:=0;
                  it1:=0;
                  it2:=0;
                  repeat
                     t1:=0;
                     t2:=0;
                     t3:=0;
                     t4:=0;
                     inc(it1);
                     s3:=s1;
                     s1:=0;
                     h:=(b-a)/split1;
                     x:=a;
                     for i:=1 to split1-1 do begin
                          x:=x+h;
                         if i mod 6 = 0 then
                          t1:=t1+82*func(x)
                            else if i mod 3 = 0 then
                              t4:=t4+272*func(x)
                                else if i mod 2 = 0 then
                                  t3:=t3+27*func(x)
                                    else
                                      t2:=t2+216*func(x);
                     end;
                     s1:=6*h/840*(41*(func(a)+func(b))+t1+t2+t3+t4);
                     split1:=split1*2;
                  until (abs(s1-s3)<eps);
                   repeat
                     t1:=0;
                     t2:=0;
                     t3:=0;
                     t4:=0;
                     inc(it2);
                     s3:=s2;
                     s2:=0;
                     h:=(b-a)/split2;
                     x:=a;
                     for i:=1 to split2-1 do begin
                          x:=x+h;
                         if i mod 6 = 0 then
                          t1:=t1+82*func(x)
                            else if i mod 3 = 0 then
                              t4:=t4+272*func(x)
                                else if i mod 2 = 0 then
                                  t3:=t3+27*func(x)
                                    else
                                      t2:=t2+216*func(x);
                     end;
                     s2:=6*h/840*(41*(func(a)+func(b))+t1+t2+t3+t4);
                     split2:=split2*2;
                  until (abs(s2-s3)<eps);
              end
                else
                  begin
                      writeln;
                      writeln('Вычисление по методу Уэддля произведено не было! ');
                    end;
          end;

function quadraticFunc(x : extended):extended;
         begin
              quadraticFunc:=x*x-2*x+6
         end;

function lnFunc(x : extended):extended;
         begin                                         e
              if x>0 then
                 lnFunc:=ln(x)+5
              else
                 lnFunc:=0
         end;


function trigonometryFunc(x : extended):extended;
         begin
              trigonometryFunc:=sin(3*x)
         end;
end.

