function make_figure()
fig = figure('WindowButtonMotionFcn',@my_callback);
% Axes オブジェクトを作成。
ax_pole = subplot(1,2,1);
Plot_pole_location_1 = plot(ax_pole,0,0,'*','MarkerSize',10);hold on;
Plot_pole_location_2 = plot(ax_pole,0,0,'*','MarkerSize',10);hold on;
ax_pole.XLim = [-4 1];
ax_pole.YLim = [-8 8];
ax_pole.XAxisLocation = 'origin';
ax_pole.YAxisLocation = 'origin';
grid on

ax_resp = subplot(1,2,2);
ax_resp.XAxis.Visible = 'off'
yline(ax_resp,0.0);

% 式から直接
t = 0:0.05:8;
K = 1; T = 1;
y = exp(t);
Plot_response = plot(ax_resp,t,y,'LineWidth',1.1);hold on;
ax_resp.XLim = [0 5];
ax_resp.YLim = [-1.1 1.1];
grid on

  function my_callback(src,data)
      % マウスを動かしたときのコールバック関数
      Cp = ax_pole.CurrentPoint;
      x_pole_location = Cp(1,1);
      y_pole_location = Cp(1,2);
      % 1次用
      Plot_pole_location_1.XData = x_pole_location;
      Plot_pole_location_1.YData = 0;
      hold(ax_pole,'on');
      
      % リファクタ！（2次用）
      Plot_pole_location_1.XData = x_pole_location;
      Plot_pole_location_1.YData = y_pole_location;
      Plot_pole_location_2.XData = x_pole_location;
      Plot_pole_location_2.YData = -y_pole_location;
      
      % 1次遅れ系のシステム、初期値を1にするため、K=Tとする。
      % 伝達関数, 丸田さんの参考にrとiに分けることが重要！！
      r = x_pole_location;
      i = abs(y_pole_location)
      y = exp(r*t).*sin(i*t);
      Plot_response.YData = y
      
      %重根の時の関係性が良くわからない、、？
  end

end