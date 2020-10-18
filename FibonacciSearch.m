%----------------------- FIBONACCI Search Method---------------------
%%
%% INITIALIZATION
epsi=input('\n Enter epsilon :\n');
xL=input('\n Enter a lower bound : \n');
xU=input('\n Enter upper bound : \n');
%% 
%% MAXIMUM OR MINIMUM!!
Question='\n Do you want maximum of function  or minimum of function?! \n';
char=input(Question,'s');
Max='maximum of function';
if(strcmp(char,Max)|| strcmp(char,'maximum')||strcmp(char,'max')) 
    func=input('\n Enter your function handle :)  \n');
else
    func=input('\n Enter and Multiply your function handle in -1 and continue! :) \n');
end
%%
%% PLOTING FUNCTION
% THIS FUNCTION IS UNIMODAL.
ezplot(func,[xL,xU]);
hold on;
disp('---------------------------------------------------------------------------------');
%% 
a=xL;
b=xU;
x=((b-a)*(1+(2*epsi)))/epsi;
%% FIND INDEX.
j=1;
n=-1;
while (Fibo(n) < x)
    n=n+1;
    j=j+1;  
end
N=n-1;
 r=1-(Fibo(N)/Fibo(N+1));
     d=r*(b-a);
     a0=a+d;
     b0=b-d;
     p=func(a0); 
     q=func(b0);
     A=['iteration',' ',num2str(0),':','   ','r=',num2str(r),'   ','a=',num2str(a0),'   ','f(a)=',num2str(p),'   '.....
    'b=',num2str(b0),'   ','f(b)=',num2str(q)];
disp(A);
disp('---------------------------------------------------------------------------------');
%% MAIN LOOP
k=1;
while (abs(b-a)>epsi )
     r=1-(Fibo(N)/Fibo(N+1));
     d=r*(b-a);
     a0=a+d;
     b0=b-d;
     p=func(a0); 
     q=func(b0);
    if  p>q
        b=b0;
        d=r*(b-a);
        b0=a0;
        q=p;
        a0=a+d;
        p=func(a0);
    elseif p<q
        a=a0;
      d=r*(b-a);
      a0=b0;
      p=q;
      b0=b-d;
      q=func(b0);
    elseif p==q
        a=a0;
        b=b0; 
        d=r*(b-a);
        a0=a+d;
        b0=b-d;
        p=func(a0);
        q=func(b0);
    end
    N=N-1;
    %% SHOW ALL ITERATION
    ch='iteration';
B=[ch,' ',num2str(k),':','   ', ' r=',num2str(r),'   ',' a=',num2str(a0),'   ','f(a)= ',.....
    num2str(p),'   ','b=',num2str(b0),'   ','f(b)= ',num2str(q)];
disp(B);
disp('---------------------------------------------------------------------------------');
    k=k+1;
end
K=k;
tex=['This algorithm converages in ', 'iteration',' ',num2str(K),'.'];
disp(tex);
disp('---------------------------------------------------------------------------------');
%% SHOW THE OPTIMAL POINT.
if p>q
   mx=['x-max is :',num2str(a0)];
   disp(mx);
   fmx=['f(x)-max is :',num2str(p)];
   disp(fmx);
   plot(a0,p,'c*')%plot the optimal point.
   hold on;
else
   mx=['x_max is :',num2str(b0)];
   fmx=['f(x)_max is :',num2str(q)];
   C=[mx ,'   ', fmx];
   disp(C);
   plot(b0,q,'y*')%plot the optimal point.
   hold on;  
end
%% FIBONOCCI FUNCTION
function z=Fibo(n)
if(n==-1)
    z=0;
elseif n==0
    z=1;
else    
 z=Fibo(n-1)+Fibo(n-2);
end
end
%%