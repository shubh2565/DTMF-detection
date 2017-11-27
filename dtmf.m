clc
close all
clear all
% DTMF tone generator
fs=8000;
t=[0:1:204]/fs;
x=zeros(1,length(t));
x(1)=1;
y852=filter([0 sin(2*pi*852/fs) ],[1 -2*cos(2*pi*852/fs) 1],x);
y1209=filter([0 sin(2*pi*1209/fs) ],[1 -2*cos(2*pi*1209/fs) 1],x);
y1336=filter([0 sin(2*pi*1336/fs) ],[1 -2*cos(2*pi*1336/fs) 1],x);
y1477=filter([0 sin(2*pi*1477/fs) ],[1 -2*cos(2*pi*1477/fs) 1],x);
y697=filter([0 sin(2*pi*697/fs) ],[1 -2*cos(2*pi*697/fs) 1],x);
y770=filter([0 sin(2*pi*770/fs) ],[1 -2*cos(2*pi*770/fs) 1],x);
y941=filter([0 sin(2*pi*941/fs) ],[1 -2*cos(2*pi*941/fs) 1],x);
y7=y852+y1209;
y1=y1209+y697;
y2=y1336+y697;
y3=y1477+y697;
y4=y1209+y770;
y5=y1336+y770;
y6=y1477+y770;
y8=y1336+y852;
y9=y1477+y852;
y_star=y941+y1209;
y0=y941+y1336;
y_hash=y941+y1477;
subplot(2,3,1);plot(t,y1);grid
ylabel('y(n) DTMF: number 1');
xlabel('time (second)')
Ak=2*abs(fft(y1))/length(y1);Ak(1)=Ak(1)/2;
f=[0:1:(length(y1)-1)/2]*fs/length(y1);
subplot(2,3,4);plot(f,Ak(1:(length(y1)+1)/2));grid 
ylabel('Spectrum for y1(n)');
xlabel('frequency (Hz)');
subplot(2,3,2);plot(t,y2);grid
ylabel('y(n) DTMF: number 2');
xlabel('time (second)')
Ak=2*abs(fft(y2))/length(y2);Ak(1)=Ak(1)/2;
f=[0:1:(length(y2)-1)/2]*fs/length(y2);
subplot(2,3,5);plot(f,Ak(1:(length(y2)+1)/2));grid 
ylabel('Spectrum for y2(n)');
xlabel('frequency (Hz)');
subplot(2,3,3);plot(t,y3);grid
ylabel('y(n) DTMF: number 3');
xlabel('time (second)')
Ak=2*abs(fft(y3))/length(y3);Ak(1)=Ak(1)/2;
f=[0:1:(length(y3)-1)/2]*fs/length(y3);
subplot(2,3,6);plot(f,Ak(1:(length(y3)+1)/2));grid 
ylabel('Spectrum for y3(n)');
xlabel('frequency (Hz)');
figure
subplot(2,3,1);plot(t,y4);grid
ylabel('y(n) DTMF: number 4');
xlabel('time (second)')
Ak=2*abs(fft(y4))/length(y4);Ak(1)=Ak(1)/2;
f=[0:1:(length(y4)-1)/2]*fs/length(y4);
subplot(2,3,4);plot(f,Ak(1:(length(y4)+1)/2));grid 
ylabel('Spectrum for y4(n)');
xlabel('frequency (Hz)');
subplot(2,3,2);plot(t,y5);grid
ylabel('y(n) DTMF: number 5');
xlabel('time (second)')
Ak=2*abs(fft(y5))/length(y5);Ak(1)=Ak(1)/2;
f=[0:1:(length(y5)-1)/2]*fs/length(y5);
subplot(2,3,5);plot(f,Ak(1:(length(y5)+1)/2));grid 
ylabel('Spectrum for y5(n)');
xlabel('frequency (Hz)');
subplot(2,3,3);plot(t,y6);grid
ylabel('y(n) DTMF: number 6');
xlabel('time (second)')
Ak=2*abs(fft(y6))/length(y6);Ak(1)=Ak(1)/2;
f=[0:1:(length(y6)-1)/2]*fs/length(y6);
subplot(2,3,6);plot(f,Ak(1:(length(y6)+1)/2));grid 
ylabel('Spectrum for y6(n)');
xlabel('frequency (Hz)');
figure
subplot(2,3,1);plot(t,y7);grid
ylabel('y(n) DTMF: number 7');
xlabel('time (second)')
Ak=2*abs(fft(y7))/length(y7);Ak(1)=Ak(1)/2;
f=[0:1:(length(y7)-1)/2]*fs/length(y7);
subplot(2,3,4);plot(f,Ak(1:(length(y7)+1)/2));grid 
ylabel('Spectrum for y7(n)');
xlabel('frequency (Hz)');
subplot(2,3,2);plot(t,y8);grid
ylabel('y(n) DTMF: number 8');
xlabel('time (second)')
Ak=2*abs(fft(y8))/length(y8);Ak(1)=Ak(1)/2;
f=[0:1:(length(y8)-1)/2]*fs/length(y8);
subplot(2,3,5);plot(f,Ak(1:(length(y8)+1)/2));grid 
ylabel('Spectrum for y8(n)');
xlabel('frequency (Hz)');
subplot(2,3,3);plot(t,y9);grid
ylabel('y(n) DTMF: number 9');
xlabel('time (second)')
Ak=2*abs(fft(y9))/length(y9);Ak(1)=Ak(1)/2;
f=[0:1:(length(y9)-1)/2]*fs/length(y9);
subplot(2,3,6);plot(f,Ak(1:(length(y9)+1)/2));grid 
ylabel('Spectrum for y9(n)');
xlabel('frequency (Hz)');
figure
subplot(2,3,1);plot(t,y_star);grid
ylabel('y(n) DTMF: number y*');
xlabel('time (second)')
Ak=2*abs(fft(y_star))/length(y_star);Ak(1)=Ak(1)/2;
f=[0:1:(length(y_star)-1)/2]*fs/length(y_star);
subplot(2,3,4);plot(f,Ak(1:(length(y_star)+1)/2));grid 
ylabel('Spectrum for y*(n)');
xlabel('frequency (Hz)');
subplot(2,3,2);plot(t,y0);grid
ylabel('y(n) DTMF: number 0');
xlabel('time (second)')
Ak=2*abs(fft(y0))/length(y0);Ak(1)=Ak(1)/2;
f=[0:1:(length(y0)-1)/2]*fs/length(y0);
subplot(2,3,5);plot(f,Ak(1:(length(y0)+1)/2));grid 
ylabel('Spectrum for y0(n)');
xlabel('frequency (Hz)');
subplot(2,3,3);plot(t,y_hash);grid
ylabel('y(n) DTMF: number #');
xlabel('time (second)')
Ak=2*abs(fft(y_hash))/length(y_hash);Ak(1)=Ak(1)/2;
f=[0:1:(length(y_hash)-1)/2]*fs/length(y_hash);
subplot(2,3,6);plot(f,Ak(1:(length(y_hash)+1)/2));grid 
ylabel('Spectrum for y#(n)');
xlabel('frequency (Hz)');