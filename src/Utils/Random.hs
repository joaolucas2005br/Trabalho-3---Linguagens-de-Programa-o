module Utils.Random(
    getRandom
) where

import Data.Time.Clock.POSIX (getPOSIXTime)

getRandom :: Int -> IO Int
getRandom limit = fmap ((`mod` limit) . floor . (* 1000)) getPOSIXTime