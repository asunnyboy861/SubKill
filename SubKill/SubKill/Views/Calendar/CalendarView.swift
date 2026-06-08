import SwiftUI

struct CalendarView: View {
    let subscriptionVM: SubscriptionViewModel

    @State private var selectedDate = Date()
    @State private var displayedMonth = Date()

    private var calendar: Calendar { Calendar.current }

    private var monthString: String {
        displayedMonth.formatted(.dateTime.year().month(.wide))
    }

    private var daysInMonth: [Date] {
        guard let range = calendar.dateInterval(of: .month, for: displayedMonth) else { return [] }
        var dates: [Date] = []
        var date = range.start
        while date < range.end {
            dates.append(date)
            guard let next = calendar.date(byAdding: .day, value: 1, to: date) else { break }
            date = next
        }
        return dates
    }

    private var firstWeekday: Int {
        guard let firstDay = daysInMonth.first else { return 0 }
        return calendar.component(.weekday, from: firstDay) - 1
    }

    private func chargesFor(date: Date) -> [Subscription] {
        let active = subscriptionVM.fetchActive()
        return active.filter { sub in
            calendar.isDate(sub.nextPaymentDate, inSameDayAs: date)
        }
    }

    private var selectedDayCharges: [Subscription] {
        chargesFor(date: selectedDate)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                monthNavigation

                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 8) {
                    ForEach(["S","M","T","W","T","F","S"], id: \.self) { day in
                        Text(day)
                            .font(.caption2.bold())
                            .foregroundStyle(.secondary)
                    }

                    ForEach(0..<firstWeekday, id: \.self) { _ in
                        Color.clear.frame(height: 44)
                    }

                    ForEach(daysInMonth, id: \.self) { date in
                        let charges = chargesFor(date: date)
                        let isSelected = calendar.isDate(date, inSameDayAs: selectedDate)
                        let isToday = calendar.isDateInToday(date)

                        Button(action: { selectedDate = date }) {
                            VStack(spacing: 2) {
                                Text("\(calendar.component(.day, from: date))")
                                    .font(.caption)
                                    .foregroundStyle(isSelected ? .white : isToday ? .red : .primary)
                                    .bold(isSelected || isToday)

                                if !charges.isEmpty {
                                    HStack(spacing: 2) {
                                        ForEach(charges.prefix(3), id: \.name) { _ in
                                            Circle()
                                                .fill(Color.red)
                                                .frame(width: 4, height: 4)
                                        }
                                    }
                                }
                            }
                            .frame(height: 44)
                            .background(isSelected ? Color.red : Color.clear)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
                .padding(.horizontal)

                if !selectedDayCharges.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                            .font(.headline)
                            .foregroundStyle(.white)

                        ForEach(selectedDayCharges, id: \.name) { sub in
                            HStack {
                                Image(systemName: sub.iconName)
                                    .foregroundStyle(.white)
                                Text(sub.name)
                                    .foregroundStyle(.white)
                                Spacer()
                                Text("$\(String(format: "%.2f", sub.price))")
                                    .font(.caption.bold())
                                    .foregroundStyle(.red)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6).opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                }

                Spacer()
            }
            .background(Color.black)
            .navigationTitle("Calendar")
        }
    }

    private var monthNavigation: some View {
        HStack {
            Button(action: { changeMonth(-1) }) {
                Image(systemName: "chevron.left")
            }
            Spacer()
            Text(monthString)
                .font(.headline)
                .foregroundStyle(.white)
            Spacer()
            Button(action: { changeMonth(1) }) {
                Image(systemName: "chevron.right")
            }
        }
        .padding(.horizontal)
        .foregroundStyle(.red)
    }

    private func changeMonth(_ delta: Int) {
        if let newMonth = calendar.date(byAdding: .month, value: delta, to: displayedMonth) {
            displayedMonth = newMonth
        }
    }
}
