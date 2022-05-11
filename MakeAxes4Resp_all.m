classdef MakeAxes4Resp_all
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
        function obj = MakeAxes4Resp_all()
            obj.ax_pole = subplot(1,2,1);
            obj.ax_resp = subplot(1,2,2);
        end
        % 1次系
        function  [ax_pole, Plot_pole_location, ax_resp, Plot_response] =...
                MakeAxes_first_order(obj, t, y)
            Plot_pole_location = plot(obj.ax_pole,0,0,'*','MarkerSize',10);
            obj.tmp_set_figure_ax_pole(obj.ax_pole);
            
            Plot_response = plot(obj.ax_resp,t,y,'LineWidth',1.1);
            obj.tmp_set_figure_ax_resp(obj.ax_resp);
            
            ax_pole = obj.ax_pole;
            ax_resp = obj.ax_resp;
        end
        function update_pole_location_first_order(obj, Plot_pole_location,s)
            Plot_pole_location.XData = s(1)
            Plot_pole_location.YData = 0;
        end
        % 2次系
        function  [ax_pole, Plot_pole_location_1, Plot_pole_location_2, ax_resp, Plot_response] =...
                MakeAxes_second_order(obj, t, y)
            Plot_pole_location_1 = plot(obj.ax_pole,0,0,'*','MarkerSize',10);hold(obj.ax_pole, 'on')
            Plot_pole_location_2 = plot(obj.ax_pole,0,0,'*','MarkerSize',10);
            obj.tmp_set_figure_ax_pole(obj.ax_pole);
            
            Plot_response = plot(obj.ax_resp,t,y,'LineWidth',1.1);
            obj.tmp_set_figure_ax_resp(obj.ax_resp);
            
            ax_pole = obj.ax_pole;
            ax_resp = obj.ax_resp;
        end
        function update_pole_location_second_order(obj, Plot_pole_location_1,Plot_pole_location_2, s)
            Plot_pole_location_1.XData = s(1);
            Plot_pole_location_1.YData = s(2);
            Plot_pole_location_2.XData = s(1);
            Plot_pole_location_2.YData = -s(2);
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
            ax_resp.YLim = [-1.1 1.1];
            grid(ax_resp, 'on')
        end
    end
end