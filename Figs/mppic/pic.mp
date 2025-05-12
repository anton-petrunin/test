input macros
input hatching
input mparrows

verbatimtex
%&latex
\documentclass[twoside]{book}
\usepackage{../../puzzles}
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

end
