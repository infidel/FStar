
open Prims

type sort =
| Bool_sort
| Int_sort
| String_sort
| Ref_sort
| Term_sort
| Fuel_sort
| Array of (sort * sort)
| Arrow of (sort * sort)
| Sort of Prims.string


let is_Bool_sort = (fun _discr_ -> (match (_discr_) with
| Bool_sort (_) -> begin
true
end
| _ -> begin
false
end))


let is_Int_sort = (fun _discr_ -> (match (_discr_) with
| Int_sort (_) -> begin
true
end
| _ -> begin
false
end))


let is_String_sort = (fun _discr_ -> (match (_discr_) with
| String_sort (_) -> begin
true
end
| _ -> begin
false
end))


let is_Ref_sort = (fun _discr_ -> (match (_discr_) with
| Ref_sort (_) -> begin
true
end
| _ -> begin
false
end))


let is_Term_sort = (fun _discr_ -> (match (_discr_) with
| Term_sort (_) -> begin
true
end
| _ -> begin
false
end))


let is_Fuel_sort = (fun _discr_ -> (match (_discr_) with
| Fuel_sort (_) -> begin
true
end
| _ -> begin
false
end))


let is_Array = (fun _discr_ -> (match (_discr_) with
| Array (_) -> begin
true
end
| _ -> begin
false
end))


let is_Arrow = (fun _discr_ -> (match (_discr_) with
| Arrow (_) -> begin
true
end
| _ -> begin
false
end))


let is_Sort = (fun _discr_ -> (match (_discr_) with
| Sort (_) -> begin
true
end
| _ -> begin
false
end))


let ___Array____0 = (fun projectee -> (match (projectee) with
| Array (_79_10) -> begin
_79_10
end))


let ___Arrow____0 = (fun projectee -> (match (projectee) with
| Arrow (_79_13) -> begin
_79_13
end))


let ___Sort____0 = (fun projectee -> (match (projectee) with
| Sort (_79_16) -> begin
_79_16
end))


let rec strSort : sort  ->  Prims.string = (fun x -> (match (x) with
| Bool_sort -> begin
"Bool"
end
| Int_sort -> begin
"Int"
end
| Term_sort -> begin
"Term"
end
| String_sort -> begin
"String"
end
| Ref_sort -> begin
"Ref"
end
| Fuel_sort -> begin
"Fuel"
end
| Array (s1, s2) -> begin
(let _168_52 = (strSort s1)
in (let _168_51 = (strSort s2)
in (FStar_Util.format2 "(Array %s %s)" _168_52 _168_51)))
end
| Arrow (s1, s2) -> begin
(let _168_54 = (strSort s1)
in (let _168_53 = (strSort s2)
in (FStar_Util.format2 "(%s -> %s)" _168_54 _168_53)))
end
| Sort (s) -> begin
s
end))


type op =
| True
| False
| Not
| And
| Or
| Imp
| Iff
| Eq
| LT
| LTE
| GT
| GTE
| Add
| Sub
| Div
| Mul
| Minus
| Mod
| ITE
| Var of Prims.string


let is_True = (fun _discr_ -> (match (_discr_) with
| True (_) -> begin
true
end
| _ -> begin
false
end))


let is_False = (fun _discr_ -> (match (_discr_) with
| False (_) -> begin
true
end
| _ -> begin
false
end))


let is_Not = (fun _discr_ -> (match (_discr_) with
| Not (_) -> begin
true
end
| _ -> begin
false
end))


let is_And = (fun _discr_ -> (match (_discr_) with
| And (_) -> begin
true
end
| _ -> begin
false
end))


let is_Or = (fun _discr_ -> (match (_discr_) with
| Or (_) -> begin
true
end
| _ -> begin
false
end))


let is_Imp = (fun _discr_ -> (match (_discr_) with
| Imp (_) -> begin
true
end
| _ -> begin
false
end))


let is_Iff = (fun _discr_ -> (match (_discr_) with
| Iff (_) -> begin
true
end
| _ -> begin
false
end))


let is_Eq = (fun _discr_ -> (match (_discr_) with
| Eq (_) -> begin
true
end
| _ -> begin
false
end))


let is_LT = (fun _discr_ -> (match (_discr_) with
| LT (_) -> begin
true
end
| _ -> begin
false
end))


let is_LTE = (fun _discr_ -> (match (_discr_) with
| LTE (_) -> begin
true
end
| _ -> begin
false
end))


let is_GT = (fun _discr_ -> (match (_discr_) with
| GT (_) -> begin
true
end
| _ -> begin
false
end))


let is_GTE = (fun _discr_ -> (match (_discr_) with
| GTE (_) -> begin
true
end
| _ -> begin
false
end))


let is_Add = (fun _discr_ -> (match (_discr_) with
| Add (_) -> begin
true
end
| _ -> begin
false
end))


let is_Sub = (fun _discr_ -> (match (_discr_) with
| Sub (_) -> begin
true
end
| _ -> begin
false
end))


let is_Div = (fun _discr_ -> (match (_discr_) with
| Div (_) -> begin
true
end
| _ -> begin
false
end))


let is_Mul = (fun _discr_ -> (match (_discr_) with
| Mul (_) -> begin
true
end
| _ -> begin
false
end))


let is_Minus = (fun _discr_ -> (match (_discr_) with
| Minus (_) -> begin
true
end
| _ -> begin
false
end))


let is_Mod = (fun _discr_ -> (match (_discr_) with
| Mod (_) -> begin
true
end
| _ -> begin
false
end))


let is_ITE = (fun _discr_ -> (match (_discr_) with
| ITE (_) -> begin
true
end
| _ -> begin
false
end))


let is_Var = (fun _discr_ -> (match (_discr_) with
| Var (_) -> begin
true
end
| _ -> begin
false
end))


let ___Var____0 = (fun projectee -> (match (projectee) with
| Var (_79_36) -> begin
_79_36
end))


type qop =
| Forall
| Exists


let is_Forall = (fun _discr_ -> (match (_discr_) with
| Forall (_) -> begin
true
end
| _ -> begin
false
end))


let is_Exists = (fun _discr_ -> (match (_discr_) with
| Exists (_) -> begin
true
end
| _ -> begin
false
end))


type term' =
| Integer of Prims.string
| BoundV of Prims.int
| FreeV of fv
| App of (op * term Prims.list)
| Quant of (qop * pat Prims.list Prims.list * Prims.int Prims.option * sort Prims.list * term)
| Labeled of (term * Prims.string * FStar_Range.range) 
 and term =
{tm : term'; hash : Prims.string; freevars : fvs FStar_Syntax_Syntax.memo} 
 and pat =
term 
 and fv =
(Prims.string * sort) 
 and fvs =
fv Prims.list


let is_Integer = (fun _discr_ -> (match (_discr_) with
| Integer (_) -> begin
true
end
| _ -> begin
false
end))


let is_BoundV = (fun _discr_ -> (match (_discr_) with
| BoundV (_) -> begin
true
end
| _ -> begin
false
end))


let is_FreeV = (fun _discr_ -> (match (_discr_) with
| FreeV (_) -> begin
true
end
| _ -> begin
false
end))


let is_App = (fun _discr_ -> (match (_discr_) with
| App (_) -> begin
true
end
| _ -> begin
false
end))


let is_Quant = (fun _discr_ -> (match (_discr_) with
| Quant (_) -> begin
true
end
| _ -> begin
false
end))


let is_Labeled = (fun _discr_ -> (match (_discr_) with
| Labeled (_) -> begin
true
end
| _ -> begin
false
end))


let is_Mkterm : term  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkterm"))))


let ___Integer____0 = (fun projectee -> (match (projectee) with
| Integer (_79_42) -> begin
_79_42
end))


let ___BoundV____0 = (fun projectee -> (match (projectee) with
| BoundV (_79_45) -> begin
_79_45
end))


let ___FreeV____0 = (fun projectee -> (match (projectee) with
| FreeV (_79_48) -> begin
_79_48
end))


let ___App____0 = (fun projectee -> (match (projectee) with
| App (_79_51) -> begin
_79_51
end))


let ___Quant____0 = (fun projectee -> (match (projectee) with
| Quant (_79_54) -> begin
_79_54
end))


let ___Labeled____0 = (fun projectee -> (match (projectee) with
| Labeled (_79_57) -> begin
_79_57
end))


type caption =
Prims.string Prims.option


type binders =
(Prims.string * sort) Prims.list


type projector =
(Prims.string * sort)


type constructor_t =
(Prims.string * projector Prims.list * sort * Prims.int * Prims.bool)


type constructors =
constructor_t Prims.list


type decl =
| DefPrelude
| DeclFun of (Prims.string * sort Prims.list * sort * caption)
| DefineFun of (Prims.string * sort Prims.list * sort * term * caption)
| Assume of (term * caption * Prims.string Prims.option)
| Caption of Prims.string
| Eval of term
| Echo of Prims.string
| Push
| Pop
| CheckSat
| SetOption of (Prims.string * Prims.string)


let is_DefPrelude = (fun _discr_ -> (match (_discr_) with
| DefPrelude (_) -> begin
true
end
| _ -> begin
false
end))


let is_DeclFun = (fun _discr_ -> (match (_discr_) with
| DeclFun (_) -> begin
true
end
| _ -> begin
false
end))


let is_DefineFun = (fun _discr_ -> (match (_discr_) with
| DefineFun (_) -> begin
true
end
| _ -> begin
false
end))


let is_Assume = (fun _discr_ -> (match (_discr_) with
| Assume (_) -> begin
true
end
| _ -> begin
false
end))


let is_Caption = (fun _discr_ -> (match (_discr_) with
| Caption (_) -> begin
true
end
| _ -> begin
false
end))


let is_Eval = (fun _discr_ -> (match (_discr_) with
| Eval (_) -> begin
true
end
| _ -> begin
false
end))


let is_Echo = (fun _discr_ -> (match (_discr_) with
| Echo (_) -> begin
true
end
| _ -> begin
false
end))


let is_Push = (fun _discr_ -> (match (_discr_) with
| Push (_) -> begin
true
end
| _ -> begin
false
end))


let is_Pop = (fun _discr_ -> (match (_discr_) with
| Pop (_) -> begin
true
end
| _ -> begin
false
end))


let is_CheckSat = (fun _discr_ -> (match (_discr_) with
| CheckSat (_) -> begin
true
end
| _ -> begin
false
end))


let is_SetOption = (fun _discr_ -> (match (_discr_) with
| SetOption (_) -> begin
true
end
| _ -> begin
false
end))


let ___DeclFun____0 = (fun projectee -> (match (projectee) with
| DeclFun (_79_61) -> begin
_79_61
end))


let ___DefineFun____0 = (fun projectee -> (match (projectee) with
| DefineFun (_79_64) -> begin
_79_64
end))


let ___Assume____0 = (fun projectee -> (match (projectee) with
| Assume (_79_67) -> begin
_79_67
end))


let ___Caption____0 = (fun projectee -> (match (projectee) with
| Caption (_79_70) -> begin
_79_70
end))


let ___Eval____0 = (fun projectee -> (match (projectee) with
| Eval (_79_73) -> begin
_79_73
end))


let ___Echo____0 = (fun projectee -> (match (projectee) with
| Echo (_79_76) -> begin
_79_76
end))


let ___SetOption____0 = (fun projectee -> (match (projectee) with
| SetOption (_79_79) -> begin
_79_79
end))


type decls_t =
decl Prims.list


type error_label =
(fv * Prims.string * FStar_Range.range)


type error_labels =
error_label Prims.list


let fv_eq : fv  ->  fv  ->  Prims.bool = (fun x y -> ((Prims.fst x) = (Prims.fst y)))


let fv_sort = (fun x -> (Prims.snd x))


let freevar_eq : term  ->  term  ->  Prims.bool = (fun x y -> (match ((x.tm, y.tm)) with
| (FreeV (x), FreeV (y)) -> begin
(fv_eq x y)
end
| _79_91 -> begin
false
end))


let freevar_sort : term  ->  sort = (fun _79_1 -> (match (_79_1) with
| {tm = FreeV (x); hash = _79_96; freevars = _79_94} -> begin
(fv_sort x)
end
| _79_101 -> begin
(FStar_All.failwith "impossible")
end))


let fv_of_term : term  ->  fv = (fun _79_2 -> (match (_79_2) with
| {tm = FreeV (fv); hash = _79_106; freevars = _79_104} -> begin
fv
end
| _79_111 -> begin
(FStar_All.failwith "impossible")
end))


let rec freevars : term  ->  fv Prims.list = (fun t -> (match (t.tm) with
| (Integer (_)) | (BoundV (_)) -> begin
[]
end
| FreeV (fv) -> begin
(fv)::[]
end
| App (_79_122, tms) -> begin
(FStar_List.collect freevars tms)
end
| (Quant (_, _, _, _, t)) | (Labeled (t, _, _)) -> begin
(freevars t)
end))


let free_variables : term  ->  fvs = (fun t -> (match ((FStar_ST.read t.freevars)) with
| Some (b) -> begin
b
end
| None -> begin
(

let fvs = (let _168_303 = (freevars t)
in (FStar_Util.remove_dups fv_eq _168_303))
in (

let _79_148 = (FStar_ST.op_Colon_Equals t.freevars (Some (fvs)))
in fvs))
end))


let qop_to_string : qop  ->  Prims.string = (fun _79_3 -> (match (_79_3) with
| Forall -> begin
"forall"
end
| Exists -> begin
"exists"
end))


let op_to_string : op  ->  Prims.string = (fun _79_4 -> (match (_79_4) with
| True -> begin
"true"
end
| False -> begin
"false"
end
| Not -> begin
"not"
end
| And -> begin
"and"
end
| Or -> begin
"or"
end
| Imp -> begin
"implies"
end
| Iff -> begin
"iff"
end
| Eq -> begin
"="
end
| LT -> begin
"<"
end
| LTE -> begin
"<="
end
| GT -> begin
">"
end
| GTE -> begin
">="
end
| Add -> begin
"+"
end
| Sub -> begin
"-"
end
| Div -> begin
"div"
end
| Mul -> begin
"*"
end
| Minus -> begin
"-"
end
| Mod -> begin
"mod"
end
| ITE -> begin
"ite"
end
| Var (s) -> begin
s
end))


let weightToSmt : Prims.int Prims.option  ->  Prims.string = (fun _79_5 -> (match (_79_5) with
| None -> begin
""
end
| Some (i) -> begin
(let _168_310 = (FStar_Util.string_of_int i)
in (FStar_Util.format1 ":weight %s\n" _168_310))
end))


let hash_of_term' : term'  ->  Prims.string = (fun t -> (match (t) with
| Integer (i) -> begin
i
end
| BoundV (i) -> begin
(let _168_313 = (FStar_Util.string_of_int i)
in (Prims.strcat "@" _168_313))
end
| FreeV (x) -> begin
(let _168_314 = (strSort (Prims.snd x))
in (Prims.strcat (Prims.strcat (Prims.fst x) ":") _168_314))
end
| App (op, tms) -> begin
(let _168_318 = (let _168_317 = (let _168_316 = (FStar_List.map (fun t -> t.hash) tms)
in (FStar_All.pipe_right _168_316 (FStar_String.concat " ")))
in (Prims.strcat (Prims.strcat "(" (op_to_string op)) _168_317))
in (Prims.strcat _168_318 ")"))
end
| Labeled (t, r1, r2) -> begin
(let _168_319 = (FStar_Range.string_of_range r2)
in (Prims.strcat (Prims.strcat t.hash r1) _168_319))
end
| Quant (qop, pats, wopt, sorts, body) -> begin
(let _168_327 = (let _168_320 = (FStar_List.map strSort sorts)
in (FStar_All.pipe_right _168_320 (FStar_String.concat " ")))
in (let _168_326 = (weightToSmt wopt)
in (let _168_325 = (let _168_324 = (FStar_All.pipe_right pats (FStar_List.map (fun pats -> (let _168_323 = (FStar_List.map (fun p -> p.hash) pats)
in (FStar_All.pipe_right _168_323 (FStar_String.concat " "))))))
in (FStar_All.pipe_right _168_324 (FStar_String.concat "; ")))
in (FStar_Util.format5 "(%s (%s)(! %s %s %s))" (qop_to_string qop) _168_327 body.hash _168_326 _168_325))))
end))


let __all_terms : term FStar_Util.smap FStar_ST.ref = (let _168_328 = (FStar_Util.smap_create 10000)
in (FStar_ST.alloc _168_328))


let all_terms : Prims.unit  ->  term FStar_Util.smap = (fun _79_205 -> (match (()) with
| () -> begin
(FStar_ST.read __all_terms)
end))


let mk : term'  ->  term = (fun t -> (

let key = (hash_of_term' t)
in (match ((let _168_333 = (all_terms ())
in (FStar_Util.smap_try_find _168_333 key))) with
| Some (tm) -> begin
tm
end
| None -> begin
(

let tm = (let _168_334 = (FStar_Util.mk_ref None)
in {tm = t; hash = key; freevars = _168_334})
in (

let _79_212 = (let _168_335 = (all_terms ())
in (FStar_Util.smap_add _168_335 key tm))
in tm))
end)))


let mkTrue : term = (mk (App ((True, []))))


let mkFalse : term = (mk (App ((False, []))))


let mkInteger : Prims.string  ->  term = (fun i -> (mk (Integer (i))))


let mkInteger' : Prims.int  ->  term = (fun i -> (let _168_340 = (FStar_Util.string_of_int i)
in (mkInteger _168_340)))


let mkBoundV : Prims.int  ->  term = (fun i -> (mk (BoundV (i))))


let mkFreeV : (Prims.string * sort)  ->  term = (fun x -> (mk (FreeV (x))))


let mkApp' : (op * term Prims.list)  ->  term = (fun f -> (mk (App (f))))


let mkApp : (Prims.string * term Prims.list)  ->  term = (fun _79_221 -> (match (_79_221) with
| (s, args) -> begin
(mk (App ((Var (s), args))))
end))


let mkNot : term  ->  term = (fun t -> (match (t.tm) with
| App (True, _79_225) -> begin
mkFalse
end
| App (False, _79_230) -> begin
mkTrue
end
| _79_234 -> begin
(mkApp' (Not, (t)::[]))
end))


let mkAnd : (term * term)  ->  term = (fun _79_237 -> (match (_79_237) with
| (t1, t2) -> begin
(match ((t1.tm, t2.tm)) with
| (App (True, _79_240), _79_244) -> begin
t2
end
| (_79_247, App (True, _79_250)) -> begin
t1
end
| ((App (False, _), _)) | ((_, App (False, _))) -> begin
mkFalse
end
| (App (And, ts1), App (And, ts2)) -> begin
(mkApp' (And, (FStar_List.append ts1 ts2)))
end
| (_79_280, App (And, ts2)) -> begin
(mkApp' (And, (t1)::ts2))
end
| (App (And, ts1), _79_291) -> begin
(mkApp' (And, (FStar_List.append ts1 ((t2)::[]))))
end
| _79_294 -> begin
(mkApp' (And, (t1)::(t2)::[]))
end)
end))


let mkOr : (term * term)  ->  term = (fun _79_297 -> (match (_79_297) with
| (t1, t2) -> begin
(match ((t1.tm, t2.tm)) with
| ((App (True, _), _)) | ((_, App (True, _))) -> begin
mkTrue
end
| (App (False, _79_316), _79_320) -> begin
t2
end
| (_79_323, App (False, _79_326)) -> begin
t1
end
| (App (Or, ts1), App (Or, ts2)) -> begin
(mkApp' (Or, (FStar_List.append ts1 ts2)))
end
| (_79_340, App (Or, ts2)) -> begin
(mkApp' (Or, (t1)::ts2))
end
| (App (Or, ts1), _79_351) -> begin
(mkApp' (Or, (FStar_List.append ts1 ((t2)::[]))))
end
| _79_354 -> begin
(mkApp' (Or, (t1)::(t2)::[]))
end)
end))


let mkImp : (term * term)  ->  term = (fun _79_357 -> (match (_79_357) with
| (t1, t2) -> begin
(match ((t1.tm, t2.tm)) with
| (_79_359, App (True, _79_362)) -> begin
mkTrue
end
| (App (True, _79_368), _79_372) -> begin
t2
end
| (_79_375, App (Imp, t1'::t2'::[])) -> begin
(let _168_359 = (let _168_358 = (let _168_357 = (mkAnd (t1, t1'))
in (_168_357)::(t2')::[])
in (Imp, _168_358))
in (mkApp' _168_359))
end
| _79_384 -> begin
(mkApp' (Imp, (t1)::(t2)::[]))
end)
end))


let mk_bin_op : op  ->  (term * term)  ->  term = (fun op _79_388 -> (match (_79_388) with
| (t1, t2) -> begin
(mkApp' (op, (t1)::(t2)::[]))
end))


let mkMinus : term  ->  term = (fun t -> (mkApp' (Minus, (t)::[])))


let mkIff : (term * term)  ->  term = (mk_bin_op Iff)


let mkEq : (term * term)  ->  term = (mk_bin_op Eq)


let mkLT : (term * term)  ->  term = (mk_bin_op LT)


let mkLTE : (term * term)  ->  term = (mk_bin_op LTE)


let mkGT : (term * term)  ->  term = (mk_bin_op GT)


let mkGTE : (term * term)  ->  term = (mk_bin_op GTE)


let mkAdd : (term * term)  ->  term = (mk_bin_op Add)


let mkSub : (term * term)  ->  term = (mk_bin_op Sub)


let mkDiv : (term * term)  ->  term = (mk_bin_op Div)


let mkMul : (term * term)  ->  term = (mk_bin_op Mul)


let mkMod : (term * term)  ->  term = (mk_bin_op Mod)


let mkITE : (term * term * term)  ->  term = (fun _79_393 -> (match (_79_393) with
| (t1, t2, t3) -> begin
(match ((t2.tm, t3.tm)) with
| (App (True, _79_396), App (True, _79_401)) -> begin
mkTrue
end
| (App (True, _79_407), _79_411) -> begin
(let _168_380 = (let _168_379 = (mkNot t1)
in (_168_379, t3))
in (mkImp _168_380))
end
| (_79_414, App (True, _79_417)) -> begin
(mkImp (t1, t2))
end
| (_79_422, _79_424) -> begin
(mkApp' (ITE, (t1)::(t2)::(t3)::[]))
end)
end))


let mkCases : term Prims.list  ->  term = (fun t -> (match (t) with
| [] -> begin
(FStar_All.failwith "Impos")
end
| hd::tl -> begin
(FStar_List.fold_left (fun out t -> (mkAnd (out, t))) hd tl)
end))


let mkQuant : (qop * pat Prims.list Prims.list * Prims.int Prims.option * sort Prims.list * term)  ->  term = (fun _79_438 -> (match (_79_438) with
| (qop, pats, wopt, vars, body) -> begin
if ((FStar_List.length vars) = 0) then begin
body
end else begin
(match (body.tm) with
| App (True, _79_441) -> begin
body
end
| _79_445 -> begin
(mk (Quant ((qop, pats, wopt, vars, body))))
end)
end
end))


let abstr : fv Prims.list  ->  term  ->  term = (fun fvs t -> (

let nvars = (FStar_List.length fvs)
in (

let index_of = (fun fv -> (match ((FStar_Util.try_find_index (fv_eq fv) fvs)) with
| None -> begin
None
end
| Some (i) -> begin
Some ((nvars - (i + 1)))
end))
in (

let rec aux = (fun ix t -> (match ((FStar_ST.read t.freevars)) with
| Some ([]) -> begin
t
end
| _79_460 -> begin
(match (t.tm) with
| (Integer (_)) | (BoundV (_)) -> begin
t
end
| FreeV (x) -> begin
(match ((index_of x)) with
| None -> begin
t
end
| Some (i) -> begin
(mkBoundV (i + ix))
end)
end
| App (op, tms) -> begin
(let _168_398 = (let _168_397 = (FStar_List.map (aux ix) tms)
in (op, _168_397))
in (mkApp' _168_398))
end
| Labeled (t, r1, r2) -> begin
(let _168_401 = (let _168_400 = (let _168_399 = (aux ix t)
in (_168_399, r1, r2))
in Labeled (_168_400))
in (mk _168_401))
end
| Quant (qop, pats, wopt, vars, body) -> begin
(

let n = (FStar_List.length vars)
in (let _168_404 = (let _168_403 = (FStar_All.pipe_right pats (FStar_List.map (FStar_List.map (aux (ix + n)))))
in (let _168_402 = (aux (ix + n) body)
in (qop, _168_403, wopt, vars, _168_402)))
in (mkQuant _168_404)))
end)
end))
in (aux 0 t)))))


let inst : term Prims.list  ->  term  ->  term = (fun tms t -> (

let n = (FStar_List.length tms)
in (

let rec aux = (fun shift t -> (match (t.tm) with
| (Integer (_)) | (FreeV (_)) -> begin
t
end
| BoundV (i) -> begin
if ((0 <= (i - shift)) && ((i - shift) < n)) then begin
(FStar_List.nth tms (i - shift))
end else begin
t
end
end
| App (op, tms) -> begin
(let _168_414 = (let _168_413 = (FStar_List.map (aux shift) tms)
in (op, _168_413))
in (mkApp' _168_414))
end
| Labeled (t, r1, r2) -> begin
(let _168_417 = (let _168_416 = (let _168_415 = (aux shift t)
in (_168_415, r1, r2))
in Labeled (_168_416))
in (mk _168_417))
end
| Quant (qop, pats, wopt, vars, body) -> begin
(

let m = (FStar_List.length vars)
in (

let shift = (shift + m)
in (let _168_420 = (let _168_419 = (FStar_All.pipe_right pats (FStar_List.map (FStar_List.map (aux shift))))
in (let _168_418 = (aux shift body)
in (qop, _168_419, wopt, vars, _168_418)))
in (mkQuant _168_420))))
end))
in (aux 0 t))))


let mkQuant' : (qop * term Prims.list Prims.list * Prims.int Prims.option * fv Prims.list * term)  ->  term = (fun _79_526 -> (match (_79_526) with
| (qop, pats, wopt, vars, body) -> begin
(let _168_426 = (let _168_425 = (FStar_All.pipe_right pats (FStar_List.map (FStar_List.map (abstr vars))))
in (let _168_424 = (FStar_List.map fv_sort vars)
in (let _168_423 = (abstr vars body)
in (qop, _168_425, wopt, _168_424, _168_423))))
in (mkQuant _168_426))
end))


let mkForall'' : (pat Prims.list Prims.list * Prims.int Prims.option * sort Prims.list * term)  ->  term = (fun _79_531 -> (match (_79_531) with
| (pats, wopt, sorts, body) -> begin
(mkQuant (Forall, pats, wopt, sorts, body))
end))


let mkForall' : (pat Prims.list Prims.list * Prims.int Prims.option * fvs * term)  ->  term = (fun _79_536 -> (match (_79_536) with
| (pats, wopt, vars, body) -> begin
(mkQuant' (Forall, pats, wopt, vars, body))
end))


let mkForall : (pat Prims.list Prims.list * fvs * term)  ->  term = (fun _79_540 -> (match (_79_540) with
| (pats, vars, body) -> begin
(mkQuant' (Forall, pats, None, vars, body))
end))


let mkExists : (pat Prims.list Prims.list * fvs * term)  ->  term = (fun _79_544 -> (match (_79_544) with
| (pats, vars, body) -> begin
(mkQuant' (Exists, pats, None, vars, body))
end))


let mkDefineFun : (Prims.string * (Prims.string * sort) Prims.list * sort * term * caption)  ->  decl = (fun _79_550 -> (match (_79_550) with
| (nm, vars, s, tm, c) -> begin
(let _168_439 = (let _168_438 = (FStar_List.map fv_sort vars)
in (let _168_437 = (abstr vars tm)
in (nm, _168_438, s, _168_437, c)))
in DefineFun (_168_439))
end))


let constr_id_of_sort : sort  ->  Prims.string = (fun sort -> (let _168_442 = (strSort sort)
in (FStar_Util.format1 "%s_constr_id" _168_442)))


let fresh_token : (Prims.string * sort)  ->  Prims.int  ->  decl = (fun _79_554 id -> (match (_79_554) with
| (tok_name, sort) -> begin
(

let a_name = (Prims.strcat "fresh_token_" tok_name)
in (let _168_455 = (let _168_454 = (let _168_453 = (let _168_452 = (mkInteger' id)
in (let _168_451 = (let _168_450 = (let _168_449 = (constr_id_of_sort sort)
in (let _168_448 = (let _168_447 = (mkApp (tok_name, []))
in (_168_447)::[])
in (_168_449, _168_448)))
in (mkApp _168_450))
in (_168_452, _168_451)))
in (mkEq _168_453))
in (_168_454, Some ("fresh token"), Some (a_name)))
in Assume (_168_455)))
end))


let fresh_constructor : (Prims.string * sort Prims.list * sort * Prims.int)  ->  decl = (fun _79_561 -> (match (_79_561) with
| (name, arg_sorts, sort, id) -> begin
(

let id = (FStar_Util.string_of_int id)
in (

let bvars = (FStar_All.pipe_right arg_sorts (FStar_List.mapi (fun i s -> (let _168_462 = (let _168_461 = (let _168_460 = (FStar_Util.string_of_int i)
in (Prims.strcat "x_" _168_460))
in (_168_461, s))
in (mkFreeV _168_462)))))
in (

let bvar_names = (FStar_List.map fv_of_term bvars)
in (

let capp = (mkApp (name, bvars))
in (

let cid_app = (let _168_464 = (let _168_463 = (constr_id_of_sort sort)
in (_168_463, (capp)::[]))
in (mkApp _168_464))
in (

let a_name = (Prims.strcat "constructor_distinct_" name)
in (let _168_470 = (let _168_469 = (let _168_468 = (let _168_467 = (let _168_466 = (let _168_465 = (mkInteger id)
in (_168_465, cid_app))
in (mkEq _168_466))
in (((capp)::[])::[], bvar_names, _168_467))
in (mkForall _168_468))
in (_168_469, Some ("Constructor distinct"), Some (a_name)))
in Assume (_168_470))))))))
end))


let injective_constructor : (Prims.string * (Prims.string * sort) Prims.list * sort)  ->  decls_t = (fun _79_573 -> (match (_79_573) with
| (name, projectors, sort) -> begin
(

let n_bvars = (FStar_List.length projectors)
in (

let bvar_name = (fun i -> (let _168_475 = (FStar_Util.string_of_int i)
in (Prims.strcat "x_" _168_475)))
in (

let bvar_index = (fun i -> (n_bvars - (i + 1)))
in (

let bvar = (fun i s -> (let _168_483 = (let _168_482 = (bvar_name i)
in (_168_482, s))
in (mkFreeV _168_483)))
in (

let bvars = (FStar_All.pipe_right projectors (FStar_List.mapi (fun i _79_586 -> (match (_79_586) with
| (_79_584, s) -> begin
(bvar i s)
end))))
in (

let bvar_names = (FStar_List.map fv_of_term bvars)
in (

let capp = (mkApp (name, bvars))
in (let _168_496 = (FStar_All.pipe_right projectors (FStar_List.mapi (fun i _79_593 -> (match (_79_593) with
| (name, s) -> begin
(

let cproj_app = (mkApp (name, (capp)::[]))
in (

let proj_name = DeclFun ((name, (sort)::[], s, Some ("Projector")))
in (

let a_name = (Prims.strcat "projection_inverse_" name)
in (let _168_495 = (let _168_494 = (let _168_493 = (let _168_492 = (let _168_491 = (let _168_490 = (let _168_489 = (let _168_488 = (bvar i s)
in (cproj_app, _168_488))
in (mkEq _168_489))
in (((capp)::[])::[], bvar_names, _168_490))
in (mkForall _168_491))
in (_168_492, Some ("Projection inverse"), Some (a_name)))
in Assume (_168_493))
in (_168_494)::[])
in (proj_name)::_168_495))))
end))))
in (FStar_All.pipe_right _168_496 FStar_List.flatten)))))))))
end))


let constructor_to_decl : constructor_t  ->  decls_t = (fun _79_602 -> (match (_79_602) with
| (name, projectors, sort, id, injective) -> begin
(

let injective = (injective || true)
in (

let cdecl = (let _168_500 = (let _168_499 = (FStar_All.pipe_right projectors (FStar_List.map Prims.snd))
in (name, _168_499, sort, Some ("Constructor")))
in DeclFun (_168_500))
in (

let cid = (let _168_502 = (let _168_501 = (FStar_All.pipe_right projectors (FStar_List.map Prims.snd))
in (name, _168_501, sort, id))
in (fresh_constructor _168_502))
in (

let disc = (

let disc_name = (Prims.strcat "is-" name)
in (

let xfv = ("x", sort)
in (

let xx = (mkFreeV xfv)
in (

let disc_eq = (let _168_508 = (let _168_507 = (let _168_504 = (let _168_503 = (constr_id_of_sort sort)
in (_168_503, (xx)::[]))
in (mkApp _168_504))
in (let _168_506 = (let _168_505 = (FStar_Util.string_of_int id)
in (mkInteger _168_505))
in (_168_507, _168_506)))
in (mkEq _168_508))
in (

let proj_terms = (FStar_All.pipe_right projectors (FStar_List.map (fun _79_612 -> (match (_79_612) with
| (proj, s) -> begin
(mkApp (proj, (xx)::[]))
end))))
in (

let disc_inv_body = (let _168_511 = (let _168_510 = (mkApp (name, proj_terms))
in (xx, _168_510))
in (mkEq _168_511))
in (

let disc_ax = (mkAnd (disc_eq, disc_inv_body))
in (mkDefineFun (disc_name, (xfv)::[], Bool_sort, disc_ax, Some ("Discriminator definition"))))))))))
in (

let projs = if injective then begin
(injective_constructor (name, projectors, sort))
end else begin
[]
end
in (let _168_518 = (let _168_514 = (let _168_513 = (let _168_512 = (FStar_Util.format1 "<start constructor %s>" name)
in Caption (_168_512))
in (_168_513)::(cdecl)::(cid)::projs)
in (FStar_List.append _168_514 ((disc)::[])))
in (let _168_517 = (let _168_516 = (let _168_515 = (FStar_Util.format1 "</end constructor %s>" name)
in Caption (_168_515))
in (_168_516)::[])
in (FStar_List.append _168_518 _168_517))))))))
end))


let name_binders_inner : (Prims.string * sort) Prims.list  ->  Prims.int  ->  sort Prims.list  ->  ((Prims.string * sort) Prims.list * Prims.string Prims.list * Prims.int) = (fun outer_names start sorts -> (

let _79_636 = (FStar_All.pipe_right sorts (FStar_List.fold_left (fun _79_624 s -> (match (_79_624) with
| (names, binders, n) -> begin
(

let prefix = (match (s) with
| Term_sort -> begin
"@x"
end
| _79_628 -> begin
"@u"
end)
in (

let nm = (let _168_527 = (FStar_Util.string_of_int n)
in (Prims.strcat prefix _168_527))
in (

let names = ((nm, s))::names
in (

let b = (let _168_528 = (strSort s)
in (FStar_Util.format2 "(%s %s)" nm _168_528))
in (names, (b)::binders, (n + 1))))))
end)) (outer_names, [], start)))
in (match (_79_636) with
| (names, binders, n) -> begin
(names, (FStar_List.rev binders), n)
end)))


let name_binders : sort Prims.list  ->  ((Prims.string * sort) Prims.list * Prims.string Prims.list) = (fun sorts -> (

let _79_641 = (name_binders_inner [] 0 sorts)
in (match (_79_641) with
| (names, binders, n) -> begin
((FStar_List.rev names), binders)
end)))


let termToSmt : term  ->  Prims.string = (fun t -> (

let rec aux = (fun n names t -> (match (t.tm) with
| Integer (i) -> begin
i
end
| BoundV (i) -> begin
(let _168_539 = (FStar_List.nth names i)
in (FStar_All.pipe_right _168_539 Prims.fst))
end
| FreeV (x) -> begin
(Prims.fst x)
end
| App (op, []) -> begin
(op_to_string op)
end
| App (op, tms) -> begin
(let _168_541 = (let _168_540 = (FStar_List.map (aux n names) tms)
in (FStar_All.pipe_right _168_540 (FStar_String.concat "\n")))
in (FStar_Util.format2 "(%s %s)" (op_to_string op) _168_541))
end
| Labeled (t, _79_663, _79_665) -> begin
(aux n names t)
end
| Quant (qop, pats, wopt, sorts, body) -> begin
(

let _79_678 = (name_binders_inner names n sorts)
in (match (_79_678) with
| (names, binders, n) -> begin
(

let binders = (FStar_All.pipe_right binders (FStar_String.concat " "))
in (

let pats_str = (match (pats) with
| ([]::[]) | ([]) -> begin
""
end
| _79_684 -> begin
(let _168_547 = (FStar_All.pipe_right pats (FStar_List.map (fun pats -> (let _168_546 = (let _168_545 = (FStar_List.map (fun p -> (let _168_544 = (aux n names p)
in (FStar_Util.format1 "%s" _168_544))) pats)
in (FStar_String.concat " " _168_545))
in (FStar_Util.format1 "\n:pattern (%s)" _168_546)))))
in (FStar_All.pipe_right _168_547 (FStar_String.concat "\n")))
end)
in (match ((pats, wopt)) with
| (([]::[], None)) | (([], None)) -> begin
(let _168_548 = (aux n names body)
in (FStar_Util.format3 "(%s (%s)\n %s);;no pats\n" (qop_to_string qop) binders _168_548))
end
| _79_696 -> begin
(let _168_550 = (aux n names body)
in (let _168_549 = (weightToSmt wopt)
in (FStar_Util.format5 "(%s (%s)\n (! %s\n %s %s))" (qop_to_string qop) binders _168_550 _168_549 pats_str)))
end)))
end))
end))
in (aux 0 [] t)))


let caption_to_string : Prims.string Prims.option  ->  Prims.string = (fun _79_6 -> (match (_79_6) with
| None -> begin
""
end
| Some (c) -> begin
(

let _79_710 = (match ((FStar_Util.splitlines c)) with
| [] -> begin
(FStar_All.failwith "Impossible")
end
| hd::[] -> begin
(hd, "")
end
| hd::_79_705 -> begin
(hd, "...")
end)
in (match (_79_710) with
| (hd, suffix) -> begin
(FStar_Util.format2 ";;;;;;;;;;;;;;;;%s%s\n" hd suffix)
end))
end))


let rec declToSmt : Prims.string  ->  decl  ->  Prims.string = (fun z3options decl -> (

let escape = (fun s -> (FStar_Util.replace_char s '\'' '_'))
in (match (decl) with
| DefPrelude -> begin
(mkPrelude z3options)
end
| Caption (c) -> begin
(let _168_561 = (FStar_All.pipe_right (FStar_Util.splitlines c) (fun _79_7 -> (match (_79_7) with
| [] -> begin
""
end
| h::t -> begin
h
end)))
in (FStar_Util.format1 "\n; %s" _168_561))
end
| DeclFun (f, argsorts, retsort, c) -> begin
(

let l = (FStar_List.map strSort argsorts)
in (let _168_563 = (caption_to_string c)
in (let _168_562 = (strSort retsort)
in (FStar_Util.format4 "%s(declare-fun %s (%s) %s)" _168_563 f (FStar_String.concat " " l) _168_562))))
end
| DefineFun (f, arg_sorts, retsort, body, c) -> begin
(

let _79_739 = (name_binders arg_sorts)
in (match (_79_739) with
| (names, binders) -> begin
(

let body = (let _168_564 = (FStar_List.map mkFreeV names)
in (inst _168_564 body))
in (let _168_567 = (caption_to_string c)
in (let _168_566 = (strSort retsort)
in (let _168_565 = (termToSmt body)
in (FStar_Util.format5 "%s(define-fun %s (%s) %s\n %s)" _168_567 f (FStar_String.concat " " binders) _168_566 _168_565)))))
end))
end
| Assume (t, c, Some (n)) -> begin
(let _168_569 = (caption_to_string c)
in (let _168_568 = (termToSmt t)
in (FStar_Util.format3 "%s(assert (!\n%s\n:named %s))" _168_569 _168_568 (escape n))))
end
| Assume (t, c, None) -> begin
(let _168_571 = (caption_to_string c)
in (let _168_570 = (termToSmt t)
in (FStar_Util.format2 "%s(assert %s)" _168_571 _168_570)))
end
| Eval (t) -> begin
(let _168_572 = (termToSmt t)
in (FStar_Util.format1 "(eval %s)" _168_572))
end
| Echo (s) -> begin
(FStar_Util.format1 "(echo \"%s\")" s)
end
| CheckSat -> begin
"(check-sat)"
end
| Push -> begin
"(push)"
end
| Pop -> begin
"(pop)"
end
| SetOption (s, v) -> begin
(FStar_Util.format2 "(set-option :%s %s)" s v)
end)))
and mkPrelude : Prims.string  ->  Prims.string = (fun z3options -> (

let basic = (Prims.strcat z3options "(declare-sort Ref)\n(declare-fun Ref_constr_id (Ref) Int)\n\n(declare-sort String)\n(declare-fun String_constr_id (String) Int)\n\n(declare-sort Term)\n(declare-fun Term_constr_id (Term) Int)\n(declare-datatypes () ((Fuel \n(ZFuel) \n(SFuel (prec Fuel)))))\n(declare-fun MaxIFuel () Fuel)\n(declare-fun MaxFuel () Fuel)\n(declare-fun PreType (Term) Term)\n(declare-fun Valid (Term) Bool)\n(declare-fun HasTypeFuel (Fuel Term Term) Bool)\n(define-fun HasTypeZ ((x Term) (t Term)) Bool\n(HasTypeFuel ZFuel x t))\n(define-fun HasType ((x Term) (t Term)) Bool\n(HasTypeFuel MaxIFuel x t))\n;;fuel irrelevance\n(assert (forall ((f Fuel) (x Term) (t Term))\n(! (= (HasTypeFuel (SFuel f) x t)\n(HasTypeZ x t))\n:pattern ((HasTypeFuel (SFuel f) x t)))))\n(define-fun  IsTyped ((x Term)) Bool\n(exists ((t Term)) (HasTypeZ x t)))\n(declare-fun ApplyTF (Term Fuel) Term)\n(declare-fun ApplyTT (Term Term) Term)\n(declare-fun Rank (Term) Int)\n(declare-fun Closure (Term) Term)\n(declare-fun ConsTerm (Term Term) Term)\n(declare-fun ConsFuel (Fuel Term) Term)\n(declare-fun Precedes (Term Term) Term)\n(assert (forall ((t Term))\n(! (implies (exists ((e Term)) (HasType e t))\n(Valid t))\n:pattern ((Valid t)))))\n(assert (forall ((t1 Term) (t2 Term))\n(! (iff (Valid (Precedes t1 t2)) \n(< (Rank t1) (Rank t2)))\n:pattern ((Precedes t1 t2)))))\n(define-fun Prims.precedes ((a Term) (b Term) (t1 Term) (t2 Term)) Term\n(Precedes t1 t2))\n(declare-fun Range_const () Term)\n")
in (

let constrs = (("String_const", (("String_const_proj_0", Int_sort))::[], String_sort, 0, true))::(("Tm_type", [], Term_sort, 2, true))::(("Tm_arrow", (("Tm_arrow_id", Int_sort))::[], Term_sort, 3, false))::(("Tm_uvar", (("Tm_uvar_fst", Int_sort))::[], Term_sort, 5, true))::(("Tm_unit", [], Term_sort, 6, true))::(("BoxInt", (("BoxInt_proj_0", Int_sort))::[], Term_sort, 7, true))::(("BoxBool", (("BoxBool_proj_0", Bool_sort))::[], Term_sort, 8, true))::(("BoxString", (("BoxString_proj_0", String_sort))::[], Term_sort, 9, true))::(("BoxRef", (("BoxRef_proj_0", Ref_sort))::[], Term_sort, 10, true))::(("LexCons", (("LexCons_0", Term_sort))::(("LexCons_1", Term_sort))::[], Term_sort, 11, true))::[]
in (

let bcons = (let _168_575 = (let _168_574 = (FStar_All.pipe_right constrs (FStar_List.collect constructor_to_decl))
in (FStar_All.pipe_right _168_574 (FStar_List.map (declToSmt z3options))))
in (FStar_All.pipe_right _168_575 (FStar_String.concat "\n")))
in (

let lex_ordering = "\n(define-fun is-Prims.LexCons ((t Term)) Bool \n(is-LexCons t))\n(assert (forall ((x1 Term) (x2 Term) (y1 Term) (y2 Term))\n(iff (Valid (Precedes (LexCons x1 x2) (LexCons y1 y2)))\n(or (Valid (Precedes x1 y1))\n(and (= x1 y1)\n(Valid (Precedes x2 y2)))))))\n"
in (Prims.strcat (Prims.strcat basic bcons) lex_ordering))))))


let mk_Range_const : term = (mkApp ("Range_const", []))


let mk_Term_type : term = (mkApp ("Tm_type", []))


let mk_Term_app : term  ->  term  ->  term = (fun t1 t2 -> (mkApp ("Tm_app", (t1)::(t2)::[])))


let mk_Term_uvar : Prims.int  ->  term = (fun i -> (let _168_584 = (let _168_583 = (let _168_582 = (mkInteger' i)
in (_168_582)::[])
in ("Tm_uvar", _168_583))
in (mkApp _168_584)))


let mk_Term_unit : term = (mkApp ("Tm_unit", []))


let boxInt : term  ->  term = (fun t -> (mkApp ("BoxInt", (t)::[])))


let unboxInt : term  ->  term = (fun t -> (mkApp ("BoxInt_proj_0", (t)::[])))


let boxBool : term  ->  term = (fun t -> (mkApp ("BoxBool", (t)::[])))


let unboxBool : term  ->  term = (fun t -> (mkApp ("BoxBool_proj_0", (t)::[])))


let boxString : term  ->  term = (fun t -> (mkApp ("BoxString", (t)::[])))


let unboxString : term  ->  term = (fun t -> (mkApp ("BoxString_proj_0", (t)::[])))


let boxRef : term  ->  term = (fun t -> (mkApp ("BoxRef", (t)::[])))


let unboxRef : term  ->  term = (fun t -> (mkApp ("BoxRef_proj_0", (t)::[])))


let boxTerm : sort  ->  term  ->  term = (fun sort t -> (match (sort) with
| Int_sort -> begin
(boxInt t)
end
| Bool_sort -> begin
(boxBool t)
end
| String_sort -> begin
(boxString t)
end
| Ref_sort -> begin
(boxRef t)
end
| _79_786 -> begin
(Prims.raise FStar_Util.Impos)
end))


let unboxTerm : sort  ->  term  ->  term = (fun sort t -> (match (sort) with
| Int_sort -> begin
(unboxInt t)
end
| Bool_sort -> begin
(unboxBool t)
end
| String_sort -> begin
(unboxString t)
end
| Ref_sort -> begin
(unboxRef t)
end
| _79_794 -> begin
(Prims.raise FStar_Util.Impos)
end))


let mk_PreType : term  ->  term = (fun t -> (mkApp ("PreType", (t)::[])))


let mk_Valid : term  ->  term = (fun t -> (match (t.tm) with
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_Equality"), _79_808::t1::t2::[]); hash = _79_802; freevars = _79_800}::[]) -> begin
(mkEq (t1, t2))
end
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_disEquality"), _79_827::t1::t2::[]); hash = _79_821; freevars = _79_819}::[]) -> begin
(let _168_613 = (mkEq (t1, t2))
in (mkNot _168_613))
end
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_LessThanOrEqual"), t1::t2::[]); hash = _79_840; freevars = _79_838}::[]) -> begin
(let _168_616 = (let _168_615 = (unboxInt t1)
in (let _168_614 = (unboxInt t2)
in (_168_615, _168_614)))
in (mkLTE _168_616))
end
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_LessThan"), t1::t2::[]); hash = _79_857; freevars = _79_855}::[]) -> begin
(let _168_619 = (let _168_618 = (unboxInt t1)
in (let _168_617 = (unboxInt t2)
in (_168_618, _168_617)))
in (mkLT _168_619))
end
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_GreaterThanOrEqual"), t1::t2::[]); hash = _79_874; freevars = _79_872}::[]) -> begin
(let _168_622 = (let _168_621 = (unboxInt t1)
in (let _168_620 = (unboxInt t2)
in (_168_621, _168_620)))
in (mkGTE _168_622))
end
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_GreaterThan"), t1::t2::[]); hash = _79_891; freevars = _79_889}::[]) -> begin
(let _168_625 = (let _168_624 = (unboxInt t1)
in (let _168_623 = (unboxInt t2)
in (_168_624, _168_623)))
in (mkGT _168_625))
end
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_AmpAmp"), t1::t2::[]); hash = _79_908; freevars = _79_906}::[]) -> begin
(let _168_628 = (let _168_627 = (unboxBool t1)
in (let _168_626 = (unboxBool t2)
in (_168_627, _168_626)))
in (mkAnd _168_628))
end
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_BarBar"), t1::t2::[]); hash = _79_925; freevars = _79_923}::[]) -> begin
(let _168_631 = (let _168_630 = (unboxBool t1)
in (let _168_629 = (unboxBool t2)
in (_168_630, _168_629)))
in (mkOr _168_631))
end
| App (Var ("Prims.b2t"), {tm = App (Var ("Prims.op_Negation"), t::[]); hash = _79_942; freevars = _79_940}::[]) -> begin
(let _168_632 = (unboxBool t)
in (mkNot _168_632))
end
| App (Var ("Prims.b2t"), t::[]) -> begin
(unboxBool t)
end
| _79_960 -> begin
(mkApp ("Valid", (t)::[]))
end))


let mk_HasType : term  ->  term  ->  term = (fun v t -> (mkApp ("HasType", (v)::(t)::[])))


let mk_HasTypeZ : term  ->  term  ->  term = (fun v t -> (mkApp ("HasTypeZ", (v)::(t)::[])))


let mk_IsTyped : term  ->  term = (fun v -> (mkApp ("IsTyped", (v)::[])))


let mk_HasTypeFuel : term  ->  term  ->  term  ->  term = (fun f v t -> if (FStar_Options.unthrottle_inductives ()) then begin
(mk_HasType v t)
end else begin
(mkApp ("HasTypeFuel", (f)::(v)::(t)::[]))
end)


let mk_HasTypeWithFuel : term Prims.option  ->  term  ->  term  ->  term = (fun f v t -> (match (f) with
| None -> begin
(mk_HasType v t)
end
| Some (f) -> begin
(mk_HasTypeFuel f v t)
end))


let mk_Destruct : term  ->  term = (fun v -> (mkApp ("Destruct", (v)::[])))


let mk_Rank : term  ->  term = (fun x -> (mkApp ("Rank", (x)::[])))


let mk_tester : Prims.string  ->  term  ->  term = (fun n t -> (mkApp ((Prims.strcat "is-" n), (t)::[])))


let mk_ApplyTF : term  ->  term  ->  term = (fun t t' -> (mkApp ("ApplyTF", (t)::(t')::[])))


let mk_ApplyTT : term  ->  term  ->  term = (fun t t' -> (mkApp ("ApplyTT", (t)::(t')::[])))


let mk_String_const : Prims.int  ->  term = (fun i -> (let _168_675 = (let _168_674 = (let _168_673 = (mkInteger' i)
in (_168_673)::[])
in ("String_const", _168_674))
in (mkApp _168_675)))


let mk_Precedes : term  ->  term  ->  term = (fun x1 x2 -> (let _168_680 = (mkApp ("Precedes", (x1)::(x2)::[]))
in (FStar_All.pipe_right _168_680 mk_Valid)))


let mk_LexCons : term  ->  term  ->  term = (fun x1 x2 -> (mkApp ("LexCons", (x1)::(x2)::[])))


let rec n_fuel : Prims.int  ->  term = (fun n -> if (n = 0) then begin
(mkApp ("ZFuel", []))
end else begin
(let _168_689 = (let _168_688 = (let _168_687 = (n_fuel (n - 1))
in (_168_687)::[])
in ("SFuel", _168_688))
in (mkApp _168_689))
end)


let fuel_2 : term = (n_fuel 2)


let fuel_100 : term = (n_fuel 100)


let mk_and_opt : term Prims.option  ->  term Prims.option  ->  term Prims.option = (fun p1 p2 -> (match ((p1, p2)) with
| (Some (p1), Some (p2)) -> begin
(let _168_694 = (mkAnd (p1, p2))
in Some (_168_694))
end
| ((Some (p), None)) | ((None, Some (p))) -> begin
Some (p)
end
| (None, None) -> begin
None
end))


let mk_and_opt_l : term Prims.option Prims.list  ->  term Prims.option = (fun pl -> (FStar_List.fold_left (fun out p -> (mk_and_opt p out)) None pl))


let mk_and_l : term Prims.list  ->  term = (fun l -> (match (l) with
| [] -> begin
mkTrue
end
| hd::tl -> begin
(FStar_List.fold_left (fun p1 p2 -> (mkAnd (p1, p2))) hd tl)
end))


let mk_or_l : term Prims.list  ->  term = (fun l -> (match (l) with
| [] -> begin
mkFalse
end
| hd::tl -> begin
(FStar_List.fold_left (fun p1 p2 -> (mkOr (p1, p2))) hd tl)
end))


let rec print_smt_term : term  ->  Prims.string = (fun t -> (match (t.tm) with
| Integer (n) -> begin
(FStar_Util.format1 "(Integer %s)" n)
end
| BoundV (n) -> begin
(let _168_711 = (FStar_Util.string_of_int n)
in (FStar_Util.format1 "(BoundV %s)" _168_711))
end
| FreeV (fv) -> begin
(FStar_Util.format1 "(FreeV %s)" (Prims.fst fv))
end
| App (op, l) -> begin
(let _168_712 = (print_smt_term_list l)
in (FStar_Util.format2 "(%s %s)" (op_to_string op) _168_712))
end
| Labeled (t, r1, r2) -> begin
(let _168_713 = (print_smt_term t)
in (FStar_Util.format2 "(Labeled \'%s\' %s)" r1 _168_713))
end
| Quant (qop, l, _79_1042, _79_1044, t) -> begin
(let _168_715 = (print_smt_term_list_list l)
in (let _168_714 = (print_smt_term t)
in (FStar_Util.format3 "(%s %s %s)" (qop_to_string qop) _168_715 _168_714)))
end))
and print_smt_term_list : term Prims.list  ->  Prims.string = (fun l -> (let _168_717 = (FStar_List.map print_smt_term l)
in (FStar_All.pipe_right _168_717 (FStar_String.concat " "))))
and print_smt_term_list_list : term Prims.list Prims.list  ->  Prims.string = (fun l -> (FStar_List.fold_left (fun s l -> (let _168_722 = (let _168_721 = (print_smt_term_list l)
in (Prims.strcat (Prims.strcat s "; [ ") _168_721))
in (Prims.strcat _168_722 " ] "))) "" l))




