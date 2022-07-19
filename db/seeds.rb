
Specialist.find_or_create_by(name: "Петрович")
Specialist.find_or_create_by(name: "Степаныч")
Specialist.find_or_create_by(name: "Анджелина Джоли")
Specialist.find_or_create_by(name: "Генри Форд")

CATEGORIES = ["Кузовной ремонт",
              "Шиномонтаж",
              "Плановое ТО",
              "Диагностика",
              "Двигатель",
              "Трансмиссия",
              "Ходовая",
              "Мультимедия",
              "Сварочные работы"]

0.upto(CATEGORIES.size) do |i|
  Category.find_or_create_by(name: CATEGORIES[i])
end

Service.find_or_create_by(name: "Покраска крыла", category_id: 1)
Service.find_or_create_by(name: "Подкачка шин", category_id: 2)
Service.find_or_create_by(name: "Замена масла двигателя", category_id: 3)
Service.find_or_create_by(name: "Компьютерная диагностика", category_id: 4)

Order.find_or_create_by(client_name: "Иван", phone: "89031654789", car: "bmw", service_id: 1, specialist_id: 1 )

OrderList.create(service_id: 1, specialist_id: 1, order_id: 1)
OrderList.create(service_id: 2, specialist_id: 2, order_id: 1)
OrderList.create(service_id: 3, specialist_id: 3, order_id: 1)
OrderList.create(service_id: 4, specialist_id: 1, order_id: 1)
