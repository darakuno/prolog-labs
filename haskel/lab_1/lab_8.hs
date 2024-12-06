mergeUnion :: Ord a => [a] -> [a] -> [a]
mergeUnion [] y = y  
mergeUnion x [] = x  
mergeUnion (x:xs) (y:ys)
    | x == y = x : mergeUnion xs ys  
    | x < y = x : mergeUnion xs (y:ys)  
    | otherwise = y : mergeUnion (x:xs) ys  

mergeInter :: Ord a => [a] -> [a] -> [a]
mergeInter [] y = []
mergeInter x [] = []
mergeInter (x:xs) (y:ys)
    | x == y = x : mergeInter xs ys
    | x < y = mergeInter xs (y:ys)
    | otherwise = y : mergeInter (x:xs) ys

mergeDiff :: Ord a => [a] -> [a] -> [a]
mergeDiff [] y = []
mergeDiff x [] = []
mergeDiff (x:xs) (y:ys)
    | x == y = mergeDiff xs ys
    | x < y = x : mergeDiff xs (y:ys)
    | otherwise = mergeDiff (x:xs) ys

mergeSimDiff :: Ord a => [a] -> [a] -> [a]
mergeSimDiff [] y = y  
mergeSimDiff x [] = x   
mergeSimDiff (x:xs) (y:ys) 
    | x == y  = mergeSimDiff xs ys  
    | x < y   = x : mergeSimDiff xs (y:ys)  
    | otherwise = y : mergeSimDiff (x:xs) ys

main :: IO ()
main = do
    let list1 = [1, 2, 3, 4, 5, 6, 9]
    let list2 = [2, 4, 6, 8]
    print (mergeUnion list1 list2)
    print (mergeInter list1 list2)
    print (mergeDiff list1 list2)
    print (mergeSimDiff list1 list2)