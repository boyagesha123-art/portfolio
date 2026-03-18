-- بيانات تجريبية لجدول المستخدمين
INSERT INTO dbo.AppUser (Id, UserName, Email)
VALUES 
(1, 'AbdoEssam', 'abdo@example.com'),
(2, 'SaraAli', 'sara@example.com');

-- بيانات تجريبية لجدول DailyCalorie
INSERT INTO dbo.DailyCalorie (Id, UserId, Date, Calories)
VALUES 
(1, 1, '2025-12-23', 2200),
(2, 2, '2025-12-23', 1800);

-- بيانات تجريبية لجدول MealBreakdown
INSERT INTO dbo.MealBreakdown (Id, DailyCalId, MealType, Carbs, Protein, Fat)
VALUES
(1, 1, 'Breakfast', 50, 20, 10),
(2, 1, 'Lunch', 70, 25, 15);

-- بيانات تجريبية لجدول SugarReading
INSERT INTO dbo.SugarReading (Id, UserId, ValueMgDl, ReadingDate)
VALUES
(1, 1, 120, '2025-12-23'),
(2, 2, 110, '2025-12-23');

-- بيانات تجريبية لجدول SugarPrediction
INSERT INTO dbo.SugarPrediction (Id, UserId, PredValue, PredDate)
VALUES
(1, 1, 115, '2025-12-23');

-- بيانات تجريبية لجدول Prediction
INSERT INTO dbo.Prediction (Id, UserId, ReadingId, PredictionResult)
VALUES
(1, 1, 1, 'Normal');

-- بيانات تجريبية لجدول PredictionResult
INSERT INTO dbo.PredictionResult (Id, PredictionId, ResultDetails)
VALUES
(1, 1, 'Everything looks good');

-- بيانات تجريبية لجدول Restaurant
INSERT INTO dbo.Restaurant (Id, Name, Location)
VALUES
(1, 'Healthy Bites Cafe', 'Cairo'),
(2, 'FitFood', 'Alexandria');

-- بيانات تجريبية لجدول UserRestaurant
INSERT INTO dbo.UserRestaurant (Id, UserId, RestaurantId)
VALUES
(1, 1, 1),
(2, 2, 2);

-- بيانات تجريبية لجدول RestaurantReview
INSERT INTO dbo.RestaurantReview (Id, RestaurantId, UserId, Review, Rating)
VALUES
(1, 1, 1, 'Great food!', 5),
(2, 2, 2, 'Good service', 4);

