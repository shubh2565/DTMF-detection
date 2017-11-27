clc
close all
clear all
figure(1)
% DTMF tone generator
fs=8000;
t=[0:1:204]/fs;
x=zeros(1,length(t));
x(1)=1;
y852=filter([0 sin(2*pi*852/fs) ],[1 -2*cos(2*pi*852/fs) 1],x);
y1209=filter([0 sin(2*pi*1209/fs) ],[1 -2*cos(2*pi*1209/fs) 1],x);
y7=y852+y1209;
subplot(2,1,1);plot(t,y7);grid
ylabel('y(n) DTMF: number 7');
xlabel('time (second)')
Ak=2*abs(fft(y7))/length(y7);Ak(1)=Ak(1)/2;
f=[0:1:(length(y7)-1)/2]*fs/length(y7);
subplot(2,1,2);plot(f,Ak(1:(length(y7)+1)/2));grid
ylabel('Spectrum for y7(n)');
xlabel('frequency (Hz)');

figure(2)
% DTMF detector (use Goertzel algorithm)
b697=[1];
a697=[1 -2*cos(2*pi*18/205) 1];
b770=[1];
a770=[1 -2*cos(2*pi*20/205) 1];
b852=[1];
a852=[1 -2*cos(2*pi*22/205) 1];
b941=[1];
a941=[1 -2*cos(2*pi*24/205) 1];
b1209=[1];
a1209=[1 -2*cos(2*pi*31/205) 1];
b1336=[1];
a1336=[1 -2*cos(2*pi*34/205) 1];
b1477=[1];
a1477=[1 -2*cos(2*pi*38/205) 1]

[w1, f]=freqz([1 -exp(-2*pi*18/205)],a697,512,8000);
[w2, f]=freqz([1 -exp(-2*pi*20/205)],a770,512,8000);
[w3, f]=freqz([1 -exp(-2*pi*22/205)],a852,512,8000);
[w4, f]=freqz([1 -exp(-2*pi*24/205)],a941,512,8000);
[w5, f]=freqz([1 -exp(-2*pi*31/205)],a1209,512,8000);
[w6, f]=freqz([1 -exp(-2*pi*34/205)],a1336,512,8000);
[w7, f]=freqz([1 -exp(-2*pi*38/205)],a1477,512,8000);
subplot(2,1,1);plot(f,abs(w1),f,abs(w2),f,abs(w3), ...
 f,abs(w4),f,abs(w5),f,abs(w6),f,abs(w7));grid
xlabel('Frequency (Hz)');
ylabel('BPF frequency responses');

yDTMF=[y7 0];
y697=filter(1,a697,yDTMF);
y770=filter(1,a770,yDTMF);
y852=filter(1,a852,yDTMF);
y941=filter(1,a941,yDTMF);
y1209=filter(1,a1209,yDTMF);
y1336=filter(1,a1336,yDTMF);
y1477=filter(1,a1477,yDTMF);

m(1)=sqrt(y697(206)^2+y697(205)^2- ...
     2*cos(2*pi*18/205)*y697(206)*y697(205));
m(2)=sqrt(y770(206)^2+y770(205)^2- ...
     2*cos(2*pi*20/205)*y770(206)*y770(205));
m(3)=sqrt(y852(206)^2+y852(205)^2- ...
     2*cos(2*pi*22/205)*y852(206)*y852(205));
m(4)=sqrt(y941(206)^2+y941(205)^2- ...
     2*cos(2*pi*24/205)*y941(206)*y941(205));
m(5)=sqrt(y1209(206)^2+y1209(205)^2- ...
     2*cos(2*pi*31/205)*y1209(206)*y1209(205));
m(6)=sqrt(y1336(206)^2+y1336(205)^2- ...
     2*cos(2*pi*34/205)*y1336(206)*y1336(205));
m(7)=sqrt(y1477(206)^2+y1477(205)^2- ...
     2*cos(2*pi*38/205)*y1477(206)*y1477(205));
m=2*m/205;
th=sum(m)/4;  %based on empirical measurement
f=[ 697 770 852 941 1209 1336 1477];
f1=[0  4000];
th=[ th th];
x
subplot(2,1,2);stem(f,m);grid
hold; plot(f1,th);
xlabel('Frequency (Hz)');
ylabel('Absolute output values');
