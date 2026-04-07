-- Seed data for Urban Company

-- Insert users: customers, providers, admins
INSERT INTO "user" ("id", "email", "name", "role", "password", "emailVerified", "createdAt", "updatedAt") VALUES
('mass-seed-customer-1', 'mass-seed.customer1@demo.local', 'Customer 1', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-2', 'mass-seed.customer2@demo.local', 'Customer 2', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-3', 'mass-seed.customer3@demo.local', 'Customer 3', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-4', 'mass-seed.customer4@demo.local', 'Customer 4', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-5', 'mass-seed.customer5@demo.local', 'Customer 5', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-6', 'mass-seed.customer6@demo.local', 'Customer 6', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-7', 'mass-seed.customer7@demo.local', 'Customer 7', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-8', 'mass-seed.customer8@demo.local', 'Customer 8', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-9', 'mass-seed.customer9@demo.local', 'Customer 9', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-10', 'mass-seed.customer10@demo.local', 'Customer 10', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-11', 'mass-seed.customer11@demo.local', 'Customer 11', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-12', 'mass-seed.customer12@demo.local', 'Customer 12', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-13', 'mass-seed.customer13@demo.local', 'Customer 13', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-14', 'mass-seed.customer14@demo.local', 'Customer 14', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-15', 'mass-seed.customer15@demo.local', 'Customer 15', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-16', 'mass-seed.customer16@demo.local', 'Customer 16', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-17', 'mass-seed.customer17@demo.local', 'Customer 17', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-18', 'mass-seed.customer18@demo.local', 'Customer 18', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-19', 'mass-seed.customer19@demo.local', 'Customer 19', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-customer-20', 'mass-seed.customer20@demo.local', 'Customer 20', 'CUSTOMER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-1', 'mass-seed.provider1@demo.local', 'Provider 1', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-2', 'mass-seed.provider2@demo.local', 'Provider 2', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-3', 'mass-seed.provider3@demo.local', 'Provider 3', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-4', 'mass-seed.provider4@demo.local', 'Provider 4', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-5', 'mass-seed.provider5@demo.local', 'Provider 5', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-6', 'mass-seed.provider6@demo.local', 'Provider 6', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-7', 'mass-seed.provider7@demo.local', 'Provider 7', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-8', 'mass-seed.provider8@demo.local', 'Provider 8', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-9', 'mass-seed.provider9@demo.local', 'Provider 9', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-provider-10', 'mass-seed.provider10@demo.local', 'Provider 10', 'PROVIDER', 'seed-password', true, NOW(), NOW()),
('mass-seed-admin-1', 'mass-seed.admin1@demo.local', 'Marketplace Admin', 'ADMIN', 'seed-password', true, NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

-- Insert provider profiles
INSERT INTO "provider_profile" ("id", "userId", "bio", "experience", "serviceArea", "averageRating", "totalReviews", "createdAt", "updatedAt") VALUES
('mass-seed-provider-profile-1', 'mass-seed-provider-1', 'Professional cleaner with 5 years of field experience.', 5, 'Bengaluru Central', 4.50, 250, NOW(), NOW()),
('mass-seed-provider-profile-2', 'mass-seed-provider-2', 'Professional cleaner with 8 years of field experience.', 8, 'Mumbai North', 4.30, 180, NOW(), NOW()),
('mass-seed-provider-profile-3', 'mass-seed-provider-3', 'Professional cleaner with 3 years of field experience.', 3, 'Delhi South', 4.60, 320, NOW(), NOW()),
('mass-seed-provider-profile-4', 'mass-seed-provider-4', 'Professional cleaner with 6 years of field experience.', 6, 'Hyderabad East', 4.40, 150, NOW(), NOW()),
('mass-seed-provider-profile-5', 'mass-seed-provider-5', 'Professional cleaner with 4 years of field experience.', 4, 'Pune West', 4.20, 200, NOW(), NOW()),
('mass-seed-provider-profile-6', 'mass-seed-provider-6', 'Professional cleaner with 7 years of field experience.', 7, 'Chennai Metro Belt', 4.55, 280, NOW(), NOW()),
('mass-seed-provider-profile-7', 'mass-seed-provider-7', 'Professional cleaner with 2 years of field experience.', 2, 'Kolkata Urban Zone', 4.35, 90, NOW(), NOW()),
('mass-seed-provider-profile-8', 'mass-seed-provider-8', 'Professional cleaner with 9 years of field experience.', 9, 'Ahmedabad Central', 4.70, 450, NOW(), NOW()),
('mass-seed-provider-profile-9', 'mass-seed-provider-9', 'Professional cleaner with 11 years of field experience.', 11, 'Bengaluru South', 4.45, 380, NOW(), NOW()),
('mass-seed-provider-profile-10', 'mass-seed-provider-10', 'Professional cleaner with 10 years of field experience.', 10, 'Mumbai Metro Belt', 4.65, 420, NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

-- Insert services (6 per provider)
INSERT INTO "service" ("id", "providerId", "title", "description", "category", "city", "price", "durationMinutes", "isActive", "createdAt", "updatedAt") VALUES
-- Provider 1 services
('mass-seed-service-1', 'mass-seed-provider-1', 'Deep Cleaning Package 1', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Bengaluru', 999.00, 120, true, NOW(), NOW()),
('mass-seed-service-2', 'mass-seed-provider-1', 'Maintenance Package 2', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Mumbai', 1499.00, 90, true, NOW(), NOW()),
('mass-seed-service-3', 'mass-seed-provider-1', 'Move Cleaning Package 3', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Delhi', 2499.00, 180, true, NOW(), NOW()),
('mass-seed-service-4', 'mass-seed-provider-1', 'Bathroom Cleaning Package 4', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Hyderabad', 599.00, 60, true, NOW(), NOW()),
('mass-seed-service-5', 'mass-seed-provider-1', 'Kitchen Cleaning Package 5', 'Kitchen Cleaning for apartments and homes with trained professionals.', 'Kitchen Cleaning', 'Pune', 899.00, 90, true, NOW(), NOW()),
('mass-seed-service-6', 'mass-seed-provider-1', 'Sofa Cleaning Package 6', 'Sofa Cleaning for apartments and homes with trained professionals.', 'Sofa Cleaning', 'Chennai', 1299.00, 150, true, NOW(), NOW()),
-- Provider 2 services
('mass-seed-service-7', 'mass-seed-provider-2', 'Carpet Cleaning Package 1', 'Carpet Cleaning for apartments and homes with trained professionals.', 'Carpet Cleaning', 'Kolkata', 799.00, 120, true, NOW(), NOW()),
('mass-seed-service-8', 'mass-seed-provider-2', 'Deep Cleaning Package 2', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Ahmedabad', 1799.00, 150, true, NOW(), NOW()),
('mass-seed-service-9', 'mass-seed-provider-2', 'Maintenance Package 3', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Bengaluru', 1199.00, 90, true, NOW(), NOW()),
('mass-seed-service-10', 'mass-seed-provider-2', 'Move Cleaning Package 4', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Mumbai', 2999.00, 240, true, NOW(), NOW()),
('mass-seed-service-11', 'mass-seed-provider-2', 'Bathroom Cleaning Package 5', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Delhi', 699.00, 60, true, NOW(), NOW()),
('mass-seed-service-12', 'mass-seed-provider-2', 'Kitchen Cleaning Package 6', 'Kitchen Cleaning for apartments and homes with trained professionals.', 'Kitchen Cleaning', 'Hyderabad', 999.00, 120, true, NOW(), NOW()),
-- Provider 3 services
('mass-seed-service-13', 'mass-seed-provider-3', 'Sofa Cleaning Package 1', 'Sofa Cleaning for apartments and homes with trained professionals.', 'Sofa Cleaning', 'Pune', 1499.00, 180, true, NOW(), NOW()),
('mass-seed-service-14', 'mass-seed-provider-3', 'Carpet Cleaning Package 2', 'Carpet Cleaning for apartments and homes with trained professionals.', 'Carpet Cleaning', 'Chennai', 899.00, 90, true, NOW(), NOW()),
('mass-seed-service-15', 'mass-seed-provider-3', 'Deep Cleaning Package 3', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Kolkata', 1999.00, 150, true, NOW(), NOW()),
('mass-seed-service-16', 'mass-seed-provider-3', 'Maintenance Package 4', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Ahmedabad', 1399.00, 120, true, NOW(), NOW()),
('mass-seed-service-17', 'mass-seed-provider-3', 'Move Cleaning Package 5', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Bengaluru', 2699.00, 180, true, NOW(), NOW()),
('mass-seed-service-18', 'mass-seed-provider-3', 'Bathroom Cleaning Package 6', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Mumbai', 549.00, 60, true, NOW(), NOW()),
-- Provider 4 services
('mass-seed-service-19', 'mass-seed-provider-4', 'Kitchen Cleaning Package 1', 'Kitchen Cleaning for apartments and homes with trained professionals.', 'Kitchen Cleaning', 'Delhi', 1099.00, 120, true, NOW(), NOW()),
('mass-seed-service-20', 'mass-seed-provider-4', 'Sofa Cleaning Package 2', 'Sofa Cleaning for apartments and homes with trained professionals.', 'Sofa Cleaning', 'Hyderabad', 1699.00, 150, true, NOW(), NOW()),
('mass-seed-service-21', 'mass-seed-provider-4', 'Carpet Cleaning Package 3', 'Carpet Cleaning for apartments and homes with trained professionals.', 'Carpet Cleaning', 'Pune', 999.00, 90, true, NOW(), NOW()),
('mass-seed-service-22', 'mass-seed-provider-4', 'Deep Cleaning Package 4', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Chennai', 2299.00, 180, true, NOW(), NOW()),
('mass-seed-service-23', 'mass-seed-provider-4', 'Maintenance Package 5', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Kolkata', 1599.00, 150, true, NOW(), NOW()),
('mass-seed-service-24', 'mass-seed-provider-4', 'Move Cleaning Package 6', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Ahmedabad', 3199.00, 240, true, NOW(), NOW()),
-- Provider 5 services
('mass-seed-service-25', 'mass-seed-provider-5', 'Bathroom Cleaning Package 1', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Bengaluru', 749.00, 60, true, NOW(), NOW()),
('mass-seed-service-26', 'mass-seed-provider-5', 'Kitchen Cleaning Package 2', 'Kitchen Cleaning for apartments and homes with trained professionals.', 'Kitchen Cleaning', 'Mumbai', 1199.00, 120, true, NOW(), NOW()),
('mass-seed-service-27', 'mass-seed-provider-5', 'Sofa Cleaning Package 3', 'Sofa Cleaning for apartments and homes with trained professionals.', 'Sofa Cleaning', 'Delhi', 1899.00, 180, true, NOW(), NOW()),
('mass-seed-service-28', 'mass-seed-provider-5', 'Carpet Cleaning Package 4', 'Carpet Cleaning for apartments and homes with trained professionals.', 'Carpet Cleaning', 'Hyderabad', 849.00, 90, true, NOW(), NOW()),
('mass-seed-service-29', 'mass-seed-provider-5', 'Deep Cleaning Package 5', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Pune', 2099.00, 150, true, NOW(), NOW()),
('mass-seed-service-30', 'mass-seed-provider-5', 'Maintenance Package 6', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Chennai', 1299.00, 120, true, NOW(), NOW()),
-- Provider 6 services
('mass-seed-service-31', 'mass-seed-provider-6', 'Move Cleaning Package 1', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Kolkata', 2899.00, 240, true, NOW(), NOW()),
('mass-seed-service-32', 'mass-seed-provider-6', 'Bathroom Cleaning Package 2', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Ahmedabad', 649.00, 60, true, NOW(), NOW()),
('mass-seed-service-33', 'mass-seed-provider-6', 'Kitchen Cleaning Package 3', 'Kitchen Cleaning for apartments and homes with trained professionals.', 'Kitchen Cleaning', 'Bengaluru', 1349.00, 150, true, NOW(), NOW()),
('mass-seed-service-34', 'mass-seed-provider-6', 'Sofa Cleaning Package 4', 'Sofa Cleaning for apartments and homes with trained professionals.', 'Sofa Cleaning', 'Mumbai', 1599.00, 180, true, NOW(), NOW()),
('mass-seed-service-35', 'mass-seed-provider-6', 'Carpet Cleaning Package 5', 'Carpet Cleaning for apartments and homes with trained professionals.', 'Carpet Cleaning', 'Delhi', 949.00, 120, true, NOW(), NOW()),
('mass-seed-service-36', 'mass-seed-provider-6', 'Deep Cleaning Package 6', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Hyderabad', 2499.00, 180, true, NOW(), NOW()),
-- Provider 7 services
('mass-seed-service-37', 'mass-seed-provider-7', 'Maintenance Package 1', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Pune', 1449.00, 90, true, NOW(), NOW()),
('mass-seed-service-38', 'mass-seed-provider-7', 'Move Cleaning Package 2', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Chennai', 3399.00, 240, true, NOW(), NOW()),
('mass-seed-service-39', 'mass-seed-provider-7', 'Bathroom Cleaning Package 3', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Kolkata', 799.00, 60, true, NOW(), NOW()),
('mass-seed-service-40', 'mass-seed-provider-7', 'Kitchen Cleaning Package 4', 'Kitchen Cleaning for apartments and homes with trained professionals.', 'Kitchen Cleaning', 'Ahmedabad', 1049.00, 120, true, NOW(), NOW()),
('mass-seed-service-41', 'mass-seed-provider-7', 'Sofa Cleaning Package 5', 'Sofa Cleaning for apartments and homes with trained professionals.', 'Sofa Cleaning', 'Bengaluru', 1799.00, 150, true, NOW(), NOW()),
('mass-seed-service-42', 'mass-seed-provider-7', 'Carpet Cleaning Package 6', 'Carpet Cleaning for apartments and homes with trained professionals.', 'Carpet Cleaning', 'Mumbai', 899.00, 90, true, NOW(), NOW()),
-- Provider 8 services
('mass-seed-service-43', 'mass-seed-provider-8', 'Deep Cleaning Package 1', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Delhi', 1899.00, 150, true, NOW(), NOW()),
('mass-seed-service-44', 'mass-seed-provider-8', 'Maintenance Package 2', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Hyderabad', 1699.00, 120, true, NOW(), NOW()),
('mass-seed-service-45', 'mass-seed-provider-8', 'Move Cleaning Package 3', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Pune', 3099.00, 240, true, NOW(), NOW()),
('mass-seed-service-46', 'mass-seed-provider-8', 'Bathroom Cleaning Package 4', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Chennai', 699.00, 60, true, NOW(), NOW()),
('mass-seed-service-47', 'mass-seed-provider-8', 'Kitchen Cleaning Package 5', 'Kitchen Cleaning for apartments and homes with trained professionals.', 'Kitchen Cleaning', 'Kolkata', 1249.00, 150, true, NOW(), NOW()),
('mass-seed-service-48', 'mass-seed-provider-8', 'Sofa Cleaning Package 6', 'Sofa Cleaning for apartments and homes with trained professionals.', 'Sofa Cleaning', 'Ahmedabad', 1999.00, 180, true, NOW(), NOW()),
-- Provider 9 services
('mass-seed-service-49', 'mass-seed-provider-9', 'Carpet Cleaning Package 1', 'Carpet Cleaning for apartments and homes with trained professionals.', 'Carpet Cleaning', 'Bengaluru', 1099.00, 120, true, NOW(), NOW()),
('mass-seed-service-50', 'mass-seed-provider-9', 'Deep Cleaning Package 2', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Mumbai', 2199.00, 180, true, NOW(), NOW()),
('mass-seed-service-51', 'mass-seed-provider-9', 'Maintenance Package 3', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Delhi', 1549.00, 90, true, NOW(), NOW()),
('mass-seed-service-52', 'mass-seed-provider-9', 'Move Cleaning Package 4', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Hyderabad', 3599.00, 240, true, NOW(), NOW()),
('mass-seed-service-53', 'mass-seed-provider-9', 'Bathroom Cleaning Package 5', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Pune', 849.00, 60, true, NOW(), NOW()),
('mass-seed-service-54', 'mass-seed-provider-9', 'Kitchen Cleaning Package 6', 'Kitchen Cleaning for apartments and homes with trained professionals.', 'Kitchen Cleaning', 'Chennai', 1399.00, 120, true, NOW(), NOW()),
-- Provider 10 services
('mass-seed-service-55', 'mass-seed-provider-10', 'Sofa Cleaning Package 1', 'Sofa Cleaning for apartments and homes with trained professionals.', 'Sofa Cleaning', 'Kolkata', 1699.00, 150, true, NOW(), NOW()),
('mass-seed-service-56', 'mass-seed-provider-10', 'Carpet Cleaning Package 2', 'Carpet Cleaning for apartments and homes with trained professionals.', 'Carpet Cleaning', 'Ahmedabad', 999.00, 90, true, NOW(), NOW()),
('mass-seed-service-57', 'mass-seed-provider-10', 'Deep Cleaning Package 3', 'Deep Cleaning for apartments and homes with trained professionals.', 'Deep Cleaning', 'Bengaluru', 2599.00, 180, true, NOW(), NOW()),
('mass-seed-service-58', 'mass-seed-provider-10', 'Maintenance Package 4', 'Maintenance for apartments and homes with trained professionals.', 'Maintenance', 'Mumbai', 1849.00, 150, true, NOW(), NOW()),
('mass-seed-service-59', 'mass-seed-provider-10', 'Move Cleaning Package 5', 'Move Cleaning for apartments and homes with trained professionals.', 'Move Cleaning', 'Delhi', 3299.00, 240, true, NOW(), NOW()),
('mass-seed-service-60', 'mass-seed-provider-10', 'Bathroom Cleaning Package 6', 'Bathroom Cleaning for apartments and homes with trained professionals.', 'Bathroom Cleaning', 'Hyderabad', 749.00, 60, true, NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

-- Insert bookings (sample data)
INSERT INTO "booking" ("id", "serviceId", "customerId", "providerId", "scheduleAt", "address", "notes", "status", "paymentStatus", "totalAmount", "createdAt", "updatedAt") VALUES
('mass-seed-booking-1', 'mass-seed-service-1', 'mass-seed-customer-1', 'mass-seed-provider-1', NOW() - INTERVAL '5 days', '42, Central, Bengaluru', 'Seeded booking generated for load testing and UI demos.', 'COMPLETED', 'SUCCESS', 999.00, NOW(), NOW()),
('mass-seed-booking-2', 'mass-seed-service-7', 'mass-seed-customer-1', 'mass-seed-provider-2', NOW() + INTERVAL '10 days', '156, North, Mumbai', 'Seeded booking generated for load testing and UI demos.', 'CONFIRMED', 'SUCCESS', 799.00, NOW(), NOW()),
('mass-seed-booking-3', 'mass-seed-service-13', 'mass-seed-customer-2', 'mass-seed-provider-3', NOW() - INTERVAL '15 days', '89, South, Delhi', 'Seeded booking generated for load testing and UI demos.', 'COMPLETED', 'SUCCESS', 1499.00, NOW(), NOW()),
('mass-seed-booking-4', 'mass-seed-service-19', 'mass-seed-customer-3', 'mass-seed-provider-4', NOW() + INTERVAL '3 days', '301, East, Hyderabad', 'Seeded booking generated for load testing and UI demos.', 'PENDING', 'PENDING', 1099.00, NOW(), NOW()),
('mass-seed-booking-5', 'mass-seed-service-25', 'mass-seed-customer-4', 'mass-seed-provider-5', NOW() - INTERVAL '20 days', '67, West, Pune', 'Seeded booking generated for load testing and UI demos.', 'COMPLETED', 'FAILED', 749.00, NOW(), NOW()),
('mass-seed-booking-6', 'mass-seed-service-31', 'mass-seed-customer-5', 'mass-seed-provider-6', NOW() + INTERVAL '7 days', '234, Metro Belt, Chennai', 'Seeded booking generated for load testing and UI demos.', 'IN_PROGRESS', 'SUCCESS', 2899.00, NOW(), NOW()),
('mass-seed-booking-7', 'mass-seed-service-37', 'mass-seed-customer-6', 'mass-seed-provider-7', NOW() - INTERVAL '30 days', '512, Urban Zone, Kolkata', 'Seeded booking generated for load testing and UI demos.', 'CANCELLED', 'PENDING', 1449.00, NOW(), NOW()),
('mass-seed-booking-8', 'mass-seed-service-43', 'mass-seed-customer-7', 'mass-seed-provider-8', NOW() + INTERVAL '12 days', '78, Central, Ahmedabad', 'Seeded booking generated for load testing and UI demos.', 'CONFIRMED', 'SUCCESS', 1899.00, NOW(), NOW()),
('mass-seed-booking-9', 'mass-seed-service-49', 'mass-seed-customer-8', 'mass-seed-provider-9', NOW() - INTERVAL '8 days', '445, South, Bengaluru', 'Seeded booking generated for load testing and UI demos.', 'COMPLETED', 'SUCCESS', 1099.00, NOW(), NOW()),
('mass-seed-booking-10', 'mass-seed-service-55', 'mass-seed-customer-9', 'mass-seed-provider-10', NOW() + INTERVAL '25 days', '99, North, Mumbai', 'Seeded booking generated for load testing and UI demos.', 'PENDING', 'PENDING', 1699.00, NOW(), NOW()),
('mass-seed-booking-11', 'mass-seed-service-2', 'mass-seed-customer-10', 'mass-seed-provider-1', NOW() + INTERVAL '2 days', '183, East, Delhi', 'Seeded booking generated for load testing and UI demos.', 'CONFIRMED', 'SUCCESS', 1499.00, NOW(), NOW()),
('mass-seed-booking-12', 'mass-seed-service-8', 'mass-seed-customer-11', 'mass-seed-provider-2', NOW() - INTERVAL '12 days', '567, West, Hyderabad', 'Seeded booking generated for load testing and UI demos.', 'COMPLETED', 'SUCCESS', 1799.00, NOW(), NOW()),
('mass-seed-booking-13', 'mass-seed-service-14', 'mass-seed-customer-12', 'mass-seed-provider-3', NOW() + INTERVAL '18 days', '321, Metro Belt, Pune', 'Seeded booking generated for load testing and UI demos.', 'IN_PROGRESS', 'FAILED', 899.00, NOW(), NOW()),
('mass-seed-booking-14', 'mass-seed-service-20', 'mass-seed-customer-13', 'mass-seed-provider-4', NOW() - INTERVAL '25 days', '145, Urban Zone, Chennai', 'Seeded booking generated for load testing and UI demos.', 'CANCELLED', 'PENDING', 1699.00, NOW(), NOW()),
('mass-seed-booking-15', 'mass-seed-service-26', 'mass-seed-customer-14', 'mass-seed-provider-5', NOW() + INTERVAL '6 days', '789, Central, Kolkata', 'Seeded booking generated for load testing and UI demos.', 'PENDING', 'PENDING', 1199.00, NOW(), NOW()),
('mass-seed-booking-16', 'mass-seed-service-32', 'mass-seed-customer-15', 'mass-seed-provider-6', NOW() - INTERVAL '3 days', '432, North, Ahmedabad', 'Seeded booking generated for load testing and UI demos.', 'COMPLETED', 'SUCCESS', 649.00, NOW(), NOW()),
('mass-seed-booking-17', 'mass-seed-service-38', 'mass-seed-customer-16', 'mass-seed-provider-7', NOW() + INTERVAL '15 days', '256, South, Bengaluru', 'Seeded booking generated for load testing and UI demos.', 'CONFIRMED', 'SUCCESS', 3399.00, NOW(), NOW()),
('mass-seed-booking-18', 'mass-seed-service-44', 'mass-seed-customer-17', 'mass-seed-provider-8', NOW() - INTERVAL '18 days', '678, East, Mumbai', 'Seeded booking generated for load testing and UI demos.', 'COMPLETED', 'SUCCESS', 1699.00, NOW(), NOW()),
('mass-seed-booking-19', 'mass-seed-service-50', 'mass-seed-customer-18', 'mass-seed-provider-9', NOW() + INTERVAL '9 days', '912, West, Delhi', 'Seeded booking generated for load testing and UI demos.', 'IN_PROGRESS', 'SUCCESS', 2199.00, NOW(), NOW()),
('mass-seed-booking-20', 'mass-seed-service-56', 'mass-seed-customer-19', 'mass-seed-provider-10', NOW() - INTERVAL '40 days', '234, Metro Belt, Hyderabad', 'Seeded booking generated for load testing and UI demos.', 'COMPLETED', 'SUCCESS', 999.00, NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

-- Insert payments for bookings with non-pending payment status
INSERT INTO "payment" ("id", "bookingId", "customerId", "providerId", "amount", "status", "transactionRef", "method", "createdAt", "updatedAt") VALUES
('mass-seed-payment-1', 'mass-seed-booking-1', 'mass-seed-customer-1', 'mass-seed-provider-1', 999.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-1', 'mock', NOW(), NOW()),
('mass-seed-payment-2', 'mass-seed-booking-2', 'mass-seed-customer-1', 'mass-seed-provider-2', 799.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-2', 'mock', NOW(), NOW()),
('mass-seed-payment-3', 'mass-seed-booking-3', 'mass-seed-customer-2', 'mass-seed-provider-3', 1499.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-3', 'mock', NOW(), NOW()),
('mass-seed-payment-4', 'mass-seed-booking-5', 'mass-seed-customer-4', 'mass-seed-provider-5', 749.00, 'FAILED', 'mass-seed-txn-mass-seed-booking-5', 'mock', NOW(), NOW()),
('mass-seed-payment-5', 'mass-seed-booking-6', 'mass-seed-customer-5', 'mass-seed-provider-6', 2899.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-6', 'mock', NOW(), NOW()),
('mass-seed-payment-6', 'mass-seed-booking-8', 'mass-seed-customer-7', 'mass-seed-provider-8', 1899.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-8', 'mock', NOW(), NOW()),
('mass-seed-payment-7', 'mass-seed-booking-9', 'mass-seed-customer-8', 'mass-seed-provider-9', 1099.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-9', 'mock', NOW(), NOW()),
('mass-seed-payment-8', 'mass-seed-booking-11', 'mass-seed-customer-10', 'mass-seed-provider-1', 1499.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-11', 'mock', NOW(), NOW()),
('mass-seed-payment-9', 'mass-seed-booking-12', 'mass-seed-customer-11', 'mass-seed-provider-2', 1799.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-12', 'mock', NOW(), NOW()),
('mass-seed-payment-10', 'mass-seed-booking-13', 'mass-seed-customer-12', 'mass-seed-provider-3', 899.00, 'FAILED', 'mass-seed-txn-mass-seed-booking-13', 'mock', NOW(), NOW()),
('mass-seed-payment-11', 'mass-seed-booking-16', 'mass-seed-customer-15', 'mass-seed-provider-6', 649.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-16', 'mock', NOW(), NOW()),
('mass-seed-payment-12', 'mass-seed-booking-17', 'mass-seed-customer-16', 'mass-seed-provider-7', 3399.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-17', 'mock', NOW(), NOW()),
('mass-seed-payment-13', 'mass-seed-booking-18', 'mass-seed-customer-17', 'mass-seed-provider-8', 1699.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-18', 'mock', NOW(), NOW()),
('mass-seed-payment-14', 'mass-seed-booking-19', 'mass-seed-customer-18', 'mass-seed-provider-9', 2199.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-19', 'mock', NOW(), NOW()),
('mass-seed-payment-15', 'mass-seed-booking-20', 'mass-seed-customer-19', 'mass-seed-provider-10', 999.00, 'SUCCESS', 'mass-seed-txn-mass-seed-booking-20', 'mock', NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

-- Insert reviews for completed bookings
INSERT INTO "review" ("id", "serviceId", "bookingId", "customerId", "providerId", "rating", "comment", "isHidden", "createdAt", "updatedAt") VALUES
('mass-seed-review-1', 'mass-seed-service-1', 'mass-seed-booking-1', 'mass-seed-customer-1', 'mass-seed-provider-1', 5, 'Seeded review: service was professional and on time.', false, NOW(), NOW()),
('mass-seed-review-2', 'mass-seed-service-13', 'mass-seed-booking-3', 'mass-seed-customer-2', 'mass-seed-provider-3', 4, 'Seeded review: service was professional and on time.', false, NOW(), NOW()),
('mass-seed-review-3', 'mass-seed-service-49', 'mass-seed-booking-9', 'mass-seed-customer-8', 'mass-seed-provider-9', 5, 'Seeded review: service was professional and on time.', false, NOW(), NOW()),
('mass-seed-review-4', 'mass-seed-service-2', 'mass-seed-booking-12', 'mass-seed-customer-11', 'mass-seed-provider-2', 4, 'Seeded review: service was professional and on time.', false, NOW(), NOW()),
('mass-seed-review-5', 'mass-seed-service-32', 'mass-seed-booking-16', 'mass-seed-customer-15', 'mass-seed-provider-6', 5, 'Seeded review: service was professional and on time.', false, NOW(), NOW()),
('mass-seed-review-6', 'mass-seed-service-44', 'mass-seed-booking-18', 'mass-seed-customer-17', 'mass-seed-provider-8', 4, 'Seeded review: service was professional and on time.', false, NOW(), NOW()),
('mass-seed-review-7', 'mass-seed-service-56', 'mass-seed-booking-20', 'mass-seed-customer-19', 'mass-seed-provider-10', 5, 'Seeded review: service was professional and on time.', false, NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

-- Insert notifications
INSERT INTO "notification" ("id", "userId", "title", "message", "type", "isRead", "createdAt") VALUES
('mass-seed-notification-1', 'mass-seed-customer-1', 'Booking status updated', 'Booking mass-seed-booking-1 status: COMPLETED', 'BOOKING', false, NOW()),
('mass-seed-notification-2', 'mass-seed-provider-1', 'New booking activity', 'A booking linked to your service is completed.', 'BOOKING', false, NOW()),
('mass-seed-notification-3', 'mass-seed-customer-2', 'Booking status updated', 'Booking mass-seed-booking-3 status: COMPLETED', 'BOOKING', true, NOW()),
('mass-seed-notification-4', 'mass-seed-provider-3', 'New booking activity', 'A booking linked to your service is completed.', 'BOOKING', true, NOW()),
('mass-seed-notification-5', 'mass-seed-customer-3', 'Booking status updated', 'Booking mass-seed-booking-4 status: PENDING', 'BOOKING', false, NOW()),
('mass-seed-notification-6', 'mass-seed-provider-4', 'New booking activity', 'A booking linked to your service is pending.', 'BOOKING', false, NOW()),
('mass-seed-notification-7', 'mass-seed-customer-5', 'Booking status updated', 'Booking mass-seed-booking-6 status: IN_PROGRESS', 'BOOKING', true, NOW()),
('mass-seed-notification-8', 'mass-seed-provider-6', 'New booking activity', 'A booking linked to your service is in_progress.', 'BOOKING', false, NOW()),
('mass-seed-notification-9', 'mass-seed-customer-7', 'Booking status updated', 'Booking mass-seed-booking-8 status: CONFIRMED', 'BOOKING', false, NOW()),
('mass-seed-notification-10', 'mass-seed-provider-8', 'New booking activity', 'A booking linked to your service is confirmed.', 'BOOKING', true, NOW()),
('mass-seed-notification-11', 'mass-seed-provider-1', 'Weekly performance digest', 'You have new customer interactions this week.', 'SYSTEM', false, NOW()),
('mass-seed-notification-12', 'mass-seed-provider-2', 'Weekly performance digest', 'You have new customer interactions this week.', 'SYSTEM', false, NOW()),
('mass-seed-notification-13', 'mass-seed-provider-3', 'Weekly performance digest', 'You have new customer interactions this week.', 'SYSTEM', false, NOW()),
('mass-seed-notification-14', 'mass-seed-provider-4', 'Weekly performance digest', 'You have new customer interactions this week.', 'SYSTEM', false, NOW()),
('mass-seed-notification-15', 'mass-seed-provider-5', 'Weekly performance digest', 'You have new customer interactions this week.', 'SYSTEM', false, NOW())
ON CONFLICT ("id") DO NOTHING;