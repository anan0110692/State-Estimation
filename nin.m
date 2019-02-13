n=wgn(1,100,10,'linear');
x0=randn;
for k=1:100
    xT(k)=.5*x0+(25*x0)/(1+x0^2)+n(k)+8*cos(1.2*(k)); 
    x0=xT(k);
end
y=(xT.^2)/20+wgn(1,100,1,'linear');
plot([1:100],xT,'r',[1:100],y,'b');