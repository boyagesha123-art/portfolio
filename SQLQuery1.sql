-- افترض أن الجداول موجودة. سنحذف القيود القديمة (إن وُجدت) ثم نعيد إنشائها بالخيارات المعدلة.

-- حذف قيود قديمة (أسماء القيود كما في السكريبت السابق)
IF OBJECT_ID('FK_Prediction_User','F') IS NOT NULL ALTER TABLE dbo.Prediction DROP CONSTRAINT FK_Prediction_User;
IF OBJECT_ID('FK_Prediction_Reading','F') IS NOT NULL ALTER TABLE dbo.Prediction DROP CONSTRAINT FK_Prediction_Reading;
IF OBJECT_ID('FK_PredictionResult_Prediction','F') IS NOT NULL ALTER TABLE dbo.PredictionResult DROP CONSTRAINT FK_PredictionResult_Prediction;
IF OBJECT_ID('FK_SugarReading_User','F') IS NOT NULL ALTER TABLE dbo.SugarReading DROP CONSTRAINT FK_SugarReading_User;
IF OBJECT_ID('FK_SugarPrediction_User','F') IS NOT NULL ALTER TABLE dbo.SugarPrediction DROP CONSTRAINT FK_SugarPrediction_User;
IF OBJECT_ID('FK_DailyCalorie_User','F') IS NOT NULL ALTER TABLE dbo.DailyCalorie DROP CONSTRAINT FK_DailyCalorie_User;
IF OBJECT_ID('FK_MealBreakdown_DailyCalorie','F') IS NOT NULL ALTER TABLE dbo.MealBreakdown DROP CONSTRAINT FK_MealBreakdown_DailyCalorie;
IF OBJECT_ID('FK_UserRestaurant_User','F') IS NOT NULL ALTER TABLE dbo.UserRestaurant DROP CONSTRAINT FK_UserRestaurant_User;
IF OBJECT_ID('FK_UserRestaurant_Restaurant','F') IS NOT NULL ALTER TABLE dbo.UserRestaurant DROP CONSTRAINT FK_UserRestaurant_Restaurant;
IF OBJECT_ID('FK_RestaurantReview_Restaurant','F') IS NOT NULL ALTER TABLE dbo.RestaurantReview DROP CONSTRAINT FK_RestaurantReview_Restaurant;
IF OBJECT_ID('FK_RestaurantReview_User','F') IS NOT NULL ALTER TABLE dbo.RestaurantReview DROP CONSTRAINT FK_RestaurantReview_User;

-- إعادة إنشاء القيود مع تعديل سلوك الحذف
ALTER TABLE dbo.Prediction
    ADD CONSTRAINT FK_Prediction_User FOREIGN KEY (UserId) REFERENCES dbo.AppUser(Id) ON DELETE SET NULL;

ALTER TABLE dbo.Prediction
    ADD CONSTRAINT FK_Prediction_Reading FOREIGN KEY (ReadingId) REFERENCES dbo.SugarReading(Id) ON DELETE SET NULL;

ALTER TABLE dbo.PredictionResult
    ADD CONSTRAINT FK_PredictionResult_Prediction FOREIGN KEY (PredictionId) REFERENCES dbo.Prediction(Id) ON DELETE CASCADE;

ALTER TABLE dbo.SugarReading
    ADD CONSTRAINT FK_SugarReading_User FOREIGN KEY (UserId) REFERENCES dbo.AppUser(Id) ON DELETE NO ACTION;

ALTER TABLE dbo.SugarPrediction
    ADD CONSTRAINT FK_SugarPrediction_User FOREIGN KEY (UserId) REFERENCES dbo.AppUser(Id) ON DELETE NO ACTION;

ALTER TABLE dbo.DailyCalorie
    ADD CONSTRAINT FK_DailyCalorie_User FOREIGN KEY (UserId) REFERENCES dbo.AppUser(Id) ON DELETE NO ACTION;

ALTER TABLE dbo.MealBreakdown
    ADD CONSTRAINT FK_MealBreakdown_DailyCalorie FOREIGN KEY (DailyCalId) REFERENCES dbo.DailyCalorie(Id) ON DELETE CASCADE;

ALTER TABLE dbo.UserRestaurant
    ADD CONSTRAINT FK_UserRestaurant_User FOREIGN KEY (UserId) REFERENCES dbo.AppUser(Id) ON DELETE NO ACTION;

ALTER TABLE dbo.UserRestaurant
    ADD CONSTRAINT FK_UserRestaurant_Restaurant FOREIGN KEY (RestaurantId) REFERENCES dbo.Restaurant(Id) ON DELETE NO ACTION;

ALTER TABLE dbo.RestaurantReview
    ADD CONSTRAINT FK_RestaurantReview_Restaurant FOREIGN KEY (RestaurantId) REFERENCES dbo.Restaurant(Id) ON DELETE CASCADE;

ALTER TABLE dbo.RestaurantReview
    ADD CONSTRAINT FK_RestaurantReview_User FOREIGN KEY (UserId) REFERENCES dbo.AppUser(Id) ON DELETE SET NULL;