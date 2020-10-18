%----------------------- Golden Section Search Method---------------------
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
disp('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
%% ITERATION 0 :
%% CUMPUTE a0,b0,p,q
a=xL;
b=xU;
r=(3-sqrt(5))/2;  %%  GOLDEN NUMBER
d=r*(b-a);
a0=a+d;
b0=b-d;
p=func(a0);
q=func(b0);
k=1;
A=['iteration',' ',num2str(0),':','   ','a=',num2str(a0),'   ','f(a)=',num2str(p),'   '.....
    'b=',num2str(b0),'   ','f(b)=',num2str(q)];
disp(A);
disp('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
%%
%% MAIN LOOP
while (abs(b-a)>epsi )
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
    %% SHOW ALL ITERATION
ch='iteration';
B=[ch,' ',num2str(k),':','   ','a=',num2str(a0),'   ','f(a)= ',.....
    num2str(p),'   ','b=',num2str(b0),'   ','f(b)= ',num2str(q)];
disp(B);
disp('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
    k=k+1;
end
K=k;
tex=['This algorithm converages in ', 'iteration',' ',num2str(K),'.'];
disp(tex);
disp('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
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
   plot(b0,q,'c*')%plot the optimal point.
   hold on;  
end