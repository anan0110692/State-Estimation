function z=kalman1(xT,y)

%Initial state estimation
x00=0;
%Initial error variance estimation
p0=100;
%For loop to estimate 100 value of the state
for k=1:100
    %Evaluating the prior estimate of the state at k
    xpre=x00/2+25*x00/(1+x00^2)+8*cos(1.2*k);
    
    %This term is resulted after we linearized the system  using Taylor series expansion
    F=.5+(-25*x00^2+25)/(1+x00^2)^2;
    
    %Evaluating the prior estimate of the error variance at k
    ppre=F^2*p0+10;
    
    %This term is resulted after we linearized the system  using Taylor series expansion
    H=xpre/10;
    
    %Kalman filter gain
    K=ppre*H*(H^2*ppre+1)^-1;
   
    %Posterior state estimate at k 
    xpos=xpre+K*(y(k)-xpre^2/20);
    
     %Posterior error variance estimate at k 
    ppos=(1-K*H)*ppre^-1;
    
    %o vector to store the posterior estimate
    o(k)=xpos;
    
    %Update the error variance for the next itteration 
    p0=ppos;
    
    %Update the state for the next itteration
    x00=xpos;
end
 plot([1:100],xT,'r*',[1:100],o,'b')
    