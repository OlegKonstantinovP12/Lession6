//
//  main.swift
//  Lession6
//
//  Created by Oleg Konstantinov on 19.09.2025.
//

import Foundation

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

enum Payment {
    case cash(Double)
    case card(number: String, amount: Double)
    case crypto(wallet: String, amount: Double)
}

func process(payment: Payment) {
    switch payment {
    case .cash(let cash):
        print("Оплата наличными: \(cash)₽")
    case .card(let number, let amount):
        let charOfNumbers = number.enumerated().map { (index, char) -> Character in
            if char == " " {
                return char
            }
            if index >= number.count - 4 {
                return char
            }
            return "*"
        }

        print("Оплата по карте: \(String(charOfNumbers)). Остаток на счету: \(amount)₽")
    case .crypto(let wallet, let amount):
        print("Произведена оплата крипто-кошельком: \(wallet). Остаток на счету: \(amount)₽")
    }
    
}

process(payment: .cash(1234))
process(payment: .card(number: "1234 5678 9012 3456", amount: 1000))
process(payment: .crypto(wallet: "QWv3409vnqjk14", amount: 5000.134))


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
 */

enum AppEvent {
    case login(user: String)
    case logout(user: String)
    case error(message: String)
    case purchase(user: String, amount: Double)
}

func showEvent(_ event: AppEvent) {
    switch event {
    case .login(let user):
        print("Welcome back, \(user)!")
    case .logout(let user):
        print("I hope to see you again soon \(user)")
    case .error(let message):
        print("Something went wrong... Error: \(message)")
    case .purchase(_, let amount) where amount > 1000:
        print("Big spender!")
    case .purchase(let user, let amount):
        print("Thanks you, \(user)! Your purchase, \(amount)₽ was accepted")
    }
}

showEvent(.login(user: "Michael"))
showEvent(.logout(user: "Michael"))
showEvent(.error(message: "Not connection"))
showEvent(.purchase(user: "Michael", amount: 500))
showEvent(.purchase(user: "Michael", amount: 1001))

/*
 5 - Уведомления
 Создай enum Notification:

 .message(user: String, text: String)
 .friendRequest(user: String)
 .system(message: String)

 Напиши функцию handle(notification:), которая выводит разные сообщения в зависимости от типа уведомления.
 */

enum Notification {
    case message(user: String, text: String)
    case friendRequest(user: String)
    case system(message: String)
}

func handle(notification: Notification) {
    switch notification {
    case .message(let user, let text):
        print("""
              You have a new message from: \(user).
              \(text)
              """)
    case .friendRequest(let user):
        print("You have a new friend request from \(user)")
    case .system(let message):
        print(message)
    }
}

handle(notification: .message(user: "Michael", text: "Hello, World!"))
handle(notification: .friendRequest(user: "Dwight"))
handle(notification: .system(message: "New version! It's time to upgrade"))

/*
 6 - Результат загрузки файла
 Создай enum DownloadResult:

 .success(filePath: String, size: Int)
 .failure(error: String)

 Используй switch, чтобы:
 При успехе вывести путь и размер
 При ошибке — сообщение об ошибке.
 */

enum DownloadResult {
    case success(filePath: String, size: Int)
    case failure(error: MessageError)
    
}
enum MessageError: String {
    case folder = "Cannot find filePath"
    case connection = "The connection with the server was lost."
    case file = "Cannot find file."
    case spaceDisk = "Your disk does not have enough free space."
}

func handle(file: DownloadResult) {
    switch file {
    case .success(let filePath, let size):
        print("""
            Файл успешно загружен.
            Путь: \(filePath).
            Размер: \(size)
            """)
    case .failure(let error):
        print("Ошибка загрузки. \(error.rawValue)")
    }
}

handle(file: .success(filePath: "/Users/oleg/Downloads/img.png", size: 4096))
handle(file: .failure(error: .spaceDisk))
