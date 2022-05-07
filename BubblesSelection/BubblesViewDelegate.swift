//
//  BubblesViewDelegate.swift
//  Bubbles selection
//
//  Created by Aleksei Bochkov on 18/04/22.
//

//set a value to property delegate of BubbleView to do some actions when selected state is changed
public protocol BubblesViewDelegate {
    func didChangeBubbleSelection(_ bubblesView: BubblesView, bubble: BubbleNode)
}
