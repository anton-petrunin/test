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

def xdots (text t) text T = forsuffixes $ = t:
    xdot z$ T; endfor enddef;

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


def P(text t) = forsuffixes $ = t: z$-- endfor cycle enddef;

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


  draw unitsquare xscaled w yscaled h;

  % draw (w,h-3u)--(w-6u,h-3u);
  % draw (w-6u,h-u)--(w-6u,0);

  w1 = 11u;
  h1 = 9u;
  w2 = 5.2u;
  h2 = 5u;
  w3 = w1-w2;
  h3 = h2;

  w4 = 6u;
  h4 = h-h1-h2;

  h5 = h4-2u;
  w5 = 7u;

  h6 = h7 = h8 = 2u;
  w6 = w7 = 2.75u;
  w8 = w5 - w6-w7;
  
  w9 = 2u;
  h9 = h1+h2-h10-h12;

  h10 = h13 = 7u;
  h12 = h11 = 3u;
  w11 = 6u;
  w12 = 2.5u;

  w13 = 5u;
  w10 +w13 = w11+w12 = w9+w14+w15;

  w14 = 3u;
  h14 + h16+h10+h11 = h; 

  h16 = h17 = 4u;
  w16 = 1.2u;

  w16+w17 = w14;
  
  h18 = 13u;

  h10+h11+h15 = h18;


  w9+w14+w19 = w11+w12+w18+w21;

  w19 = 7u;
  w20 = w21 = w22+w23 = 2u;
  w22 = .8u;
  h22 = h23 = 8u;
  h20+h21+h22 = h18;
  h20=h21;

  h24 = u;
  h18+h19+h24 = h;
  
  w24 = 8.5u; 
  
  w25 = 6u;

  w28+w29 = w25;
  w28 = 1.5u;

  h31 = 11u;
  h30 = 9u;

  h29 = 3u;

  h27=h30;

  h31+h29+h25 = h;

  w26+w31=  w25;
  w31 = 1.2u;

  w27+w30+w31 = w25;

  
  w27 = 3u;

  h26 = 2u;
  h28+h24 = h29;

  pickup pencircle scaled 1;
    
  draw (0,h1)--(w1,h1);
  draw (w2,h1)--(w2,h1+h2);
  draw (w1,0)--(w1,h1+h2);
  draw (w4,h1+h2)--(w4,h);
  draw (w4+w6,h1+h2)--(w4+w6,h1+h2+h6);
  draw (w4+w6+w7,h1+h2)--(w4+w6+w7,h1+h2+h6);
  draw (w4,h1+h2+h6)--(w4+w5,h1+h2+h6);
  draw (0,h1+h2)--(w4+w5,h1+h2);

  draw (w1+w9,h10+h12)--(w1+w9,h);
  draw (w1,h11)--(w1+w11+w12,h11);
  draw (w1+w11,0)--(w1+w11,h11);
  draw (w1,h11+h10)--(w1+w11+w12,h11+h10);

  draw (w1+w10,h11)--(w1+w10,h11+h10);
  draw (w1+w9,h11+h10+h14)--(w1+w9+w14,h11+h10+h14);
  draw (w1+w9+w16,h-h16)--(w1+w9+w16,h);
  draw (w1+w9+w14,h11+h10)--(w1+w9+w14,h);

  draw (w1+w11+w12,0)--(w1+w11+w12,h10+h11+h15);


  draw  (w1+w9+w14,h10+h11+h15)-- (w-w25,h10+h11+h15);
  draw (w-w25,0)--(w-w25,h-h24);

  draw (w1+w9+w14,h-h24)--(w1+w9+w14+w24,h-h24);

  draw (w-w25,h25)--(w,h25);

  draw (w-w25,h25+h31)--(w,h25+h31);

  draw (w-w31,h25)--(w-w31,h25+h31);

  draw (w-w29,h-h29)--(w-w29,h);
  draw (w-w25,h25+h26)--(w-w31,h25+h26);

  draw (w-w25+w27,h25+h26)--(w-w25+w27,h25+h26+h27);

  draw (w-w25-w21,h21)--(w-w25,h21);
  draw (w-w25-w21,h21+h22)--(w-w25,h21+h22);
  draw (w-w25-w21,0)--(w-w25-w21,h18);

    draw (w-w25-w23,h21)--(w-w25-w23,h21+h22);

  
% arrows

  pickup pencircle scaled .5;
  
  drawh(origin,1);
  drawh((w1,0),11);

  draww((0,h1),2);
  draww((w2,h1),3);

  drawh((0,h1+h2),4);
  drawh((w4,h-h5),5);

  draww((w4,h-h4),6);
  draww((w4+w6,h-h4),7);
  draww((w4+w6+w7,h-h4),8);
  
  draww((w1+w11,0),12);

  draww((w1,h11),10);

  drawh((w1,h11+h10),9);
  drawh((w1+w10,h11),13);
  
  drawh((w1+w9,h11+h10),14);
  draww((w1+w9+w14,h11+h10),15);

  draww((w4+w5,h-h16),16);
  draww((w4+w5+w16,h-h16),17);

  draww((w1+w11+w12,0),18);

  drawh((w-w25-w21,0),21);
  draww((w-w25-w21,h21),22);
  draww((w-w25-w23,h21),23);
  

  drawh((w-w25,0),25);

  draww((w-w25,h25),26);
  draww((w-w31,h25),31);

  draww((w-w31-w30,h25+h26),30);

  drawh((w-w25,h25+h26),27);
  draww((w-w25,h-h29),28);
  draww((w-w29,h-h29),29);

  draww((w-w29-w24,h-h24),24);
  drawh((w-w29-w24,h-h24-h19),19);

  drawh((w-w25-w20,h21+h22),20);
  
endfig;

beginfig(2)


 % fill 

  fill unitsquare xscaled w yscaled h withcolor .85;
  
  fillh(origin,1);
  fillh((w1,0),11);

  fillw((0,h1),2);
  fillw((w2,h1),3);

  fillh((0,h1+h2),4);
  fillh((w4,h-h5),5);

  fillw((w4,h-h4),6);
  fillw((w4+w6,h-h4),7);
  fillw((w4+w6+w7,h-h4),8);
  
  fillw((w1+w11,0),12);

  fillw((w1,h11),10);

  fillh((w1,h11+h10),9);
  fillh((w1+w10,h11),13);
  
  fillh((w1+w9,h11+h10),14);
  fillw((w1+w9+w14,h11+h10),15);

  fillw((w4+w5,h-h16),16);
  fillw((w4+w5+w16,h-h16),17);

  fillw((w1+w11+w12,0),18);

  fillh((w-w25-w21,0),21);
  fillw((w-w25-w21,h21),22);
  fillw((w-w25-w23,h21),23);
  

  fillh((w-w25,0),25);

  fillw((w-w25,h25),26);
  fillw((w-w31,h25),31);

  fillw((w-w31-w30,h25+h26),30);

  fillh((w-w25,h25+h26),27);
  fillw((w-w25,h-h29),28);
  fillw((w-w29,h-h29),29);

  fillw((w-w29-w24,h-h24),24);
  fillh((w-w29-w24,h-h24-h19),19);

  fillh((w-w25-w20,h21+h22),20);

  for n = 1 upto (w/u):
    draw (n*u,0)--(n*u,h) withcolor 1;
  endfor

  for n = 1 upto (h/u):
    draw (0,n*u)--(w,n*u) withcolor 1;
  endfor
  
      pickup pencircle scaled 1;

  draw unitsquare xscaled w yscaled h;
  
  draw (0,h1)--(w1,h1);
  draw (w2,h1)--(w2,h1+h2);
  draw (w1,0)--(w1,h1+h2);
  draw (w4,h1+h2)--(w4,h);
  draw (w4+w6,h1+h2)--(w4+w6,h1+h2+h6);
  draw (w4+w6+w7,h1+h2)--(w4+w6+w7,h1+h2+h6);
  draw (w4,h1+h2+h6)--(w4+w5,h1+h2+h6);
  draw (0,h1+h2)--(w4+w5,h1+h2);

  draw (w1+w9,h10+h12)--(w1+w9,h);
  draw (w1,h11)--(w1+w11+w12,h11);
  draw (w1+w11,0)--(w1+w11,h11);
  draw (w1,h11+h10)--(w1+w11+w12,h11+h10);

  draw (w1+w10,h11)--(w1+w10,h11+h10);
  draw (w1+w9,h11+h10+h14)--(w1+w9+w14,h11+h10+h14);
  draw (w1+w9+w16,h-h16)--(w1+w9+w16,h);
  draw (w1+w9+w14,h11+h10)--(w1+w9+w14,h);

  draw (w1+w11+w12,0)--(w1+w11+w12,h10+h11+h15);


  draw  (w1+w9+w14,h10+h11+h15)-- (w-w25,h10+h11+h15);
  draw (w-w25,0)--(w-w25,h-h24);

  draw (w1+w9+w14,h-h24)--(w1+w9+w14+w24,h-h24);

  draw (w-w25,h25)--(w,h25);

  draw (w-w25,h25+h31)--(w,h25+h31);

  draw (w-w31,h25)--(w-w31,h25+h31);

  draw (w-w29,h-h29)--(w-w29,h);
  draw (w-w25,h25+h26)--(w-w31,h25+h26);

  draw (w-w25+w27,h25+h26)--(w-w25+w27,h25+h26+h27);

  draw (w-w25-w21,h21)--(w-w25,h21);
  draw (w-w25-w21,h21+h22)--(w-w25,h21+h22);
  draw (w-w25-w21,0)--(w-w25-w21,h18);

  draw (w-w25-w23,h21)--(w-w25-w23,h21+h22);

  % drawarrow
  %   (-u,4.5u){right}...
  %   (11u+.5l,7.5u){up}...
  %   (11u,9.5u){dir 120}...
  %   (11u-.5l,11u){up}
  %   ;


  path p;

  k = 29u/1527;

  p = ((-37,241)
	 ..controls (217,241) and (589,281) .. (589,421)
	 ..controls (589,488) and (572,496) .. (572,553)
	 ..controls (574,663) and (810,741) .. (1031,750)
	 ..controls (1315,750) and (1330,656) .. (1264,556)
	 ..controls (1217,484) and (1202,447) .. (1202,296)
	 ..controls (1202,217) and (1207,156) .. (1248,139)
	 ..controls (1289,122) and (1338,113) .. (1569,113)
) scaled k;

  drawarrow p;

  
  
endfig;

beginfig(3)

  u := 6cm;

  z.c  =(.5u,.5u);
  z.w = (.75u,.65u);

  r:=.15u;

  
  path c[];
  c0 = fullcircle scaled 2r shifted z.w;
  c1 = fullcircle scaled (2r-6) shifted z.w;

  z.m  = point 1.8 of c1;
  
  z.l1 = (0,-.25u)  rotated angle (z.w-z.c) shifted z.c;
  z.l2 = (0,.25u)  rotated angle (z.w-z.c) shifted z.c;

  z.m1 = perp(z.m,z.l1,z.l2);


  fill c0 withcolor .8;
  draw c0 ; % withpen thick ;
  linecap:=rounded;
  draw % subpath (1.15,8.95) of
    c1 dashed withdots scaled .28; %   evenly scaled 1;
  linecap:=butt;
  
  draw z.c--z.w;

  draw z.l1--z.l2;

  draw prug(z.w,z.c,z.l1);
  draw prug(z.m,z.m1,z.l2);
  

  ww:=1;

  c2 = % buildcycle ( subpath (.1,7.9) of fullcircle scaled 3.5 ,
    (0,-ww)--(r-6.5,-ww)--(r-4.5,0)--(r-6.5,ww)--(0,ww)--cycle;

  fill c2 rotated angle (z.m-z.w) shifted z.w  ;

  draw z.c--z.m dashed evenly;
  draw z.m1--z.m dashed evenly;
  
  xnot z.c;
  xnot z.w;
  xnot z.m;
  
  draw unitsquare scaled u;
  
  label.llft(btex $C$ etex,z.c);
  label.lrt(btex $W$ etex,z.w);
  label.urt(btex $M$ etex,z.m+(-1,3));
  label.urt(btex $\ell$ etex,z.l2+(3,-4));

endfig;

beginfig(4)

  u := 5mm;
  k:=.8;
  
  draw ((0u,0)--(0u,u)--(11u,u)--(11u,0)) yscaled k;
  draw ((1u,0)--(1u,2u)--(5u,2u)--(5u,0)) yscaled k;
  draw ((2u,0)--(2u,3u)--(8u,3u)--(8u,0)) yscaled k;
  draw ((3u,0)--(3u,5u)--(17u,5u)--(17u,0)) yscaled k withpen thick; % dashed evenly) yscaled k;
  draw ((4u,0)--(4u,4u)--(7u,4u)--(7u,0)) yscaled k;
  draw ((6u,0)--(6u,2u)--(16u,2u)--(16u,0)) yscaled k;
  draw ((9u,0)--(9u,3u)--(14u,3u)--(14u,0)) yscaled k;
  draw ((10u,0)--(10u,4u)--(12u,4u)--(12u,0)) yscaled k;
  draw ((13u,0)--(13u,4u)--(18u,4u)--(18u,0)) yscaled k;
  draw ((15u,0)--(15u,1u)--(19u,1u)--(19u,0)) yscaled k;

  label.bot(btex 1 etex,(0u,0)); 
  label.bot(btex 2 etex,(1u,0)); 
  label.bot(btex 3 etex,(2u,0)); 
  label.bot(btex 4 etex,(3u,0)); 
  label.bot(btex 5 etex,(4u,0)); 
  label.bot(btex 6 etex,(5u,0)); 
  label.bot(btex 7 etex,(6u,0)); 
  label.bot(btex 8 etex,(7u,0)); 
  label.bot(btex 9 etex,(8u,0)); 
  label.bot(btex 10 etex,(9u,0)); 
  label.bot(btex 11 etex,(10u,0)); 
  label.bot(btex 12 etex,(11u,0)); 
  label.bot(btex 13 etex,(12u,0)); 
  label.bot(btex 14 etex,(13u,0)); 
  label.bot(btex 15 etex,(14u,0)); 
  label.bot(btex 16 etex,(15u,0)); 
  label.bot(btex 17 etex,(16u,0)); 
  label.bot(btex 18 etex,(17u,0)); 
  label.bot(btex 19 etex,(18u,0)); 
  label.bot(btex 20 etex,(19u,0)); 


  
  
endfig;


beginfig(5)

  u := 7mm;
  k:=3.5mm/u;

  h:=.5u;
  
  draw ((0u,0)--(0u,3u+h)--(3u,3u+h)--(3u,0)) yscaled k;
  draw ((1u,0)--(1u,1u+h)--(5u,1u+h)--(5u,0)) yscaled k;
  draw ((4u,0)--(4u,2u+h)--(15u,2u+h)--(15u,0)) yscaled k;
  draw ((6u,0)--(6u,3u+h)--(8u,3u+h)--(8u,0)) yscaled k;
  draw ((7u,0)--(7u,1u+h)--(9u,1u+h)--(9u,0)) yscaled k;
  draw ((10u,0)--(10u,1u+h)--(12u,1u+h)--(12u,0)) yscaled k;
  drawarrow ((2u,0)--(2u,-2u)--(14u,-2u)--(14u,-2)) yscaled k dashed evenly shifted (0,0);
  drawarrow ((11u,-2u)--(11u,-2)) yscaled k dashed evenly;
  drawarrow ((13u,-2u)--(13u,-2)) yscaled k dashed evenly;

  for n = 0,1,3,4,5,6,7,8,9,10,12,15:
    xdot (n*u,0);
  endfor
  for n = 2,11,13,14:
    xnot (n*u,0);
  endfor

  labeloffset:=labeloffset+1.5;

  K:=.95;
  
  label.bot(btex $B(6)$ etex xscaled K,(0u,0)); 
  label.bot(btex $B(3)$ etex xscaled K,(1u,0)); 
  label.bot(btex $A(6)$ etex xscaled K,(3u,0)); 
  label.bot(btex $A(5)$ etex xscaled K,(4u,0)); 
  label.bot(btex $A(3)$ etex xscaled K,(5u,0)); 
  label.bot(btex $A(2)$ etex xscaled K,(6u,0)); 
  label.bot(btex $A(1)$ etex xscaled K,(7u,0)); 
  label.bot(btex $B(2)$ etex xscaled K,(8u,0)); 
  label.bot(btex $B(1)$ etex xscaled K,(9u,0)); 
  label.bot(btex $A(4)$ etex xscaled K,(10u,0)); 
  label.bot(btex $B(4)$ etex xscaled K,(12u,0)); 
  label.bot(btex $B(5)$ etex xscaled K,(15u,0)); 

  label.top(btex $a$ etex xscaled 1,(2u,0)); 
  label.top(btex $b$ etex xscaled 1,(11u,0)); 
  label.top(btex $c$ etex xscaled 1,(13u,0)); 
  label.top(btex $d$ etex xscaled 1,(14u,0)); 
  

  draw ((7.5u,-1.5u)--(7.5u,5u)) yscaled k dashed evenly;

  label.lft(btex левая сторона etex xscaled 1,(7.5u,4.5u) yscaled k);  
  label.rt(btex правая сторона etex xscaled 1,(7.5u,4.5u) yscaled k);  

  labeloffset:=labeloffset-1.5;
  
endfig;

beginfig(6)

  u:=2.12cm;

  z = (.1u,5u);  
  
  z0 = origin;
  z1 = (u,0);
  z1' = 2[z0,z1];
  z3 = whatever[z0,z] = (whatever,.4u);
  z2 = whatever[z1,z] = (whatever,y3) ;
  z2' = 2[z3,z2] ;

  z5 = z+unitvector(z0-z) scaled ((length(z-z0)**.5)*(length (z-z3)**.5));

  z4 = whatever[z1,z] = (whatever ,y5);
  z4' = whatever[z1',z] = (whatever ,y5);


  z6 = .5[z5,z4]+(0,.85u/sqrt 2);
  z6' = .5[z4,z4']+(0,.85u/sqrt 2);

  fill z0--z1'--z6'--z1--z6--cycle withcolor .8;
  fill z1'--z6'--z2'--cycle withcolor .5;
  fill z1--z6--z2--cycle withcolor .5;
  
  draw z3--z0--z1'--z2'--z6'--z2--z6--cycle;
  draw z1--z2;
  draw z0--z6--z1--z6'--z1';

  draw z6--z6' dashed evenly;
  
endfig;

beginfig(7)

  u:=5mm;

  z0 = origin;
  z1 = (u,0);
  z2 = z1 rotated 60;
  z3 = z1 rotated -60;

  draw image(
  for n = -3 upto 3:
    draw (-4z1--4z1) shifted (n*z2);
    draw (-4z2--4z2) shifted (n*z1);
    draw (-4z3--4z3) shifted (n*z1);
endfor
clip currentpicture to
  (-4z1-- -4z2--4z3--4z1--4z2-- -4z3--cycle));

draw   (-4z1-- -4z2--4z3--4z1--4z2-- -4z3--cycle);

path p;
p = (z0--z3--z3-z2-- -z2--cycle) shifted (.33*(z3-z2));

for n = 0 upto 2:
  fill p rotated 120n shifted (8z1) withcolor .8;
  draw p rotated 120n shifted (8z1) ;
endfor
  
  
  
  
endfig;

beginfig(8)

  u:=1mm;
  numeric r[];

  r0 := 10u;
  r1 := 6u;
  r2 := 4u;

  z0 = origin;
  z1 = (14u,0) rotated -85;
  z2 = (22u,0) rotated -20;

  z1 = (r1/r0)[z3,z0];
  z2 = (r2/r0)[z4,z0];
  z2 = (r2/r1)[z5,z1];


  z0' = U(0,3) scaled r0 rotated angle (r0,length(z3-z0)+-+r0);
  z0'' = z0' reflectedabout (z0,z3);

  z1' = U(0,4) scaled r0 rotated angle (r0,length(z4-z0)+-+r0);
  z1'' = z1' reflectedabout (z0,z4);

  z2' = U(1,5) scaled r1 rotated angle (r1,length(z5-z1)+-+r1) shifted z1;
  z2'' = z2' reflectedabout (z1,z5);
  
  path c[];
  c0 = fullcircle  scaled 2r0 shifted z0;
  c1 = fullcircle  scaled 2r1 shifted z1;
  c2 = fullcircle  scaled 2r2 shifted z2;

  for n = 0 upto 2:
    fill c[n] withcolor .8;
  endfor

  for n = 0 upto 2:
    draw c[n];
  endfor
  

  draw z0'+25U(3,0')--z3--z0''+20U(3,0'');
  draw z1'+20U(4,1')--z4--z1''+25U(4,1'');
  draw z2'+27U(5,2')--z5--z2''+27U(5,2'');

  draw z3+12U(5,3)--z5+13U(3,5) dashed evenly;

    xnot z3;
  xnot z4;
  xnot z5;

endfig;

beginfig(9)

  u:=1mm;
  r:=3u;
  path c[];

  c0 = subpath (0,8) of fullcircle shifted .5left scaled 2r;
  c0 := c0 & ( reverse  c0 scaled  -1) & cycle;

  c1 = c0 rotated 90 yscaled .4 xscaled .6 shifted (-r,0);
  c2 = c0 xscaled .4 yscaled .6 shifted (r,0);
  c3 = c0 xscaled .12 yscaled .2 shifted (.6r,0);

  c4 = c0  rotated 90 yscaled .45 xscaled .15 shifted (2.75r,0);
  c5 = c4 shifted (.5r,0); 

  c6 = c5 shifted (3.3r,0); 
  c7 = c6 shifted (.5r,0); 
  c8 = c7 shifted (.5r,0); 
  c9 = c8 shifted (.5r,0); 

  c10 = c0 xscaled .45 yscaled .15 shifted (5.1r,.75r);
  c11 = c0 xscaled .45 yscaled .15 shifted (5.1r,.25r);
  c12 = c0 xscaled .45 yscaled .15 shifted (5.1r,-.25r);
  c13 = c0 xscaled .45 yscaled .15 shifted (5.1r,-.75r);

  c14 = (2.2r,0)..controls (2.2r,1.1r) and (2.1r,1.2r) ..(0,1.2r);
  c14 := c14 & reverse c14 xscaled -1; 
  c14 := c14 & reverse c14 yscaled -1;

  c15 = (2.2r,0)..controls (2.2r,1r) and (2.4r,1.1r) ..(3r,1.1r)
    ..controls (3.6r,1.1r) and (3.8r,1r) ..(3.8r,0)    ;
  c15 := c15 & reverse c15 yscaled -1;


  for n = 0 upto 15:
  draw c[n];
  endfor

  save dotdiam;
  dotdiam:=1.5;

  picture D;
  D =  image (
  xdot (0,0);
  xdot (-4,0);
    xdot (4,0);
    );

  draw D    shifted  (9.5r,0);
  draw D    shifted  (-3.5r,0);
  draw D rotated 90   shifted  (3r,2.5r);
  draw D rotated 90   shifted  (3r,-2.5r);

  
endfig;

beginfig(10)

  u:=3mm;
  
  for n = -12 upto 12:
    draw (n*u,-7.5u)--(n*u,7.5u)  withpen pencircle scaled .25 ;
  endfor

  for n = -7 upto 7:
    draw (-12.5u,n*u)--(12.5u,n*u)  withpen pencircle scaled .25 ;
  endfor

  drawarrow (-12.8u,0)--(13u,0);
  drawarrow (0,-7.8u)--(0,7.8u);
  
  for n = -11,-7,-3,1,5,9:
    draw fullcircle scaled 2u shifted (n*u,0) withpen thick;
  endfor

%  linecap:= rounded;
  for n = 1 upto 7:
    draw fullcircle scaled (2n*u) dashed evenly;
  endfor
%  linecap:=butt;

  
  
  
endfig;

beginfig(11)

  u:=1mm;
  l:=14u;

  z0 = origin;
  z1 = (l,0) ;
  z2 = z1 rotated 60;
  z3 = z1 rotated -60;


  draw (z1--z2-- -z3-- -z1-- -z2--z3--cycle);

  draw z2--z0--z3;
  draw z0-- -z1;

  z4 = (1.5z1+1.5z3) xscaled .85;
  z5 = (2x4,0) ; % (-1.5z2+1.5z3);
  z6 = z4+z5;  % (1.5z1-1.5z2+3z3);
    
  
    
  draw image(
      draw (z1--z2-- -z3-- -z1-- -z2--z3--cycle);
    draw (z1--z2--z0--z3--cycle) shifted -.5z1 withpen thick;
    draw z0--z2 dashed evenly withpen thin;
    draw z0--z3 dashed evenly withpen thin;
    draw z0-- -z1 dashed evenly withpen thin;
    pickup thick;
    drawarrow ((4,0) --(12,0)) shifted .5z1;
    drawarrow ((-4,0) --(-12,0)) shifted -.5z1;
    pickup defaultpen;
    label.lrt(btex $A$ etex,-.55z3);
    ) shifted z4;

  draw image(
        draw (z1--z2-- -z3-- -z1-- -z2--z3--cycle);
    draw (unitsquare shifted (-.5,-.5) scaled (y2*sqrt 2) rotated 45)  withpen thick;
    draw z0--z2 dashed evenly withpen thin;
    draw z0--z3 dashed evenly withpen thin;
    draw z0-- -z1 dashed evenly withpen thin;
    label.lrt(btex $B$ etex,-.65z3+2left);
    ) shifted z5;

  draw image(
        draw (z1--z2-- -z3-- -z1-- -z2--z3--cycle);
    draw (unitsquare shifted (-.5,-.5) scaled (y2*sqrt 2) rotated 30)  withpen thick;
    draw z0--z2 dashed evenly withpen thin;
    draw z0--z3 dashed evenly withpen thin;
    draw z0-- -z1 dashed evenly withpen thin;
    label.lrt(btex $B$ etex,-.65z3+2left);
    ) shifted z6;


  pickup thick;

  
  drawarrow (-6dir -30--6dir -30) shifted .5[z0,z4];
  drawarrow (-6dir 30-- 6dir 30) shifted .5[z4,z5];
  drawarrow (-6dir -30--6dir -30) shifted .5[z5,z6];

endfig;


beginfig(12)


  z.r =  origin;
  z.s = (40u,0) rotated -40;
  z.q = .25[z.r,z.s];
  z.p = (25u,0);

  z1 = perp(z.p,z.r,z.s);
  z2 = perp(z.q,z.p,z.r);
  
  draw z.r+15U(s,r)--z.s+15U(r,s) withpen thick;

  draw z1--z.p dashed evenly;
  draw z.r+15U(p,r)--z.p+15U(r,p); %  dashed evenly;

  draw z2--z.q dashed evenly; 
  
  draw prug(z.p,z1,z.s);
  draw prug(z.q,z2,z.p);

  xnots (p,q,r,s); 

  label.llft(btex $R$ etex,z.r+(2,0));
  label.llft(btex $Q$ etex,z.q+(2,0));
  label.llft(btex $\ell$ etex,.6z.s+(2,0));
  label.lrt(btex $P$ etex,z.p+(-2,0));
  

endfig;


beginfig(13)

  r:=17.5u;

  path c;

  c = fullcircle scaled 2r;

  z = origin; 
  z0 = dir 162;
  z1 = dir 218;
  z2 = dir -72;
  z3 = dir -35;
  z4 = dir 15;
  z5 = dir 57;

  for n = 0 upto 5:
    z[n]' = directionpoint z[n] of c;
  endfor

  for n = 0 upto 5:
    z[n]'' = z[n]' + whatever*z[n]' rotated 90 = z[(n+1) mod 6]' + whatever*z[(n+1) mod 6]' rotated 90;
  endfor
  

  draw z0''--z1''--z2''--z3''--z4''--z5''--cycle withpen thick;

  draw prug(z,z0',z5'');
  draw prug(z,z5',z5'');
  
  draw z--z0' dashed evenly;
  draw z--z5' dashed evenly;
  draw z--z5'' dashed evenly;

  
  draw c scaled (1-.5/r); %  dashed evenly;

  xnot z;

  label(btex $r$ etex,.5[z,z0']-5.5UR(,0'));
  label(btex $r$ etex,.5[z,z5']+6UR(,5'));
  
endfig;

beginfig(14)

  u:=1mm;
  for n = 0 upto 9:
    z[n] = (15u,0) rotated 36n;
  endfor;

  z2-z1 = z0'-z0 = z9'-z9;

  z0''-z0' = z9''-z9' = z8''-z9 = z3-z2;

  z4-z4'' = z1-z0; 
  
  fill P(2,3,0'',9'',8'',7,8,9,9',0') withcolor .65; 
  fill P(0,0',0'',4'',4,5,6,9'',9',9) withcolor .8;

  fill P(0',0'',9'',9') withcolor .4;
  

%   draw z6--z4'' withcolor 1;
  draw P(0',0'',9'',8'',9,9') withcolor 1;
  draw P(0',0'',4'',6,9'',9') withcolor 1;
%   draw z9'--z9'' withcolor 1;


    draw P(0,1,2,3,4,5,6,7,8,9);

  pickup thick;

  drawarrow z5--z4;
  drawarrow z3--z2;

  label(btex $\vec v$ etex,.5[z2,z3]-6.5UR(2,3));
  label(btex $\vec u$ etex,.5[z4,z5]-6UR(4,5));
  
endfig;

beginfig(16)

  u:=6mm;

  z = origin;
  
  label (btex $-3$ etex, (0u,0u)+z);
  label (btex $-2$ etex, (1u,0u)+z);
  label (btex $-2$ etex, (2u,0u)+z);
  label (btex $4$ etex, (3u,0u)+z);
  label (btex $4$ etex, (4u,0u)+z);
  
  label (btex $2$ etex, (0u,1u)+z);
  label (btex $-1$ etex, (1u,1u)+z);
  label (btex $0$ etex, (2u,1u)+z);
  label (btex $3$ etex, (3u,1u)+z);
  label (btex $1$ etex, (4u,1u)+z);

  label (btex $1$ etex, (0u,2u)+z);
  label (btex $3$ etex, (1u,2u)+z);
  label (btex $2$ etex, (2u,2u)+z);
  label (btex $-4$ etex, (3u,2u)+z);
  label (btex $2$ etex, (4u,2u)+z);
  
  label (btex $-1$ etex, (0u,3u)+z);
  label (btex $2$ etex, (1u,3u)+z);
  label (btex $-1$ etex, (2u,3u)+z);
  label (btex $-1$ etex, (3u,3u)+z);
  label (btex $2$ etex, (4u,3u)+z);

  label (btex $2$ etex, (0u,4u)+z);
  label (btex $-3$ etex, (1u,4u)+z);
  label (btex $-1$ etex, (2u,4u)+z);
  label (btex $0$ etex, (3u,4u)+z);
  label (btex $3$ etex, (4u,4u)+z);

  d:=3.5mm;
  draw unitsquare scaled (4u+2d) shifted (-d,-d);

  labeloffset:=labeloffset+3;
  

  label.bot(btex $1$ etex,(0u,-d));
  label.bot(btex $-1$ etex,(1u,-d));
  label.bot(btex $-2$ etex,(2u,-d));
  label.bot(btex $2$ etex,(3u,-d));
  label.bot(btex $12$ etex,(4u,-d));

  label.rt(btex $1$ etex,(4u+d,0u));
  label.rt(btex $5$ etex,(4u+d,1u));
  label.rt(btex $4$ etex,(4u+d,2u));
  label.rt(btex $1$ etex,(4u+d,3u));
  label.rt(btex $1$ etex,(4u+d,4u));

  pickup thick;
    
  drawarrow ((0,15)--(0,5)) shifted (u,4u+d);
      
  pickup defaultpen;
    
  labeloffset:=labeloffset-3;

  draw image(

  label (btex $-3$ etex, (0u,0u)+z);
  label (btex $2$ etex, (1u,0u)+z);
  label (btex $-2$ etex, (2u,0u)+z);
  label (btex $4$ etex, (3u,0u)+z);
  label (btex $4$ etex, (4u,0u)+z);
  
  label (btex $2$ etex, (0u,1u)+z);
  label (btex $1$ etex, (1u,1u)+z);
  label (btex $0$ etex, (2u,1u)+z);
  label (btex $3$ etex, (3u,1u)+z);
  label (btex $1$ etex, (4u,1u)+z);

  label (btex $1$ etex, (0u,2u)+z);
  label (btex $-3$ etex, (1u,2u)+z);
  label (btex $2$ etex, (2u,2u)+z);
  label (btex $-4$ etex, (3u,2u)+z);
  label (btex $2$ etex, (4u,2u)+z);
  
  label (btex $-1$ etex, (0u,3u)+z);
  label (btex $-2$ etex, (1u,3u)+z);
  label (btex $-1$ etex, (2u,3u)+z);
  label (btex $-1$ etex, (3u,3u)+z);
  label (btex $2$ etex, (4u,3u)+z);

  label (btex $2$ etex, (0u,4u)+z);
  label (btex $3$ etex, (1u,4u)+z);
  label (btex $-1$ etex, (2u,4u)+z);
  label (btex $0$ etex, (3u,4u)+z);
  label (btex $3$ etex, (4u,4u)+z);

%   d:=3.5mm;
  draw unitsquare scaled (4u+2d) shifted (-d,-d);

  labeloffset:=labeloffset+3;
  

  label.bot(btex $1$ etex,(0u,-d));
  label.bot(btex $1$ etex,(1u,-d));
  label.bot(btex $-2$ etex,(2u,-d));
  label.bot(btex $2$ etex,(3u,-d));
  label.bot(btex $12$ etex,(4u,-d));

  label.rt(btex $5$ etex,(4u+d,0u));
  label.rt(btex $7$ etex,(4u+d,1u));
  label.rt(btex $-2$ etex,(4u+d-3,2u));
  label.rt(btex $-3$ etex,(4u+d-3,3u));
  label.rt(btex $7$ etex,(4u+d,4u));

  labeloffset:=labeloffset-3;

    ) shifted (9u,0);

  draw image(
      draw (-10,-2)--(8,-2);
    draw (-10,2)--(8,2);
    draw (6,-4)--(10,0)--(6,4);
    ) shifted (7u,2u);
  
endfig;

beginfig(17);

  u:=4mm;

  for n = 0 upto 9:
    fill unitsquare shifted (n,9-n) scaled u withcolor .4;
  endfor

  draw unitsquare scaled 10u;

  for n = 1 upto 9:
    draw (n*u,0)--(n*u,10u);
    draw (0,n*u)--(10u,n*u);
  endfor

  draw image (
        for n = 0 upto 9:
    fill unitsquare shifted (n,9-n) scaled u withcolor .4;
	if n<9:
	  fill unitsquare shifted (n,8-n) scaled u withcolor .7;
	  fill unitsquare shifted (n+1,9-n) scaled u withcolor .7;
	  fi
  endfor

  draw unitsquare scaled 10u;

  for n = 1 upto 9:
    draw (n*u,0)--(n*u,10u);
    draw (0,n*u)--(10u,n*u);
  endfor


  ) shifted (14u,0);
  

  draw image(
      draw (-10,-2)--(8,-2);
    draw (-10,2)--(8,2);
    draw (6,-4)--(10,0)--(6,4);
    ) shifted (12u+2,5u);
  

endfig;

beginfig(170);

  u:=4mm;

  for n = 1,3,5,7,9:
    fill unitsquare shifted (n,0) scaled u withcolor .4;
    fill unitsquare shifted (0,n) scaled u withcolor .4;
  endfor

  draw unitsquare scaled 10u;

  for n = 1 upto 9:
    draw (n*u,0)--(n*u,10u);
    draw (0,n*u)--(10u,n*u);
  endfor


endfig;

beginfig(18)

  u:=.5mm;

  r0:=10u;
  k:=.25;
  
  
  path c[];

  c0 = fullcircle scaled 2r0  yscaled k;

  z = unitvector dir 83;
  
  t0 = directiontime z of c0;
  t1 = (4-t0) mod 8 ;

  z0 = point t0 of c0;
  z0' = z0 + 25u*z;

  z1 = z0 xscaled -1;
  z1' = z0' xscaled -1;


  z0c = origin;

  
  c1 = c0 scaled (x1'/x1) ;

  r1 := xpart point 0 of c1;
  z1c = (z1'-point t1 of c1);

  c1 := c1 shifted z1c;

  vardef bucket (expr l,T) =
    pair tmp;
    path tmpath;
    image(
  tmp = l[z0c,z1c];
  tmpath = fullcircle scaled (l[r0,r1]*2) yscaled k shifted tmp;


  fill subpath (t1,t0) of c0 --subpath (t0,t1+8) of tmpath--cycle  withcolor .7;

   draw subpath (t1,t0) of tmpath;

  draw z1'--subpath (t1,t0) of c0--z0';
  draw subpath (t0,t1+8) of c0 dashed evenly;
  draw subpath (t0,t1+8) of tmpath dashed evenly;
  draw z0--z0';
  draw z1--z1';
      draw c1;
      label(T,z1c+.5down);
	)
  enddef;
  
  
  draw bucket(.4,btex 11 у etex);
  draw bucket(.25,btex 6 у etex) shifted (29u,-16u);
  draw bucket(.5,btex 14 у etex) shifted (58u,0u);

  draw image(
  draw bucket(.4,btex 11 у etex);
  draw bucket(.44,btex 12 у etex) shifted (29u,-16u);
  draw bucket(.3,btex 8 у etex) shifted (58u,0u);
    ) shifted (110u,0); 

  draw image(
      draw (-10,-2)--(8,-2);
    draw (-10,2)--(8,2);
    draw (6,-4)--(10,0)--(6,4);
    ) shifted (84u,6u);
  
  
endfig;

beginfig(19)

  u:=4mm;

  for n = -4 upto 4:
    draw (-4.5u,n*u)--(4.5u,n*u);
    draw (n*u,-4.5u)--(n*u,4.5u);
  endfor

  for n = -4 upto 0:
    for m = -4 upto 4:
      fill fullcircle scaled 7 shifted (m*u,n*u);
      draw fullcircle scaled 5.5 shifted (m*u,n*u) withcolor 1 withpen thin;
    endfor
  endfor

  draw  ((-u,-u){dir 75}..(u-1,u-1)) cutbefore (fullcircle scaled 8 shifted (-u,-u)) cutafter (fullcircle scaled 4 shifted (u,u)) withpen thick  withcolor 1;

  drawarrow  ((-u,-u){dir 75}..(u,u-1)) cutbefore (fullcircle scaled 8 shifted (-u,-u)) cutafter (fullcircle scaled 4 shifted (u,u));
      
  draw image(
      for n = -4 upto 4:
    draw (-4.5u,n*u)--(4.5u,n*u);
    draw (n*u,-4.5u)--(n*u,4.5u);
  endfor

  for n = -4 upto 0:
    for m = -4 upto 4:
      if not (((n=0) and (m = 0)) or ((n=-1) and (m=-1)))  :
	fill fullcircle scaled 7 shifted (m*u,n*u);
	draw fullcircle scaled 5.5 shifted (m*u,n*u) withcolor 1 withpen thin;
      fi
    endfor
  endfor

  fill fullcircle scaled 7 shifted (u,u);
  draw fullcircle scaled 5.5 shifted (u,u) withcolor 1 withpen thin;
  
  fill fullcircle scaled 7 shifted (6u,-.5u);
  draw fullcircle scaled 5.5 shifted (6u,-.5u) withcolor 1 withpen thin;
  

      ) shifted (13u,0);

    
  
  draw image(
      draw (-10,-2)--(8,-2);
    draw (-10,2)--(8,2);
    draw (6,-4)--(10,0)--(6,4);
    ) shifted (6.5u+1,0u);
  
  
  
endfig;

beginfig(190)

  u:=5mm;

  for n = 0 upto 9:
    draw (-.7u,n*u)--(9.7u,n*u);
    draw (n*u,-.7u)--(n*u,9.7u);
  endfor

  for n = 0 upto 9:
    for m = 0 upto 9:
      fill fullcircle  scaled 10 shifted ((n,m) scaled u)
	withcolor if (n mod 3 = 0) or (m mod 3 = 0): 1 else: .7 fi;
      draw fullcircle  scaled 10 shifted ((n,m) scaled u) withpen thin;
    endfor
  endfor

  picture tmpicture;
  tmpicture := currentpicture;

  
  % for n = -4 upto 0:
  %   for m = -4 upto 4:
  %     fill fullcircle scaled 7 shifted (m*u,n*u);
  %     draw fullcircle scaled 5.5 shifted (m*u,n*u) withcolor 1 withpen thin;
  %   endfor
  % endfor

  r:=6;
  
  
  fill fullcircle scaled r shifted (0u,9u);
  fill fullcircle scaled r shifted (1u,9u);
  draw fullcircle scaled (r-.5) shifted (2u,9u);

  drawarrow (0u,9u){dir 55}..(2u,9u) cutbefore (fullcircle scaled 12 shifted (0u,9u)) cutafter (fullcircle scaled 12 shifted (2u,9u));

  fill fullcircle scaled r shifted (4u,8u);
  fill fullcircle scaled r shifted (5u,8u);
  draw fullcircle scaled (r-.5) shifted (6u,8u);

  drawarrow (4u,8u){dir 55}..(6u,8u) cutbefore (fullcircle scaled 12 shifted (4u,8u)) cutafter (fullcircle scaled 12 shifted (6u,8u));

  fill fullcircle scaled r shifted (6u,1u);
  fill fullcircle scaled r shifted (7u,1u);
  fill fullcircle scaled (r-.5) shifted (8u,1u) withcolor 1 ;
  draw fullcircle scaled (r-.5) shifted (8u,1u);

  drawarrow (6u,1u){dir 55}..(8u,1u) cutbefore (fullcircle scaled 12 shifted (6u,1u)) cutafter (fullcircle scaled 12 shifted (8u,1u));

  fill fullcircle scaled r shifted (4u,2u);
  fill fullcircle scaled r shifted (4u,3u);
  fill fullcircle scaled (r-.5) shifted (4u,4u) withcolor 1 ;
  draw fullcircle scaled (r-.5) shifted (4u,4u);

  drawarrow (4u,2u){dir (90+55)}..(4u,4u) cutbefore (fullcircle scaled 12 shifted (4u,2u)) cutafter (fullcircle scaled 12 shifted (4u,4u));
  
    

draw image(draw tmpicture;

    for $ = (0,7u),(2u,2u),(4u,6u),(7u,2u):
  draw image( for n = 0 upto 2:
      for m = 0 upto 2:
      fill fullcircle scaled r shifted (n*u,m*u);
    endfor
  endfor) shifted $;
endfor


  ) shifted (11.5u,0);



endfig;
  
beginfig(20)

  u:=1mm;

  for n = 0 upto 4:
    z[n] = (10u,0) rotated (72n-4);
  endfor

  fill P(0,1,2,3,4) withcolor .7;

  draw P(0,1,2,3,4);

  label.rt(btex $-2$ etex,z0+.25up);
  label.top(btex $1$ etex,z1);
  label.ulft(btex $3$ etex,z2+dir -45);
  label.llft(btex $-1$ etex,z3+dir 45);
  label.bot(btex $0$ etex,z4);

  draw fullcircle scaled 16 yscaled .8 shifted (10u+9,-2);
  
  draw image(
        fill P(0,1,2,3,4) withcolor .7;

  draw P(0,1,2,3,4);

  label.rt(btex $2$ etex,z0);
  label.top(btex $-1$ etex,z1);
  label.ulft(btex $3$ etex,z2+dir -45);
  label.llft(btex $-1$ etex,z3+dir 45);
  label.bot(btex $-2$ etex,z4);

    ) shifted (40u,0);

  draw image(
      draw (-10,-2)--(8,-2);
    draw (-10,2)--(8,2);
    draw (6,-4)--(10,0)--(6,4);
    ) shifted (22.5u,0u);
  
  
endfig;

beginfig(200)

  u:=1mm;

  for n = 0 upto 4:
    z[n] = (10u,0) rotated (72n-4);
  endfor

  fill P(0,1,2,3,4) withcolor .7;

  draw P(0,1,2,3,4);

  label.rt(btex $-2$ etex,z0+.25up);
  label.top(btex $1$ etex,z1);
  label.ulft(btex $3$ etex,z2+dir -45);
  label.llft(btex $-1$ etex,z3+dir 45);
  label.bot(btex $0$ etex,z4);

  d:=4.5u;
  k:=.9;
  
  tmpicture:=
    image(
  label.top(btex \ldots etex scaled k,(-d,0));
  label.top(btex $-1$ etex scaled k,(0d,0));
  label.top(btex $-3$ etex scaled k,(1d,0));
  label.top(btex $-3$ etex scaled k,(2d,0));
  label.top(btex $-4$ etex scaled k,(3d,0));
  label.top(btex $-1$ etex scaled k,(4d,0));
  label.top(btex $\vphantom-0$ etex scaled k,(5d,0));
  label.top(btex $-2$ etex scaled k,(6d,0));
  label.top(btex $-2$ etex scaled k,(7d,0));
  label.top(btex $-3$ etex scaled k,(8d,0));
  label.top(btex $\vphantom-0$ etex scaled k,(9d,0));
  label.top(btex $\vphantom-1$ etex scaled k,(10d,0));
  label.top(btex $-1$ etex scaled k,(11d,0));
  label.top(btex $-1$ etex scaled k,(12d,0));
  label.top(btex $-2$ etex scaled k,(13d,0));
  label.top(btex $\vphantom-1$ etex scaled k,(14d,0));
  label.top(btex $\vphantom-2$ etex scaled k,(15d,0));
  label.top(btex $\vphantom-0$ etex scaled k,(16d,0));
  label.top(btex $\vphantom-0$ etex scaled k,(17d,0));
  label.top(btex $-1$ etex scaled k,(18d,0));
  label.top(btex $\vphantom-2$ etex scaled k,(19d,0));
  label.top(btex $\vphantom-3$ etex scaled k,(20d,0));
  label.top(btex $\vphantom-1$ etex scaled k,(21d,0));
  label.top(btex $\vphantom-1$ etex scaled k,(22d,0));
  label.top(btex \ldots etex scaled k,(23d,0));

  label.lft(btex $b(0)$ etex,(7d,-10u));
    
  drawarrow (7d,-10u){dir 15}  ..(9d,0);
    
   drawdblarrow (0d,0){down}..(1d,0);
   drawdblarrow (5d,0){down}..(6d,0);
    drawdblarrow (10d,0){down}..(11d,0);
   drawdblarrow (15d,0){down}..(16d,0);
    drawdblarrow (20d,0){down}..(21d,0);
    
	);

  draw tmpicture shifted (-11d,-20u);
    
      
  
  
  draw fullcircle scaled 16 yscaled .8 shifted (10u+9,-2);
  
  draw image(
        fill P(0,1,2,3,4) withcolor .7;

  draw P(0,1,2,3,4);

  label.rt(btex $2$ etex,z0);
  label.top(btex $-1$ etex,z1);
  label.ulft(btex $3$ etex,z2+dir -45);
  label.llft(btex $-1$ etex,z3+dir 45);
  label.bot(btex $-2$ etex,z4);

    tmpicture:=
    image(
  label.top(btex \ldots etex scaled k,(-d,0));
  label.top(btex $-3$ etex scaled k,(0d,0));
  label.top(btex $-1$ etex scaled k,(1d,0));
  label.top(btex $-3$ etex scaled k,(2d,0));
  label.top(btex $-4$ etex scaled k,(3d,0));
  label.top(btex $-1$ etex scaled k,(4d,0));
  label.top(btex $-2$ etex scaled k,(5d,0));
  label.top(btex $\vphantom-0$ etex scaled k,(6d,0));
  label.top(btex $-2$ etex scaled k,(7d,0));
  label.top(btex $-3$ etex scaled k,(8d,0));
  label.top(btex $\vphantom-0$ etex scaled k,(9d,0));
  label.top(btex $-1$ etex scaled k,(10d,0));
  label.top(btex $\vphantom-1$ etex scaled k,(11d,0));
  label.top(btex $-1$ etex scaled k,(12d,0));
  label.top(btex $-2$ etex scaled k,(13d,0));
  label.top(btex $\vphantom-1$ etex scaled k,(14d,0));
  label.top(btex $\vphantom-0$ etex scaled k,(15d,0));
  label.top(btex $\vphantom-2$ etex scaled k,(16d,0));
  label.top(btex $\vphantom-0$ etex scaled k,(17d,0));
  label.top(btex $-1$ etex scaled k,(18d,0));
  label.top(btex $\vphantom-2$ etex scaled k,(19d,0));
  label.top(btex $\vphantom-1$ etex scaled k,(20d,0));
  label.top(btex $\vphantom-3$ etex scaled k,(21d,0));
  label.top(btex $\vphantom-1$ etex scaled k,(22d,0));
  label.top(btex \ldots etex scaled k,(23d,0));

   % drawdblarrow (0d,0){down}..(1d,0);
   % drawdblarrow (5d,0){down}..(6d,0);
   %  drawdblarrow (10d,0){down}..(11d,0);
   % drawdblarrow (15d,0){down}..(16d,0);
   %  drawdblarrow (20d,0){down}..(21d,0);
    
	);

  draw tmpicture shifted (-11d,-20u);

        ) shifted (0,-50u);



 draw image(
     draw (-10,-2)--(8,-2);
   draw (-10,2)--(8,2);
   draw (6,-4)--(10,0)--(6,4);
   ) rotated -90 shifted (0,-30u);
  
  
endfig;

beginfig(21)

  
  u:=.6mm;
  w:=7u;
  h:=6u;
  d:=2;
  
  vardef brick =
    image (
    fill (0,0)--(w,0)--(w-d,d)--(d,d)--cycle withcolor .4;
    fill (w,h)--(w,0)--(w-d,d)--(w-d,h-d)--cycle withcolor .5;
    fill (w,h)--(0,h)--(d,h-d)--(w-d,h-d)--cycle withcolor .7;
    fill (0,0)--(0,h)--(d,h-d)--(d,d)--cycle withcolor .7;
      fill (w-d,h-d)--(d,h-d)--(d,d)--(w-d,d)--cycle withcolor .8;
%      draw (w-d,h-d)--(d,h-d)--(d,d)% --(w-d,d)--cycle
%	withpen fine ;
%      draw (0,0)--(d,d) withpen fine ;
%      draw (0,h)--(d,h-d) withpen fine withcolor .5 ;
%      draw (w,0)--(w-d,d) withpen fine withcolor .8;
      % draw (w,h)--(w-d,h-d) withpen fine;
      draw unitsquare xscaled w yscaled h withcolor .8 withpen fine; 
      )
  enddef;

  for n = 0 upto 5:
    for m = 0 upto 3:
      draw brick shifted ((w*n,h*m));
    endfor
  endfor


  draw image(
      draw (-10,-2)--(8,-2);
    draw (-10,2)--(8,2);
    draw (6,-4)--(10,0)--(6,4);
    ) shifted (7.5w,2h);
  
  draw image(
  for n = 0 upto 5:
    for m = 0 upto 1:
      draw brick shifted ((w*n,h*m));
    endfor
  endfor
  ) rotated 10 shifted (9w,2.3h);
  
  draw image(
  for n = 0 upto 5:
    for m = 0 upto 1:
      draw brick shifted ((w*n,h*m));
    endfor
  endfor
  ) rotated -10 shifted (9w,-.2h);
  
  draw image(
      draw (-10,-2)--(8,-2);
    draw (-10,2)--(8,2);
    draw (6,-4)--(10,0)--(6,4);
    ) shifted (16.25w,2h);
      
  draw image(
  for n = 0 upto 5:
    for m = 0 upto 1:
      draw brick shifted ((w*n,h*m));
    endfor
  endfor
  ) rotated 10 shifted (18w,2.3h);
  
  draw image(
  for n = 0 upto 4:
    for m = 0 upto 1:
      draw brick shifted ((w*n,h*m));
    endfor
  endfor
  ) rotated -10 shifted (18w,-.2h);
  
  draw image(
  for n = 5 upto 6:
    for m = 0 upto 1:
      draw brick shifted ((w*n,h*m));
    endfor
  endfor
  ) rotated 10 shifted (19w,-2h);
  
    
  
endfig;

beginfig(22)


  u:=1.2mm;

  for n = 0 upto 4:
    z[n] = (-10u,0) rotated 72n;
  endfor

  l0 := length (z0-z1);
  l1 :=  length(z0-z2);

  for n = 0 upto 4:
    z[n]' = z[n] scaled (l1/l0);
  endfor

  
  transform T;

  z0 transformed T = z0;
  z4 transformed T = z4;
  z1 transformed T = z0';

  z0'' = z2 transformed T;

  for n = 1 upto 4:
    z[n]'' = z0'' rotated 72n;
  endfor

  for n = 0 upto 4:
    z[n]''' = z[n]'' scaled 1.5;
  endfor
  
  
  draw P(0,1,2,3,4);

  for n = 0 upto 4:
    draw z[n]--z[n]';
    draw z[n]''--z[n]''';
  endfor
  
  draw P(0'',0',1'',1',2'',2',3'',3',4'',4');

  draw P(0''',1''',2''',3''',4''');

  path p[];

  k:=l0/247;

  z =  (-422,-292);
  
  p0 = ((735,526)
	 ..controls (779,580) and (793,626)..(713,738)
	 ..controls (605,890) and (403,860)..(217,794)
	 ..controls (-9,714) and (-49,664)..(-49,356)
	 ..controls (-49,2) and (-54,-25)..(142,-78)
	 ..controls (180,-88) and (269,-138)..(305,-62)) shifted z scaled k;

  p1 = ((248,102)
	 ..controls (316,46) and (389,26)..(480,44)
	 ..controls (581,64) and (630,2)..(704,36))  shifted z scaled k;

  p2 = ((218,616)
	 ..controls (106,586) and (66,522)..(62,396))  shifted z scaled k;

  p3 = ((-46,356)
	 ..controls (-35,343) and (2,313)..(34,323)
	 ..controls (109,346) and (125,441)..(202,431)
	 ..controls (309,418) and (327,243)..(430,274)
	 ..controls (531,304) and (427,531)..(524,528)
	 ..controls (597,526) and (669,464)..(671,322)
	 ..controls (673,215) and (789,238)..(758,118)
	 ..controls (734,27) and (791,-34)..(730,-132)
	 ..controls (622,-274) and (563,-284)..(97,-134)
	 ..controls (-130,-61) and (-162,224)..(-46,356))  shifted z scaled k;


  drawarrow subpath (0,2.99) of p0 dashed evenly ;
  drawarrow subpath (5,3.02) of p0 dashed evenly ;
  drawarrow subpath (0,1) of p1 dashed evenly;
  drawarrow subpath (1.05,2) of p1 dashed evenly;
  drawarrow p2 dashed evenly;
  pickup thick;
  drawarrow subpath (0,1.15) of p3 dashed evenly;
  drawarrow subpath (1.2,2.05) of p3 dashed evenly;
  drawarrow subpath (2.1,3) of p3 dashed evenly;
  drawarrow subpath (3.05,4.1) of p3 dashed evenly;
  drawarrow subpath (4.15,5.03) of p3 dashed evenly;
  drawarrow subpath (5.08,6) of p3 dashed evenly;
  drawarrow subpath (6.05,8.99) of p3 dashed evenly scaled .98;

  
endfig;

beginfig(23)

  
  u:=.8mm;
  w:=7u;
  h:=7u;
  d:=2;
  
  for n = 0 upto 5:
    for m = 0 upto 2:
      draw brick shifted ((w*n,h*m));
    endfor
  endfor

  for n = 0 upto 3:
    draw brick shifted ((w*n,3h));
  endfor

  draw brick shifted (4.2w,3.2h);
  draw brick shifted (5.2w,3.2h);

  draw ((d+1,d+1)--(w-d-1,h-d-1)) shifted (4.2w,3.2h);
  draw ((d+1,h-d-1)--(w-d-1,d+1)) shifted (4.2w,3.2h);

  path p[];

  k:=.6w/630;

  p0 = ((464,263)
	 ..controls (450,263) and (436,270)..(436,284)
	 ..controls (436,305) and (457,330)..(464,330)
	 ..controls (471,330) and (492,305)..(492,284)
	 ..controls (492,270) and (478,263)..cycle) scaled k;
  p1 = ((588,449)
	 ..controls (561,449) and (519,481)..(519,444)
	 ..controls (519,389) and (543,360)..(585,360)
	 ..controls (629,360) and (659,400)..(659,444)
	 ..controls (659,472) and (616,449)..cycle) shifted (5,0) scaled k;
  p2 = ((338,449)
	 ..controls (311,449) and (269,481)..(269,444)
	 ..controls (269,389) and (293,360)..(335,360)
	 ..controls (379,360) and (409,400)..(409,444)
	 ..controls (409,472) and (366,449)..cycle) scaled k;

  p3 = ((463,107)
	 ..controls (439,107) and (424,115)..(411,138)
	 ..controls (398,122) and (368,104)..(347,119)
	 ..controls (317,140) and (317,157)..(315,207)
	 ..controls (250,223) and (148,307)..(148,409)
	 ..controls (148,597) and (295,703)..(463,703)
	 ..controls (631,703) and (778,597)..(778,409)
	 ..controls (778,307) and (676,223)..(611,207)
	 ..controls (609,157) and (609,140)..(579,119)
	 ..controls (558,104) and (528,122)..(515,138)
	 ..controls (502,115) and (487,107)..cycle) scaled k;


  tmpicture := image(
      fill p3 withcolor 1;
    draw p3 withpen fine;
    filldraw p0  withpen fine;
    filldraw p1 withpen fine;
    filldraw p2 withpen fine);

  draw tmpicture shifted ((.5w,.5h)-(.5[llcorner tmpicture,urcorner tmpicture]));


  draw image(
  
  for n = 0 upto 5:
    for m = 0 upto 2:
      draw brick shifted ((w*n,h*m) if (n>2) and (m>0): +(.2w,.2h) fi );
    endfor
  endfor

  for n = 0 upto 2:
    draw brick shifted ((w*n,3h));
  endfor

%   draw brick shifted (4.2w,3.2h);
  draw brick shifted (3.2w,3.2h);

  draw ((d+1,d+1)--(w-d-1,h-d-1)) shifted (3.2w,1.2h);
  draw ((d+1,h-d-1)--(w-d-1,d+1)) shifted (3.2w,1.2h);

  draw tmpicture shifted ((.5w,.5h)-(.5[llcorner tmpicture,urcorner tmpicture]));
  ) shifted (9w,0);

  
  draw image(
      draw (-10,-2)--(8,-2);
    draw (-10,2)--(8,2);
    draw (6,-4)--(10,0)--(6,4);
    ) shifted (7.5w+2,2h);

endfig;

beginfig(24)

  u:=1.3*3mm;
  w:=2u;
  h:=3u;

  d:=4;
  dh:=12; 
  
  path p;
  p = (2,0)---(w-2,0)..(w,2)---(w,h-2)..(w-2,h)---(2,h)..(0,h-2)---(0,2)..cycle;

  picture T,K,D;  

  T = btex Т etex scaled .6 xscaled .9; 
  K = btex К etex scaled .6 xscaled .9; 
  D = btex Д etex scaled .6 xscaled .9; 
  
  vardef card (expr t) =
    image(
    fill p withcolor .9;
    draw p withpen fine;
    label.ulft(t,(w,0));
    label.lrt(t,(0,h));)
  enddef;

  vardef cardplace  =
    image(
    fill p withcolor .9;
    draw p withpen fine  dashed evenly scaled .91 withcolor .5 ;
)
  enddef;
  
  labeloffset:=labeloffset-1;

  draw card(K);
  draw card(D) shifted (w+d,0);
  draw card(T) shifted (1.3w+d,0);
  draw cardplace shifted (2.3w+2d,0);

  draw image (
      draw card(K);
    draw card(T) shifted (.3w,0);
    draw card(D) shifted (1.3w+d,0);
    draw cardplace shifted (2.3w+2d,0);
    ) shifted (1.8w,-h-dh); 

  drawarrow (1.8w+d,.25h){dir -45}..(.8w,.75h)    shifted (1.8w,-h-dh); 

  draw image (
      draw card(K);
    draw card(T) shifted (.3w,0);
    draw cardplace shifted (1.3w+d,0);
    draw card(D) shifted (2.3w+2d,0);
    ) shifted (3.6w,-2h-2dh); 

  drawarrow (1.8w+d,.25h) shifted (1.8w,-h-dh) {dir 25}..(2.8w+2d,.75h)  shifted (3.6w,-2h-2dh); 
  
  draw image (
      draw card(K);
    draw card(T) shifted (w+d,0);
    draw card(D) shifted (2w+2d,0);
    ) shifted (5.4w,-3h-3dh); 

  drawarrow (.8w,.25h) shifted (3.6w,-2h-2dh) {dir 20}..(1.5w+d,.75h)  shifted (5.4w,-3h-3dh); 
  

  draw image (
      draw card(K);
    draw card(D) shifted (w+d,0);
    draw card(T) shifted (2w+2d,0);
    ) shifted (5.4w,0);

  drawarrow (2.5w+2d,.25h) shifted (5.4w,0){dir -133}..(.8w,.75h)    shifted (3.6w,-2h-2dh); 
  
  draw image (
      draw cardplace;
    draw card(T) shifted (w+d,0);
    draw card(K) shifted (1.3w+d,0);
    draw card(D) shifted (2.3w+2d,0);
    ) shifted (5.4w-.15w,-4*(h+dh)); 

  drawarrow (.5w,.25h) shifted (5.4w,-3*(h+dh)){dir 0}  .. (1.8w+d,.75h)  shifted (5.4w-.15w,-4(h+dh)); 



  draw image (
      draw card(D);
    draw card(T) shifted (w+d,0);
    draw card(K) shifted (1.3w+d,0);
    draw cardplace shifted (2.3w+2d,0);
    ) shifted (5.4w-.15w,-5*(h+dh)); 

  drawarrow (2.8w+2d,.25h) shifted (5.4w-.15w,-4*(h+dh)){dir 180}  .. {dir -110}(.5w,.75h)  shifted (5.4w-.15w,-5(h+dh)); 

  
  draw image (
      draw card(D);
    draw card(T) shifted (w+d,0);
    draw card(K) shifted (2w+2d,0);
    ) shifted (5.4w,-6*(h+dh)); 
  
  drawarrow (1.8w+d,.25h) shifted (5.4w-.15w,-5*(h+dh)){dir 10}  .. {dir -90}(2.5w+2d,.75h)  shifted (5.4w,-6(h+dh)); 

  draw image (
      draw card(D);
    draw card(K) shifted (.3w,0);
    draw card(T) shifted (1.3w+d,0);
    draw cardplace shifted (2.3w+2d,0);
    ) shifted (5.4w-.15w,-7*(h+dh)); 

  drawarrow (2.5w+2d,.25h) shifted (5.4w,-6*(h+dh)){dir 170}  .. {dir -110}(.8w,.75h)  shifted (5.4w-.15w,-7(h+dh)); 


%%%

    draw image (
      draw card(K);
    draw card(T) shifted (.3w,0);
    draw cardplace shifted (1.3w+d,0);
    draw card(D) shifted (2.3w+2d,0);
    ) shifted (w,-3.5*(h+dh));


  drawarrow (.8w,.75h) shifted (w,-3.5*(h+dh)){dir 45}.. tension 1.2  .. (1.5w+d,.25h)  shifted (5.4w,-3(h+dh)); 

  
    draw image (
      draw card(K);
    draw cardplace shifted (w+d,0);
    draw card(D) shifted (2w+2d,0);
    draw card(T) shifted (2.3w+2d,0);
    ) shifted (0,-4.5*(h+dh));

  drawarrow (2.8w+2d,.75h) shifted (0,-4.5*(h+dh)){dir 100}  ..{dir 200} (.8w,.25h)  shifted (w,-3.5(h+dh)); 

  %%% 
  
  
  draw image (
      draw card(T);
    draw card(D) shifted (w+d,0);
    draw card(K) shifted (2w+2d,0);
    ) shifted (10w,.5*(h+dh));
  
  draw image (
      draw card(T);
    draw card(K) shifted (.3w,0);
    draw card(D) shifted (1.3w+d,0);
    draw cardplace shifted (2.3w+2d,0);
    ) shifted (10w-.15w,-.5*(h+dh));



  drawarrow (2.5w+2d,.25h) shifted (10w,.5*(h+dh)){dir 170}  .. (.8w,.75h)  shifted (10w-.15w,-.5(h+dh)); 

  
  draw image (
      draw card(T);
    draw card(K) shifted (.3w,0);
    draw cardplace shifted (1.3w+d,0);
    draw card(D) shifted (2.3w+2d,0);
    ) shifted (10w-.15w,-1.5*(h+dh));

  drawarrow (1.8w+d,.25h) shifted (10w-.15w,-.5*(h+dh)){dir 10}  .. {dir -90}(2.8w+2d,.75h)  shifted (10w-.15w,-1.5(h+dh)); 
  
  draw image (
      draw card(T);
    draw card(K) shifted (w+d,0);
    draw card(D) shifted (2w+2d,0);
    ) shifted (10w,-2.5*(h+dh));
  
  drawarrow (.8w,.25h) shifted (10w-.15w,-1.5*(h+dh)){dir 20}  .. {dir -90}(1.5w+d,.75h)  shifted (10w,-2.5(h+dh)); 
  
  draw image (
      draw cardplace ;
    draw card(K) shifted (1w+d,0);
    draw card(T) shifted (1.3w+d,0);
    draw card(D) shifted (2.3w+2d,0);
    ) shifted (10w-.15w,-3.5*(h+dh));
  
  drawarrow (.5w,.25h) shifted (10w,-2.5*(h+dh)){dir 10}  .. {dir -90}(1.8w+d,.75h)  shifted (10w-.15w,-3.5(h+dh)); 
  
  draw image (
      draw card(D) ;
    draw card(K) shifted (1w+d,0);
    draw card(T) shifted (1.3w+d,0);
    draw cardplace shifted (2.3w+2d,0);
    ) shifted (10w-.15w,-4.5*(h+dh));

  drawarrow (2.8w+2d,.25h) shifted (10w-.15w,-3.5*(h+dh)){dir 180}  .. {dir -110}(.5w,.75h)  shifted (10w-.15w,-4.5(h+dh)); 
  
  draw image (
      draw card(D);
    draw card(K) shifted (w+d,0);
    draw card(T) shifted (2w+2d,0);
    ) shifted (10w,-5.5*(h+dh));
  
  drawarrow (1.8w+d,.25h) shifted (10w-.15w,-4.5*(h+dh)){dir 10}  .. {dir -90}(2.5w+2d,.75h)  shifted (10w,-5.5(h+dh)); 
  
  draw image (
      draw card(D) ;
    draw card(K) shifted (.3w,0);
    draw cardplace shifted (1.3w+d,0);
    draw card(T) shifted (2.3w+2d,0);
    ) shifted (10w-.15w,-6.5*(h+dh));

  drawarrow (1.5w+d,.25h) shifted (10w,-5.5*(h+dh)){dir -150}  .. (.8w,.75h)  shifted (10w-.15w,-6.5(h+dh)); 

  draw image (
      draw card(D) ;
    draw card(K) shifted (.3w,0);
    draw card(T) shifted (.6w,0);
    draw cardplace shifted (1.6w+d,0);
    draw cardplace shifted (2.6w+2d,0);
    ) shifted (10w-.3w,-7.5*(h+dh));
  
  drawarrow (2.8w+2d,.25h) shifted (10w-.15w,-6.5*(h+dh)){dir -170}  .. (1.1w,.75h)  shifted (10w-.3w,-7.5(h+dh)); 
  
  drawarrow (1.8w+d,.25h) shifted (5.4w-.15w,-7*(h+dh)){dir 10}  .. (1.1w,.25h)  shifted (10w-.3w,-7.5(h+dh)); 
  

endfig;

beginfig(25)

  u:=1mm;
  path c;

  r:=3u;
  h:=3;
  c = fullcircle scaled 2r yscaled .25; 


  l:= 10u;
  
  vardef coin (expr n)  =
    image (
	fill subpath (0,4) of c shifted (0,n*h) -- subpath (4,8) of c--cycle withcolor .8;
      draw subpath (0,4) of c shifted (0,n*h) -- subpath (4,8) of c--cycle withpen thin;
      for k = 1 upto n: 
	draw subpath (4,8) of c shifted (0,k*h)  withpen thin;
      endfor
%      draw (point 1 of c--point 5 of c) scaled .7 shifted (0,n*h) withpen fine;
      )
  enddef;

  z3 = (0,l);
  z1 = (l,0) rotated 0;
%  z2 = (0,l) rotated 5 yscaled .4;
  z2 = (0,.45l) rotated 25;


  
  path p;
  p =  (-.5z1-.5z2)--(6.5z1-.5z2)--(6.5z1+.5z2)--(-.5z1+.5z2)--cycle;

  k:=1.7;
  kk:=1.2;
  
  transform T;

  origin transformed T = origin;
  (l,0) transformed T = z1;
  z3 transformed T = z2;


  vardef box = 
  image(
  draw subpath (-1,1) of p--subpath (1,3) of p shifted z3--cycle;
  draw subpath (-1,1) of p shifted z3;
  for n = 1 upto 6:
    draw (-.5z2-- z3-.5z2 -- z3+.5z2) shifted ((n-.5)*z1);
    draw (-.5z2-- .5z2 -- z3+.5z2) shifted ((n-.5)*z1) dashed evenly;
  endfor

  draw subpath (1,3) of p dashed evenly;

  draw (origin--z3) shifted point 0 of p;
  draw .5z2+6.5z1--z3+.5z2+6.5z1 dashed evenly shifted .5left;

  label(btex \textsc{вс} etex scaled k yscaled kk transformed T,z3);
  label(btex \textsc{пн} etex scaled k yscaled kk transformed T,z3+z1);
  label(btex \textsc{вт} etex scaled k yscaled kk transformed T,z3+2z1);
  label(btex \textsc{ср} etex scaled k yscaled kk transformed T,z3+3z1);
  label(btex \textsc{чт} etex scaled k yscaled kk transformed T,z3+4z1);
  label(btex \textsc{пт} etex scaled k yscaled kk transformed T,z3+5z1);
  label(btex \textsc{сб} etex scaled k yscaled kk transformed T,z3+6z1);
  

  ) enddef;


  draw box;
  draw coin (4) ;
  draw image (draw coin(2)) shifted z1 ;
  draw image (draw coin(3)) shifted 2z1 ;
  draw image (draw coin(3)) shifted 3z1 ;
  draw image (draw coin(3)) shifted 4z1 ;
  draw image (draw coin(3)) shifted 5z1 ;
  draw image (draw coin(3)) shifted 6z1 ;

  draw image(
  draw box;
  draw coin (2) ;
  draw image (draw coin(2)) shifted z1 ;
  draw image (draw coin(3)) shifted 2z1 ;
  draw image (draw coin(1)) shifted 3z1 ;
  draw image (draw coin(1)) shifted 4z1 ;
  draw image (draw coin(1)) shifted 5z1 ;
  draw image (draw coin(2)) shifted 6z1 ;

  ) shifted (0,-2l);

  draw image(
  draw box;
  draw coin (3) ;
  draw image (draw coin(2)) shifted z1 ;
  draw image (draw coin(2)) shifted 2z1 ;
  draw image (draw coin(2)) shifted 3z1 ;
  draw image (draw coin(2)) shifted 4z1 ;
  draw image (draw coin(2)) shifted 5z1 ;
  draw image (draw coin(2)) shifted 6z1 ;

  ) shifted (0,-4l);

  draw image(
  draw box;
  draw coin (2) ;
  draw image (draw coin(2)) shifted z1 ;
  draw image (draw coin(2)) shifted 2z1 ;
  draw image (draw coin(2)) shifted 3z1 ;
  draw image (draw coin(4)) shifted 4z1 ;
  draw image (draw coin(2)) shifted 5z1 ;
  draw image (draw coin(2)) shifted 6z1 ;

  ) shifted (0,-6l);

endfig;


beginfig(26)

  w := 1.2cm;
  h := 1cm;

  label(btex $010$ etex,(0w,0h));
  label(btex $001$ etex,(1w,0h));
  label(btex $100$ etex,(2w,0h));
  label(btex $001$ etex,(3w,0h));
  label(btex $010$ etex,(4w,0h));
  label(btex $100$ etex,(5w,0h));
  label(btex $001$ etex,(6w,0h));

  label(btex $002$ etex,(0w,1h));
  label(btex $200$ etex,(1w,1h));
  label(btex $002$ etex,(2w,1h));
  label(btex $020$ etex,(3w,1h));
  label(btex $110$ etex,(4w,1h));
  label(btex $002$ etex,(5w,1h));
  label(btex $020$ etex,(6w,1h));

  label(btex $300$ etex,(0w,2h));
  label(btex $102$ etex,(1w,2h));
  label(btex $120$ etex,(2w,2h));
  label(btex $111$ etex,(3w,2h));
  label(btex $003$ etex,(4w,2h));
  label(btex $030$ etex,(5w,2h));
  label(btex $012$ etex,(6w,2h));
  
  label(btex 1 таб etex,(-w-10,0h));
  label(btex 2 таб etex,(-w-10,1h));
  label(btex 3 таб etex,(-w-10,2h));

  label(btex день 1 etex,(0w,3h-5));
  label(btex день 2 etex,(1w,3h-5));
  label(btex день 3 etex,(2w,3h-5));
  label(btex день 4 etex,(3w,3h-5));
  label(btex день 5 etex,(4w,3h-5));
  label(btex день 6 etex,(5w,3h-5));
  label(btex день 7 etex,(6w,3h-5));
  
  drawarrow subpath (.2,.8) of ((0w,1h)--(1w,0h));

  drawarrow subpath (.4,.8) of ((-1w,1h)--(0w,0h));
  drawarrow subpath (.4,.8) of ((-1w,2h)--(0w,1h));


  for n = 0 upto 4:
  drawarrow subpath (.2,.8) of ((0w,2h)--(1w,1h)) shifted (n*w,0) ;
  drawarrow subpath (.2,.8) of ((1w,1h)--(2w,0h)) shifted (n*w,0) ;
  endfor

  drawarrow subpath (.2,.8) of ((5w,2h)--(6w,1h));
  drawarrow subpath (.2,.6) of ((6w,1h)--(7w,0h));

  drawarrow subpath (.2,.6) of ((6w,2h)--(7w,1h));
endfig;


beginfig(27)

  u:=1mm;
  l:=20u;

  dh:=15;
  dw:=20;

  ds := 22.038/4;
  
  pickup fine;

  path p,pp,q,qq;
  pp :=  (0,0)--(l/3,2/3l)--(2/3l,l/3)--(l,l);


  
  draw pp withpen thick;

  p:=  (0,0)--(l,l);
  draw p;

  dotdiam:=2.5;
  for n = 0 step 5 until arclength p:
    xnot (point (arctime n of p) of p);
  endfor

  
  draw image (draw origin--(l,0) withpen thick;
    q := origin--(0,l);
    draw q;

    k0 = arclength(subpath (0,1) of pp)/arclength pp ;
    k0' = arclength(p cutafter (point 1 of pp--point 1 of pp+(l,0)))/arclength p;

    k1 = arclength(subpath (0,2) of pp)/arclength pp ;
    k1' = arclength(p cutafter (point 2 of pp--point 2 of pp+(-l,0)))/arclength p;


      
    for n = 0 step ds until arclength q:
    xnot (point (arctime n of q) of q);
  endfor
  
  qq :=  (origin--(k0,k0')--(k1,k1')--(1,1)) scaled l;
  draw qq;
  for n = 0,1,2,3:  xdot point n of qq; endfor

      ) shifted (0,-l-dh);


%%%%%%%


  draw image(
%     p :=  (0,0)--(l/3,2/3l)--(2/3l,l/3)--(l,l);
 pp :=  (0,0)--(2l/5,2/3l)--(3/5l,l/3)--(l,l);

  show arclength subpath (1,2) of pp; 
  
      p:= pp;
  draw p withpen thick;
  for n = 0 step ds until arclength p:
    xnot (point (arctime n of p) of p);
  endfor

  draw image (draw origin--(l,0) withpen thick;
    q := origin--(0,l);
    draw q;

    k0 := arclength(subpath (0,1) of pp)/arclength pp ;


    k1 := arclength(subpath (0,2) of pp)/arclength pp ;


    k0' := arclength(p cutafter (point 1 of pp+right--point 1 of pp+(l,0)))/arclength p;
    k1' := arclength(p cutafter (point 2 of pp+left--point 2 of pp+(-l,0)))/arclength p;



    
    for n = 0 step ds until arclength q:
    xnot (point (arctime n of q) of q);
  endfor
  
  qq :=  (origin--(k0,k0)--(k1,k1')--(k0',k0)--(k0,k0')--(k1',k1)--(k0,k0)--(k1,k1)--(1,1)) scaled l;
  draw qq;
  for n = 0 upto length qq:  xdot point n of qq; endfor

      ) shifted (0,-l-dh);
  
  )       shifted (1l+dw,0);

%%%%%%%%%

  draw image(
      pp :=  (0,0)--(2l/5,2/3l)--(3/5l,l/3)--(l,l);

  draw pp withpen thick;

  p :=  (0,0)--(l/5,1/3l)--(2/5l,0)--(l,l);

  draw p;
  for n = 0 step ds until arclength p:
    xnot (point (arctime n of p) of p);
  endfor

    draw image (draw origin--(l,0) withpen thick;
    q := origin--(0,l);
    draw q;


    
    for n = 0 step ds until arclength q:
    xnot (point (arctime n of q) of q);
  endfor
  
  qq :=  (origin--(1/5,1/5)--(0,2/5)--(2/5,4/5)--(3/5,3/5)--(1,1)) scaled l;
  draw qq;
  for n = 0 upto length qq:  xdot point n of qq; endfor
  xdot (3/5,1/5) scaled l;

  ) shifted (0,-l-dh);

  )       shifted (2l+2dw,0);

%%%%%%%%%%%%


  draw image(
%      pp :=  (0,0)--(2l/5,2/3l)--(3/5l,l/3)--(l,l);

  draw pp withpen thick;

%   p :=  (0,0)--(l/5,1/3l)+3*(1.2*3.67)*unitvector(1/5,1/3)--(2/5l,0)+3*(1.2*3.67)*unitvector(1/5,1/3)--(l,l);
  p :=  (0,0)--1.5*(l/5,1/3l)--1.5*(l/5,1/3l)+(l/5,-1/3l)--(l,l);

  draw p;
  for n = 0 step ds until arclength p:
    xnot (point (arctime n of p) of p);
  endfor

      draw image (draw origin--(l,0) withpen thick;
    q := origin--(0,l);
    draw q;


    
    for n = 0 step ds until arclength q:
    xnot (point (arctime n of q) of q);
  endfor
  
  qq :=  (origin--(.3,.3)--(.2,.4)--(.6,.8)--(.7,.7)--(1,1)) scaled l;
  for n = 0 upto length qq:  xdot point n of qq; endfor

  draw qq;

  
  qq :=  ((.5,.3)--(.6,.4)--(.7,.3)--(.6,.2)--cycle) scaled l;
  for n = 0 upto length qq:  xdot point n of qq; endfor

  draw qq; 
  
  ) shifted (0,-l-dh);

  )       shifted (3l+3dw,0);


endfig;

beginfig(28)

  u:=1mm;
  r:=3u;

  picture p[];
  p1 = btex 1 etex;
  p2 = btex 2 etex;
  p3 = btex 3 etex;
  p4 = btex 4 etex;
  p5 = btex 5 etex;
  
  vardef ball (expr n) =
    image(
    fill subpath (0,-4) of fullcircle & subpath (4,8) of fullcircle yscaled .7 & cycle scaled 2r rotated 45 withcolor .5;
      draw fullcircle scaled 2r ;
      label(p[n],dir 90);
      )
  enddef;

  z0 = (0,r);
  z1 = z0+((2r,0) rotated 10) ;

  pair tmpair;
  tmpair = z1;

  z0' = (x0,y1);
  z1' = (x1,y0);

  vardef box(expr n) =
    image(
    draw (-r,3.5r)--(-r,-12)--(x1+r,-12)--(x1+r,3.5r);
      draw (-r,0)--(x1+r,0);
      label(p[n],(.5x1,-6));
      )
  enddef;

  dw := 5r;
  
  draw ball(5) shifted z0;
  draw ball(5) shifted z1;

  draw box(1);

  draw image(
  draw ball(4) shifted z0';
  draw ball(4) shifted z1';
    draw box(2);
    ) shifted (dw,0);

  draw image(
  draw ball(3) shifted z0';
  draw ball(3) shifted z1';
    draw box(3);
    ) shifted (2dw,0);

  draw image(
  draw ball(2) shifted z0;
  draw ball(2) shifted z1;
    draw box(4);
    ) shifted (3dw,0);

    draw image(
  draw ball(1) shifted z0';
  draw ball(1) shifted z1';
    draw box(5);
    ) shifted (4dw,0);

tmpicture:=currentpicture;

  
endfig;

beginfig(280)

  draw tmpicture shifted (-.5xpart tmpair,10) ;

  dh:=15;

  label(btex $55$ etex,(0dw,-dh)); 
  label(btex $54$ etex,(0dw,-2dh)); 
  label(btex $54$ etex,(0dw,-3dh)); 
  label(btex $54$ etex,(0dw,-4dh)); 
  label(btex $54$ etex,(0dw,-5dh)); 
  label(btex $54$ etex,(0dw,-6dh)); 
  label(btex $54$ etex,(0dw,-7dh)); 
  label(btex $41$ etex,(0dw,-8dh)); 
  label(btex $41$ etex,(0dw,-9dh)); 
  label(btex $41$ etex,(0dw,-10dh)); 
  label(btex $41$ etex,(0dw,-11dh)); 
  label(btex $41$ etex,(0dw,-12dh)); 
  label(btex $41$ etex,(0dw,-13dh)); 
  label(btex $11$ etex,(0dw,-14dh)); 
  label(btex $11$ etex,(0dw,-15dh)); 
  label(btex $11$ etex,(0dw,-16dh)); 

  label(btex $44$ etex,(1dw,-dh)); 
  label(btex $54$ etex,(1dw,-2dh)); 
  label(btex $43$ etex,(1dw,-3dh)); 
  label(btex $43$ etex,(1dw,-4dh)); 
  label(btex $43$ etex,(1dw,-5dh)); 
  label(btex $43$ etex,(1dw,-6dh)); 
  label(btex $31$ etex,(1dw,-7dh)); 
  label(btex $53$ etex,(1dw,-8dh)); 
  label(btex $32$ etex,(1dw,-9dh)); 
  label(btex $32$ etex,(1dw,-10dh)); 
  label(btex $32$ etex,(1dw,-11dh)); 
  label(btex $32$ etex,(1dw,-12dh)); 
  label(btex $21$ etex,(1dw,-13dh)); 
  label(btex $42$ etex,(1dw,-14dh)); 
  label(btex $22$ etex,(1dw,-15dh)); 
  label(btex $22$ etex,(1dw,-16dh)); 
  
  label(btex $33$ etex,(2dw,-dh)); 
  label(btex $33$ etex,(2dw,-2dh)); 
  label(btex $53$ etex,(2dw,-3dh)); 
  label(btex $32$ etex,(2dw,-4dh)); 
  label(btex $32$ etex,(2dw,-5dh)); 
  label(btex $21$ etex,(2dw,-6dh)); 
  label(btex $42$ etex,(2dw,-7dh)); 
  label(btex $42$ etex,(2dw,-8dh)); 
  label(btex $54$ etex,(2dw,-9dh)); 
  label(btex $42$ etex,(2dw,-10dh)); 
  label(btex $42$ etex,(2dw,-11dh)); 
  label(btex $21$ etex,(2dw,-12dh)); 
  label(btex $32$ etex,(2dw,-13dh)); 
  label(btex $32$ etex,(2dw,-14dh)); 
  label(btex $43$ etex,(2dw,-15dh)); 
  label(btex $33$ etex,(2dw,-16dh)); 

  label(btex $22$ etex,(3dw,-dh)); 
  label(btex $22$ etex,(3dw,-2dh)); 
  label(btex $22$ etex,(3dw,-3dh)); 
  label(btex $52$ etex,(3dw,-4dh)); 
  label(btex $21$ etex,(3dw,-5dh)); 
  label(btex $32$ etex,(3dw,-6dh)); 
  label(btex $32$ etex,(3dw,-7dh)); 
  label(btex $32$ etex,(3dw,-8dh)); 
  label(btex $32$ etex,(3dw,-9dh)); 
  label(btex $53$ etex,(3dw,-10dh)); 
  label(btex $31$ etex,(3dw,-11dh)); 
  label(btex $43$ etex,(3dw,-12dh)); 
  label(btex $43$ etex,(3dw,-13dh)); 
  label(btex $43$ etex,(3dw,-14dh)); 
  label(btex $43$ etex,(3dw,-15dh)); 
  label(btex $44$ etex,(3dw,-16dh)); 

  label(btex $11$ etex,(4dw,-dh)); 
  label(btex $11$ etex,(4dw,-2dh)); 
  label(btex $11$ etex,(4dw,-3dh)); 
  label(btex $11$ etex,(4dw,-4dh)); 
  label(btex $51$ etex,(4dw,-5dh)); 
  label(btex $51$ etex,(4dw,-6dh)); 
  label(btex $51$ etex,(4dw,-7dh)); 
  label(btex $51$ etex,(4dw,-8dh)); 
  label(btex $51$ etex,(4dw,-9dh)); 
  label(btex $51$ etex,(4dw,-10dh)); 
  label(btex $55$ etex,(4dw,-11dh)); 
  label(btex $55$ etex,(4dw,-12dh)); 
  label(btex $55$ etex,(4dw,-13dh)); 
  label(btex $55$ etex,(4dw,-14dh)); 
  label(btex $55$ etex,(4dw,-15dh)); 
  label(btex $55$ etex,(4dw,-16dh)); 

  for $ = (.5dw,-dh),(1.5dw,-2dh),(2.5dw,-3dh),(3.5dw,-4dh),
    (.5dw,-7dh),(1.5dw,-6dh),(2.5dw,-5dh),
      (1.5dw,-8dh),(2.5dw,-9dh),(3.5dw,-10dh),
      (.5dw,-13dh),(1.5dw,-12dh),(2.5dw,-11dh),
      (1.5dw,-14dh),(2.5dw,-15dh):
    drawdblarrow ((-10,0)--(10,0)) shifted $;
  endfor
    

endfig;


beginfig(29)

  u:=1mm;

  k:= 5cm/1200;
  
  path p[];

	p0 = ((734,642)
	 ..controls (847,545) and (893,513)..(1104,503)) scaled k;

	p1 = ((410,440)
	 ..controls (462,534) and (584,632)..(734,642)) scaled k;

	p2 = ((758,223)
	 ..controls (538,162) and (200,248)..(200,496)
	 ..controls (200,565) and (249,628)..(318,628)
	 ..controls (489,628) and (602,373)..(784,373)
	 ..controls (919,373) and (1004,446)..(1104,503)) scaled k;

	p3 = ((596,-123)
	 ..controls (496,46) and (447,314)..(666,314)
	 ..controls (821,314) and (903,246)..(1058,246)
	 ..controls (1182,246) and (1256,370)..(1256,494)
	 ..controls (1256,621) and (1169,722)..(1022,722)
	 ..controls (906,722) and (811,680)..(734,642)) scaled k;

	p4 = ((596,-123)
	 ..controls (365,41) and (66,248)..(66,518)
	 ..controls (66,644) and (154,760)..(280,760)
	 ..controls (498,760) and (634,462)..(904,462)
	 ..controls (988,462) and (1032,492)..(1104,503)) scaled k;


  for n = 0 upto 4:
    draw p[n] ;
  endfor

  for $ = point 0 of p0, point 1 of p0, point 0 of p1, point 0 of p2, point 0 of p3 :
    xnot $; endfor
  
  
  
endfig;

beginfig(31)

  u:=5mm;

  path p ;
  p = ((0,0)--(1,0)--(1,-1)--(2,-1)--(2,-2)--(3,-1)--(3,0)--(5,0)--(5,-1)--
    (6,-2)--(6,-1)--(7,-1)--(8,0)--(7,0)--(7,1)--(6,2)--(6,1)--(5,1)--
      (4,2)--(4,1)--(3,1)--(2,2)--(2,1)--(1,1)--cycle) scaled u;

  fill p withcolor .8;
  draw p;

  xdot (2u,0);
  xdot (6u,0);
  
endfig;

beginfig(32)

  u:=5mm;

%    pickup thick;

  draw unitsquare scaled 8u;

  path p;
  p = (-5,-2)--(1,-2)--(1,-4)--(6,0);
  p:= p& reverse p yscaled -1 --cycle;

  
  for n = 0 upto 7:
    for m = 0 upto 7:
      if (n+m) mod 5 = 0 :
% 	drawarrow ((-5,0)--(5,0))
	fill p shifted ((n+.5,m+.5) scaled u);
      fi
      if (n+m) mod 5 = 4 :
%	drawarrow ((0,-5)--(0,5))
	fill p rotated 90 shifted ((n+.5,m+.5) scaled u) withcolor .8;
      fi
    endfor
  endfor

  draw image(

         draw unitsquare scaled 8u ;

    for $ = (0,1),(0,2),(1,2),(1,3),(2,3),(3,3),(2,4),(3,4),(4,4),(4,5),(5,6),(6,6),(6,7),(7,7): 
	fill p shifted (($ + (.5,.5)) scaled u);
      endfor

    for $ = (0,0),(1,0),(1,1),(2,1),(3,1),(2,2),(3,2),(4,2),(4,3),(5,4),(5,5),(6,5),(7,6): 
	fill p rotated 90 shifted (($ + (.5,.5)) scaled u) withcolor .8;
      endfor
      
      ) shifted (10u,0);

endfig;

beginfig(33)

  u:=1mm;
  z0 = (0,10u);
  z1 = z0 rotated 120;
  z2 = z1 rotated 120;

  for n = 0 upto 2:
    drawarrow (z0{dir -30}..z2 cutafter (fullcircle scaled 3 shifted z2)) rotated 120n;
    drawarrow (z0{dir -105}..z1 cutafter (fullcircle scaled 3 shifted z1)) rotated 120n dashed evenly;
    xdot z[n];
  endfor    

  draw image(
    drawarrow (z0{dir -30}..z2 cutafter (fullcircle scaled 3 shifted z2)) rotated 0 dashed evenly;
    drawarrow (z0{dir -30}..z2 cutafter (fullcircle scaled 3 shifted z2)) rotated -120 dashed evenly;
    drawarrow (z0{dir -105}..z1 cutafter (fullcircle scaled 3 shifted z1)) rotated 120 dashed evenly;

    drawarrow (z0{dir -30}..z2 cutafter (fullcircle scaled 3 shifted z2)) rotated 120;
    drawarrow (z0{dir -105}..z1 cutafter (fullcircle scaled 3 shifted z1)) rotated 00 ;
    drawarrow (z0{dir -105}..z1 cutafter (fullcircle scaled 3 shifted z1)) rotated -120;

    
    xdot z0;    
    xdot z1;    
    xdot z2;    
      ) shifted (25u,0);


  
endfig;



beginfig(340)

  u:=4.5mm;

  for $ = (0,0),(1,0),(0,1):
    fill unitsquare shifted $ scaled u withcolor .7;
  endfor

  path p;
  p = (0,5.5u){dir 15}..(3.7u,3.7u){dir -30} ..(5.5u,0)--origin--cycle;
  
  for n = 1 upto 5:
    draw (n*u,0)--(n*u,6u);
    draw (0,n*u)--(6u,n*u);
  endfor

  clip currentpicture to p;
  draw p;

  fill fullcircle scaled .6u shifted (.5u,.5u);
  

  

  
endfig;

beginfig(341)

%   u:=5mm;

  for $ = (0,0),(1,0),(0,1),(2,0),(1,1),(0,2):
    fill unitsquare shifted $ scaled u withcolor .7;
  endfor

  path p;
  p = (0,5.5u){dir 15}..(3.7u,3.7u){dir -30} ..(5.5u,0)--origin--cycle;
  
  for n = 1 upto 5:
    draw (n*u,0)--(n*u,6u);
    draw (0,n*u)--(6u,n*u);
  endfor

  clip currentpicture to p;
  draw p;

  fill fullcircle scaled .6u shifted (.5u,.5u);
  

  

  
endfig;

beginfig(342)

%   u:=5mm;

  for $ = (0,0),(1,0),(0,1),(2,0),(1,1),(0,2),(3,0),(2,1),(1,2),(0,3):
    fill unitsquare shifted $ scaled u withcolor .7;
  endfor

  path p;
  p = (0,5.5u){dir 15}..(3.7u,3.7u){dir -30} ..(5.5u,0)--origin--cycle;
  
  for n = 1 upto 5:
    draw (n*u,0)--(n*u,6u);
    draw (0,n*u)--(6u,n*u);
  endfor

  clip currentpicture to p;
  draw p;

  fill fullcircle scaled .6u shifted (.5u,.5u);
  

  

  
endfig;

beginfig(35)

  u:=1mm;
  z1 = (12u,0);
  z1 = -z0;

  l := 7u;

  z1' = z1+(0,-10u);
  z0' = z0+(0,-10u);

  path p[];

  p0 = halfcircle scaled 2 xscaled (x1+l) yscaled ((x1+l)+-+x1);

  p1 = reverse p0 reflectedabout (.5[z0,z0'],.5[z1,z1']);

  xdots (0,1,0',1');

  p2=  p0..z0+(-5u,-3u)..{right}z0..tension 1.5..{left}z0'..z0'+(-5u,3u)..{down}point 0 of p1;

  draw p2 & p2 rotatedaround (.5[z0,z1'],180) & cycle;
  
endfig;

beginfig(36)

  u:=1mm;
  
  z0 = origin;
  z1 = (30u,0);
  z2 = z1 rotated 40;

  z3 = (9.5u,0) rotated 22;
  z4 = z3 + (12.5u,0);
%   z5 = z3 rotatedaround (z4,-50);

  z5 = halfcircle scaled (2*length(z4-z3)) shifted z4 intersectionpoint
(halfcircle scaled (2*length(z2-z3)) shifted z1);

  z6 = halfcircle scaled (2*length(z0-z3)) shifted z5 intersectionpoint
(halfcircle scaled (2*length(z0-z1)) shifted z1);
  
  draw z0--z1--z5--z4--z3--z2--cycle;

  draw z3--z0 dashed evenly scaled 2/3;
  draw z4--z1 dashed evenly  scaled 2/3;
  draw z4--z0 dashed evenly  scaled 2/3;

  draw image(

      draw z0--z1--z6--z5--z4--z3--cycle;
  draw z4--z1 dashed evenly  scaled 2/3;
  draw z4--z0 dashed evenly  scaled 2/3;
  draw z5--z1 dashed evenly  scaled 2/3;
    
      ) shifted (1.2*(z1-z0));
  
endfig;

beginfig(37)

  u:=3mm;

  z2 = (0,u);
  z0 = z2 rotated 120;
  z1 = z0 rotated 120;

  pickup pencircle scaled .5;
  
  picture qub;
  qub = image(
      fill origin--(-z0)--z2--(-z1)--cycle withcolor .85;
      fill origin--(-z1)--z0--(-z2)--cycle ;
    fill origin--(-z2)--z1--(-z0)--cycle withcolor .5;
    draw z2--(-z1)--z0--(-z2)--z1--(-z0)--cycle withcolor 1;
    draw (-z1)--origin--(-z0) withcolor 1;
    draw (-z2)--origin withcolor 1;
      );


  fill origin--7z2--(-7z1)--7z0--cycle withcolor .5;
  fill origin--7z2--(-7z0)--7z1--cycle ;
  fill origin--7z1--(-7z2)--7z0--cycle withcolor .85;

  draw 7z2--(-7z1)--7z0--(-7z2)--7z1--(-7z0)--cycle withcolor 1;
  for n = 0 upto 6:
    draw (7z0--origin--7z1) shifted (n*z2) withcolor 1;
    draw (7z2--origin--7z1) shifted (n*z0) withcolor 1;
    draw (7z2--origin--7z0) shifted (n*z1) withcolor 1;
  endfor

  for c =
    (0,0,6),(0,1,6),(0,2,6),(0,2,6),
    (0,3,5),(0,3,6),
    (0,4,4),(0,4,5),
    (0,5,2),(0,5,3),
      (0,6,0),(0,6,1),(0,6,2):
    draw qub shifted (redpart c*z0+greenpart c*z1+bluepart c*z2);
  endfor  

  for c =
    (1,0,5),(1,1,5),(1,2,4),(1,3,3),(1,3,4),
    (1,4,2),(1,4,3),(1,4,4),(1,5,1),(1,6,0):
    draw qub shifted (redpart c*z0+greenpart c*z1+bluepart c*z2);
  endfor  

  for c =
    (2,0,5),(2,1,4),(2,1,5),(2,2,3),(2,3,2),(2,4,1),(2,5,0):
    draw qub shifted (redpart c*z0+greenpart c*z1+bluepart c*z2);
  endfor  

  for c =
    (3,0,5),(3,1,3),(3,1,4),(3,2,2),(3,3,1),(3,4,0),(3,5,0):
    draw qub shifted (redpart c*z0+greenpart c*z1+bluepart c*z2);
  endfor  

  for c =
    (4,0,3),(4,0,4),(4,1,2),(4,2,1),(4,3,0),(4,4,0):
    draw qub shifted (redpart c*z0+greenpart c*z1+bluepart c*z2);
  endfor  

  for c =
    (5,0,2),(5,1,1),(5,2,0),(5,2,1),(5,3,0):
    draw qub shifted (redpart c*z0+greenpart c*z1+bluepart c*z2);
  endfor  

  for c =
    (6,0,0),(6,0,1),(6,0,2),(6,1,0):
    draw qub shifted (redpart c*z0+greenpart c*z1+bluepart c*z2);
  endfor  
  
endfig;


beginfig(38)

  u:=3.75mm;
  uy:=3mm;
  

  k:=.55;

  y:=0;
    
  label(btex $\vphantom(100$ etex scaled k,(0u,y));
  label(btex $\vphantom(100$ etex scaled k,(u,y));
  label(btex $\vphantom(\phantom{0}98$ etex scaled k,(2u,y));
  label(btex $\vphantom(\phantom{0}94$ etex scaled k,(3u,y));
  label(btex $\vphantom(\phantom{0}89$ etex scaled k,(4u,y));
  label(btex $\vphantom(\phantom{0}82$ etex scaled k,(5u,y));
  label(btex $\vphantom(\phantom{0}74$ etex scaled k,(6u,y));

  y:=uy;
  
  label(btex $\vphantom(100$ etex scaled k,(0u,y));
  label(btex $\vphantom(101$ etex scaled k,(u,y));
  label(btex $\vphantom(101$ etex scaled k,(2u,y));
  label(btex $\vphantom(\phantom{0}99$ etex scaled k,(3u,y));
  label(btex $\vphantom(\phantom{0}95$ etex scaled k,(4u,y));
  label(btex $\vphantom(\phantom{0}89$ etex scaled k,(5u,y));
  label(btex $\vphantom(\phantom{0}82$ etex scaled k,(6u,y));

  y:=2uy;
  
  label(btex $\vphantom(\phantom{0}98$ etex scaled k,(0u,y));
  label(btex $\vphantom(101$ etex scaled k,(u,y));
  label(btex $\vphantom(102$ etex scaled k,(2u,y));
  label(btex $\vphantom(102$ etex scaled k,(3u,y));
  label(btex $\vphantom(100$ etex scaled k,(4u,y));
  label(btex $\vphantom(\phantom{0}96$ etex scaled k,(5u,y));
  label(btex $\vphantom(\phantom{0}90$ etex scaled k,(6u,y));

  y:=3uy;
  
  label(btex $\vphantom(\phantom{0}94$ etex scaled k,(0u,y));
  label(btex $\vphantom(\phantom{0}99$ etex scaled k,(u,y));
  label(btex $\vphantom(102$ etex scaled k,(2u,y));
  label(btex $\vphantom(103$ etex scaled k,(3u,y));
  label(btex $\vphantom(103$ etex scaled k,(4u,y));
  label(btex $\vphantom(101$ etex scaled k,(5u,y));
  label(btex $\vphantom(\phantom{0}97$ etex scaled k,(6u,y));

  y:=4uy;
  
  label(btex $\vphantom(\phantom{0}89$ etex scaled k,(0u,y));
  label(btex $\vphantom(\phantom{0}95$ etex scaled k,(u,y));
  label(btex $\vphantom(100$ etex scaled k,(2u,y));
  label(btex $\vphantom(103$ etex scaled k,(3u,y));
  label(btex $\vphantom(105$ etex scaled k,(4u,y));
  label(btex $\vphantom(105$ etex scaled k,(5u,y));
  label(btex $\vphantom(103$ etex scaled k,(6u,y));
  label(btex $\vphantom(\phantom{0}98$ etex scaled k,(7u,y));
  label(btex $\vphantom(\phantom{0}91$ etex scaled k,(8u,y));
  label(btex $\vphantom(\phantom{0}83$ etex scaled k,(9u,y));
  label(btex $\vphantom(\phantom{0}73$ etex scaled k,(10u,y));
  
  y:=5uy;
  
  label(btex $\vphantom(\phantom{0}82$ etex scaled k,(0u,y));
  label(btex $\vphantom(\phantom{0}89$ etex scaled k,(u,y));
  label(btex $\vphantom(\phantom{0}96$ etex scaled k,(2u,y));
  label(btex $\vphantom(101$ etex scaled k,(3u,y));
  label(btex $\vphantom(105$ etex scaled k,(4u,y));
  label(btex $\vphantom(107$ etex scaled k,(5u,y));
  label(btex $\vphantom(107$ etex scaled k,(6u,y));
  label(btex $\vphantom(104$ etex scaled k,(7u,y));
  label(btex $\vphantom(\phantom{0}99$ etex scaled k,(8u,y));
  label(btex $\vphantom(\phantom{0}92$ etex scaled k,(9u,y));
  label(btex $\vphantom(\phantom{0}83$ etex scaled k,(10u,y));

  y:=6uy;
  
  label(btex $\vphantom(\phantom{0}74$ etex scaled k,(0u,y));
  label(btex $\vphantom(\phantom{0}82$ etex scaled k,(u,y));
  label(btex $\vphantom(\phantom{0}90$ etex scaled k,(2u,y));
  label(btex $\vphantom(\phantom{0}97$ etex scaled k,(3u,y));
  label(btex $\vphantom(103$ etex scaled k,(4u,y));
  label(btex $\vphantom(107$ etex scaled k,(5u,y));
  label(btex $\vphantom(109$ etex scaled k,(6u,y));
  label(btex $\vphantom(109$ etex scaled k,(7u,y));
  label(btex $\vphantom(106$ etex scaled k,(8u,y));
  label(btex $\vphantom(101$ etex scaled k,(9u,y));
  label(btex $\vphantom(\phantom{0}93$ etex scaled k,(10u,y));

  y:=7uy;
  
  label(btex $\vphantom(\phantom{0}98$ etex scaled k,(4u,y));
  label(btex $\vphantom(104$ etex scaled k,(5u,y));
  label(btex $\vphantom(109$ etex scaled k,(6u,y));
  label(btex $\vphantom(111$ etex scaled k,(7u,y));
  label(btex $\vphantom(111$ etex scaled k,(8u,y));
  label(btex $\vphantom(108$ etex scaled k,(9u,y));
  label(btex $\vphantom(102$ etex scaled k,(10u,y));
  label(btex $\vphantom(\phantom{0}94$ etex scaled k,(11u,y));

  y:=8uy;
  
  label(btex $\vphantom(\phantom{0}91$ etex scaled k,(4u,y));
  label(btex $\vphantom(\phantom{0}99$ etex scaled k,(5u,y));
  label(btex $\vphantom(106$ etex scaled k,(6u,y));
  label(btex $\vphantom(111$ etex scaled k,(7u,y));
  label(btex $\vphantom(113$ etex scaled k,(8u,y));
  label(btex $\vphantom(113$ etex scaled k,(9u,y));
  label(btex $\vphantom(110$ etex scaled k,(10u,y));
  label(btex $\vphantom(104$ etex scaled k,(11u,y));
  label(btex $\vphantom(\phantom{0}95$ etex scaled k,(12u,y));
  
  y:=9uy;
  
  label(btex $\vphantom(\phantom{0}83$ etex scaled k,(4u,y));
  label(btex $\vphantom(\phantom{0}92$ etex scaled k,(5u,y));
  label(btex $\vphantom(101$ etex scaled k,(6u,y));
  label(btex $\vphantom(108$ etex scaled k,(7u,y));
  label(btex $\vphantom(113$ etex scaled k,(8u,y));
  label(btex $\vphantom(116$ etex scaled k,(9u,y));
  label(btex $\vphantom(116$ etex scaled k,(10u,y));
  label(btex $\vphantom(113$ etex scaled k,(11u,y));
  label(btex $\vphantom(106$ etex scaled k,(12u,y));
  label(btex $\vphantom(\phantom{0}96$ etex scaled k,(13u,y));
  
  y:=10uy;
  
  label(btex $\vphantom(\phantom{0}73$ etex scaled k,(4u,y));
  label(btex $\vphantom(\phantom{0}83$ etex scaled k,(5u,y));
  label(btex $\vphantom(\phantom{0}93$ etex scaled k,(6u,y));
  label(btex $\vphantom(102$ etex scaled k,(7u,y));
  label(btex $\vphantom(110$ etex scaled k,(8u,y));
  label(btex $\vphantom(116$ etex scaled k,(9u,y));
  label(btex $\vphantom(119$ etex scaled k,(10u,y));
  label(btex $\vphantom(119$ etex scaled k,(11u,y));
  label(btex $\vphantom(115$ etex scaled k,(12u,y));
  label(btex $\vphantom(108$ etex scaled k,(13u,y));
  label(btex $\vphantom(\phantom{0}97$ etex scaled k,(14u,y));

  y:=11uy;
  
  label(btex $\vphantom(\phantom{0}94$ etex scaled k,(7u,y));
  label(btex $\vphantom(104$ etex scaled k,(8u,y));
  label(btex $\vphantom(113$ etex scaled k,(9u,y));
  label(btex $\vphantom(119$ etex scaled k,(10u,y));
  label(btex $\vphantom(122$ etex scaled k,(11u,y));
  label(btex $\vphantom(122$ etex scaled k,(12u,y));
  label(btex $\vphantom(118$ etex scaled k,(13u,y));
  label(btex $\vphantom(110$ etex scaled k,(14u,y));
  label(btex $\vphantom(\phantom{0}98$ etex scaled k,(15u,y));

  y:=12uy;
  
  label(btex $\vphantom(\phantom{0}95$ etex scaled k,(8u,y));
  label(btex $\vphantom(106$ etex scaled k,(9u,y));
  label(btex $\vphantom(115$ etex scaled k,(10u,y));
  label(btex $\vphantom(122$ etex scaled k,(11u,y));
  label(btex $\vphantom(126$ etex scaled k,(12u,y));
  label(btex $\vphantom(126$ etex scaled k,(13u,y));
  label(btex $\vphantom(121$ etex scaled k,(14u,y));
  label(btex $\vphantom(112$ etex scaled k,(15u,y));
  label(btex $\vphantom(\phantom{0}99$ etex scaled k,(16u,y));
  label(btex $\vphantom(\phantom{0}83$ etex scaled k,(17u,y));
  
  y:=13uy;
  
  label(btex $\vphantom(\phantom{0}96$ etex scaled k,(9u,y));
  label(btex $\vphantom(108$ etex scaled k,(10u,y));
  label(btex $\vphantom(118$ etex scaled k,(11u,y));
  label(btex $\vphantom(126$ etex scaled k,(12u,y));
  label(btex $\vphantom(130$ etex scaled k,(13u,y));
  label(btex $\vphantom(130$ etex scaled k,(14u,y));
  label(btex $\vphantom(125$ etex scaled k,(15u,y));
  label(btex $\vphantom(115$ etex scaled k,(16u,y));
  label(btex $\vphantom(100$ etex scaled k,(17u,y));
  
  y:=14uy;
  
  label(btex $\vphantom(\phantom{0}97$ etex scaled k,(10u,y));
  label(btex $\vphantom(110$ etex scaled k,(11u,y));
  label(btex $\vphantom(121$ etex scaled k,(12u,y));
  label(btex $\vphantom(130$ etex scaled k,(13u,y));
  label(btex $\vphantom(135$ etex scaled k,(14u,y));
  label(btex $\vphantom(135$ etex scaled k,(15u,y));
  label(btex $\vphantom(129$ etex scaled k,(16u,y));
  label(btex $\vphantom(117$ etex scaled k,(17u,y));
  label(btex $\vphantom(101$ etex scaled k,(18u,y));
  
  y:=15uy;
  
  label(btex $\vphantom(\phantom{0}98$ etex scaled k,(11u,y));
  label(btex $\vphantom(112$ etex scaled k,(12u,y));
  label(btex $\vphantom(125$ etex scaled k,(13u,y));
  label(btex $\vphantom(135$ etex scaled k,(14u,y));
  label(btex $\vphantom(140$ etex scaled k,(15u,y));
  label(btex $\vphantom(140$ etex scaled k,(16u,y));
  label(btex $\vphantom(133$ etex scaled k,(17u,y));
  label(btex $\vphantom(120$ etex scaled k,(18u,y));
  
  y:=16uy;
  
  label(btex $\vphantom(\phantom{0}99$ etex scaled k,(12u,y));
  label(btex $\vphantom(115$ etex scaled k,(13u,y));
  label(btex $\vphantom(129$ etex scaled k,(14u,y));
  label(btex $\vphantom(140$ etex scaled k,(15u,y));
  label(btex $\vphantom(146$ etex scaled k,(16u,y));
  label(btex $\vphantom(146$ etex scaled k,(17u,y));
  label(btex $\vphantom(138$ etex scaled k,(18u,y));
  label(btex $\vphantom(123$ etex scaled k,(19u,y));
  
  y:=17uy;
  
  label(btex $\vphantom(\phantom{0}83$ etex scaled k,(12u,y));
  label(btex $\vphantom(100$ etex scaled k,(13u,y));
  label(btex $\vphantom(117$ etex scaled k,(14u,y));
  label(btex $\vphantom(133$ etex scaled k,(15u,y));
  label(btex $\vphantom(146$ etex scaled k,(16u,y));
  label(btex $\vphantom(153$ etex scaled k,(17u,y));
  label(btex $\vphantom(153$ etex scaled k,(18u,y));
  label(btex $\vphantom(144$ etex scaled k,(19u,y));
  label(btex $\vphantom(126$ etex scaled k,(20u,y));
  label(btex $\vphantom(101$ etex scaled k,(21u,y));
  
  y:=18uy;
  
  label(btex $\vphantom(101$ etex scaled k,(14u,y));
  label(btex $\vphantom(120$ etex scaled k,(15u,y));
  label(btex $\vphantom(138$ etex scaled k,(16u,y));
  label(btex $\vphantom(153$ etex scaled k,(17u,y));
  label(btex $\vphantom(161$ etex scaled k,(18u,y));
  label(btex $\vphantom(161$ etex scaled k,(19u,y));
  label(btex $\vphantom(150$ etex scaled k,(20u,y));
  label(btex $\vphantom(129$ etex scaled k,(21u,y));
  
  
  y:=19uy;
  
  label(btex $\vphantom(123$ etex scaled k,(16u,y));
  label(btex $\vphantom(144$ etex scaled k,(17u,y));
  label(btex $\vphantom(161$ etex scaled k,(18u,y));
  label(btex $\vphantom(171$ etex scaled k,(19u,y));
  label(btex $\vphantom(171$ etex scaled k,(20u,y));
  label(btex $\vphantom(158$ etex scaled k,(21u,y));
  label(btex $\vphantom(132$ etex scaled k,(22u,y));
  label(btex $\vphantom(\phantom{0}96$ etex scaled k,(23u,y));
  
  y:=20uy;
  
  label(btex $\vphantom(126$ etex scaled k,(17u,y));
  label(btex $\vphantom(150$ etex scaled k,(18u,y));
  label(btex $\vphantom(171$ etex scaled k,(19u,y));
  label(btex $\vphantom(184$ etex scaled k,(20u,y));
  label(btex $\vphantom(184$ etex scaled k,(21u,y));
  label(btex $\vphantom(167$ etex scaled k,(22u,y));
  label(btex $\vphantom(134$ etex scaled k,(23u,y));
  
  
  y:=21uy;
  
  label(btex $\vphantom(101$ etex scaled k,(17u,y));
  label(btex $\vphantom(129$ etex scaled k,(18u,y));
  label(btex $\vphantom(158$ etex scaled k,(19u,y));
  label(btex $\vphantom(184$ etex scaled k,(20u,y));
  label(btex $\vphantom(200$ etex scaled k,(21u,y));
  label(btex $\vphantom(200$ etex scaled k,(22u,y));
  label(btex $\vphantom(178$ etex scaled k,(23u,y));
  
  
  y:=22uy;
  
  label(btex $\vphantom(132$ etex scaled k,(19u,y));
  label(btex $\vphantom(167$ etex scaled k,(20u,y));
  label(btex $\vphantom(200$ etex scaled k,(21u,y));
  label(btex $\vphantom(222$ etex scaled k,(22u,y));
  label(btex $\vphantom(222$ etex scaled k,(23u,y));
  label(btex $\vphantom(190$ etex scaled k,(24u,y));

  y:=23uy;
  
  label(btex $\vphantom(\phantom{0}96$ etex scaled k,(19u,y));
  label(btex $\vphantom(134$ etex scaled k,(20u,y));
  label(btex $\vphantom(178$ etex scaled k,(21u,y));
  label(btex $\vphantom(222$ etex scaled k,(22u,y));
  label(btex $\vphantom(253$ etex scaled k,(23u,y));
  label(btex $\vphantom(253$ etex scaled k,(24u,y));
  label(btex $\vphantom(202$ etex scaled k,(25u,y));
  label(btex $\vphantom(101$ etex scaled k,(26u,y));
  
  
  y:=24uy;
  
  label(btex $\vphantom(190$ etex scaled k,(22u,y));
  label(btex $\vphantom(253$ etex scaled k,(23u,y));
  label(btex $\vphantom(303$ etex scaled k,(24u,y));
  label(btex $\vphantom(303$ etex scaled k,(25u,y));
  label(btex $\vphantom(202$ etex scaled k,(26u,y));
  
  y:=25uy;
  
  label(btex $\vphantom(202$ etex scaled k,(23u,y));
  label(btex $\vphantom(303$ etex scaled k,(24u,y));
  label(btex $\vphantom(404$ etex scaled k,(25u,y));
  label(btex $\vphantom(404$ etex scaled k,(26u,y));

  y:=26uy;
  
  label(btex $\vphantom(101$ etex scaled k,(23u,y));
  label(btex $\vphantom(202$ etex scaled k,(24u,y));
  label(btex $\vphantom(404$ etex scaled k,(25u,y));
  label(btex $\vphantom(808$ etex scaled k,(26u,y));

  y:=-1.1uy;
  
  label(btex $\vphantom(26$ etex scaled k,(0u,y));
  label(btex $\vphantom(25$ etex scaled k,(1u,y));
  label(btex $\vphantom(24$ etex scaled k,(2u,y));
  label(btex $\vphantom(23$ etex scaled k,(3u,y));
  label(btex $\vphantom(22$ etex scaled k,(4u,y));
  label(btex $\vphantom(21$ etex scaled k,(5u,y));
  label(btex $\vphantom(20$ etex scaled k,(6u,y));
  label(btex $\vphantom(19$ etex scaled k,(7u,y));
  label(btex $\vphantom(18$ etex scaled k,(8u,y));
  label(btex $\vphantom(17$ etex scaled k,(9u,y));
  label(btex $\vphantom(16$ etex scaled k,(10u,y));
  label(btex $\vphantom(15$ etex scaled k,(11u,y));
  label(btex $\vphantom(14$ etex scaled k,(12u,y));
  label(btex $\vphantom(13$ etex scaled k,(13u,y));
  label(btex $\vphantom(12$ etex scaled k,(14u,y));
  label(btex $\vphantom(11$ etex scaled k,(15u,y));
  label(btex $\vphantom(10$ etex scaled k,(16u,y));
  label(btex $\vphantom(9$ etex scaled k,(17u,y));
  label(btex $\vphantom(8$ etex scaled k,(18u,y));
  label(btex $\vphantom(7$ etex scaled k,(19u,y));
  label(btex $\vphantom(6$ etex scaled k,(20u,y));
  label(btex $\vphantom(5$ etex scaled k,(21u,y));
  label(btex $\vphantom(4$ etex scaled k,(22u,y));
  label(btex $\vphantom(3$ etex scaled k,(23u,y));
  label(btex $\vphantom(2$ etex scaled k,(24u,y));
  label(btex $\vphantom(1$ etex scaled k,(25u,y));
  label(btex $\vphantom(0$ etex scaled k,(26u,y));


  
  label(btex $\vphantom(26$ etex scaled k,(-u,0uy));
  label(btex $\vphantom(25$ etex scaled k,(-u,1uy));
  label(btex $\vphantom(24$ etex scaled k,(-u,2uy));
  label(btex $\vphantom(23$ etex scaled k,(-u,3uy));
  label(btex $\vphantom(22$ etex scaled k,(-u,4uy));
  label(btex $\vphantom(21$ etex scaled k,(-u,5uy));
  label(btex $\vphantom(20$ etex scaled k,(-u,6uy));
  label(btex $\vphantom(19$ etex scaled k,(-u,7uy));
  label(btex $\vphantom(18$ etex scaled k,(-u,8uy));
  label(btex $\vphantom(17$ etex scaled k,(-u,9uy));
  label(btex $\vphantom(16$ etex scaled k,(-u,10uy));
  label(btex $\vphantom(15$ etex scaled k,(-u,11uy));
  label(btex $\vphantom(14$ etex scaled k,(-u,12uy));
  label(btex $\vphantom(13$ etex scaled k,(-u,13uy));
  label(btex $\vphantom(12$ etex scaled k,(-u,14uy));
  label(btex $\vphantom(11$ etex scaled k,(-u,15uy));
  label(btex $\vphantom(10$ etex scaled k,(-u,16uy));
  label(btex $\vphantom(\phantom{0}9$ etex scaled k,(-u,17uy));
  label(btex $\vphantom(\phantom{0}8$ etex scaled k,(-u,18uy));
  label(btex $\vphantom(\phantom{0}7$ etex scaled k,(-u,19uy));
  label(btex $\vphantom(\phantom{0}6$ etex scaled k,(-u,20uy));
  label(btex $\vphantom(\phantom{0}5$ etex scaled k,(-u,21uy));
  label(btex $\vphantom(\phantom{0}4$ etex scaled k,(-u,22uy));
  label(btex $\vphantom(\phantom{0}3$ etex scaled k,(-u,23uy));
  label(btex $\vphantom(\phantom{0}2$ etex scaled k,(-u,24uy));
  label(btex $\vphantom(\phantom{0}1$ etex scaled k,(-u,25uy));
  label(btex $\vphantom(\phantom{0}0$ etex scaled k,(-u,26uy));

  if false:
  linecap:=rounded;  drawoptions(dashed withdots scaled .15);   pickup pencircle scaled .2;

  draw ((6,10)--(6,0)--(0,0)--(0,6)--(10,6)) xscaled u yscaled uy;
  draw ((1,6)--(1,0)) xscaled u yscaled uy;
  draw ((2,6)--(2,0)) xscaled u yscaled uy;
  draw ((3,6)--(3,0)) xscaled u yscaled uy;
  draw ((4,0)--(4,10)--(14,10)--(14,18)--(21,18)) xscaled u yscaled uy;
  draw ((5,0)--(5,10)) xscaled u yscaled uy;


  draw ((7,4)--(7,11)--(15,11)--(15,18)) xscaled u yscaled uy;
  draw ((8,4)--(8,12)--(17,12)--(17,21)--(23,21)) xscaled u yscaled uy;
  draw ((9,4)--(9,13)--(17,13)) xscaled u yscaled uy;




  draw ((0,1)--(6,1)) xscaled u yscaled uy;
  draw ((0,2)--(6,2)) xscaled u yscaled uy;
  draw ((0,3)--(6,3)) xscaled u yscaled uy;

  draw ((0,4)--(10,4)--(10,14)--(18,14)--(18,21)) xscaled u yscaled uy;
  
  draw ((0,5)--(10,5)) xscaled u yscaled uy;

  draw ((4,7)--(11,7)--(11,15)--(18,15)) xscaled u yscaled uy;
  draw ((4,8)--(12,8)--(12,17)--(21,17)--(21,23)) xscaled u yscaled uy;
  draw ((4,9)--(13,9)--(13,17)) xscaled u yscaled uy;



  draw ((16,12)--(16,19)--(23,19)--(23,26)--(26,26)) xscaled u yscaled uy ;
  draw ((12,16)--(19,16)--(19,23)--(26,23)--(26,26)) xscaled u yscaled uy;


  draw ((25,23)--(25,26)) xscaled u yscaled uy;
  draw ((23,25)--(26,25)) xscaled u yscaled uy;

  draw ((24,26)--(24,22)--(19,22)) xscaled u yscaled uy;
  draw ((26,24)--(22,24)--(22,19)) xscaled u yscaled uy;
  
  draw ((17,20)--(23,20)) xscaled u yscaled uy;
  draw ((20,17)--(20,23)) xscaled u yscaled uy;
fi

linecap:=butt; drawoptions(); pickup pencircle scaled .1;

  draw ((7,0)--(7,3)) xscaled u yscaled uy;
  draw ((8,0)--(8,3)) xscaled u yscaled uy;
  draw ((9,0)--(9,3)) xscaled u yscaled uy;
  draw ((10,0)--(10,3)) xscaled u yscaled uy;
  draw ((11,0)--(11,6)) xscaled u yscaled uy;
  draw ((12,0)--(12,7)) xscaled u yscaled uy;
  draw ((13,0)--(13,8)) xscaled u yscaled uy;
  draw ((14,0)--(14,9)) xscaled u yscaled uy;
  draw ((15,0)--(15,10)) xscaled u yscaled uy;
  draw ((16,0)--(16,11)) xscaled u yscaled uy;
  draw ((17,0)--(17,11)) xscaled u yscaled uy;
  draw ((18,0)--(18,13)) xscaled u yscaled uy;
  draw ((19,0)--(19,15)) xscaled u yscaled uy;
  draw ((20,0)--(20,16)) xscaled u yscaled uy;
  draw ((21,0)--(21,16)) xscaled u yscaled uy;
  draw ((22,0)--(22,18)) xscaled u yscaled uy;
  draw ((23,0)--(23,18)) xscaled u yscaled uy;
  draw ((24,0)--(24,21)) xscaled u yscaled uy;
  draw ((25,0)--(25,22)) xscaled u yscaled uy;
  draw ((26,0)--(26,22)) xscaled u yscaled uy;
  
  
  draw ((0,7)--(3,7)) xscaled u yscaled uy;
  draw ((0,8)--(3,8)) xscaled u yscaled uy;
  draw ((0,9)--(3,9)) xscaled u yscaled uy;
  draw ((0,10)--(3,10)) xscaled u yscaled uy;
  draw ((0,11)--(6,11)) xscaled u yscaled uy;
  draw ((0,12)--(7,12)) xscaled u yscaled uy;
  draw ((0,13)--(8,13)) xscaled u yscaled uy;
  draw ((0,14)--(9,14)) xscaled u yscaled uy;
  draw ((0,15)--(10,15)) xscaled u yscaled uy;
  draw ((0,16)--(11,16)) xscaled u yscaled uy;
  draw ((0,17)--(11,17)) xscaled u yscaled uy;
  draw ((0,18)--(13,18)) xscaled u yscaled uy;
  draw ((0,19)--(15,19)) xscaled u yscaled uy;
  draw ((0,20)--(16,20)) xscaled u yscaled uy;
  draw ((0,21)--(16,21)) xscaled u yscaled uy;
  draw ((0,22)--(18,22)) xscaled u yscaled uy;
  draw ((0,23)--(18,23)) xscaled u yscaled uy;
  draw ((0,24)--(21,24)) xscaled u yscaled uy;
  draw ((0,25)--(22,25)) xscaled u yscaled uy;
  draw ((0,26)--(22,26)) xscaled u yscaled uy;
  
  
  
endfig;
    
end
