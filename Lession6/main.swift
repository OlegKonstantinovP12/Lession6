//
//  main.swift
//  Lession6
//
//  Created by Oleg Konstantinov on 19.09.2025.
//

import Foundation

/*
 4 - События в приложении
 Создай enum AppEvent:

 .login(user: String)
 .logout(user: String)
 .error(message: String)
 .purchase(user: String, amount: Double)

 Используй switch, чтобы:
 Вывести лог для каждого события
 Если .purchase больше 1000 — вывести особое сообщение "Big spender!" (использовать where)

 5 - Уведомления
 Создай enum Notification:

 .message(user: String, text: String)
 .friendRequest(user: String)
 .system(message: String)

 Напиши функцию handle(notification:), которая выводит разные сообщения в зависимости от типа уведомления.

 6 - Результат загрузки файла
 Создай enum DownloadResult:

 .success(filePath: String, size: Int)
 .failure(error: String)

 Используй switch, чтобы:
 При успехе вывести путь и размер
 При ошибке — сообщение об ошибке.
 */

/*
 1 - Направления движения (без rawValue)
 Создай enum Direction с вариантами .north, .south, .east, .west.

 Напиши функцию move(direction:), которая выводит текст в консоль:

 "Go up" для .north
 "Go down" для .south
 "Go right" для .east
 "Go left" для .west

 Вызови её с разными направлениями.
 */
enum Direction {
    case north, south, east, west
}

func move(direction: Direction) {
    switch direction {
    case .north:
        print("Go up")
    case .south:
        print("Go down")
    case .east:
        print("Go right")
    case .west:
        print("Go left")
    }
}
move(direction: .north)
move(direction: .south)
move(direction: .east)
move(direction: .west)

/*
 2 - Игровые уровни
 Создай enum GameLevel: String с вариантами "Easy", "Medium", "Hard".

 Напиши функцию, которая принимает строку, преобразует её в enum и выводит сообщение.

 Если строка не соответствует ни одному уровню, выводи "Unknown level".
 */

enum GameLevel: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
}

func choice(_ level: String) {
    if let choiceLevel = GameLevel(rawValue: level) {
        print("Level selected: \(choiceLevel.rawValue)")
    } else {
        print("Unknown level")
    }
}

choice("Easy")
choice("Medium")
choice("Hard")
choice("Ultra")
/*
 3 - Платёжная система
 Создай enum Payment, где:

 .cash(Double)
 .card(number: String, amount: Double)
 .crypto(wallet: String, amount: Double)

 Напиши функцию process(payment:), которая по-разному обрабатывает оплату (например, разные сообщения в консоль).
 */


