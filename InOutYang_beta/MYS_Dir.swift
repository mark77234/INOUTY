import SwiftUI

struct MYS_Dir: View {
    @State private var selectedSchedule = "대학 개강"
    
    let schedules = [
        "대학 개강": [
            ["버스 노선", "부산대", "밀양역"],
            ["7번", "07:02", "07:18"],
            ["2번", "07:20", "07:32"],
            ["2번", "07:37", "07:56"],
            ["2번", "08:40", "08:52"],
            ["1번", "08:53", "09:12"],
            ["7번", "09:04", "09:20"],
            ["아리랑", "09:20", "09:26"],
            ["1번", "09:43", "10:00"],
            ["2번", "09:56", "10:12"],
            ["4-1번", "10:13", "10:30"],
            ["2번", "10:38", "10:52"],
            ["아리랑", "11:10", "11:16"],
            ["7-1번", "11:56", "12:16"],
            ["1-2번", "12:18", "12:34"],
            ["2번", "13:02", "13:16"],
            ["1번", "13:28", "13:44"],
            ["1번", "13:48", "14:00"],
            ["7번", "14:29", "14:40"],
            ["아리랑", "14:30", "14:36"],
            ["4-1번", "15:17", "15:30"],
            ["2번", "15:28", "15:44"],
            ["1번", "15:52", "16:00"],
            ["4-1번", "16:17", "16:25"],
            ["2번", "17:02", "17:16"],
            ["2번", "17:40", "17:56"],
            ["7번", "17:56", "18:08"],
            ["7-1번", "18:22", "18:32"],
            ["아리랑", "18:25", "18:31"],
            ["2번", "18:40", "19:00"],
            ["7-1번", "19:02", "19:24"],
            ["1번", "19:42", "19:50"],
            ["2번", "20:04", "20:18"],
            ["7번", "20:20", "20:30"],
            ["7번", "20:57", "21:07"],
            ["4-1번", "21:17", "21:28"],
            ["2번", "22:09", "22:24"],
            ["2번", "22:42", "23:00"],
            ["2번", "23:12", "23:20"]
        ],
        "대학 방학": [
            ["버스 노선", "부산대", "밀양역"],
            ["2번", "07:20", "07:35"],
            ["1번", "08:40", "09:05"],
            ["1번", "08:57", "09:10"],
            ["2번", "10:38", "10:55"],
            ["1번", "12:18", "12:40"],
            ["2번", "13:28", "13:45"],
            ["2번", "15:28", "15:45"],
            ["1번", "15:47", "16:00"],
            ["2번", "17:02", "17:15"],
            ["2번", "17:42", "18:00"],
            ["1-2번", "18:20", "18:30"],
            ["2번", "18:42", "18:55"],
            ["7-1번", "19:08", "19:24"],
            ["1번", "20:04", "20:18"],
            ["1번", "20:40", "20:48"],
            ["1번", "21:34", "21:44"],
            ["1번", "22:38", "22:50"]
        ],
        "모두 방학": [
            ["버스 노선", "부산대", "밀양역"],
            ["7번", "07:02", "07:18"],
            ["2번", "07:20", "07:32"],
            ["2번", "07:37", "07:56"],
            ["2번", "08:39", "08:52"],
            ["1번", "08:57", "09:12"],
            ["1번", "09:46", "10:00"],
            ["2번", "10:38", "10:52"],
            ["1-2번", "12:18", "12:34"],
            ["1번", "13:28", "13:44"],
            ["1번", "13:50", "14:00"],
            ["1번", "15:28", "15:44"],
            ["1번", "15:52", "16:00"],
            ["2번", "17:02", "17:16"],
            ["2번", "17:42", "17:56"],
            ["2번", "18:42", "19:00"],
            ["7-1번", "18:22", "18:32"],
            ["7-1번", "19:08", "19:24"],
            ["2번", "20:04", "20:18"],
            ["2번", "22:44", "23:00"]
        ]
    ]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        VStack{
            Text("부산대 ➜ 밀양역")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Picker("시간표 선택",selection: $selectedSchedule){
                ForEach(schedules.keys.sorted(), id: \.self){ schedule in
                    Text(schedule)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if let schedule = schedules[selectedSchedule] {
                List {
                    HStack {
                        ForEach(schedule.first ?? [], id: \.self) { header in
                            Text(header)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    .padding(.vertical, 5)
                    .background(Color.gray.opacity(0.2))
                    
                    ForEach(schedule.dropFirst(), id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { cell in
                                Text(cell)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        .padding(.vertical, 5)
                        .background(
                            schedule.firstIndex(of: row)! % 2 == 0 ?
                            Color.blue.opacity(0.1) :
                                Color.clear
                        )
                    }
                }
                .listStyle(PlainListStyle())
            } else {
                Text("선택한 시간표가 없습니다.")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("밀양역 방면")
    }
    @ViewBuilder
    func createRow(row: [String], rowIndex: Int) -> some View {
        ForEach(row.indices, id: \.self) { columnIndex in
            let uniqueID = "\(rowIndex)-\(columnIndex)"
            Text(row[columnIndex])
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(8)
                .frame(width: 100, height: 50)
                .id(uniqueID)
        }
    }
}

struct MYS_Dir_Previews: PreviewProvider {
    static var previews: some View {
        MYS_Dir()
            .previewDevice("iPhone 16 Pro")
            .environment(\.colorScheme, .light)
    }
}
