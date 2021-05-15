clc
close all
clear all

%% Data Production
disp('================ Reading Input Matrix ================')
row=input('Enter Number of rows : ');
column=input('Enter Number of columns : ');

% Matrix of Phase1
disp('Getting Mtrix of Phase1: ');
A1=zeros(row,column);
for i=1:row
    for j=1:column
        position=[i,j];
        disp(['Entry ', num2str(position)]);
        A1(i,j)=input(' ');
    end
end

% Matrix of Phase2
disp('Getting Mtrix of Phase2: ');
A2=zeros(row,column);
for i=1:row
    for j=1:column
        position=[i,j];
        disp(['Entry ', num2str(position)]);
        A2(i,j)=input(' ');
    end
end

% Matrix of Phase3
disp('Getting Mtrix of Phase3: ');
A3=zeros(row,column);
for i=1:row
    for j=1:column
        position=[i,j];
        disp(['Entry ', num2str(position)]);
        A3(i,j)=input(' ');
    end
end

% Matrix of Phase4
disp('Getting Mtrix of Phase4: ');
A4=zeros(row,column);
for i=1:row
    for j=1:column
        position=[i,j];
        disp(['Entry ', num2str(position)]);
        A4(i,j)=input(' ');
    end
end

%% Geometric Averaging
B=zeros(row,4);
% Computation of B(:,1)
for i=1:row
    B(i,1)=(prod(A1(i,:)))^(1/column);
end

% Computation of B(:,2)
for i=1:row
    B(i,2)=(prod(A2(i,:)))^(1/column);
end

% Computation of B(:,3)
for i=1:row
    B(i,3)=(prod(A3(i,:)))^(1/column);
end

% Computation of B(:,4)
for i=1:row
    B(i,4)=(prod(A4(i,:)))^(1/column);
end


%% Normalizing
Acc1=sum(B);
Acc2=sort(Acc1,'descend');
C=zeros(row,4);
for i=1:row
    C(i,:)=B(i,:)./Acc2;
end
disp(C);
%% Extracting Curves and Results
% Obtaining Curves
D=zeros(row,4);
for i=1:row
    if C(i,1) == C(i,2)
        D(i,1)=1;
        D(i,2)=1;
        D(i,3)=1;
        D(i,4)=0;
    elseif C(i,3)== C(i,4)
        D(i,1)=0;
        D(i,2)=1;
        D(i,3)=1;
        D(i,4)=1;
    else 
        D(i,1)=0;
        D(i,2)=1;
        D(i,3)=1;
        D(i,4)=0;
    end
end
disp('================= Curves ==================')
for i=1:row
    figure(i)
    plot(C(i,:),D(i,:))
end

% Calculating Mass point
Mass=zeros(row,1);
for i=1:row
    disp(['Center of Mass',num2str(i),' is:'])
    if C(i,1) == C(i,2)
        den=(   C(i,3)-C(i,1)  )+ ( C(i,4)-C(i,3)  )  /  2 ;
        num=(   C(i,1)+C(i,2)  )*(  C(i,2)-C(i,1)  )  /  2 +( C(i,2)+C(i,3) )*(  C(i,3)-C(i,2) )/2   + C(i,3)*(  C(i,4)-C(i,3) )/2 ;
        Mass(i,1)=num/den;
        disp(Mass(i,1));
    elseif C(i,3)== C(i,4)
        den=( ( C(i,2)-C(i,1)  )  /  2 ) +  (   C(i,4)-C(i,2)  );
        num=C(i,2)*(  C(i,2)-C(i,1) )/2  +  (   C(i,2)+C(i,3)  )*(  C(i,3)-C(i,2) ) / 2+( C(i,3)+C(i,4) )*(  C(i,4)-C(i,3) )/2   ;
        Mass(i,1)=num/den;
        disp(Mass(i,1));
    else
        den=( ( C(i,2)-C(i,1)  )  /  2 ) +  (   C(i,3)-C(i,2)  )  +   ( ( C(i,4)-C(i,3)  )  /  2 );
        num=C(i,2)*(  C(i,2)-C(i,1) )/2  +  (   C(i,2)+C(i,3)  )*(  C(i,3)-C(i,2) ) / 2    + C(i,3)*(  C(i,4)-C(i,3) )/2 ;
        Mass(i,1)=num/den;
        disp(Mass(i,1));
    end
end