# Администрирование ОС Linux

*Выполнено на CentOS8*

## Лабораторная работа №1. Управление файлами и каталогами
Создать скрипт (создать текстовый файл с необходимыми командами (добавив в начало #!/bin/sh), сделать его исполняемым). Создать и редактировать скрипт можно в редакторах nano или vi.
<details>
  <summary>Скрипт:</summary>

1. Создать каталог test в домашнем каталоге пользователя.
2. Создать в нем файл list, содержащий список всех файлов и поддиректориев каталога /etc (включая скрытые) в таком виде, что можно однозначно определить какая из записей является именем файла, а какая — названием директории.
3. Вывести в конец этого файла два числа. Сначала количество поддиректориев в каталоге /etc, а затем количество скрытых файлов в каталоге /etc.
4. Создать в каталоге test каталог links.
5. Создать в каталоге links жесткую ссылку на файл list с именем list_hlink.
6. Создать в каталоге links символическую ссылку на файл list с именем list_slink.
7. Вывести на экран количество имен (жестких ссылок) файла list_hlink, количество имен (жестких ссылок) файла list и количество имен (жестких ссылок) файла list_slink.
8. Дописать в конец файла list_hlink число строк в файле list.
9. Сравнить содержимое файлов list_hlink и list_slink. Вывести на экран YES, если файлы идентичны.
10. Переименовать файл list в list1.
11. Сравнить содержимое файлов list_hlink и list_slink. Вывести на экран YES, если файлы идентичны.
12. Создать в домашнем каталоге пользователя жесткую ссылку на файл list_link с именем list1.
13. Создать в домашнем каталоге файл list_conf, содержащий список файлов с расширением .conf, из каталога /etc и всех его подкаталогов.
14. Создать в домашнем каталоге файл list_d, содержащий список всех подкаталогов каталога /etc, расширение которых .d.
15. Создать файл list_conf_d, включив в него последовательно содержимое list_conf и list_d.
16. Создать в каталоге test скрытый каталог sub.
17. Скопировать в него файл list_conf_d.
18. Еще раз скопировать туда же этот же файл в режиме автоматического создания резервной копии замещаемых файлов.
19. Вывести на экран полный список файлов (включая все подкаталоги и их содержимое) каталога test.
20. Создать в домашнем каталоге файл man.txt, содержащий документацию на команду man.
21. Разбить файл man.txt на несколько файлов, каждый из которых будет иметь размер не более 1 килобайта.
22. Создать каталог man.dir.
23. Переместить одной командой все файлы, полученные в пункте 21 в каталог man.dir.
24. Собрать файлы в каталоге man.dir обратно в файл с именем man.txt.
25. Сравнить файлы man.txt в домашней каталоге и в каталоге man.dir и вывести YES, если файлы идентичны.
26. Добавить в файл man.txt, находящийся в домашнем каталоге несколько строчек с произвольными символами в начало файла и несколько строчек в конце файла.
27. Одной командой получить разницу между файлами в отдельный файл в стандартном формате для наложения патчей.
28. Переместить файл с разницей в каталог man.dir.
29. Наложить патч из файла с разницей на man.txt в каталоге man.dir.
30. Сравнить файлы man.txt в домашней каталоге и в каталоге man.dir и вывести YES, если файлы идентичны.

</details>

## Лабораторная работа №2. Управление разделами дисковой системы, создание и монтирование файловых систем
<details>
  <summary>Скрипт:</summary>

1. Создайте новый раздел, начинающийся с первого свободного сектора и имеющий размер 300 МБайт. 
2. Создайте файл в домашнем каталоге пользователя root и сохраните в него UUID созданного раздела. 
3. Создайте на созданном разделе файловую систему ext4 с размером блока 4096 байт. 
4. Выведите на экран текущее состояние параметров, записанных в суперблоке созданной файловой системы. 
5. Настройте эту файловую систему таким образом, чтобы ее автоматическая проверка запускалась через 2 месяца или каждое второе монтирование файловой системы. 
6. Создайте в каталоге /mnt подкаталог newdisk и подмонтируйте в него созданную файловую систему. 
7. Создайте в домашнем каталоге пользователя root ссылку на смонтированную файловую систему 
8. Создайте каталог с любым именем в смонтированной файловой системе. 
9. Включите автомонтирование при запуске операционной системы созданной файловой системы в /mnt/newdisk таким образом, чтобы было невозможно запускать исполняемые файлы, находящиеся в этой системе, а также с отключением возможности записи времени последнего доступа к файлу для ускорения работы с этой файловой системой. Перезагрузите операционную систему и проверьте доступность файловой системы. Проверьте невозможность запустить исполняемый файл, если он хранится в этой файловой системе. 
10. Увеличьте размер раздела и файловой системы до 350 МБайт. Проверьте, что размер изменился. 
11. Проверьте на наличие ошибок созданную файловую системы "в безопасном режиме", то есть в режиме запрета внесения каких-либо изменений в файловую систему, даже если обнаружены ошибки.
12. Создайте новый раздел, размером в 12 Мбайт. Настройте файловую систему, созданную в пункте 3 таким образом, чтобы ее журнал был расположен на разделе, созданном в этом пункте.
13. Создайте два новых раздела, размером в 100 МБайт каждый.
14. Создайте группу разделов LVM и логический том LVM над созданными в предыдущем пункте разделами. Создайте файловую систему ext4 для созданного логического тома LVM и смонтируйте её в предварительно созданный каталог supernewdisk в каталоге mnt. 15. Создайте папку (каталог) в хостовой операционной системе и предоставьте к ней сетевой доступ, создав сетевой ресурс на хостовой операционной системе. Создайте в директории /mnt поддиректорию share и подмонтируйте в нее созданный сетевой ресурс. 16. Сделайте так, чтобы сетевой ресурс автоматически монтировалcя для чтения при загрузке операционной системы. Перезагрузите операционную систему и проверьте, что автоматическое монтирование ресурса выполнилось.

</details>

## Лабораторная работа № 3. Управление пользователями, группами пользователей и правами на файлы и каталоги в Linux
1) Научиться создавать, изменять и редактировать учетные записи пользователей и групп пользователей в Linux.   
2) Научиться задавать атрибуты прав и владения для файлов и каталогов под конкретные задачи

<details>
  <summary>Скрипт:</summary>

1. выводит в файл work3.log построчно список всех пользователей в системе в следующем формате: «user NNN has id MM»; 
2.  добавляет в файл work3.log строку, содержащую дату последней смены пароля для пользователя root; 
3. добавляет в файл work3.log список всех групп в системе (только названия групп) через запятую; 
4. делает так, чтобы при создании нового пользователя у него в домашнем каталоге создавался файл readme.txt с текстом «Be careful!»; 
5. создает пользователя u1 с паролем 12345678; 
6. создает группу g1;
7. делает так, чтобы пользователь u1 дополнительно входил в группу g1; 
8. добавляет в файл work3.log строку, содержащую сведения об идентификаторе и имени пользователя u1 и идентификаторах и именах всех групп, в которые он входит;
9. делает так, чтобы пользователь user дополнительно входил в группу g1
10. добавляет в файл work3.log строку с перечнем пользователей в группе g1 через запятую;
11. делает так, что при входе пользователя u1 в систему вместо оболочки bash автоматически запускается /usr/bin/mc, при выходе из которого пользователь возвращается к вводу логина и пароля;
12. создает пользователя u2 с паролем 87654321;
13. в каталоге /home создает каталог test13, в который копирует файл work3.log два раза с разными именами (work3-1.log и work3-2.log);
14. сделает так, чтобы пользователи u1 и u2 смогли бы просматривать каталог test13 и читать эти файлы, только пользователь u1 смог бы изменять и удалять их, а все остальные пользователи системы не могли просматривать содержимое каталога test13 и файлов в нем. При этом никто не должен иметь права исполнять эти файлы;
15. создает в каталоге /home каталог test14, в который любой пользователь системы сможет записать данные, но удалить любой файл сможет только пользователь, который его создал или пользователь u1;
16. копирует в каталог test14 исполняемый файл редактора nano и делает так, чтобы любой пользователь смог изменять с его помощью файлы, созданные в пункте 13;
17. создает каталог test15 и создает в нем текстовый файл /test15/secret_file. Делает так, чтобы содержимое этого файла можно было вывести на экран, используя полный путь, но чтобы узнать имя этого файла, было бы невозможно.  

Отдельно создать второй скрипт, который полностью уничтожает результаты деятельности предыдущего:
удаляет созданных пользователей и их домашние каталоги, удаляет созданные группы, удаляет все
созданные в предыдущем скрипте файлы и каталоги.

</details>