function Pole2ImpulseResp()
% figure の作成
fig = figure('WindowButtonMotionFcn',@update_figure);

% model と見たい応答の設定
model = SecondOrderModel;
% Axes オブジェクトの作成
Axes = MakeAxes4Resp_second_order;
[ax_pole, Plot_pole_location_1, Plot_pole_location_2, ax_resp, Plot_response] =...
    Axes.MakeAxes_second_order(model.t, model.y)

  function update_figure(src,data)
      % マウスの位置から極を決定
      Cp = ax_pole.CurrentPoint;
      x_pole_location = Cp(1,1);y_pole_location = Cp(1,2);
      s = [x_pole_location, y_pole_location];
      y = model.impulse_response(s);
      Axes.update_pole_location(Plot_pole_location_1,Plot_pole_location_2, s)
      Axes.update_response(Plot_response, y)
  end

end