input macros
input hatching
input mparrows

verbatimtex
%&latex
\documentclass[twoside]{book}
\usepackage{../puzzles}
\begin{document}
etex

filenametemplate "%j-%1c.mps";
prologues:=3;
setarrows(barbedsharp);
linecap:=butt;
%linejoin:=mitered;

%outputformat := "svg";

beginfig(1) 
save u;
u:=1.4cm;

x.R=2.5*u;
x.r=1/sqrt(.6215049);
z.x=origin;
z.y=(1,0)*u;
z.a=z.y rotated 60;
z.b=z.y rotated 120;
z.bb=z.y rotated 150;

draw circle(z.x,z.y-z.x);
draw circle(z.y,z.x-z.y);

draw z.x--z.y--z.a--cycle;
hatchfill  z.x--z.y--z.a--cycle withcolor (77, 1mm, -.5bp);
draw -z.y--z.x--z.b;
hatchfill  z.x--(arc(z.b,z.bb,-z.y))--cycle withcolor (20, 1mm, -.5bp);

draw (x.R,x.R)--(x.R,-x.R)--(-x.R,-x.R)--(-x.R,x.R)--cycle;
draw (x.R,x.R)*x.r--(x.R,-x.R)*x.r--(-x.R,-x.R)*x.r--(-x.R,x.R)*x.r--cycle;

dOt z.x,z.y;

label.llft(btex $x$ etex, z.x);
label.lrt(btex $y$ etex, z.y);
label.bot(btex $1$ etex, .5[z.x,z.y]);
label.bot(btex $1$ etex, .5[z.x,-z.y]);

label.lrt(btex {\Large $F$} etex, (-x.R,x.R));
label.lrt(btex {\Large $F'$} etex, (-x.R,x.R)*x.r);

whitelabel(btex $\tfrac{\sqrt{3}}4$ etex, (.31*(z.x+z.y+1.2*z.a)));
whitelabel(btex $\tfrac\pi6$ etex, (.38*(z.x-z.y+z.b)));
endfig;

beginfig(2) 
save u, p;
u:=3cm;
path p[];

z.P=origin;
z.Q=(1,0)*u;
z.R=(.7,.6)*u;

p0=z.P{up}..z.R..z.Q{down}..tension 1.5..cycle;

labelarcsprof(z.Q, z.P, z.R, 21, 7, btex \small{$\theta$} etex);

draw p0 pensemibold;

draw z.P--z.R;

drawarrow ddline(z.P,z.Q)(.2,.2);
drawarrow z.P-(0,.4)*u--z.P+(0,.7)*u;

dOt z.P,z.Q,z.R;

label.ulft(btex $P$ etex, z.P);
label.urt(btex $Q$ etex, z.Q);
label.urt(btex $R(\theta)$ etex, z.R);
label(btex $r(\theta)$ etex rotated angle(z.R), .5*z.R +6*(unitvector(z.R) rotated 90));

endfig;

beginfig(10) 
save u,n,r,s;
u:=.5cm;
n:=7;
r:=5.4*u;
s:=.14*u;


for i=0 step 1 until n:
draw (i,0)*u--(i,n)*u;
draw (0,i)*u--(n,i)*u;
endfor

path p[];

p0:=(0,0)--(r,0)
for i=1 upto n-1: .. (r+s*normaldeviate,0) rotated (i/n*90) endfor
..(0,r)--cycle;

p1=(0,0)*u--(2,0)*u--(2,1)*u--(1,1)*u--(1,2)*u--(0,2)*u--cycle;
hatchfill  p1 withcolor (77, 1mm, -.5bp);

p2=circle((.5,.5)*u,.35*u);
fill p2 withcolor 0;

clip currentpicture to p0;


draw p0 penhair;

label.bot(btex а) etex, (r/2,0));

endfig;

beginfig(11) 
save u,n,r,s;
u:=.5cm;
n:=7;
r:=5.4*u;
s:=.14*u;


for i=0 step 1 until n:
draw (i,0)*u--(i,n)*u;
draw (0,i)*u--(n,i)*u;
endfor

path p[];

p0:=(0,0)--(r,0)
for i=1 upto n-1: .. (r+s*normaldeviate,0) rotated (i/n*90) endfor
..(0,r)--cycle;

p1=(0,0)*u--(3,0)*u--(3,1)*u--(2,1)*u--(2,2)*u--(1,2)*u--(1,3)*u--(0,3)*u--cycle;
hatchfill  p1 withcolor (77, 1mm, -.5bp);

p2=circle((.5,.5)*u,.35*u);
fill p2 withcolor 0;

clip currentpicture to p0;


draw p0 penhair;

label.bot(btex б) etex, (r/2,0));
endfig;

beginfig(12) 
save u,n,r,s;
u:=.5cm;
n:=7;
r:=5.4*u;
s:=.14*u;


for i=0 step 1 until n:
draw (i,0)*u--(i,n)*u;
draw (0,i)*u--(n,i)*u;
endfor

path p[];

p0:=(0,0)--(r,0)
for i=1 upto n-1: .. (r+s*normaldeviate,0) rotated (i/n*90) endfor
..(0,r)--cycle;

p1=(0,0)*u--(4,0)*u--(4,1)*u--(3,1)*u--(3,2)*u--(2,2)*u--(2,3)*u--(1,3)*u--(1,4)*u--(0,4)*u--cycle;
hatchfill  p1 withcolor (77, 1mm, -.5bp);

p2=circle((.5,.5)*u,.35*u);
fill p2 withcolor 0;

clip currentpicture to p0;

draw p0 penhair;

label.bot(btex в) etex, (r/2,0));
endfig;

beginfig(246)
save u;
u:=.5cm;

z.k=(.2,.2);

z.O=origin;
z.A=(0,-2)*u;
z.B=z.A rotated 120;
z.C=z.A rotated -120;

z.AA=z.A zscaled z.k;
z.BB=z.B zscaled z.k;
z.CC=z.C zscaled z.k;

draw ddarc(z.B,z.A,z.C)(30,30);
draw ddarc(z.A,z.AA,z.O)(20,14);
draw ddarc(z.B,z.BB,z.O)(20,14);
draw ddarc(z.C,z.CC,z.O)(20,14);
draw ddarc(z.CC,z.AA,z.B)(14,14);
draw ddarc(z.AA,z.BB,z.C)(14,14);
draw ddarc(z.BB,z.CC,z.A)(14,14);

dOt z.A,z.B,z.C,z.AA,z.BB,z.CC,z.O;
endfig;

beginfig(300) 
save u, p, n, k;
u:=2cm;
n:=3;
k:=100;

path p[];

p0=(0,0)*u--(1/(2*n+2),.5)*u--(1-1/(2*n+2),.5)*u--(1,1)*u;

picture q[];

q1=image(
z.e[1]=(0,0)*u;
for i=1 step 2 until k:
pickup pencircle scaled (.5*(.9**(i-2)));
z.e[i+1]=(-(2*n+1)/(2*n+2),.5)*u*((n/(n+1))**i)+((2*n+1)/(2*n+2),.5)*u;
z.e[i+2]=(-(2*n+1)/(2*n+2),-.5)*u*((n/(n+1))**(i+1))+((2*n+1)/(2*n+2),.5)*u;
draw z.e[i]--z.e[i+1]--z.e[i+2] withcolor (.5*(1-.97**(i-2)));
z[i]=(whatever,.5)*u=whatever[z.e[i],z.e[i+1]];
z[i+1]=(whatever,.5)*u=whatever[z.e[i+1],z.e[i+2]];
endfor
pickup pencircle scaled (.5);
draw z.e[k+1]--((2*n+1)/(2*n+2),.5)*u--(1,1)*u;
);

q2=image(
pickup pencircle scaled (.5);
z.r[0]=(0,0);
for i=1 step 2 until 98:
z.r[i]=((2*n+1)/(2*n+2)*u,x[i])+whatever*(1,1)=((2*n+1)/(2*n+2)*u,x[i+1])+whatever*(1,-1);
z.r[i+1]=(1/(2*n+2)*u,x[i+1])+whatever*(-1,1)=(1/(2*n+2)*u,x[i+2])+whatever*(-1,-1);
pickup pencircle scaled (.5*(.9**(i-2)));
draw z.r[i-1]--(1/(2*n+2)*u,x[i])--((2*n+1)/(2*n+2)*u,x[i])--z.r[i]--((2*n+1)/(2*n+2)*u,x[i+1])--(1/(2*n+2)*u,x[i+1])--z.r[i+1] withcolor (.5*(1-.97**(i-2)));
endfor
pickup pencircle scaled (.5);
draw (1/(2*n+2),(2*n+1)/(2*n+2))*u--((2*n+1)/(2*n+2),(2*n+1)/(2*n+2))*u--(1,1)*u;
);

pickup pencircle scaled (.5);
draw p0;
draw q1 shifted ((1.5,0)*u);
draw q2 shifted ((3,0)*u);
endfig;

end
