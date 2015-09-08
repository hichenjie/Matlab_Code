function createfigure(X1, Y1, Z1, S1, C1, X2, Y2, S2, C2, X3, Y3, C3, X4, Y4, C4)
%CREATEFIGURE(X1,Y1,Z1,S1,C1,X2,Y2,S2,C2,X3,Y3,C3,X4,Y4,C4)
%  X1:  scatter3 x
%  Y1:  scatter3 y
%  Z1:  scatter3 z
%  S1:  scatter3 s
%  C1:  scatter3 c
%  X2:  scatter3 x
%  Y2:  scatter3 y
%  S2:  scatter3 s
%  C2:  scatter3 c
%  X3:  scatter3 x
%  Y3:  scatter3 y
%  C3:  scatter3 c
%  X4:  scatter3 x
%  Y4:  scatter3 y
%  C4:  scatter3 c

%  Auto-generated by MATLAB on 02-Sep-2014 15:33:53

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
view(axes1,[-23 46]);
grid(axes1,'on');
hold(axes1,'all');

% Create scatter3
scatter3(X1,Y1,Z1,S1,C1,'Parent',axes1,'DisplayName','��������5');

% Create scatter3
scatter3(X2,Y2,Z1,S2,C2,'Parent',axes1,'DisplayName','��������300');

% Create scatter3
scatter3(X3,Y3,Z1,S2,C3,'Parent',axes1,'DisplayName','��������500');

% Create scatter3
scatter3(X4,Y4,Z1,S1,C4,'Parent',axes1,'DisplayName','��������1000');

% Create title
title({'����Ⱥ��ͬ���������ڿռ�ķֲ�ͼ'});

% Create xlabel
xlabel('��������');

% Create ylabel
ylabel('��������');

% Create zlabel
zlabel('�췽��');

% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.750570077245944 0.792581655006055 0.221238938053097 0.140164899882214]);

% Create textarrow
annotation(figure1,'textarrow',[0.464860907759883 0.499267935578331],...
    [0.508984639016898 0.490015360983103],'TextEdgeColor','none',...
    'String',{'��ѽ�'});
