
xstart= 0;
xend=10;
schritte=100;

syms x y
dgl = {'@(x,y) y(2)';'@(x,y) -2*y(2)-y(1)'};
[x, y] = euler_1(dgl,[2 1],xstart,xend,schritte);


syms u(t) t
eqn = diff(u,t,2)+1*diff(u,t)+u==0;
Du=diff(u,t);
cond =[u(0)==2 Du(0)==1];
f_symbolic = dsolve(eqn,cond);
f=matlabFunction(f_symbolic);
hold on
plot(x,y,'-*r')
fplot(f,[0 10])
