
&НаКлиенте
Процедура ВыгрузкаВалют(Команда)
	// git
	Если Не ЗначениеЗаполнено(Дата) Тогда
		Сообщить("Не заполнена дата");
		Возврат;
	КонецЕсли;
	
	ВыгрузкаВалютНаСервере();
КонецПроцедуры

&НаСервере
Процедура ВыгрузкаВалютНаСервере()
	// test
	// test2
	a = 10;
	b = a + 20;
	Прокси = WSСсылки.Сбербанк.СоздатьWSПрокси("http://web.cbr.ru/","DailyInfo", "DailyInfoSoap");
	Параметр = Прокси.ФабрикаXDTO.Пакеты.Получить("http://web.cbr.ru/").Получить("GetCursOnDate");
	ОсобыйПараметр = Прокси.ФабрикаXDTO.Создать(Параметр);
	ОсобыйПараметр.On_date = Дата;
	Результат = Прокси.GetCursOnDate(ОсобыйПараметр);
	
	КурсыВалют.Очистить();
	Для Каждого Элемент Из Результат.GetCursOnDateResult.diffgram.ValuteData.ValuteCursOnDate Цикл
		
		Стр = КурсыВалют.Добавить();
		Стр.Имя = Элемент.Vname;
		Стр.Номинал = Элемент.Vnom;
		Стр.Курс = Элемент.Vcurs;
		Стр.Тест = Неопределено;
	КонецЦикла;
	
КонецПроцедуры
