syms u(t) t
L=5;
C=0.2;
R=2.5;
eqn = diff(u,t,2)+3*diff(u,t)+u==0;
Du=diff(u,t);
cond =[u(0)==2 Du(0)==1];
f_symbolic = dsolve(eqn,cond);
f=matlabFunction(f_symbolic);
fplot(f,[0 10]);