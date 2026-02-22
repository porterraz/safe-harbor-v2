'use server'

import Database from 'better-sqlite3'
import { revalidatePath } from 'next/cache'
import path from 'path'

const dbPath = path.join(process.cwd(), 'db', 'database.sqlite')
const db = new Database(dbPath)

export async function saveMoodEntry(entry: any) {
  try {
    const primaryEmotion = entry.emotions && entry.emotions.length > 0 ? entry.emotions[0] : 'None'
    
    const randomEntryId = Math.floor(Math.random() * 1000000)

    const stmt = db.prepare(`
      INSERT INTO Mood_Entry (entry_id, user_id, mood_rating, primary_emotion, entry_date)
      VALUES (?, ?, ?, ?, ?)
    `)

    stmt.run(
      randomEntryId,
      1001, 
      entry.mood,
      primaryEmotion,
      entry.date
    )

    revalidatePath('/')
    return { success: true }
  } catch (error) {
    console.error('Database error:', error)
    return { success: false }
  }
}

export async function getTodayMoodAction() {
  try {
    const today = new Date().toISOString().split("T")[0]
    const stmt = db.prepare('SELECT * FROM Mood_Entry WHERE entry_date = ? LIMIT 1')
    const row = stmt.get(today) as any
    
    if (row) {
      return {
        id: row.entry_id.toString(),
        date: row.entry_date,
        mood: row.mood_rating,
        sleep: 0,
        emotions: [row.primary_emotion],
      }
    }
    return null
  } catch (error) {
    console.error('Fetch error:', error)
    return null
  }
}