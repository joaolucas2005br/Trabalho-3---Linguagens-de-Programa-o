module Play (
    PlayType(..),
    Play(..),
    beats
) where

data PlayType = Rock | Paper | Scissor | Water | Fire
  deriving (Show, Eq)

data Play = Play
  { playType :: PlayType
  }
  deriving (Show)

beats :: PlayType -> PlayType -> Bool
beats Rock Scissor = True
beats Scissor Paper = True
beats Paper Rock = True

beats Fire Rock = True
beats Fire Scissor = True
beats Fire Paper = True

beats Water Fire = True

beats Rock Water = True
beats Scissor Water = True
beats Paper Water = True

beats _ _ = False