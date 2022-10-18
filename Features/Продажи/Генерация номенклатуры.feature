#language: ru

@tree

Функционал: Создание пачки номенклатуры

Как Тестировщик я хочу
создать множество элементов номенклатуры 
чтобы провести нагрузочное тестирование

Контекст:
И я подключаю профиль TestClient "TestIRP"

Сценарий: Генерация номенклатуры

* Открытие списка 
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Catalog.Items"

* Создание данных
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Наименование номенклатуры " + $Шаг$' в переменную "ИмяНоменклатуры"
		И Я запоминаю значение выражения '"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")' в переменную "УИД"

		И я проверяю или создаю для справочника "Items" объекты с обмен данными загрузка истина:
		| 'Ref'   | 'DeletionMark' | 'ItemType'                                                          | 'Unit'                                                          | 'Description_en'    | 'Description_hash' | 'Description_ru' | 'Description_tr' |
		| '$УИД$' | 'False'        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | '$ИмяНоменклатуры$' | ''                 | ''               | ''               |

	
		И я проверяю или создаю для справочника "ItemTypes" объекты с обмен данными загрузка истина:
		| 'Ref'                                                               | 'DeletionMark' | 'Parent' | 'IsFolder' | 'Code' | 'Type'                   | 'UseSerialLotNumber' | 'Description_en'            | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'UniqueID'                          |
		| 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'False'        | ''       | 'False'    | 2      | 'Enum.ItemTypes.Product' | 'False'              | 'Товар (без характеристик)' | ''                 | ''               | ''               | '_32c63d8e5ee94926b3c772ab02c5243e' |

	
		И я проверяю или создаю для справочника "Units" объекты с обмен данными загрузка истина:
		| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'False'        | 1      | ''     | 1          | ''          | ''    | 'шт'             | ''                 | ''               | ''               |          |          |          |          |         |

	
	
