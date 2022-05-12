classdef MakeAxes4Resp_FirstOrder < MakeAxes4Resp 
    methods
        % 1次系
        function  [ax_pole, Plot_pole_location, ax_resp, Plot_response] =...
                MakeAxes(obj, t, y)
            Plot_pole_location = plot(obj.ax_pole,0,0,'*','MarkerSize',10);
            obj.tmp_set_figure_ax_pole(obj.ax_pole);
            
            Plot_response = plot(obj.ax_resp,t,y,'LineWidth',1.1);
            obj.tmp_set_figure_ax_resp(obj.ax_resp);
            
            ax_pole = obj.ax_pole;
            ax_resp = obj.ax_resp;
        end
        function update_pole_location(obj, Plot_pole_location,s)
            Plot_pole_location.XData = s(1)
            Plot_pole_location.YData = 0;
        end
    end
end