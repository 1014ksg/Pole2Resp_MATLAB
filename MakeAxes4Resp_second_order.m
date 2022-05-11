classdef MakeAxes4Resp_second_order < MakeAxes4Resp 
    methods
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
    end
end