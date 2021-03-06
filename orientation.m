% Description: Determine current and desired orientation. Reset the arm 
% orientation if necessary. Compare current arm orientation with previously
% determined desired orientation. Move the arm in a straight line path to 
% full extension then back to initial position using the other arm 
% orientation. 

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

% DETERMINE CURR_ORI
[ori1,ori2] = check_ori();
if ori1 == ori2
    if ori1 == 1 && ori2 == 1
        determine_ori();
    else % In case ori1 == 0 && ori2 == 0.
        error('check_ori:er_ori','Orientation error array has incorrect value(s).');
    end
else
    if ori1 == 1
        target_ori = 1;
    end
    if ori2 == 1
        target_ori = 2; 
    end
end

if target_ori ~= curr_ori
     [x_s,y_s] = xy_switch(); 
     % MOVE ARM TO X_F, Y_F FOR SWITCHING ORIENTATIONS. 
     % MOVE ARM TO X_I, Y_I.   
end