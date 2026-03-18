# HealthyBites.Api

تشغيل محلي:
1. غيّر connection string و Jwt:Key في appsettings.json أو استخدم متغيرات بيئة.
2. ثبت الأدوات إن لم تكن مثبتة:
   - dotnet tool install --global dotnet-ef
3. أضف الحزم عبر dotnet restore.
4. أنشئ الميجريشن:
   - dotnet ef migrations add InitialCreate
5. حدّث قاعدة البيانات:
   - dotnet ef database update
6. شغّل المشروع:
   - dotnet run