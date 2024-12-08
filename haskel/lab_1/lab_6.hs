dellast :: (Eq a) => [a] -> [a]
dellast [_] = []
dellast (x:xs) = x : dellast xs

pref1 :: (Eq a) => [a] -> [[a]]
pref1 [] = [[]]
pref1 x = x : pref1 (dellast x)

postf1 :: (Eq a) => [a] -> [[a]]
postf1 [] = [[]]
postf1 x = x : postf1 (tail x)

--- 3
-- Собирает все постфиксы для данного префикса
collectSegments :: (Eq a) => [a] -> [[a]]
collectSegments p = postf1 p  -- Получаем все постфиксы для текущего префикса

-- Генерирует все сегменты: префиксы и соответствующие постфиксы
generateSegments :: (Eq a) => [[a]] -> [[a]]
generateSegments [] = []
generateSegments (p:ps) = collectSegments p ++ generateSegments ps

-- Удаление дубликатов
listToSet :: Eq a => [a] -> [a]
listToSet [] = []  -- Базовый случай: пустой список
listToSet (x:xs)
    | x `elem` xs = listToSet xs  -- Если x уже есть в хвосте, пропускаем его
    | otherwise = x : listToSet xs  -- Иначе добавляем x в результат
    
-- Основная функция, которая генерирует сегменты
segment :: (Eq a) => [a] -> [[a]]
segment xs = listToSet (generateSegments (pref1 xs))

--- 4
-- Генерация всех перестановок списка
rearr :: Eq a => [a] -> [[a]]
rearr [] = [[]]  -- Базовый случай: перестановка пустого списка
rearr (x:xs) = concatMap (insert x) (rearr xs)  -- Рекурсивно генерируем перестановки

-- Вставка элемента в каждую позицию списка
insert :: a -> [a] -> [[a]]
insert x [] = [[x]]  -- Если список пуст, возвращаем список с одним элементом
insert x (h:t) = (x:(h:t)) : map (h:) (insert x t)  -- Вставляем x в начало и рекурсивно вставляем в остальные позиции


main :: IO ()
main = do
    let set1 = [1, 2, 6, 8, 3, 5]
    let set2 = [1, 2, 3]
    print $ dellast set1
    print $ pref1 set1
    print $ postf1 set1
    print $ segment set2
    mapM_ print $ rearr set2
    