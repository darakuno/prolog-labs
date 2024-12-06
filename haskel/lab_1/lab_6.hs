dellast :: (Eq a) => [a] -> [a]
dellast [_] = []
dellast (x:xs) = x : dellast xs

pref1 :: (Eq a) => [a] -> [[a]]
pref1 [] = [[]]
pref1 x = x : pref1 (dellast x)

postf1 :: (Eq a) => [a] -> [[a]]
postf1 [] = [[]]
postf1 x = x : postf1 (tail x)

-- segment :: (Eq a) => [a] -> [[a]]
-- segment [] = [[]]
-- segment x = let
--     postfixes = postf1 x
--     s = dellast x
--     l = segment s
--     all = postfixes ++ l

-- rearr :: (Eq a) => [a] -> [a]

main :: IO ()
main = do
    let set1 = [1, 2, 6, 8, 3, 5]
    let set2 = [3, 4, 5]
    print $ dellast set1
    print $ pref1 set1
    print $ postf1 set1
    -- print $ segment set2
    