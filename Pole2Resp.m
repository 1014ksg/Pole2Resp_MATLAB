function Pole2Resp()
% figure の作成
fig = figure('WindowButtonMotionFcn',@update_figure);

% 以下、First ⇒ Second に変更すれば2次系に
model = SecondOrderModel;
Axes = MakeAxes4Resp_SecondOrder;
[ax_pole, Plot_pole_location, ax_resp, Plot_response] =...
    Axes.MakeAxes(model.t, model.y);

  function update_figure(src,data)
      % マウスの位置から極を決定
      Cp = ax_pole.CurrentPoint;
      x_pole_location = Cp(1,1);y_pole_location = Cp(1,2);
      s = [x_pole_location, y_pole_location];
      %y = model.impulse_response(s);
      y = model.step_response(s);
      Axes.update_pole_location(Plot_pole_location, s)
      Axes.update_response(Plot_response, y)
  end

end