% This function returns current angles of the arm in radians. 

function [theta2,theta3,gamma] = thetas()

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

% Output angles in radians.
theta2 = pi - ((a.analogRead(PIN_pot1) - theta2_min) / (theta2_max - theta2_min) * 180) * pi / 180; % From +x axis.
theta3 = pi - ((a.analogRead(PIN_pot2) - theta3_min) / (theta3_max - theta3_min) * 180) * pi / 180; % From +x axis.

if theta3 > (pi/2)
    gamma = pi - theta2 + theta3;
end
if theta3 < (pi/2)
    gamma = (pi/2) - theta2 + theta3;
end