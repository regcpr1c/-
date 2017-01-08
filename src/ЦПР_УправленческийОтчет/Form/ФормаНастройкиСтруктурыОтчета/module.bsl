﻿
Процедура СтатьиОтчетаПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	Если НоваяСтрока Тогда
		ЭлементыФормы.СтатьиОтчета.ТекущиеДанные.Идентификатор=Новый УникальныйИдентификатор;
	КонецЕсли;
КонецПроцедуры

Процедура ОбновитьИсточникиДанныхПоСтатье()
	ТекДанные=ЭлементыФормы.СтатьиОтчета.ТекущиеДанные;
	Если ТекДанные=Неопределено Тогда
		ИсточникиДанныхПоСтатье=ИсточникиДанных.СкопироватьКолонки();
		Возврат;
	КонецЕсли;
	
	СтруктураОтбора=Новый Структура;
	СтруктураОтбора.Вставить("ИдентификаторСтатьи",ТекДанные.Идентификатор);
	ИсточникиДанныхПоСтатье=ИсточникиДанных.Скопировать(СтруктураОтбора);
КонецПроцедуры

Процедура СтатьиОтчетаПриАктивизацииСтроки(Элемент)
	 ОбновитьИсточникиДанныхПоСтатье();
	//ЭлементыФормы.ИсточникиДанных.ОтборСтрок.ИдентификаторСтатьи.Установить(ТекДанные.Идентификатор,Истина);
КонецПроцедуры

Процедура ЗаписатьИзменениеИсточникаДанныхВТабличнуюЧасть(ИдентификаторСтатьи,СтруктураИсточникаДанных)
	ИдентификаторИсточника=СтруктураИсточникаДанных.Идентификатор;
	СтрокаИсточника=ИсточникиДанных.Найти(ИдентификаторИсточника,"Идентификатор");
	Если СтрокаИсточника=Неопределено Тогда
		СтрокаИсточника=ИсточникиДанных.Добавить();
		СтрокаИсточника.ИдентификаторСтатьи=ИдентификаторСтатьи;
		//СтрокаИсточника.Показатели=ИнициализироватьПоказателиИсточникаДанных();
		//СтрокаИсточника.Аналитика=ИнициализироватьАналитикуИсточникаДанных();
	КонецЕсли;
	
	ЗаполнитьЗначенияСвойств(СтрокаИсточника,СтруктураИсточникаДанных,,"Показатели,Аналитика,ГраницыОтбора");
	
	СтрокаИсточника.Показатели=СтруктураИсточникаДанных.Показатели.Скопировать();
	СтрокаИсточника.Аналитика=СтруктураИсточникаДанных.Аналитика.Скопировать();
	СтрокаИсточника.ГраницыОтбора=СтруктураИсточникаДанных.ГраницыОтбора.Скопировать();
	
	ОбновитьИсточникиДанныхПоСтатье();
КонецПроцедуры

Процедура ОткрытьИсточникДанныхДляРедактирования(ИдентификаторСтатьи,Идентификатор=Неопределено) 
	СтруктураИсточникаДанных=Неопределено;
	Если Идентификатор<>Неопределено Тогда
		СтрокаИсточника=ИсточникиДанных.Найти(Идентификатор,"Идентификатор");
		Если СтрокаИсточника<>Неопределено Тогда
			СтруктураИсточникаДанных=Новый Структура;
			СтруктураИсточникаДанных.Вставить("ИдентификаторСтатьи",СтрокаИсточника.ИдентификаторСтатьи);
			СтруктураИсточникаДанных.Вставить("Идентификатор",СтрокаИсточника.Идентификатор);
			СтруктураИсточникаДанных.Вставить("Наименование",СтрокаИсточника.Наименование);
			СтруктураИсточникаДанных.Вставить("ИмяРегистра",СтрокаИсточника.ИмяРегистра);
			СтруктураИсточникаДанных.Вставить("НастройкиПостроителя",СтрокаИсточника.НастройкиПостроителя);
			СтруктураИсточникаДанных.Вставить("ТекстЗапроса",СтрокаИсточника.ТекстЗапроса);
			СтруктураИсточникаДанных.Вставить("ВиртуальнаяТаблица",СтрокаИсточника.ВиртуальнаяТаблица);
			СтруктураИсточникаДанных.Вставить("ДетализироватьПоРегистратору",СтрокаИсточника.ДетализироватьПоРегистратору);
			СтруктураИсточникаДанных.Вставить("Коэффициент",СтрокаИсточника.Коэффициент);
			//СтруктураИсточникаДанных.Вставить("ВидИсточникаДанных",СтрокаИсточника.ВидИсточникаДанных);
			//СтруктураИсточникаДанных.Вставить("ПараметрыЗапросаИсточникаДанных",СтрокаИсточника.ПараметрыЗапросаИсточникаДанных);
			СтруктураИсточникаДанных.Вставить("Показатели",СтрокаИсточника.Показатели.Скопировать());
			СтруктураИсточникаДанных.Вставить("Аналитика",СтрокаИсточника.Аналитика.Скопировать());
			СтруктураИсточникаДанных.Вставить("ГраницыОтбора",СтрокаИсточника.ГраницыОтбора.Скопировать());
		КонецЕсли;
	КонецЕСли;
	
	ПараметрыФормы=Новый Структура;
	ПараметрыФормы.Вставить("ДанныеИсточника",СтруктураИсточникаДанных);
	
	
	Форма=ПолучитьФорму("ФормаЭлементаИсточникаДанных",ЭтаФорма);
	Форма.ОписаниеИсточника=СтруктураИсточникаДанных;
	РезультатОткрытия=Форма.ОткрытьМодально();//ОткрытьФормуМодально("ВнешнийОтчет.ЦПР_УправленческийОтчет.Форма.ФормаЭлементаИсточникаДанных",ПараметрыФормы);
	
	Если РезультатОткрытия=Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ЗаписатьИзменениеИсточникаДанныхВТабличнуюЧасть(ИдентификаторСтатьи,РезультатОткрытия);
	
КонецПроцедуры

Процедура ИсточникиДанныхПередНачаломДобавления(Элемент, Отказ, Копирование)
	Отказ=Истина;
	
	ТекДанныеСтатьи=ЭлементыФормы.СтатьиОтчета.ТекущиеДанные;
	Если ТекДанныеСтатьи=Неопределено Тогда
		Возврат;
	КонецЕСли;
	
	ОткрытьИсточникДанныхДляРедактирования(ТекДанныеСтатьи.Идентификатор);
КонецПроцедуры

Процедура ИсточникиДанныхВыбор(Элемент, ВыбраннаяСтрока, Колонка, СтандартнаяОбработка)
	ТекДанныеСтатьи=ЭлементыФормы.СтатьиОтчета.ТекущиеДанные;
	Если ТекДанныеСтатьи=Неопределено Тогда
		Возврат;
	КонецЕСли;
	
	ОткрытьИсточникДанныхДляРедактирования(ТекДанныеСтатьи.Идентификатор,ВыбраннаяСтрока.Идентификатор);
КонецПроцедуры

Процедура СтатьиОтчетаЗнакНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка=Ложь;
	
	СписокВыбора=Новый СписокЗначений;
	СписокВыбора.Добавить(1,"+");
	СписокВыбора.Добавить(-1,"-");
	
	результатВыбора=ВыбратьИзСписка(СписокВыбора,Элемент);
	
	Если результатВыбора=Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ЭлементыФормы.СтатьиОтчета.ТекущиеДанные.Знак=результатВыбора.Значение;
КонецПроцедуры

Процедура ИсточникиДанныхПередУдалением(Элемент, Отказ)
	ТекДанные=ЭлементыФормы.ИсточникиДанных.ТекущиеДанные;
	Если ТекДанные=Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	
	СтруктураПоиска=Новый Структура;
	СтруктураПоиска.Вставить("Идентификатор",ТекДанные.Идентификатор);
	МассивСтрокИсточников=ИсточникиДанных.НайтиСтроки(СтруктураПоиска);
	
	Для Каждого  Стр ИЗ МассивСтрокИсточников Цикл
		ИсточникиДанных.Удалить(Стр);
	КонецЦикла;
КонецПроцедуры

Процедура СтатьиОтчетаПередУдалением(Элемент, Отказ)
	ТекДанные=ЭлементыФормы.СтатьиОтчета.ТекущиеДанные;
	Если ТекДанные=Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	
	СтруктураПоиска=Новый Структура;
	СтруктураПоиска.Вставить("ИдентификаторСтатьи",ТекДанные.Идентификатор);
	МассивСтрокИсточников=ИсточникиДанных.НайтиСтроки(СтруктураПоиска);
	
	Для Каждого  Стр ИЗ МассивСтрокИсточников Цикл
		ИсточникиДанных.Удалить(Стр);
	КонецЦикла;
	ОбновитьИсточникиДанныхПоСтатье();
КонецПроцедуры




