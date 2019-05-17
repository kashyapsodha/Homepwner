//
//  Copyright © 2015 Big Nerd Ranch
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        let noMore = Item(name: "No More Items", valueInDollars: 0, serialNumber: nil)
        allItems.remove(at: allItems.count - 1)
        allItems.append(newItem)
        allItems.append(noMore)
        return newItem
    }
    func removeItem(_ item: Item){
        if let index = allItems.index(of: item){
            allItems.remove(at: index)
        }
    }
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove item from array
        allItems.remove(at: fromIndex)
        
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    init() {
        let noMore = Item(name: "No More Items", valueInDollars: 0, serialNumber: nil)
        allItems.append(noMore)
    }
}
