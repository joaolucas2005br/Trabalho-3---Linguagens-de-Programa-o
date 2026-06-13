module Bots.Bots (
    module Bots.DumbBot,
    module Bots.GodBot,
    module Bots.FairBot,
    chooseBot
) where

import Bots.DumbBot
import Bots.GodBot
import Bots.FairBot
import Utils.Play

chooseBot :: Int -> (PlayType -> IO PlayType)
chooseBot 1 = playGod
chooseBot 2 = playDumb
chooseBot _ = playFair
