%% -------------------NEWTON INTERPOLATION METHOD--------------------
%%
%% ----------INITIALIZATION----------
% xi=input('\n Enter xi :\n');
% fi=input('\n Enter a fi : \n');
% X=input('\n Enter a x : \n');
% disp('o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o');
% %% FOR EXAMPLE : x=[1 2 3 5 7] , f=[3 5 9 11 15] , X=4
% %% ----------NEWTON DIVIDED DIFFERENCE----------
function Newtonmethod(xi,fi,X)
syms x;
m=length(xi);
F=diag(fi);
MX=diag(xi);
for j=1:m-1
    for i=j+1:m
        MX(i,j)=xi(i)-xi(j);
    end
end
n=length(F);
b=(n*n)-n;
for i=1:n-1
    for j=i:n+1:b
        F(j+1)=(F(j+n+1)-F(j))/MX(j+1); 
    end
    b=b-n;
end
%% ----------SHOW DIVIDED DIFFERENCE----------
for i=-1:-1:-(n-1)
    txt=['divided difference',' ',num2str(-1*i),'='];
    disp(txt);
    disp((diag(F,i))');
    disp('o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o');
end
%% ----------MAKING POLYNOMIAL INTERPOLATION----------
p=F(n,1)*(x-xi(n-1));
for j=n-1:-1:2
    p=(x-xi(j-1))*(F(j,1)+p);
end
p=F(1,1)+p;
p(x)=p;
disp('p(x)=');
disp(p(x));
disp('o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o---o');
%% ----------THE VALUE OF INTERPOLATION POLYNOMIAL IN ONE POINT----------
y=p(X);
disp('y=');
disp(y);
axis([1,8,1,15]);
plot(xi,fi,'b');
hold on;
for i=1:m
plot(xi(i),fi(i),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor',[0.25,0.25,0.25]);
end
xlabel('x');
ylabel('f');
title('polynomial interpolation');
end