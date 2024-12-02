union1 :: (Eq a) => [a] -> [a] -> [a]
union1 [] y = y
union1 (x:xs) ys
    | x `elem` ys = union1 xs ys
    | otherwise = x : union1 xs ys

intersection1 :: (Eq a) => [a] -> [a] -> [a]
intersection1 [] _ = []
intersection1 (x:xs) ys
    | x `elem` ys = x : intersection1 xs ys
    | otherwise   = intersection1 xs ys

main :: IO ()
main = do
    let set1 = [1, 2, 3, 5]
    let set2 = [3, 4, 5, 2]
    print $ intersection1 set1 set2