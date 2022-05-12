function Pole2Resp()
% figure の作成
fig = figure('WindowButtonMotionFcn',@update_figure);

% 以下、First ⇒ Second に変更すれば2次系に
model = FirstOrderModel;
Axes = MakeAxes4Resp_FirstOrder;
[ax_pole, Plot_pole_location, ax_resp, Plot_response] =...
    Axes.MakeAxes(model.t, model.y);

  function update_figure(src,data)
      % マウスの位置から極を決定
      Cp = ax_pole.CurrentPoint;
      x_pole_location = Cp(1,1);y_pole_location = Cp(1,2);
      s = [x_pole_location, y_pole_location];
      %y = model.impulse_response(s);
      y = model.impulse_response(s);
      Axes.update_pole_location(Plot_pole_location, s)
      Axes.update_response(Plot_response, y)
  end

end