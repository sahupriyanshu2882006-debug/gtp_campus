# Smart Campus Project

## 📌 Overview
Smart Campus is a web-based application designed to manage student applications, complaints, faculty records, and organization details.  
This repository contains the backend code and the MySQL database dump (`smart_campus.sql`).

---

## 🚀 Phase Roadmap

### Phase 1: Current Working Setup
- Use the provided `smart_campus.sql` dump file to set up the database.
- Test backend APIs with Postman/browser.
- Ensure team members can run the project locally.

### Phase 2: Security & Data Improvements (after project is stable)
- Implement **password hashing** (bcrypt/argon2).
- Fix typo in unique key: `organizaton_email` → `organization_email`.
- Add **phone number validation** in backend.
- Enhance timestamps with `ON UPDATE CURRENT_TIMESTAMP`.

### Phase 3: Optimization & Scaling (future)
- Add indexes for frequently queried fields (`student_id`, `application_type`).
- Create audit trail tables for activity logs.
- Test scalability for multiple organizations.

---

## 🛠️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/sahupriyanshu2882006-debug/gtp_campus.git
cd gtp_campus
2. Import Database
Open MySQL Workbench / phpMyAdmin / CLI.

Run:

bash
mysql -u root -p smart_campus < smart_campus.sql
3. Backend Setup
Install dependencies (Flask, SQLAlchemy, etc.).

Configure config.py with your DB credentials.

Run server:

bash
python app.py
4. Testing
Use Postman to test API endpoints.

Verify data from students, applications, and complaints tables.

👥 Team Roles
Priyanshu → Database & GitHub management

Tanmay → Backend API development

Gayatri → API testing & documentation

Prem → Frontend integration

✅ Status
Current dump file (smart_campus.sql) is uploaded and synced.

Project is ready for team collaboration.
