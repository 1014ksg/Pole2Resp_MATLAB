classdef FirstOrderModel
   properties
      name
      t
      y
      Tc
      K
   end 
    methods
        function obj = FirstOrderModel()
            obj.name = "FirstOrder"
            obj.t = 0:0.05:8;
            obj.y = zeros(size(obj.t));
        end
        function y = impulse_response(obj,s)
            % 1初期値を1にするため、K=Tとする。
            obj.Tc = -1/s(1);
            obj.K = obj.Tc;
            y = obj.K/obj.Tc * exp(-1/obj.Tc*obj.t);
        end
    end
end