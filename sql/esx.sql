CREATE TABLE police_impound_offence (
    `id` varchar(32) NOT NULL,
    `name` varchar(255) NOT NULL,
    `amount` int(11) DEFAULT 100,
    PRIMARY KEY (`id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO police_impound_offence (`id`, `name`, `amount`) VALUES
('illegal_parking', 'Illegal Parking', 150),
('abandoned_vehicle', 'Abandoned Vehicle', 200),
('unregistered_vehicle', 'Unregistered Vehicle', 300),
('stolen_recovery', 'Stolen Vehicle Recovery', 500),
('obstructing_traffic', 'Obstructing Traffic', 250),
('illegal_mods', 'Illegal Modifications', 400),
('crime_vehicle', 'Vehicle Used in Crime', 1000),
('driver_arrested', 'Driver Arrested', 300),
('evidence_seizure', 'Evidence Seizure', 500),
('noise_complaint', 'Noise Complaint', 100),
('reckless_driving', 'Reckless Driving', 350),
('safety_issues', 'Vehicle Safety Issues', 200),
('dui', 'Driving Under Influence', 700),
('hit_and_run', 'Hit and Run Involvement', 800);

CREATE TABLE police_impound_status (
    `id` int(1) NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO police_impound_status (`id`, `name`) VALUES
(1, 'Released'),
(2, 'Impounded'),
(3, 'Need unlock through LSPD');

CREATE TABLE police_impound (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `officer` varchar(46) NOT NULL, -- Officer Identifier
    `officer_name` varchar(128) NOT NULL, 
    `status` int(1) DEFAULT 2,
    `duration` timestamp DEFAULT NULL,
    `fine` int(11) DEFAULT 0,
    `offence` varchar(32) NOT NULL,
    `notes` LONGTEXT DEFAULT 'No extra notes',
    `vehicle` LONGTEXT NOT NULL,
    `vehicle_plate` varchar(64) DEFAULT 'Unknown',
    `vehicle_owner` varchar(46) NOT NULL, -- Owner Identifier
    `vehicle_owner_name` varchar(128) DEFAULT 'Unknown', -- Owner Name
    `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (`id`),
    -- FOREIGN KEY (`officer`) REFERENCES users(identifier), * Optional
    -- FOREIGN KEY (`vehicle_owner`) REFERENCES users(identifier), * Optional
    FOREIGN KEY (`status`) REFERENCES police_impound_status(id),
    FOREIGN KEY (`offence`) REFERENCES police_impound_offence(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;