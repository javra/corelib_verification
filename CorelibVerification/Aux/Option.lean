import Mathlib.Data.Option.Basic

namespace Option

def toSum (x : Option α) : α ⊕ Unit := x.elim (.inr ()) .inl

@[simp]
theorem toSum_some (x : α) : (some x).toSum = .inl x := rfl

@[simp]
theorem toSum_none : (none : Option α).toSum = .inr () := rfl

@[simp]
theorem filter_decide_true_some {p : α → Prop} [DecidablePred p] {a : α} (h : p a) :
    Option.filter (fun x => decide (p x)) (.some a) = .some a := by
  simp_all [Option.filter]

@[simp]
theorem filter_decide_false_some {p : α → Prop} [DecidablePred p] {a : α} (h : ¬ p a) :
    Option.filter (fun x => decide (p x)) (.some a) = .none := by
  simp_all [Option.filter]

@[simp]
theorem filter_none {p : α → Bool} : Option.filter p .none = .none := by
  simp [Option.filter]

@[simp]
theorem isSome_filter_some (x : α) : Option.isSome (Option.filter p (.some x)) = p x := by
  by_cases p x <;> simp_all [Option.filter]