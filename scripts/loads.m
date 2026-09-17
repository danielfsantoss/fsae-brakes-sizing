% In N

g = 9.81;
vehicle = 215*g;
driver = 75*g;
total_weight = vehicle + driver;
front_static_axle = total_weight * (cg_to_front_axle/wheelbase);
rear_static_axle = total_weight * (cg_to_rear_axle/wheelbase);

deceleration_g = (2 / (total_weight * tire_radius)) * (front_disk_torque + rear_disk_torque);
deceleration_ms2 = deceleration_g * g;

total_braking_force = deceleration_g * total_weight;

load_transfer = (cg_height / wheelbase) * total_braking_force;

dynamic_front_axle_normal_force = front_static_axle + load_transfer;
dynamic_rear_axle_normal_force  = rear_static_axle  - load_transfer;

fprintf('Deceleration = %.3f g (%.2f m/s^2)\n', deceleration_g, deceleration_ms2)
fprintf('Dynamic Rear Axle Normal Force (N) = %.2f\n', dynamic_rear_axle_normal_force)
