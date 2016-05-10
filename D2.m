clc
clear
load D2
I1=[ones(1,1000),2*ones(1,300),3*ones(1,200)];

k=3;
q=2;
[~,N]=size(X);
%%πÈ“ªªØ
X1=X;
ma=max(X1');
mi=min(X1');
X1=(X1-mi'*ones(1,N))./(ma'*ones(1,N)-mi'*ones(1,N));

%%%%%%%%%%%%%%%%%%%%%%%%%%%....FCM
figure(1)
set(gcf,'Units','centimeters','Position',[10 10 7 5]);
set(gca,'fontsize',8);

tic
ind=initialization(X1,k);
center=X(:,ind);
[I,center]=FCM(X,k,q,center);
toc

for i=1:k
    for j=1:k
        r1(i,j)=sum(I1(I==i)==j);
    end
end

for i=1:k
    a=find(I==i);
    x{i}=X(:,a);
end
plot(x{1}(1,:),x{1}(2,:),'b.','MarkerSize',5);
hold on
plot(x{2}(1,:),x{2}(2,:),'r.','MarkerSize',5)
plot(x{3}(1,:),x{3}(2,:),'g.','MarkerSize',5)
% plot(x{4}(1,:),x{4}(2,:),'r.','MarkerSize',5)
% plot(x{5}(1,:),x{5}(2,:),'g.','MarkerSize',5)
% plot(center1(1,:),center1(2,:),'ks',center(1,:),center(2,:),'kp','MarkerSize',5,'MarkerFaceColor','k')
% plot(center(1,:),center(2,:),'kp','MarkerSize',7,'MarkerFaceColor','k')
% axis([-15 20 -15 20])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%....csiFCM
figure(2)
set(gcf,'Units','centimeters','Position',[10 10 7 5]);
set(gca,'fontsize',8);
tic
[I,center]=csiFCM(X,k,q);
toc
for i=1:k
    for j=1:k
        r2(i,j)=sum(I1(I==i)==j);
    end
end
for i=1:k
    a=find(I==i);
    x{i}=X(:,a);
end
plot(x{1}(1,:),x{1}(2,:),'r.','MarkerSize',5);
hold on
plot(x{2}(1,:),x{2}(2,:),'b.','MarkerSize',5)
plot(x{3}(1,:),x{3}(2,:),'g.','MarkerSize',5)
% plot(center1(1,:),center1(2,:),'ks',center(1,:),center(2,:),'kp','MarkerSize',5,'MarkerFaceColor','k')
plot(center(1,:),center(2,:),'kp','MarkerSize',7,'MarkerFaceColor','k')
% axis([0 10 0 10]);

%%%%%%%%%%%%%%%%%.....siibFCM 
figure(3)
set(gcf,'Units','centimeters','Position',[10 10 7 5]);
set(gca,'fontsize',8);
tic
[I,center]=siibFCM(X,k,q);
toc

for i=1:k
    for j=1:k
        r3(i,j)=sum(I1(I==i)==j);
    end
end
for i=1:k
    a=find(I==i);
    x{i}=X(:,a);
end
plot(x{1}(1,:),x{1}(2,:),'r.','MarkerSize',5);
hold on
plot(x{2}(1,:),x{2}(2,:),'b.','MarkerSize',5)
plot(x{3}(1,:),x{3}(2,:),'g.','MarkerSize',5)
% plot(center1(1,:),center1(2,:),'ks',center(1,:),center(2,:),'kp','MarkerSize',5,'MarkerFaceColor','k')
plot(center(1,:),center(2,:),'kp','MarkerSize',7,'MarkerFaceColor','k')
% axis([0 10 0 10]);
% t3=toc
% 
figure(4)
set(gcf,'Units','centimeters','Position',[10 10 7 5]);
set(gca,'fontsize',8);

tic
ind=initialization(X1,k);
center=X(:,ind);
[I,center]=iFCM(X,k,q,center);
toc

for i=1:k
    for j=1:k
        r4(i,j)=sum(I1(I==i)==j);
    end
end

for i=1:k
    a=find(I==i);
    x{i}=X(:,a);
end
plot(x{1}(1,:),x{1}(2,:),'r.','MarkerSize',5);
hold on
plot(x{2}(1,:),x{2}(2,:),'b.','MarkerSize',5)
plot(x{3}(1,:),x{3}(2,:),'g.','MarkerSize',5)
% plot(center1(1,:),center1(2,:),'ks',center(1,:),center(2,:),'kp','MarkerSize',5,'MarkerFaceColor','k')
plot(center(1,:),center(2,:),'kp','MarkerSize',7,'MarkerFaceColor','k')
% axis([0 10 0 10]);

