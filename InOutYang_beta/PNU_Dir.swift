import SwiftUI

struct PNU_Dir: View {
    @State private var selectedSchedule = "대학 개강"
    
    let schedules = [
        "대학 개강": [
            ["버스 노선", "밀양역", "부산대"],
            ["1번", "6:45", "6:57"],
            ["-", "7:00", "7:12"],
            ["2번", "7:20", "7:32"],
            ["1번", "8:20", "8:32"],
            ["2번", "8:45", "8:53"],
            ["6번", "8:56", "9:04"],
            ["1번", "9:35", "9:43"],
            ["1번", "9:48", "9:56"],
            ["2번", "10:05", "10:13"],
            ["2번", "10:22", "10:32"],
            ["7번", "11:26", "11:38"],
            ["1번", "11:48", "11:56"],
            ["7번", "12:36", "12:48"],
            ["2번", "12:50", "13:02"],
            ["2번", "13:36", "13:48"],
            ["2번", "14:17", "14:29"],
            ["7번", "14:36", "14:48"],
            ["1번", "15:05", "15:17"],
            ["1번", "15:40", "15:52"],
            ["1번", "16:00", "16:17"],
            ["2번", "16:42", "16:54"],
            ["1번", "17:23", "17:35"],
            ["2번", "17:44", "17:56"],
            ["7번", "17:45", "17:57"],
            ["1번", "18:10", "18:22"],
            ["6번", "18:45", "18:57"],
            ["1번", "19:30", "19:42"],
            ["6번", "19:44", "19:56"],
            ["1번", "20:08", "20:20"],
            ["2번", "20:45", "20:57"],
            ["1번", "21:05", "21:17"],
            ["2번", "21:57", "22:09"],
            ["1번", "22:22", "22:34"],
            ["2번", "23:00", "23:12"]
        ],
        "대학 방학": [
            ["버스 노선", "밀양역", "부산대"],
            ["-", "07:00", "07:12"],
            ["1번", "08:20", "08:32"],
            ["2번", "08:45", "08:53"],
            ["1번", "10:22", "10:32"],
            ["7번", "11:26", "11:38"],
            ["7번", "12:36", "12:48"],
            ["7번", "14:36", "14:48"],
            ["1번", "15:32", "15:44"],
            ["2번", "16:42", "16:54"],
            ["4-1번", "17:23", "17:35"],
            ["7번", "17:45", "17:57"],
            ["1번", "18:06", "18:18"],
            ["1번", "18:45", "18:57"],
            ["6번", "19:44", "19:56"],
            ["2번", "20:24", "20:36"],
            ["1번", "21:20", "21:32"],
            ["1번", "22:18", "22:30"]
        ],
        "모두 방학": [
            ["버스 노선", "밀양역", "부산대"],
            ["1번", "06:45", "06:57"],
            ["-", "07:00", "07:12"],
            ["2번", "07:20", "07:32"],
            ["1번", "08:17", "08:29"],
            ["2번", "08:45", "08:53"],
            ["1번", "09:35", "09:43"],
            ["2번", "10:22", "10:32"],
            ["7번", "11:26", "11:38"],
            ["7번", "12:36", "12:48"],
            ["2번", "13:36", "13:48"],
            ["7번", "14:36", "14:48"],
            ["1번", "15:40", "15:52"],
            ["2번", "16:42", "16:54"],
            ["1번", "17:23", "17:35"],
            ["7번", "17:45", "17:57"],
            ["1번", "18:10", "18:22"],
            ["6번", "18:45", "18:57"],
            ["6번", "19:44", "19:56"],
            ["1번", "22:22", "22:34"]
        ]
    ]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        VStack{
            Text("밀양역 ➜ 부산대")
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
        .navigationTitle("부산대 방면")
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
