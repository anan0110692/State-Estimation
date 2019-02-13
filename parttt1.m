function z=parttt1(xT,y)
%Create the initial pdf
x000=randn(1,1000);
b=0;
%Temporary container
m=ones(1,1000);

%Prepare the normal dist
pd = makedist('Normal','mu',0,'sigma',1);

%For loop to estimate 100 points of the state
for k=1:100
   
 %The following lines of code(from line 16-20), are for generating the prior estimate of all possiable states at time k. 
 
    if k==1
    xprior=.5*x000+25*x000./(1+x000.^2)+8*cos(1.2*(k))+sqrt(10)*randn(1,1000);
    else
        xprior=.5*x00+25*x00./(1+x00.^2)+randn(1,1000)+8*cos(1.2*(k));
    end
   %The following lines of code(from line 22-23) are for evaluting the posterior pdf of all prior estimated states  
    m=m.*pdf(pd,y(k)-1/20*xprior.^2);
    q=m/sum(m);
    
     %The following lines of code(from line 27-62) are for resampling step to generate the
     %posterior states
if 1/sum(q.^2)<=100
    
    for h=1:1000
        r=rand;
        s=0;
        in=1;
        while s<r & in-1<=1000
            s=s+q(in);
            in=in+1;
        end
        xpost(h)=xprior(in-1);
    end
    m=ones(1,1000);
    
    
    %The following lines of code (from line 44-52) are  for storing the posterior estimate of
    %the state
    if k==1
        o=xpost;
        q=m/sum(m);
        v=q;
    else
        q=m/sum(m);
        o=[o;xpost];
        v=[v;q];
    end
     x00=xpost;
else
    b=b+1;
    if k==1
        o=xprior;
        v=q;
    else
         o=[o;xprior];
        v=[v;q];
    end
     x00=xprior;
end
    

 %For loop end
end 

%Evalute the mean of each resulted pdf
es=sum(v.*o,2);
plot([1:100],xT,'r*',[1:100],es,'b')

end
