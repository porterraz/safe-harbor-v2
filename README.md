
Gemini said
Safe Harbor v2
App Summary
Safe Harbor is a mental health support application designed specifically for college students who need a private, low-barrier way to track their emotional well-being and access support resources. The app addresses the problem of students feeling overwhelmed or isolated by providing a "safe harbor" to log daily moods, track sleep patterns, and identify emotional trends over time. The primary users are students navigating campus life who may benefit from noticing stress patterns before they become critical. Key features include a mood logger, a personalized dashboard with historical data visualizations, and a curated list of crisis and counseling resources. By combining local data persistence for privacy with server-side database storage for critical entries, the product ensures that students have a reliable and immediate support tool at their fingertips.

Tech Stack
Frontend Framework: Next.js 15 (App Router).

Styling & UI: Tailwind CSS, Radix UI primitives, and Lucide React icons.

State Management: React Hooks and Custom Stores (Local Storage persistence).

Backend Framework: Next.js Server Actions.

Database: SQLite via better-sqlite3.

Schema & Seeding: Raw SQL (schema.sql and seed.sql).

Tooling: TypeScript, PostCSS, and PNPM.

Architecture Diagram
Code snippet
graph TD
    User((User)) -->|Interacts with UI| Frontend[Next.js Client Components]
    Frontend -->|Reads/Writes| LocalStorage[(Browser Local Storage)]
    Frontend -->|Server Actions| Backend[Next.js Server Side]
    Backend -->|SQL Queries| DB[(SQLite Database)]
    
    subgraph "Client Side"
    Frontend
    LocalStorage
    end

    subgraph "Server Side"
    Backend
    DB
    end
Prerequisites
To run this project locally, you will need the following:

Node.js (v18 or higher): Installation Instructions

Verify: node -v

PNPM: Installation Instructions

Verify: pnpm -v

SQLite3: (Bundled with better-sqlite3, but useful for CLI verification) Installation Instructions

Verify: sqlite3 --version

Installation and Setup
Clone the Repository:

Bash
git clone <your-repo-url>
cd safe-harbor-v2
Install Dependencies:

Bash
pnpm install
Initialize the Database:
The application uses a local SQLite file located at ./db/database.sqlite. You must initialize the schema and seed data:

Bash
# Create the database directory if it doesn't exist
mkdir -p db

# Initialize schema and seed data
sqlite3 db/database.sqlite < db/schema.sql
sqlite3 db/database.sqlite < db/seed.sql
Running the Application
Start the Development Server:

Bash
pnpm dev
Open the App:
Navigate to http://localhost:3000 in your browser.

Verifying the Vertical Slice
To verify the full integration from the UI to the SQLite database:

Trigger the Feature: Navigate to the "Mood" screen via the bottom navigation bar. Select a mood rating and at least one emotion, then click "Save".

Confirm Database Update: In your terminal, run the following command to check the latest entry in the SQLite database:

Bash
sqlite3 db/database.sqlite "SELECT * FROM Mood_Entry ORDER BY entry_date DESC LIMIT 1;"
You should see the rating and primary emotion you just submitted.

Verify Persistence: Refresh the browser page. The Dashboard should now display your "Today's Mood" fetched directly from the database via a Server Action.
