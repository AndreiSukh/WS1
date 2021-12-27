﻿
&НаКлиенте
Процедура ВыгрузкаВалют(Команда)
	
	Если Не ЗначениеЗаполнено(Дата) Тогда
		Сообщить("Не заполнена дата");
		Возврат;
	КонецЕсли;
	
	ВыгрузкаВалютНаСервере();
КонецПроцедуры

&НаСервере
Процедура ВыгрузкаВалютНаСервере()
	// test
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
		
	КонецЦикла;
	
КонецПроцедуры
