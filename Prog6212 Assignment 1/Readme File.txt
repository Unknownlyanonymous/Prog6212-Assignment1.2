Project Overview
This project implements a relational database schema for managing marathon and race events. It supports event creation, route mapping, category assignment, participant registration, and result tracking. The design ensures data integrity through primary and foreign keys, while sample data demonstrates realistic use cases such as the Comrades Marathon and Soweto Marathon.
 Database Schema
The database consists of the following tables:
* Event: Stores event details (name, date, location).
* Route: Defines race routes linked to events, including distance, map, and elevation.
* Category: Organizes events into categories (e.g., Ultra Marathon, Full Marathon).
* UserProfile: Holds participant and organiser details, including role, age, and contact info.
* Registration: Tracks participant registrations, payment status, and bib numbers.
* Result: Records race outcomes such as finish time, position, and pace.
Features
* Event Management: Create, update, and list events with associated routes and categories.
* User Profiles: Manage organiser and participant information with role-based constraints.
* Registrations: Handle participant sign-ups, payment tracking, and bib assignment.
* Results: Store and retrieve race results for analysis and reporting.
Sample Data
The project includes sample inserts for:
* Events: Comrades Marathon, Soweto Marathon
* Routes: Distances and maps for each event
* Categories: Ultra Marathon and Full Marathon
* User Profiles: Example participants and organisers
* Registrations: Demonstrating paid and pending entries
* Results: Example finish times and positions
 Usage
1. Run the CREATE DATABASE RaceDay; script to initialize the database.
2. Execute the schema creation SQL to build tables.
3. Insert sample data for testing.
4. Query tables to explore event details, participant registrations, and race results.
Reference List
* GeeksforGeeks. (n.d.). SQL CREATE TABLE Statement. Retrieved from https://www.geeksforgeeks.org/sql-create-table/ (geeksforgeeks.org in Bing)
* W3Schools. (n.d.). SQL Tutorial. Retrieved from https://www.w3schools.com/sql/

