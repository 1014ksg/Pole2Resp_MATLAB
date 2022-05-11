function Pole2ImpulseResp_first_order()
% model のインストール
model = "first_order"

% Response の初期化
t = 0:0.1:8;
y = zeros(size(t));

% figure の作成
fig = figure('WindowButtonMotionFcn',@update_figure);
% Axes オブジェクトの作成
ax_pole = subplot(1,2,1);
ax_resp = subplot(1,2,2);
[ax_pole, Plot_pole_location, ax_resp, Plot_response] = MakeAxes_first_order(ax_pole, ax_resp, t, y);


  function update_figure(src,data)
      % マウスの位置から極を決定
      Cp = ax_pole.CurrentPoint;
      x_pole_location = Cp(1,1);y_pole_location = Cp(1,2);
      s = [x_pole_location, y_pole_location];
      
      % インパルス応答
      y = ImpulseResp_FirstOrder(t,s(1));
      
      % up_date
      update_pole_location(Plot_pole_location,x_pole_location);
      update_response(Plot_response, y);
  end

end

function [ax_pole, Plot_pole_location, ax_resp, Plot_response] = MakeAxes_first_order(ax_pole, ax_resp, t, y)
Plot_pole_location = plot(ax_pole,0,0,'*','MarkerSize',10);
set_figure_ax_pole(ax_pole);
Plot_response = plot(ax_resp,t,y,'LineWidth',1.1);
set_figure_ax_resp(ax_resp)
end

function y = ImpulseResp_FirstOrder(t, s)
arguments
    t = 0:0.1:8;
    s = 1
end

% 1次遅れ系のシステム、初期値を1にするため、K=Tとする。
T = -1/s;
K = T;
y = K/T * exp(-1/T*t);
end

function update_response(Plot_response, y) 
Plot_response.YData = y;
end

function update_pole_location(Plot_pole_location_1,x_pole_location)
Plot_pole_location_1.XData = x_pole_location;
Plot_pole_location_1.YData = 0;
end

function set_figure_ax_pole(ax_pole)
ax_pole.XLim = [-4 1];
ax_pole.YLim = [-8 8];
ax_pole.XAxisLocation = 'origin';
ax_pole.YAxisLocation = 'origin';
grid(ax_pole, 'on')
end

function set_figure_ax_resp(ax_resp)
ax_resp.XAxis.Visible = 'off';
yline(ax_resp,0.0);
ax_resp.XLim = [0 5];
ax_resp.YLim = [-0.1 1.1];
grid(ax_resp, 'on')
end