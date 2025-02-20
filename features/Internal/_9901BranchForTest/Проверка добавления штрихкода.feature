﻿#language: ru

@tree

Функционал: Проверка добавления штрихкода

Как Тестировщик я хочу
проверить добавление штрихкода к справочнику Items 

Контекст:
	
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка добавления штрихкода
	
	* Загрузка номенклатуры
		Тогда Подготовка тестовых данных
	* Переход к элементу справочника
		Дано Я открываю навигационную ссылку "e1cib/data/Catalog.Items?ref=b299cc15319d5da411eda70297fce3e7"
		И В текущем окне я нажимаю кнопку командного интерфейса 'Barcodes'
	* Проверка наличия штрихкодв
		Если таблица "List" содержит строки Тогда:
			| 'Barcode'       | 'Source of origin' |
			| '1234353463456' | ''                 |
			И в таблице "List" я удаляю строку
			Когда открылось окно '1С:Предприятие'
			И я нажимаю на кнопку с именем 'Button0'
	* Добавление штрихкода
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Item barcode (создание)'
		И в поле с именем 'Barcode' я ввожу текст '1234353463456'
	И я закрываю все окна клиентского приложения
	

				

