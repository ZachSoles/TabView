//
//  TabsView.swift
//
//  Created by Zachery Soles on 12/22/22.
//

import SwiftUI

struct tab: View {
    @Binding var selectedTabIndex: Int
    @State var tabText: String
    @State var index: Int
    @State var activeColor: Color
    @State var inactiveColor: Color
    @State var activeTabColor: Color
    @State var inactiveTabColor: Color
    var body : some View {
        Button {
            self.selectedTabIndex = index
            print("Selected tab index: \(selectedTabIndex)")
        } label: {
            Text(tabText)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .accentColor(selectedTabIndex == index ? activeColor : inactiveColor)
        .background(
            selectedTabIndex == index ?
                activeTabColor
                .frame(height: 4) // underline's height
                .offset(y: 24) :
                inactiveTabColor
                .frame(height: 4) // underline's height
                .offset(y: 24)
        )
    }
}

public struct TabView: View {
    @Binding var tabs: [String]
    @Binding var selectedTabIndex: Int
    @State var activeColor: Color? = Color.accentColor
    @State var inactiveColor: Color? = Color.gray
    @State var activeTabColor: Color? = Color.accentColor
    @State var inactiveTabColor: Color? = Color.white
//    @State private var draggedTab: String?
    
    public init(tabs: Binding<[String]>, selectedTabIndex: Binding<Int>, activeColor: Color? = Color.accentColor, inactiveColor: Color? = Color.accentColor, activeTabColor: Color? = Color.accentColor, inactiveTabColor: Color? = Color.accentColor) {
        self._tabs = tabs
        self._selectedTabIndex = selectedTabIndex
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
        self.activeTabColor = activeTabColor
        self.inactiveTabColor = inactiveTabColor
    }

    public var body: some View {
        HStack{
            ForEach(tabs, id: \.self) { tabName in
                let index = tabs.firstIndex(of: tabName)
                tab (
                    selectedTabIndex: $selectedTabIndex,
                    tabText: tabName,
                    index: index ?? 0,
                    activeColor: activeColor!,
                    inactiveColor: inactiveColor!,
                    activeTabColor: activeTabColor!,
                    inactiveTabColor: inactiveTabColor!
                )
//                .onDrag {
//                    draggedTab = tabName
//                    return NSItemProvider()
//                }
//                .onDrop(of: [.text], delegate: DropViewDelegate(destinationItem: tabName, tabs: $tabs, draggedItem: $draggedTab))
            }
            .frame(maxWidth: .infinity)
        }
    }
}
//
//struct DropViewDelegate: DropDelegate {
//    let destinationItem: String
//    @Binding var tabs: [String]
//    @Binding var draggedItem: String?
//
//    func dropUpdated(info: DropInfo) -> DropProposal? {
//        return DropProposal(operation: .move)
//    }
//
//    func performDrop(info: DropInfo) -> Bool {
//        draggedItem = nil
//        return true
//    }
//
//    func dropEntered(info: DropInfo) {
//        if let draggedItem {
//            let fromIndex = tabs.firstIndex(of: draggedItem)
//            if let fromIndex {
//                let toIndex = tabs.firstIndex(of: destinationItem)
//                if let toIndex, fromIndex != toIndex {
//                    withAnimation {
//                        tabs.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? toIndex + 1 : toIndex))
//                    }
//                }
//            }
//        }
//    }
//}

struct TabsView_Previews: PreviewProvider {
    @State static var indexExample = 0
    @State static var tabsExample = ["tab1", "tab2"]

    static var previews: some View {
        VStack {
            TabView(
                tabs: $tabsExample,
                selectedTabIndex: $indexExample
            )
            Spacer()
            ZStack {
                if indexExample == 0 {
                    Text("View 1")
                } else {
                    Text("View 2")
                }
            }
            Button { tabsExample.append("fuck") } label: {
                Text("+")
            }
            Spacer()
        }
    }
}

