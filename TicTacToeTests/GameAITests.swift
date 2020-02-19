//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Aaron Cleveland on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

@testable import TicTacToe

// TDD = Test Driven Development
/*
 |-----------------|
 | 0,0 | 1,0 | 2,0 |
 |-----------------|
 | 0,1 | 1,1 | 2,1 |
 |-----------------|
 | 0,2 | 1,2 | 2,2 |
 |-----------------|
 */

class GameAITests: XCTestCase {
  
  func testWinCheckingVertical1() {
    var board = GameBoard()
    
    try! board.place(mark: .x, on: (0, 0))
    try! board.place(mark: .o, on: (1, 0))
    try! board.place(mark: .x, on: (0, 1))
    try! board.place(mark: .o, on: (1, 1))
    try! board.place(mark: .x, on: (0, 2))
    
    XCTAssertTrue(game(board: board, isWonBy: .x))
    XCTAssertFalse(game(board: board, isWonBy: .o))
  }
  
  func testWinCheckingVertical2() {
    var board = GameBoard()
    try! board.place(mark: .o, on: (1, 0))
    try! board.place(mark: .x, on: (0, 0))
    try! board.place(mark: .o, on: (1, 1))
    try! board.place(mark: .x, on: (0, 1))
    try! board.place(mark: .o, on: (1, 2))
    
    XCTAssertTrue(game(board: board, isWonBy: .o))
    XCTAssertFalse(game(board: board, isWonBy: .x))
  }
  
  func testWinCheckingVertical3() {
    var board = GameBoard()
    
    try! board.place(mark: .x, on: (1, 0))
    try! board.place(mark: .x, on: (1, 1))
    
    try! board.place(mark: .o, on: (2, 0))
    try! board.place(mark: .o, on: (2, 1))
    try! board.place(mark: .o, on: (2, 2))
    
    XCTAssertTrue(game(board: board, isWonBy: .o))
    XCTAssertFalse(game(board: board, isWonBy: .x))
  }
  
  func testWinCheckingHorizontal1() {
    var board = GameBoard()
    try! board.place(mark: .x, on: (0, 0))
    try! board.place(mark: .x, on: (1, 0))
    try! board.place(mark: .x, on: (2, 0))
    try! board.place(mark: .o, on: (1, 1))
    try! board.place(mark: .o, on: (2, 2))
    
    XCTAssertTrue(game(board: board, isWonBy: .x))
    XCTAssertFalse(game(board: board, isWonBy: .o))
  }
  
  func testWinDiaganol1() {
    var board = GameBoard()
    
    try! board.place(mark: .x, on: (0,0))
    try! board.place(mark: .x, on: (1,1))
    try! board.place(mark: .x, on: (2,2))
    try! board.place(mark: .o, on: (2,0))
    try! board.place(mark: .o, on: (2,1))
    
    XCTAssertTrue(game(board: board, isWonBy: .x))
    XCTAssertFalse(game(board: board, isWonBy: .o))
  }
  
  func testWinDiaganol2() {
    var board = GameBoard()
    try! board.place(mark: .o, on: (2, 0))
    try! board.place(mark: .o, on: (1, 1))
    try! board.place(mark: .o, on: (0, 2))
    try! board.place(mark: .x, on: (0, 0))
    try! board.place(mark: .x, on: (1, 2))
    
    XCTAssertTrue(game(board: board, isWonBy: .o))
    XCTAssertFalse(game(board: board, isWonBy: .x))
  }
  
  func testIncompleteGame() {
    /*
     x - o
     - o -
     - x -
     */
    
    var board = GameBoard()
    try! board.place(mark: .o, on: (2, 0))
    try! board.place(mark: .o, on: (1, 1))
    try! board.place(mark: .x, on: (0, 0))
    try! board.place(mark: .x, on: (1, 2))
    XCTAssertFalse(game(board: board, isWonBy: .o))
    XCTAssertFalse(game(board: board, isWonBy: .x))
  }
  
  func testCatsGame() {
    /*
     x o x
     x o o
     o x x
     */
    var board = GameBoard()
    try! board.place(mark: .x, on: (0, 0))
    try! board.place(mark: .o, on: (1, 0))
    try! board.place(mark: .x, on: (2, 0))
    try! board.place(mark: .x, on: (0, 1))
    try! board.place(mark: .o, on: (1, 1))
    try! board.place(mark: .o, on: (2, 1))
    try! board.place(mark: .o, on: (0, 2))
    try! board.place(mark: .x, on: (1, 2))
    try! board.place(mark: .x, on: (2, 2))
    XCTAssertTrue(board.isFull)
    XCTAssertFalse(game(board: board, isWonBy: .o))
    XCTAssertFalse(game(board: board, isWonBy: .x))
  }
}
