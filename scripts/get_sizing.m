clc
clear
driver_force = 500;
pedal_ratio = 5;
brake_bias = 0.55;
lever_efficiency = 0.8;
balance_bar_force = driver_force*pedal_ratio*lever_efficiency;

master_cylinder_diameter = 19.05 * 10^(-3);
master_cylinder_efficiency = 0.98;
cylinder_master_area = (pi/4) * master_cylinder_diameter^2;
front_master_cylinder_force = balance_bar_force * brake_bias;
rear_master_cylinder_force = balance_bar_force * (1-brake_bias);
front_master_cylinder_pressure = (front_master_cylinder_force/cylinder_master_area) * master_cylinder_efficiency;
rear_master_cylinder_pressure = (rear_master_cylinder_force/cylinder_master_area) * master_cylinder_efficiency;
fprintf('Pressão Dianteira em Bar: %.2f\n', front_master_cylinder_pressure/10^5);
fprintf('Pressão Traseira em Bar: %.2f\n', rear_master_cylinder_pressure/10^5);

front_piston_area =  8.0425 * 10^(-4); % Área pistão dianteiro (4.987 para 25mm e 8.0425 para 32mm)
rear_piston_area = 8.0425 * 10^(-4); % Area do pistão traseira
front_caliper_piston_quantity = 2; % Número de pistões na pinça dianteira
rear_caliper_piston_quantity = 1; % Número de pistões na pinça Traseira
caliper_efficiency = 0.98; % Eficiência da pinça
front_caliper_piston_force = front_master_cylinder_pressure * front_piston_area * front_caliper_piston_quantity * caliper_efficiency; % Força dos pistões na pinça dianteira
rear_caliper_piston_force = rear_master_cylinder_pressure * rear_piston_area * rear_caliper_piston_quantity * caliper_efficiency; % Força dos pistões na pinça traseira
fprintf('Força aperto Dianteira em N: %.2f\n', front_caliper_piston_force);
fprintf('Força aperto Traseira em N: %.2f\n', rear_caliper_piston_force);

front_friction_coefficient = 0.5; % Coeficiente de atrito dianteira
rear_friction_coefficient = 0.5; % Coeficiente de atrito traseira
front_friction_force = front_caliper_piston_force*front_friction_coefficient * 2;
rear_friction_force = rear_caliper_piston_force*rear_friction_coefficient * 2;
fprintf('Força atrito Dianteira em N: %.2f\n', front_friction_force);
fprintf('Força atrito Traseira em N: %.2f\n', rear_friction_force);

front_effective_radius = 0.115; % Raio efetivo em metros
brake_factor = 0.8; % Fator de frenagem
front_disk_torque = front_effective_radius*front_friction_force*brake_factor; % Torque disco dianteiro
fprintf('Torque disco dianteiro: %.2f\n', front_disk_torque);
fprintf('Torque no eixo dianteiro: %.2f\n', 2 * front_disk_torque);

rear_effective_radius = 0.08; % Raio efetivo em metros
rear_disk_torque = rear_effective_radius*rear_friction_force*brake_factor; % Torque disco dianteiro
fprintf('Torque disco traseiro: %.2f\n', rear_disk_torque);
fprintf('Torque no eixo traseiro: %.2f\n', 2*rear_disk_torque);