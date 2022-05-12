classdef SecondOrderModel
   properties
      name
      t
      y
      Tc
      K
      r
      i
      fai
   end 
    methods
        function obj = SecondOrderModel()
            obj.name = "SecondOrder"
            obj.t = 0:0.05:8;
            obj.y = zeros(size(obj.t));
        end
        function y = impulse_response(obj,s)
            % 2次遅れ系のシステム、初期値は1
            obj.r = s(1);
            obj.i = abs(s(2));
            y = exp(obj.r*obj.t).*sin(obj.i*obj.t);
        end
        function y = step_response(obj,s)
            % 2次遅れ系のシステム、初期値は1
            obj.r = s(1);
            obj.i = abs(s(2));
            obj.fai = atan(obj.i/obj.r);
            y = 1- exp(obj.r*obj.t).*sin(obj.i*obj.t+obj.fai);
        end
    end
end