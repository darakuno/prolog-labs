union1 :: (Eq a) => [a] -> [a] -> [a]
union1 [] y = y
union1 (x:xs) y
    | x `elem` y = union1 xs y
    | otherwise = x : union1 xs y

intersection1 :: (Eq a) => [a] -> [a] -> [a]
intersection1 [] y = []
intersection1 (x:xs) y
    | x `elem` y = x : intersection1 xs y
    | otherwise = intersection1 xs y

diff1 :: (Eq a) => [a] -> [a] -> [a]
diff1 [] y = []
diff1 (x:xs) y
    | x `elem` y = diff1 xs y
    | otherwise = x : diff1 xs y


main :: IO ()
main = do
    let set1 = [1, 2, 6, 8, 3, 5]
    let set2 = [3, 4, 5, 2]
    print $ diff1 set1 set2
    