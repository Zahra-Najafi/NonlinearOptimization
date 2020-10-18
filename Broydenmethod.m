%%-------------------------------BROYDEN METHOD----------------------------
%% THIS ALGORITHM IS USED TO FIND THE MINIMUM POINT OF THREE VARIABLES FUNCTION.
% f=input('\n Enter your function handle :\n');
% dx=input('\n Enter your derivative function relative to x : \n');
% dy=input('\n Enter your derivative function relative to y : \n');
% dz=input('\n Enter your derivative function relative to z : \n');
% epsi=input('\n Enter your epsilon :\n');
% iter=input('\n Enter iteration :\n');
% x0=input('\n Enter Initiol point :\n');
%% EXAMPLE:
f=@(x,y,z)((x-1)^2+3*y+(z+1)^4);
dx=@(x,y,z)(2*(x-1));
dy=@(x,y,z)(6*y);
dz=@(x,y,z)(4*(z+1)^3);
epsi=4.97*10^(-6);
iter=5;
x0=[0;1;0];
disp('o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o');
XO=x0;
%% MAIN LOOP
 D=eye(3);
 U=zeros(3);
k=1;
while(norm(XO)>epsi && k<iter)
    A=dx(XO(1),XO(2),XO(3));
    B=dy(XO(1),XO(2),XO(3));
    C=dz(XO(1),XO(2),XO(3));
    d=[A;B;C];
    d=-1*d;
    DI=D+U;
    e=d+DI*XO;
    XN=DI\e;
    b=XN-XO;
    a=(1/((b')*b))*(d-(D*b));
    U=a*b';
    D=DI;
    XO=XN;
    %% SHOW ALL ITERATION. 
    B=['(',num2str(XN(1)),' , ',num2str(XN(2)),' , ',num2str(XN(3)),')'];
    A=['iteration',num2str(k),':','   ','   ','X-new=',B];
    disp(A);
    disp('o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o');
  k=k+1;  
end
%% SHOW MINMUM POINT.
 mn=['x_min is :','(',num2str(XN(1)),' , ',num2str(XN(2)),' , ',num2str(XN(3)),')'];
 fmin=f(XN(1),XN(2),XN(3));
 fmn=['f(x)_min is :',num2str(fmin)];
 C=[mn ,'   ', fmn];
 disp(C);