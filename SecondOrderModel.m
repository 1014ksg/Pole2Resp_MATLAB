classdef SecondOrderModel
   properties
      name
      t
      y
      Tc
      K
      r
      i
      alpha
      beta
      omega
      zeta
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
            obj.alpha = s(1)+1j*s(2);
            obj.beta =  s(1)-1j*s(2);
            obj.omega = (obj.i^2+1/4*(obj.alpha+obj.beta)^2)^(1/2);
            obj.zeta = -1/(2*obj.omega)*(obj.alpha+obj.beta);
            obj.fai = atan(((1-obj.zeta^2)^(1/2))/obj.zeta);
            
            y  = 1-1/((1-obj.zeta^2)^(1/2))*exp(obj.r*obj.t).*sin(obj.i*obj.t+obj.fai);
        end
    end
end