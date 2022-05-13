classdef MakeAxes4Resp_SecondOrder_Impulse < MakeAxes4Resp_SecondOrder
    methods
        function tmp_set_figure_ax_resp(obj,ax_resp)
            ax_resp.XAxis.Visible = 'off';
            yline(ax_resp,0.0);
            ax_resp.XLim = [0 5];
            ax_resp.YLim = [-1.1 1.1];
            grid(ax_resp, 'on')
        end
    end
end