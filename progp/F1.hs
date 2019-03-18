module F1 where
import Data.Char
import Data.Eq
import Data.String
import Data.List.Split
{- functionen =  fib
om n är 0 eller 1 retunera n
annars gör recursiv functin  med n-1 plus finctionen n-2
-}
fib :: Int -> Integer
fib n
  | n ==0 = 0
  | n == 1 = 1
  |otherwise = fib (n-1) + fib (n-2)

{- functionen = rovarsprak
om första elemen är vokal plusa element och anropa functionen med resten av sträng
annars adera "o" mellan första element och anropa functionen med resten av sträng
-}
rovarsprak :: String -> String
rovarsprak [] = []
rovarsprak (x:xs)
  | elem x  "aeiouy" = [x] ++ rovarsprak xs
  | otherwise = [x] ++ ['o'] ++ [x] ++ rovarsprak xs
{- functionen = karpsravor
  om första strängen inte är vokal och andra strängen är vokal och tredje strängen är lika med första strängen då  plusa tredje strängen med anropande function som har resten av strängen ( från fjärde sträng uppåt) som argument
  annars plusa första strängen med anropande functionen som
-}
karpsravor :: String -> String
karpsravor []= []
karpsravor [x] = [x]
karpsravor (x:y:[])= [x]++[y]
karpsravor (x:y:z:xs)
  | elem x "bcdfghjklmnpqrstvwxz" && elem y "aeiouy" &&  x == z = [z]++karpsravor xs
  | otherwise = [x]++ karpsravor (y:z:xs)
{-
functionen = medellangd
countAlp är en function som räknar antal bokstäver i strängen med hjälv av isAlpha som vi har importera från Data.Char.isAlpha
filterRest är en variabel som filtar element i strängen som inte är bosktäver
allaOrd är en variable som har lista av stränger från filterRest och varje sträng i listan är ett ord
-}
medellangd :: String -> Double
medellangd []= 0.0
medellangd s =
  let i = countAlp s
      filterRest = (map ( \c -> if not (isLetter c ) then ' ' else c) s)
      allaOrd = words filterRest
      c = i/(fromIntegral(length allaOrd)+0.0)
  in c
countAlp :: String -> Double
countAlp []= 0.0
countAlp(x:xs)
  | isAlpha x= 1.0 + countAlp xs
  | otherwise = countAlp xs
{-
functionen = skyffla
functionen skyffla anropar två functionen medan skyffla_udda adderar
alla udda elemen i listan skyffla_jamn tar resten och anropar skyffla igen .
-}

skyffla_udda :: [a] -> [a]
skyffla_udda [] = []
skyffla_udda [x] = [x]
skyffla_udda (x:_:xs) = x:skyffla_udda xs

skyffla_jamn :: [a] -> [a]
skyffla_jamn [] =[]
skyffla_jamn [x] = []
skyffla_jamn (_:x:xs) = x:skyffla_jamn xs

skyffla :: [a] -> [a]
skyffla [] = []
skyffla [x] = [x]
skyffla xs = xsUdda ++ skyffla xsJamn
    where xsUdda = skyffla_udda xs
          xsJamn = skyffla_jamn xs
