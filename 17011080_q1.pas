program Odev1;
uses crt,sysutils;
var
i,uzunluk,count ,s, passt : integer ;
tahmin ,pass ,passt1,passt2,passt3,passt4 : string ;
s1,s2,d1,d2,ms1,ms2 : real ;
st: tsystemtime ;
begin
repeat
clrscr;
passt1 :='0123456789';
passt2:='abcdefghijklmnoprstuvyzwxq';
passt3 := 'abcdefghijklmnoprstuvyzwxq0123456789';
passt4:='abcdefghijklmnoprstuvyzwxqABCDEFGHIJKLMNOPRSTUVYZXWQ0123456789';
uzunluk := 0;
pass := '';                                                                                    {Random komutuyla �ifre olu�tururken ve olu�turulan �ifreyi ��z�mlerken
                                                                                                  ihtiyac�m olan stringlerin elemanlar�n� burda tan�mlad�m.}
randomize ;
while (uzunluk<>4) and (uzunluk <> 6 ) and (uzunluk <> 8) do
begin                                                                                {Kullanici hatalar�ndan kurtulmak icin uzunluklar� while in icinde yazdim.}
writeln('Istenen sifre uzunlugunu giriniz.');
writeln('4,6,8 rakamlarindan biri secilmelidir.');
readln(uzunluk);
end;
passt:= 0 ;
while (passt<>1) and (passt<>2) and (passt<>3) and (passt<> 4) do                            {Tekrardan kullan�c� istenen karakterden ba�ka karaktere bast���nda program�n hata
                                                                                                 vermemesi i�in while kulland�m.}
begin
writeln('Sadece rakam icin 1');
writeln('Sadece kucuk harf icin 2 ');
writeln ('Kucuk harf ve rakam icin 3 ');
writeln('Buyuk harf , kucuk harf ve rakam icin 4`e basiniz.');
readln(passt);
end;
writeln('Random sifre icin 1 kendiniz olusturmak icin 2 ye basiniz.');
readln(s);
clrscr;
if s = 2 then
 begin
  writeln('Sifreyi girin.');
   readln(pass) ;
end
 else
  if passt = 1 then begin
for i:=1 to uzunluk do
pass := pass+passt1[random(10)+1];                                                                 {�stenilen t�r �ifreye g�re gerekli olan if koluna gidiyor .}
end
else
if passt=2 then begin
for i:= 1 to uzunluk do
pass:= pass+passt2[random(26)+1];
 end
else if passt= 3 then begin
for i:=1 to uzunluk do
pass := pass+passt3[random(36)+1];
end
else begin
for i:=1 to uzunluk do
pass := pass+ passt4[random(62)+1];
end;
count :=0 ; tahmin:='';
datetimetosystemtime(now,st);
with st do begin
ms1:=millisecond;
s1:= second;                                                                            {��z�mlemenin ba�lad��� zaman� almak i�in gereken komutlar.}
d1:=minute;
end;
if passt=1 then begin                                                                   {�ifre burda sistemin atad��� random sayilara g�re ��z�mleniyor.}
while tahmin <>pass do begin
tahmin:='';
for i := 1 to uzunluk do
tahmin := tahmin+passt1[random(10)+1];
count:=count+1;
end; end
else if passt=2 then begin
while tahmin <> pass do begin
tahmin:='';
for i:=1 to uzunluk do
tahmin := tahmin+passt2[random(26)+1] ;
count :=count+1;
end; end
else if passt=3 then begin
while tahmin <> pass do begin
tahmin:='';
for i:=1 to uzunluk do
tahmin :=tahmin+passt3[random(36)+1];
count:= count+1;
end; end
else if passt=4 then begin
while tahmin <> pass do begin
tahmin:='';
for i:=1 to uzunluk do
tahmin :=tahmin+passt4[random(62)+1];
count:=count+1;
end; end;
datetimetosystemtime(now,st);
with st do
begin
ms2:=millisecond;                                                                     {��z�mleme bittikten sonra tekrar sistemden zaman bilgisi al�n�yor.}
s2:=second;
d2:=minute;
end;
writeln('Belirlenen sifre = ',pass);
writeln('Bulunan sifre = ',tahmin);
writeln('Sifreyi bulmak icin gecen sure = ',(d2-d1):1:0,'dk :',(s2-s1):1:0,'saniye :',(ms2-ms1):1:0,'milisaniye');
writeln('Deneme sayisi = ',count);writeln();
writeln('Cikmak icin 1 yeniden sifre girmek icin herhangi bir rakama basiniz');
readln(s);
until s= 1;
end.









