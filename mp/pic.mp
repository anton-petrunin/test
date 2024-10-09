input macros
input hatching
input mparrows

  verbatimtex
\input latexmp.pre
etex

  input mparrows;


setarrows(barbed);
barbedarrowindent  :=.25;
ahlength:=4;

zas:=1.5;

dotdiam:=3;

def xdot expr Z=fill fullcircle scaled dotdiam shifted Z  enddef;

def xnot expr Z=unfill fullcircle scaled dotdiam shifted Z;
  draw fullcircle scaled dotdiam shifted Z %  withpen pencircle scaled .5
enddef;

def xnots (text t) text T = forsuffixes $ = t:
    xnot z$ T; endfor enddef;

linecap:=butt;

_prusize:=6;

vardef _prug(expr d,A,B,C)=image(draw (unitvector(A-B)--unitvector(A-B)+unitvector(C-B)--
unitvector(C-B)) scaled d shifted B withpen thin;) enddef;
vardef prug(expr A,B,C)=_prug(_prusize,A,B,C) enddef;

%%%%%% перпендикуляр из точки w  к отрезку  p-t
vardef perp(expr w,p,t)=
  save z_tmp; pair z_tmp;
  z_tmp = w+whatever*((p-t)rotated90)=whatever[p,t];
  z_tmp
enddef;

pen fine,thin,thick;
fine = pencircle scaled .25bp;
thin = pencircle scaled .5bp;
thick = pencircle scaled 1.2bp;


evenly:=dashpattern(on 4 off 2); % `dashed evenly'

def U(suffix $,$$) = unitvector (z$$-z$) enddef;

def B(suffix $,$$,$$$) = unitvector(U($,$$)+U($,$$$)) enddef;


def UR(suffix $,$$) = unitvector (z$$-z$) rotated 90 enddef;

vardef intersect(suffix $,$$)(suffix $$$,$$$$) = 
  save _A; pair _A;
  _A = whatever[z$,z$$]=whatever[z$$$,z$$$$]; 
  _A 
enddef;

def X(suffix $,$$)(suffix $$$,$$$$) =
  whatever[z$,z$$] = whatever[z$$$,z$$$$] enddef;


% def P(text t) = forsuffixes $ = t: z$-- endfor cycle enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef drawh(expr o,n) =
  draw image(drawdblarrow
      (1,.5*h[n])--(w[n]-1,.5h[n]);
    for k = 1 upto (w[n]/u - 1):
      draw (k*u,.5h[n]-zas)--(k*u,.5h[n]+zas);
    endfor
    ) shifted o;
enddef;

vardef draww(expr o,n) =
  draw image(drawdblarrow
      (.5w[n],1)--(.5w[n],h[n]-1);
    for k = 1 upto (h[n]/u - 1):
      draw (.5w[n]-zas,k*u)--(.5w[n]+zas,k*u);
    endfor
    ) shifted o;
enddef;

  u:=3.5mm;
  w = 29u;
  h = 18.5u;

  l:=.3u;

vardef fillh(expr o,n) =
  draw image(fill unitsquare xscaled w[n] yscaled l withcolor .5;
    fill unitsquare xscaled w[n] yscaled -l shifted (0,h[n]) withcolor .5;    
      ) shifted o;
enddef;

vardef fillw(expr o,n) =
  draw image(fill unitsquare xscaled (w[n]-2l) yscaled h[n] shifted (l,0) withcolor .5;    
       ) shifted o;
enddef;
  

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

    fill   z.x--z.y--z.a--cycle  withcolor .8;
fill  z.x--(arc(z.b,z.bb,-z.y))--cycle withcolor .6;

draw circle(z.x,z.y-z.x);
draw circle(z.y,z.x-z.y);

% hatchfill  z.x--z.y--z.a--cycle withcolor (77, 1mm, -.5bp);
draw z.x--z.y--z.a--cycle;
  
% hatchfill  z.x--(arc(z.b,z.bb,-z.y))--cycle withcolor (20, 1mm, -.5bp);
draw -z.y--z.x--z.b;

draw (x.R,x.R)--(x.R,-x.R)--(-x.R,-x.R)--(-x.R,x.R)--cycle;
draw (x.R,x.R)*x.r--(x.R,-x.R)*x.r--(-x.R,-x.R)*x.r--(-x.R,x.R)*x.r--cycle;

dOt z.x,z.y;

label.llft(btex $x$ etex, z.x+dir -135);
label.lrt(btex $y$ etex, z.y+dir -45);
label.bot(btex $1$ etex, .5[z.x,z.y]);
label.bot(btex $1$ etex, .5[z.x,-z.y]);

label.lrt(btex {\Large $F$} etex, (-x.R,x.R)+2dir-45);
label.lrt(btex {\Large $F'$} etex, (-x.R,x.R)*x.r+2dir -45);

label(btex $\tfrac{\sqrt{3}}4$ etex, (.31*(z.x+z.y+1.2*z.a)));
label(btex $\tfrac\pi6$ etex, (.38*(z.x-z.y+z.b)));
endfig;

beginfig(2) 
save u, p;
u:=3cm;
path p[];

z.P=origin;
z.Q=(1,0)*u;
z.R=(.7,.6)*u;

p0=z.P{up}..z.R..z.Q{down}..tension 1.5..cycle;

labelarcsprof(z.Q, z.P, z.R, 21, 7, btex {$\theta$} etex);

draw p0 withpen thick;

draw z.P--z.R;

drawarrow ddline(z.P,z.Q)(.2,.2);
drawarrow z.P-(0,.4)*u--z.P+(0,.7)*u;

  xnots(P,Q,R);
%    dOt z.P,z.Q,z.R;

label.ulft(btex $P$ etex, z.P+up);
label.urt(btex $Q$ etex, z.Q+right);
label.urt(btex $R(\theta)$ etex, z.R+down);
label(btex $r(\theta)$ etex rotated angle(z.R), .5*z.R +6*(unitvector(z.R) rotated 90));

endfig;

end
