classdef MakeAxes4Resp
    %
    % 左側に極配置、右側に時間応答を描画
    %
   properties
      ax_pole
      Plot_pole_location
      ax_resp
      Plot_response
   end 
    methods
        function obj = MakeAxes4Resp()
            obj.ax_pole = subplot(1,2,1);
            obj.ax_resp = subplot(1,2,2);
        end
        function update_response(obj, Plot_response, y)
            Plot_response.YData = y;
        end
        function tmp_set_figure_ax_pole(obj,ax_pole)
            ax_pole.XLim = [-4 1];
            ax_pole.YLim = [-8 8];
            ax_pole.XAxisLocation = 'origin';
            ax_pole.YAxisLocation = 'origin';
            grid(ax_pole, 'on')
        end
        function tmp_set_figure_ax_resp(obj,ax_resp)
            ax_resp.XAxis.Visible = 'off';
            yline(ax_resp,0.0);
            ax_resp.XLim = [0 5];
            ax_resp.YLim = [-1.1 2.1];
            grid(ax_resp, 'on')
        end
    end
end