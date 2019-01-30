program mod_4_lab_1;
{��������� ������ ��12-11� ������� 17
��������� �������� ������������� ��������� ��������������� ������� �� ��������
���������, �������� ��������� � 2 ��������� ���������� ����������� 4 ��������}

uses
  procedure_module in 'procedure_module.pas',
  SysUtils;

Var
    answer : byte;
    a, b, eps : double;
    split1, split2, split3, split4, split5, split6, split7, split8, split22, split11, i  : longint;
    it1, it2, it3, it4, it5, it6, it7, it8 : longint;
    x, s1, s2, s3, s4, s5, s6, s7, s8 : extended;
    inputFlag, computedFlag1, computedFlag2, computedFlag3: boolean;

begin
  inputFlag:=false;
  computedFlag1:=false;
  computedFlag2:=false;
  computedFlag3:=false;
  while True do
    begin
      write(' ': 2000); { ������� ������ }
      writeln;
      if inputFlag then writeln('������ ������� ');
      if computedFlag1 then writeln('���������� ��������� ��� ������ ������� : a = ', a:3:2, ', b = ', b:3:2, ', �������� - ', eps:5:4)
         else
             if computedFlag2 then writeln('���������� ��������� ��� ������ ������� : a = ', a:3:2, ', b = ', b:3:2, ', �������� - ', eps:5:4)
                else if
                   computedFlag3 then writeln('���������� ��������� ��� ������� ������� : a = ', a:3:2, ', b = ', b:3:2, ', �������� - ', eps:5:4);
      for i := 1 to 5 do writeln;
      writeln('     ����');
      writeln('  1 - ���� ������ ');
      writeln('  2 - ���������� ��������� 4 ��������� ');
      writeln('  3 - ����� ������� � ������������ ');
      writeln('  4 - ����� ');
      for i := 1 to 5 do writeln;
      write ('  ������� ����� ���� � ������� <Enter>:  ');
      readln (answer);
      case answer of
           1: begin
                   write(' ': 5000); { ������� ������ }
                   for i := 1 to 5 do writeln;
                   inputData(a, b, eps, split1, split2);
                   inputFlag:=true;
                   computedFlag1:=false;
                   computedFlag2:=false;
                   computedFlag3:=false;
                   split3:=split1;
                   split5:=split1;
                   split7:=split1;
                   split4:=split2;
                   split6:=split2;
                   split8:=split2;
                   split11:=split1;
                   split22:=split2;
              end;
           2: begin
                   if inputFlag then
                      begin
                            write(' ': 5000);
                            for i := 1 to 5 do writeln;
                            writeln('     2. ���������� ��������� 4 ���������.');
                            writeln('  1 - ������� x^2-2x+6 ');
                            writeln('  2 - ������� ln(x)+5 ');
                            writeln('  3 - ������� sin(3x) ');
                            writeln('  4 - ����� ');

                            for i := 1 to 5 do writeln;
                            write ('  ������� ����� ���� � ������� <Enter>:  ');
                            readln (answer);
                            case answer of
                                 1: begin
                                         write(' ': 5000);
                                         computingMethod1(a, b, eps, split1, split2, it1, it2, s1, s2, quadraticFunc);
                                         computingMethod2(a, b, eps, split3, split4, it3, it4, s3, s4, quadraticFunc);
                                         computingMethod3(a, b, eps, split5, split6, it5, it6, s5, s6, quadraticFunc);
                                         computingMethod4(a, b, eps, split7, split8, it7, it8, s7, s8, quadraticFunc);
                                         computedFlag1:=true;
                                         computedFlag2:=false;
                                         computedFlag3:=false;
                                         for i := 1 to 5 do writeln;
                                         writeln('���������� ��������� ��� 1 �������! ');
                                         readln;
                                    end;
                                 2: begin
                                         write(' ': 5000);
                                         computingMethod1(a, b, eps, split1, split2, it1, it2, s1, s2, lnFunc);
                                         computingMethod2(a, b, eps, split3, split4, it3, it4, s3, s4, lnFunc);
                                         computingMethod3(a, b, eps, split5, split6, it5, it6, s5, s6, lnFunc);
                                         computingMethod4(a, b, eps, split7, split8, it7, it8, s7, s8, lnFunc);
                                         computedFlag2:=true;
                                         computedFlag1:=false;
                                         computedFlag3:=false;
                                         for i := 1 to 5 do writeln;
                                         writeln('���������� ��������� ��� 2 �������! ');
                                         readln;
                                    end;
                                 3: begin
                                         write(' ': 5000);
                                         computingMethod1(a, b, eps, split1, split2, it1, it2, s1, s2, trigonometryFunc);
                                         computingMethod2(a, b, eps, split3, split4, it3, it4, s3, s4, trigonometryFunc);
                                         computingMethod3(a, b, eps, split5, split6, it5, it6, s5, s6, trigonometryFunc);
                                         computingMethod4(a, b, eps, split7, split8, it7, it8, s7, s8, trigonometryFunc);
                                         computedFlag3:=true;
                                         computedFlag1:=false;
                                         computedFlag2:=false;
                                         for i := 1 to 5 do writeln;
                                         writeln('���������� ��������� ��� 3 �������! ');
                                         readln;
                                    end;
                                   4: begin
                                      end
                                         else
                                   begin
                                        write('��� ������ ������. ������� <ENTER>. ��������� ����. ');
                                        readln
                                   end;
                            end;
                      end
                         else
                             begin
                                  write(' ': 5000);
                                  for i := 1 to 5 do writeln;
                                  writeln('������� ������� ������! ');
                                  readln;
                             end;
              end;
           3: begin
                   write(' ': 5000);
                   for i := 1 to 5 do writeln;
                   if (computedFlag1 or computedFlag2 or computedFlag3) and inputFlag then
                      begin
                           if computedFlag1 then writeln('������� x^2-2x+6 ');
                           if computedFlag2 then writeln('������� ln(x)+5 ');
                           if computedFlag3 then writeln('������� sin(3x) ');
                           writeln;
                           writeln('�����                      ����������                   ��������');
                           writeln('                    ���������       ��������            ���������');
                           writeln('----------------------------------------------------------------------');
                           writeln('�����������             ', split11:5, '          ', it1:2, '                ', s1:12:10);
                           writeln('���������������         ', split22:5, '          ', it2:2, '                ', s2:12:10);
                           writeln('----------------------------------------------------------------------');
                           writeln('��������                ', split11:5, '          ', it3:2, '                ', s3:12:10);
                           writeln('                        ', split22:5, '          ', it4:2, '                ', s4:12:10);
                           writeln('----------------------------------------------------------------------');
                           writeln('����������              ', split11:5, '          ', it5:2, '                ', s5:12:10);
                           writeln('�������                 ', split22:5, '          ', it6:2, '                ', s6:12:10);
                           writeln('----------------------------------------------------------------------');
                           writeln('������                  ', split11:5, '          ', it7:2, '                ', s7:12:10);
                           writeln('                        ', split22:5, '          ', it8:2, '                ', s8:12:10);
                           readln;
                      end
                         else
                             begin
                                  for i := 1 to 5 do writeln;
                                  writeln('������� ������� ������ � ��������� ����������! ');
                                  readln;
                             end;
              end;
           4: begin
                   Halt
              end
           else
             begin
               write('��� ������ ������. ������� <ENTER>. ��������� ����. ');
               readln
             end;
      end;
    end;
end.
