/*import Foundation
import EventKit

class ReminderManager {
    private let eventStore = EKEventStore()
    
    func requestAccess(completion: @escaping (Bool) -> Void) {
        eventStore.requestAccess(to: .reminder) { granted, error in
            DispatchQueue.main.async {
                completion(granted && (error == nil))
            }
        }
    }
    
    func addReminder(title: String, notes: String?, date: Date, completion: @escaping (Bool, Error?) -> Void) {
        let reminder = EKReminder(eventStore: eventStore)
        reminder.title = title
        reminder.notes = notes
        reminder.calendar = eventStore.defaultCalendarForNewReminders()
        
        let alarm = EKAlarm(absoluteDate: date)
        reminder.addAlarm(alarm)
        
        do {
            try eventStore.save(reminder, commit: true)
            completion(true, nil)
        } catch {
            completion(false, error)
        }
    }
    
    func fetchReminders(completion: @escaping ([EKReminder]) -> Void) {
        let predicate = eventStore.predicateForReminders(in: nil)
        eventStore.fetchReminders(matching: predicate) { reminders in
            completion(reminders ?? [])
        }
    }
}
 
#*/
