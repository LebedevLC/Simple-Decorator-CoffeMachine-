/*
 Еще один классический пример: создание различных вариаций кофе (простой, с молоком, с сахаром, с молоком и сахаром, со сливками, с молоком, сахаром и сливками и т. д.) c помощью декорирования — вместо создания большого количества сабклассов кофе.
 
 Создайте протокол Coffee и класс SimpleCoffee, реализующий протокол Coffee.
 Создайте протокол CoffeeDecorator, который «наследуется» от протокола Coffee.
 Далее создайте реализации декоратора — Milk, Whip, Sugar и другие, которые будут ингредиентами, которые добавляют в кофе.
 В протоколе Coffee объявите переменную cost: Int — это цена кофе.
 Каждый ингредиент должен увеличивать цену кофе на свою стоимость.
 Реализуйте описанную систему объектов с помощью паттерна Decorator аналогично тому, как это было сделано на уроке.
 */

protocol CoffeProtocol {
    var cost: Int { get }
}

class SimpleCoffe: CoffeProtocol {
    var cost = 100
}

protocol CoffeDecorator: CoffeProtocol {
    var base: CoffeProtocol { get }
    init(base: CoffeProtocol)
}

class Milk: CoffeDecorator {
    var base: CoffeProtocol
    var cost: Int {
        return base.cost + 30
    }
    required init(base: CoffeProtocol) {
        self.base = base
    }
}

class Whip: CoffeDecorator {
    var base: CoffeProtocol
    var cost: Int {
        return base.cost + 20
    }
    required init(base: CoffeProtocol) {
        self.base = base
    }
}

class Sugar: CoffeDecorator {
    var base: CoffeProtocol
    var cost: Int {
        return base.cost + 10
    }
    required init(base: CoffeProtocol) {
        self.base = base
    }
}

let coffe = SimpleCoffe()

let coffeSugar = Sugar(base: coffe)
let coffe2Sugar = Sugar(base: coffeSugar)

let coffeMilk = Milk(base: coffe)
let coffeSugarMilk = Sugar(base: coffeMilk)

let royalCoffe = Whip(base: coffeSugarMilk)

print(coffe.cost)
print(coffeSugar.cost)
print(coffe2Sugar.cost)
print(coffeMilk.cost)
print(coffeSugarMilk.cost)
print(royalCoffe.cost)
