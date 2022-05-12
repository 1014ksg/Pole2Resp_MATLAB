classdef MakeAxes4Resp_SecondOrder < MakeAxes4Resp 
    methods
        % 2次系
        function  [ax_pole, Plot_pole_location, ax_resp, Plot_response] =...
                MakeAxes(obj, t, y)
            Plot_pole_location_1 = plot(obj.ax_pole,0,0,'*','MarkerSize',10);hold(obj.ax_pole, 'on')
            Plot_pole_location_2 = plot(obj.ax_pole,0,0,'*','MarkerSize',10);
            Plot_pole_location = [Plot_pole_location_1, Plot_pole_location_2];
            obj.tmp_set_figure_ax_pole(obj.ax_pole);
            
            Plot_response = plot(obj.ax_resp,t,y,'LineWidth',1.1);
            obj.tmp_set_figure_ax_resp(obj.ax_resp);
            
            ax_pole = obj.ax_pole;
            ax_resp = obj.ax_resp;
        end
        function update_pole_location(obj, Plot_pole_location, s)
            Plot_pole_location(1).XData = s(1);
            Plot_pole_location(1).YData = s(2);
            Plot_pole_location(2).XData = s(1);
            Plot_pole_location(2).YData = -s(2);
        end
    end
end