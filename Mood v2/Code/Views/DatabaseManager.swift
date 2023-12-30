import Foundation
import SQLite
import Combine

class DatabaseManager: ObservableObject {
    static let shared = DatabaseManager()

    @Published private var db: Connection?
    @Published var moodData: [MoodData] = []

    
    private init() {
        // Open the database and create tables if needed
        if let databaseConnection = openDatabase() {
            db = databaseConnection
            createMoodTrackerTable()
        }
    }

    
    private func openDatabase() -> Connection? {
        do {
            // Get the document directory
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

                // Append the database file name to the document directory path
                let databaseURL = documentDirectory.appendingPathComponent("database.sqlite3")

                // Create a connection to the database
                let db = try Connection(databaseURL.path)

                print("Database opened successfully.")
                
                return db
            } else {
                // Document directory not found
                print("Error: Document directory not found.")
                return nil
            }
        } catch {
            // Handle errors during database connection
            print("Error opening database: \(error.localizedDescription)")
            return nil
        }
    }

    
    private func createMoodTrackerTable() {
        do {
            try db?.run("""
                CREATE TABLE IF NOT EXISTS moodTracker (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    user_id INTEGER NOT NULL,
                    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    mood INTEGER NOT NULL CHECK (mood BETWEEN 1 AND 5)
                )
            """)
            print("Table 'moodTracker' created successfully.")
        } catch {
            print("Error creating table: \(error)")
        }
    }

    
    struct MoodData {
        var id: Int64
        var userId: Int64
        var date: Date
        var mood: Int64
    }
    
    
    func logMood(user_id: Int, mood: Int) {
        do {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let currentDateTime = dateFormatter.string(from: Date())

            let insert = try db?.run("""
                INSERT INTO moodTracker (user_id, date, mood)
                VALUES (?, ?, ?)
            """, user_id, currentDateTime, mood)

            if let insert = insert {
                print("Mood logged successfully. Inserted row ID: \(insert)")
            } else {
                print("Error logging mood.")
            }
        } catch {
            print("Error logging mood: \(error)")
        }
    }
       
    
    func fetchAllMoodData() {
        do {
//            print("Fetching data...")
            
            if let moodDataResult = try db?.prepare("SELECT id, user_id, DATE(date) AS date, mood FROM moodTracker") {
                var updatedMoodData: [MoodData] = []

                for row in moodDataResult {
                    let id = row[0] as! Int64
                    let userId = row[1] as! Int64
                    let dateString = row[2] as! String  // Change the type to String
                    let mood = row[3] as! Int64

                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    if let date = dateFormatter.date(from: dateString) {
                        let moodDataEntry = MoodData(id: id, userId: userId, date: date, mood: mood)
                        updatedMoodData.append(moodDataEntry)
                    }
                }

//                print("Fetched \(updatedMoodData.count) rows from the database.")

                // Update the @Published property
                DispatchQueue.main.async {
                    self.moodData = updatedMoodData
//                    print("Updated mood data. Count: \(self.moodData.count)")
                }
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }

    
    func createTestData() {
        // Delete all data from the MoodTracker table
        deleteAllMoodData()

        let userId: Int = 1

        // Create a calendar to iterate over days
        let calendar = Calendar.current

        // Specify the date range (from 2023-12-31 to 2023-10-01)
        if let startDate = calendar.date(from: DateComponents(year: 2023, month: 12, day: 31)),
           let endDate = calendar.date(from: DateComponents(year: 2023, month: 12, day: 1)) {

            // Iterate over each day in the range
            var currentDate = startDate
            while currentDate >= endDate {
                let mood = Int.random(in: 1...5)

                // Insert mood data into the database
                logMood(user_id: userId, date: currentDate, mood: mood)

                // Move to the previous day
                currentDate = calendar.date(byAdding: .day, value: -1, to: currentDate)!
            }
        }
    }

    
    private func logMood(user_id: Int, date: Date, mood: Int) {
        do {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"

            // Convert Date to String for insertion into the database
            let dateString = dateFormatter.string(from: date)

            _ = try db?.run("""
                INSERT INTO moodTracker (user_id, date, mood)
                VALUES (?, ?, ?)
            """, user_id, dateString, mood)

            // Fetch the updated mood data and publish it
            fetchAllMoodData()
        } catch {
            print("Error logging mood: \(error)")
        }
    }


    func fetchMoodDataForWeek() -> [MoodData] {
        // Adjust the date range based on your week criteria
        let startDate = Date.from(year: 2023, month: 12, day: 25)
        let endDate = Date.from(year: 2023, month: 12, day: 31)

        do {
            // Convert dates to string format with the same format as stored in the database
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"

            let startDateString = dateFormatter.string(from: startDate)
            let endDateString = dateFormatter.string(from: endDate)
            
            let moodData = try db?.prepare("""
                SELECT * FROM moodTracker
                WHERE date BETWEEN ? AND ?
            """, startDateString, endDateString)

//            print("SQL Query: SELECT * FROM moodTracker WHERE date BETWEEN '\(startDateString)' AND '\(endDateString)'")
            
            var moodDataArray: [MoodData] = []

            for row in moodData! {
                let id = row[0] as! Int64
                let userId = row[1] as! Int64
                let dateString = row[2] as! String  // Change the type to String
                let mood = row[3] as! Int64

                // Convert string back to Date
                if let date = dateFormatter.date(from: dateString) {
                    let moodDataEntry = MoodData(id: id, userId: userId, date: date, mood: mood)
                    moodDataArray.append(moodDataEntry)
                }
            }
            
//            print("Fetched \(moodDataArray.count) rows from the database.")
            
            return moodDataArray
        } catch {
            print("Error fetching data: \(error)")
            return []
        }
    }
    
    
    func deleteMoodEntry(_ mood: MoodData) {
            do {
                try db?.run("DELETE FROM moodTracker WHERE id = ?", mood.id)
            } catch {
                print("Error deleting mood entry: \(error)")
            }
        }

    
    func deleteAllMoodData() {
        do {
            try db?.run("DELETE FROM moodTracker")
            print("All mood data deleted successfully.")
        } catch {
            print("Error deleting mood data: \(error)")
        }
    }

    
    func deleteMoodTrackerTable() {
        do {
            try db?.run("DROP TABLE IF EXISTS moodTracker")
            print("Table 'moodTracker' deleted successfully.")
        } catch {
            print("Error deleting table: \(error)")
        }
    }
}


struct moodDay: Identifiable {
    let id = UUID()
    let date: Date
    let moodRating: Int
}


extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}


extension DatabaseManager.MoodData: Equatable {
    static func == (lhs: DatabaseManager.MoodData, rhs: DatabaseManager.MoodData) -> Bool {
        return lhs.id == rhs.id
            && lhs.userId == rhs.userId
            && lhs.date == rhs.date
            && lhs.mood == rhs.mood
    }
}
