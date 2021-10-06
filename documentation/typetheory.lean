-- https://leanprover.github.io/theorem_proving_in_lean4/dependent_type_theory.html
-- type theory: every expression has an associated type


/- SIMPLY TYPE THEORY -/

-- declaring objects and checking their types:
-- `def`: can be used to define variables and functions (instead of python x = 1)
-- `#check`: used to check types
-- `#eval`: used to evaluate the expression
-- auxiliary commands that query system for info typically begin with #

def m : Nat := 1       -- m is a natural number
def n : Nat := 0
def b1 : Bool := true  -- b1 is a Boolean
def b2 : Bool := false

#check m            -- output: Nat
#check n
#check n + 0        -- Nat
#check m * (n + 0)  -- Nat
#check b1           -- Bool
#check b1 && b2     -- "&&" is the Boolean and
#check b1 || b2     -- Boolean or
#check true         -- Boolean "true"

#eval 5 * 4         -- 20
#eval m + 2         -- 3
#eval b1 && b2      -- false


-- can also build new types out of others
  -- ie. if a and b are types, a -> b denotes the type of functions from a to b
  -- a × b denotes Cartesian Product: type of pairs consisting of (a,b)
-- greek letters often used to denote types

#check Nat → Nat      -- type the arrow as "\to" or "\r"
#check Nat -> Nat     -- alternative ASCII notation

#check Nat × Nat      -- type the product as "\times"
#check Prod Nat Nat   -- alternative notation

#check Nat → Nat → Nat
#check Nat → (Nat → Nat)  --  same type as above

#check Nat × Nat → Nat
#check (Nat → Nat) → Nat -- a "functional"

#check Nat.succ     -- Nat → Nat
#check (0, 1)       -- Nat × Nat
#check (-5, 4.2, 6) -- Int × Float × Nat
#check Nat.add      -- Nat → Nat → Nat

#check Nat.succ 2   -- Nat
#check Nat.add 3    -- Nat → Nat
#check Nat.add 5 2  -- Nat
#check (5, 9).1     -- Nat
#check (5, 9).2     -- Nat

#eval Nat.succ 2   -- 3
#eval Nat.add 5 2  -- 7
#eval (5, 9).1     -- 5
#eval (5, 9).2     -- 9


/- TYPES AS OBJECTS -/

-- types themselves are objects
#check Nat               -- Type
#check Bool              -- Type
#check Nat → Bool        -- Type
#check Nat × Bool        -- Type
#check Nat → Nat         -- ...
#check Nat × Nat → Nat
#check Nat → Nat → Nat
#check Nat → (Nat → Nat)
#check Nat → Nat → Bool
#check (Nat → Nat) → Nat

-- can also declare new constants for types
def α : Type := Nat
def β : Type := Bool
def F : Type → Type := List
def G : Type → Type → Type := Prod

#check α        -- Type
#check F α      -- Type
#check F Nat    -- Type
#check G α      -- Type → Type
#check G α β    -- Type
#check G α Nat  -- Type

#check Prod α β       -- Type
#check α × β          -- Type
#check Prod Nat Nat   -- Type
#check Nat × Nat      -- Type

-- `List α` denotes type of lists of elements of type α
#check List α    -- Type
#check List Nat  -- Type


-- meta moment: HIERARCHY of types:
-- lean's underlying foundation has infinite hierarchy of types
#check Type     -- technically shortcut for Type 0; Type 1
#check Type 1   -- Type 2
#check Type 2   -- Type 3
#check Type 3   -- Type 4
#check Type 4   -- Type 5
/-
think of Type 0 as universe of "small"/"ordinary" types
then Type 1 ia larger universes of types, that contain Type 0 as element
Type 2 even larger unvierse of types, containing Type 1
so on...
-/