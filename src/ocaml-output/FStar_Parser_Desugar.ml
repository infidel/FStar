
open Prims

let imp_tag : FStar_Absyn_Syntax.arg_qualifier = FStar_Absyn_Syntax.Implicit (false)


let as_imp : FStar_Parser_AST.imp  ->  FStar_Absyn_Syntax.arg_qualifier Prims.option = (fun _60_1 -> (match (_60_1) with
| (FStar_Parser_AST.Hash) | (FStar_Parser_AST.FsTypApp) -> begin
Some (imp_tag)
end
| _60_35 -> begin
None
end))


let arg_withimp_e = (fun imp t -> (t, (as_imp imp)))


let arg_withimp_t = (fun imp t -> (match (imp) with
| FStar_Parser_AST.Hash -> begin
(t, Some (imp_tag))
end
| _60_42 -> begin
(t, None)
end))


let contains_binder : FStar_Parser_AST.binder Prims.list  ->  Prims.bool = (fun binders -> (FStar_All.pipe_right binders (FStar_Util.for_some (fun b -> (match (b.FStar_Parser_AST.b) with
| FStar_Parser_AST.Annotated (_60_46) -> begin
true
end
| _60_49 -> begin
false
end)))))


let rec unparen : FStar_Parser_AST.term  ->  FStar_Parser_AST.term = (fun t -> (match (t.FStar_Parser_AST.tm) with
| FStar_Parser_AST.Paren (t) -> begin
(unparen t)
end
| _60_54 -> begin
t
end))


let rec unlabel : FStar_Parser_AST.term  ->  FStar_Parser_AST.term = (fun t -> (match (t.FStar_Parser_AST.tm) with
| FStar_Parser_AST.Paren (t) -> begin
(unlabel t)
end
| FStar_Parser_AST.Labeled (t, _60_60, _60_62) -> begin
(unlabel t)
end
| _60_66 -> begin
t
end))


let kind_star : FStar_Range.range  ->  FStar_Parser_AST.term = (fun r -> (let _149_17 = (let _149_16 = (FStar_Ident.lid_of_path (("Type")::[]) r)
in FStar_Parser_AST.Name (_149_16))
in (FStar_Parser_AST.mk_term _149_17 r FStar_Parser_AST.Kind)))


let compile_op : Prims.int  ->  Prims.string  ->  Prims.string = (fun arity s -> (

let name_of_char = (fun _60_2 -> (match (_60_2) with
| '&' -> begin
"Amp"
end
| '@' -> begin
"At"
end
| '+' -> begin
"Plus"
end
| '-' when (arity = 1) -> begin
"Minus"
end
| '-' -> begin
"Subtraction"
end
| '/' -> begin
"Slash"
end
| '<' -> begin
"Less"
end
| '=' -> begin
"Equals"
end
| '>' -> begin
"Greater"
end
| '_' -> begin
"Underscore"
end
| '|' -> begin
"Bar"
end
| '!' -> begin
"Bang"
end
| '^' -> begin
"Hat"
end
| '%' -> begin
"Percent"
end
| '*' -> begin
"Star"
end
| '?' -> begin
"Question"
end
| ':' -> begin
"Colon"
end
| _60_89 -> begin
"UNKNOWN"
end))
in (

let rec aux = (fun i -> if (i = (FStar_String.length s)) then begin
[]
end else begin
(let _149_28 = (let _149_26 = (FStar_Util.char_at s i)
in (name_of_char _149_26))
in (let _149_27 = (aux (i + 1))
in (_149_28)::_149_27))
end)
in (let _149_30 = (let _149_29 = (aux 0)
in (FStar_String.concat "_" _149_29))
in (Prims.strcat "op_" _149_30)))))


let compile_op_lid : Prims.int  ->  Prims.string  ->  FStar_Range.range  ->  FStar_Absyn_Syntax.lident = (fun n s r -> (let _149_40 = (let _149_39 = (let _149_38 = (let _149_37 = (compile_op n s)
in (_149_37, r))
in (FStar_Absyn_Syntax.mk_ident _149_38))
in (_149_39)::[])
in (FStar_All.pipe_right _149_40 FStar_Absyn_Syntax.lid_of_ids)))


let op_as_vlid : FStar_Parser_DesugarEnv.env  ->  Prims.int  ->  FStar_Range.range  ->  Prims.string  ->  FStar_Ident.lident Prims.option = (fun env arity rng s -> (

let r = (fun l -> (let _149_51 = (FStar_Ident.set_lid_range l rng)
in Some (_149_51)))
in (

let fallback = (fun _60_103 -> (match (()) with
| () -> begin
(match (s) with
| "=" -> begin
(r FStar_Absyn_Const.op_Eq)
end
| ":=" -> begin
(r FStar_Absyn_Const.op_ColonEq)
end
| "<" -> begin
(r FStar_Absyn_Const.op_LT)
end
| "<=" -> begin
(r FStar_Absyn_Const.op_LTE)
end
| ">" -> begin
(r FStar_Absyn_Const.op_GT)
end
| ">=" -> begin
(r FStar_Absyn_Const.op_GTE)
end
| "&&" -> begin
(r FStar_Absyn_Const.op_And)
end
| "||" -> begin
(r FStar_Absyn_Const.op_Or)
end
| "*" -> begin
(r FStar_Absyn_Const.op_Multiply)
end
| "+" -> begin
(r FStar_Absyn_Const.op_Addition)
end
| "-" when (arity = 1) -> begin
(r FStar_Absyn_Const.op_Minus)
end
| "-" -> begin
(r FStar_Absyn_Const.op_Subtraction)
end
| "/" -> begin
(r FStar_Absyn_Const.op_Division)
end
| "%" -> begin
(r FStar_Absyn_Const.op_Modulus)
end
| "!" -> begin
(r FStar_Absyn_Const.read_lid)
end
| "@" -> begin
(r FStar_Absyn_Const.list_append_lid)
end
| "^" -> begin
(r FStar_Absyn_Const.strcat_lid)
end
| "|>" -> begin
(r FStar_Absyn_Const.pipe_right_lid)
end
| "<|" -> begin
(r FStar_Absyn_Const.pipe_left_lid)
end
| "<>" -> begin
(r FStar_Absyn_Const.op_notEq)
end
| _60_125 -> begin
None
end)
end))
in (match ((let _149_54 = (compile_op_lid arity s rng)
in (FStar_Parser_DesugarEnv.try_lookup_lid env _149_54))) with
| Some ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_fvar (fv, _60_136); FStar_Absyn_Syntax.tk = _60_133; FStar_Absyn_Syntax.pos = _60_131; FStar_Absyn_Syntax.fvs = _60_129; FStar_Absyn_Syntax.uvs = _60_127}) -> begin
Some (fv.FStar_Absyn_Syntax.v)
end
| _60_142 -> begin
(fallback ())
end))))


let op_as_tylid : FStar_Parser_DesugarEnv.env  ->  Prims.int  ->  FStar_Range.range  ->  Prims.string  ->  FStar_Ident.lident Prims.option = (fun env arity rng s -> (

let r = (fun l -> (let _149_65 = (FStar_Ident.set_lid_range l rng)
in Some (_149_65)))
in (match (s) with
| "~" -> begin
(r FStar_Absyn_Const.not_lid)
end
| "==" -> begin
(r FStar_Absyn_Const.eq2_lid)
end
| "=!=" -> begin
(r FStar_Absyn_Const.neq2_lid)
end
| "<<" -> begin
(r FStar_Absyn_Const.precedes_lid)
end
| "/\\" -> begin
(r FStar_Absyn_Const.and_lid)
end
| "\\/" -> begin
(r FStar_Absyn_Const.or_lid)
end
| "==>" -> begin
(r FStar_Absyn_Const.imp_lid)
end
| "<==>" -> begin
(r FStar_Absyn_Const.iff_lid)
end
| s -> begin
(match ((let _149_66 = (compile_op_lid arity s rng)
in (FStar_Parser_DesugarEnv.try_lookup_typ_name env _149_66))) with
| Some ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_const (ftv); FStar_Absyn_Syntax.tk = _60_165; FStar_Absyn_Syntax.pos = _60_163; FStar_Absyn_Syntax.fvs = _60_161; FStar_Absyn_Syntax.uvs = _60_159}) -> begin
Some (ftv.FStar_Absyn_Syntax.v)
end
| _60_171 -> begin
None
end)
end)))


let rec is_type : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  Prims.bool = (fun env t -> if (t.FStar_Parser_AST.level = FStar_Parser_AST.Type) then begin
true
end else begin
(match ((let _149_73 = (unparen t)
in _149_73.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.Wild -> begin
true
end
| FStar_Parser_AST.Labeled (_60_176) -> begin
true
end
| FStar_Parser_AST.Op ("*", hd::_60_180) -> begin
(is_type env hd)
end
| (FStar_Parser_AST.Op ("==", _)) | (FStar_Parser_AST.Op ("=!=", _)) | (FStar_Parser_AST.Op ("~", _)) | (FStar_Parser_AST.Op ("/\\", _)) | (FStar_Parser_AST.Op ("\\/", _)) | (FStar_Parser_AST.Op ("==>", _)) | (FStar_Parser_AST.Op ("<==>", _)) | (FStar_Parser_AST.Op ("<<", _)) -> begin
true
end
| FStar_Parser_AST.Op (s, args) -> begin
(match ((op_as_tylid env (FStar_List.length args) t.FStar_Parser_AST.range s)) with
| None -> begin
false
end
| _60_231 -> begin
true
end)
end
| (FStar_Parser_AST.QForall (_)) | (FStar_Parser_AST.QExists (_)) | (FStar_Parser_AST.Sum (_)) | (FStar_Parser_AST.Refine (_)) | (FStar_Parser_AST.Tvar (_)) | (FStar_Parser_AST.NamedTyp (_)) -> begin
true
end
| (FStar_Parser_AST.Var (l)) | (FStar_Parser_AST.Name (l)) when ((FStar_List.length l.FStar_Ident.ns) = 0) -> begin
(match ((FStar_Parser_DesugarEnv.try_lookup_typ_var env l.FStar_Ident.ident)) with
| Some (_60_254) -> begin
true
end
| _60_257 -> begin
(FStar_Parser_DesugarEnv.is_type_lid env l)
end)
end
| (FStar_Parser_AST.Var (l)) | (FStar_Parser_AST.Name (l)) | (FStar_Parser_AST.Construct (l, _)) -> begin
(FStar_Parser_DesugarEnv.is_type_lid env l)
end
| (FStar_Parser_AST.App ({FStar_Parser_AST.tm = FStar_Parser_AST.Var (l); FStar_Parser_AST.range = _; FStar_Parser_AST.level = _}, arg, FStar_Parser_AST.Nothing)) | (FStar_Parser_AST.App ({FStar_Parser_AST.tm = FStar_Parser_AST.Name (l); FStar_Parser_AST.range = _; FStar_Parser_AST.level = _}, arg, FStar_Parser_AST.Nothing)) when (l.FStar_Ident.str = "ref") -> begin
(is_type env arg)
end
| (FStar_Parser_AST.App (t, _, _)) | (FStar_Parser_AST.Paren (t)) | (FStar_Parser_AST.Ascribed (t, _)) -> begin
(is_type env t)
end
| FStar_Parser_AST.Product (_60_298, t) -> begin
(not ((is_kind env t)))
end
| FStar_Parser_AST.If (t, t1, t2) -> begin
(((is_type env t) || (is_type env t1)) || (is_type env t2))
end
| FStar_Parser_AST.Abs (pats, t) -> begin
(

let rec aux = (fun env pats -> (match (pats) with
| [] -> begin
(is_type env t)
end
| hd::pats -> begin
(match (hd.FStar_Parser_AST.pat) with
| (FStar_Parser_AST.PatWild) | (FStar_Parser_AST.PatVar (_)) -> begin
(aux env pats)
end
| FStar_Parser_AST.PatTvar (id, _60_324) -> begin
(

let _60_330 = (FStar_Parser_DesugarEnv.push_local_tbinding env id)
in (match (_60_330) with
| (env, _60_329) -> begin
(aux env pats)
end))
end
| FStar_Parser_AST.PatAscribed (p, tm) -> begin
(

let env = if (is_kind env tm) then begin
(match (p.FStar_Parser_AST.pat) with
| (FStar_Parser_AST.PatVar (id, _)) | (FStar_Parser_AST.PatTvar (id, _)) -> begin
(let _149_78 = (FStar_Parser_DesugarEnv.push_local_tbinding env id)
in (FStar_All.pipe_right _149_78 Prims.fst))
end
| _60_345 -> begin
env
end)
end else begin
env
end
in (aux env pats))
end
| _60_348 -> begin
false
end)
end))
in (aux env pats))
end
| FStar_Parser_AST.Let (false, ({FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (_60_353); FStar_Parser_AST.prange = _60_351}, _60_357)::[], t) -> begin
(is_type env t)
end
| FStar_Parser_AST.Let (false, ({FStar_Parser_AST.pat = FStar_Parser_AST.PatAscribed ({FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (_60_369); FStar_Parser_AST.prange = _60_367}, _60_373); FStar_Parser_AST.prange = _60_365}, _60_378)::[], t) -> begin
(is_type env t)
end
| FStar_Parser_AST.Let (false, ({FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (_60_388); FStar_Parser_AST.prange = _60_386}, _60_392)::[], t) -> begin
(is_type env t)
end
| _60_399 -> begin
false
end)
end)
and is_kind : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  Prims.bool = (fun env t -> if (t.FStar_Parser_AST.level = FStar_Parser_AST.Kind) then begin
true
end else begin
(match ((let _149_81 = (unparen t)
in _149_81.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.Name ({FStar_Ident.ns = _60_408; FStar_Ident.ident = _60_406; FStar_Ident.nsstr = _60_404; FStar_Ident.str = "Type"}) -> begin
true
end
| FStar_Parser_AST.Product (_60_412, t) -> begin
(is_kind env t)
end
| FStar_Parser_AST.Paren (t) -> begin
(is_kind env t)
end
| (FStar_Parser_AST.Construct (l, _)) | (FStar_Parser_AST.Name (l)) -> begin
(FStar_Parser_DesugarEnv.is_kind_abbrev env l)
end
| _60_425 -> begin
false
end)
end)


let rec is_type_binder : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.binder  ->  Prims.bool = (fun env b -> if (b.FStar_Parser_AST.blevel = FStar_Parser_AST.Formula) then begin
(match (b.FStar_Parser_AST.b) with
| FStar_Parser_AST.Variable (_60_429) -> begin
false
end
| (FStar_Parser_AST.TAnnotated (_)) | (FStar_Parser_AST.TVariable (_)) -> begin
true
end
| (FStar_Parser_AST.Annotated (_, t)) | (FStar_Parser_AST.NoName (t)) -> begin
(is_kind env t)
end)
end else begin
(match (b.FStar_Parser_AST.b) with
| FStar_Parser_AST.Variable (_60_444) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected binder without annotation", b.FStar_Parser_AST.brange))))
end
| FStar_Parser_AST.TVariable (_60_447) -> begin
false
end
| FStar_Parser_AST.TAnnotated (_60_450) -> begin
true
end
| (FStar_Parser_AST.Annotated (_, t)) | (FStar_Parser_AST.NoName (t)) -> begin
(is_kind env t)
end)
end)


let sort_ftv : FStar_Ident.ident Prims.list  ->  FStar_Ident.ident Prims.list = (fun ftv -> (let _149_92 = (FStar_Util.remove_dups (fun x y -> (x.FStar_Ident.idText = y.FStar_Ident.idText)) ftv)
in (FStar_All.pipe_left (FStar_Util.sort_with (fun x y -> (FStar_String.compare x.FStar_Ident.idText y.FStar_Ident.idText))) _149_92)))


let rec free_type_vars_b : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.binder  ->  (FStar_Parser_DesugarEnv.env * FStar_Ident.ident Prims.list) = (fun env binder -> (match (binder.FStar_Parser_AST.b) with
| FStar_Parser_AST.Variable (_60_466) -> begin
(env, [])
end
| FStar_Parser_AST.TVariable (x) -> begin
(

let _60_473 = (FStar_Parser_DesugarEnv.push_local_tbinding env x)
in (match (_60_473) with
| (env, _60_472) -> begin
(env, (x)::[])
end))
end
| FStar_Parser_AST.Annotated (_60_475, term) -> begin
(let _149_99 = (free_type_vars env term)
in (env, _149_99))
end
| FStar_Parser_AST.TAnnotated (id, _60_481) -> begin
(

let _60_487 = (FStar_Parser_DesugarEnv.push_local_tbinding env id)
in (match (_60_487) with
| (env, _60_486) -> begin
(env, [])
end))
end
| FStar_Parser_AST.NoName (t) -> begin
(let _149_100 = (free_type_vars env t)
in (env, _149_100))
end))
and free_type_vars : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  FStar_Ident.ident Prims.list = (fun env t -> (match ((let _149_103 = (unparen t)
in _149_103.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.Tvar (a) -> begin
(match ((FStar_Parser_DesugarEnv.try_lookup_typ_var env a)) with
| None -> begin
(a)::[]
end
| _60_496 -> begin
[]
end)
end
| (FStar_Parser_AST.Wild) | (FStar_Parser_AST.Const (_)) | (FStar_Parser_AST.Var (_)) | (FStar_Parser_AST.Name (_)) -> begin
[]
end
| (FStar_Parser_AST.Requires (t, _)) | (FStar_Parser_AST.Ensures (t, _)) | (FStar_Parser_AST.Labeled (t, _, _)) | (FStar_Parser_AST.NamedTyp (_, t)) | (FStar_Parser_AST.Paren (t)) | (FStar_Parser_AST.Ascribed (t, _)) -> begin
(free_type_vars env t)
end
| FStar_Parser_AST.Construct (_60_532, ts) -> begin
(FStar_List.collect (fun _60_539 -> (match (_60_539) with
| (t, _60_538) -> begin
(free_type_vars env t)
end)) ts)
end
| FStar_Parser_AST.Op (_60_541, ts) -> begin
(FStar_List.collect (free_type_vars env) ts)
end
| FStar_Parser_AST.App (t1, t2, _60_548) -> begin
(let _149_106 = (free_type_vars env t1)
in (let _149_105 = (free_type_vars env t2)
in (FStar_List.append _149_106 _149_105)))
end
| FStar_Parser_AST.Refine (b, t) -> begin
(

let _60_557 = (free_type_vars_b env b)
in (match (_60_557) with
| (env, f) -> begin
(let _149_107 = (free_type_vars env t)
in (FStar_List.append f _149_107))
end))
end
| (FStar_Parser_AST.Product (binders, body)) | (FStar_Parser_AST.Sum (binders, body)) -> begin
(

let _60_573 = (FStar_List.fold_left (fun _60_566 binder -> (match (_60_566) with
| (env, free) -> begin
(

let _60_570 = (free_type_vars_b env binder)
in (match (_60_570) with
| (env, f) -> begin
(env, (FStar_List.append f free))
end))
end)) (env, []) binders)
in (match (_60_573) with
| (env, free) -> begin
(let _149_110 = (free_type_vars env body)
in (FStar_List.append free _149_110))
end))
end
| FStar_Parser_AST.Project (t, _60_576) -> begin
(free_type_vars env t)
end
| (FStar_Parser_AST.Abs (_)) | (FStar_Parser_AST.Let (_)) | (FStar_Parser_AST.If (_)) | (FStar_Parser_AST.QForall (_)) | (FStar_Parser_AST.QExists (_)) -> begin
[]
end
| (FStar_Parser_AST.Record (_)) | (FStar_Parser_AST.Match (_)) | (FStar_Parser_AST.TryWith (_)) | (FStar_Parser_AST.Seq (_)) -> begin
(FStar_Parser_AST.error "Unexpected type in free_type_vars computation" t t.FStar_Parser_AST.range)
end))


let head_and_args : FStar_Parser_AST.term  ->  (FStar_Parser_AST.term * (FStar_Parser_AST.term * FStar_Parser_AST.imp) Prims.list) = (fun t -> (

let rec aux = (fun args t -> (match ((let _149_117 = (unparen t)
in _149_117.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.App (t, arg, imp) -> begin
(aux (((arg, imp))::args) t)
end
| FStar_Parser_AST.Construct (l, args') -> begin
({FStar_Parser_AST.tm = FStar_Parser_AST.Name (l); FStar_Parser_AST.range = t.FStar_Parser_AST.range; FStar_Parser_AST.level = t.FStar_Parser_AST.level}, (FStar_List.append args' args))
end
| _60_620 -> begin
(t, args)
end))
in (aux [] t)))


let close : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  FStar_Parser_AST.term = (fun env t -> (

let ftv = (let _149_122 = (free_type_vars env t)
in (FStar_All.pipe_left sort_ftv _149_122))
in if ((FStar_List.length ftv) = 0) then begin
t
end else begin
(

let binders = (FStar_All.pipe_right ftv (FStar_List.map (fun x -> (let _149_126 = (let _149_125 = (let _149_124 = (kind_star x.FStar_Ident.idRange)
in (x, _149_124))
in FStar_Parser_AST.TAnnotated (_149_125))
in (FStar_Parser_AST.mk_binder _149_126 x.FStar_Ident.idRange FStar_Parser_AST.Type (Some (FStar_Parser_AST.Implicit)))))))
in (

let result = (FStar_Parser_AST.mk_term (FStar_Parser_AST.Product ((binders, t))) t.FStar_Parser_AST.range t.FStar_Parser_AST.level)
in result))
end))


let close_fun : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  FStar_Parser_AST.term = (fun env t -> (

let ftv = (let _149_131 = (free_type_vars env t)
in (FStar_All.pipe_left sort_ftv _149_131))
in if ((FStar_List.length ftv) = 0) then begin
t
end else begin
(

let binders = (FStar_All.pipe_right ftv (FStar_List.map (fun x -> (let _149_135 = (let _149_134 = (let _149_133 = (kind_star x.FStar_Ident.idRange)
in (x, _149_133))
in FStar_Parser_AST.TAnnotated (_149_134))
in (FStar_Parser_AST.mk_binder _149_135 x.FStar_Ident.idRange FStar_Parser_AST.Type (Some (FStar_Parser_AST.Implicit)))))))
in (

let t = (match ((let _149_136 = (unlabel t)
in _149_136.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.Product (_60_633) -> begin
t
end
| _60_636 -> begin
(FStar_Parser_AST.mk_term (FStar_Parser_AST.App (((FStar_Parser_AST.mk_term (FStar_Parser_AST.Name (FStar_Absyn_Const.effect_Tot_lid)) t.FStar_Parser_AST.range t.FStar_Parser_AST.level), t, FStar_Parser_AST.Nothing))) t.FStar_Parser_AST.range t.FStar_Parser_AST.level)
end)
in (

let result = (FStar_Parser_AST.mk_term (FStar_Parser_AST.Product ((binders, t))) t.FStar_Parser_AST.range t.FStar_Parser_AST.level)
in result)))
end))


let rec uncurry : FStar_Parser_AST.binder Prims.list  ->  FStar_Parser_AST.term  ->  (FStar_Parser_AST.binder Prims.list * FStar_Parser_AST.term) = (fun bs t -> (match (t.FStar_Parser_AST.tm) with
| FStar_Parser_AST.Product (binders, t) -> begin
(uncurry (FStar_List.append bs binders) t)
end
| _60_646 -> begin
(bs, t)
end))


let rec is_app_pattern : FStar_Parser_AST.pattern  ->  Prims.bool = (fun p -> (match (p.FStar_Parser_AST.pat) with
| FStar_Parser_AST.PatAscribed (p, _60_650) -> begin
(is_app_pattern p)
end
| FStar_Parser_AST.PatApp ({FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (_60_656); FStar_Parser_AST.prange = _60_654}, _60_660) -> begin
true
end
| _60_664 -> begin
false
end))


let rec destruct_app_pattern : FStar_Parser_DesugarEnv.env  ->  Prims.bool  ->  FStar_Parser_AST.pattern  ->  ((FStar_Ident.ident, FStar_Ident.lident) FStar_Util.either * FStar_Parser_AST.pattern Prims.list * FStar_Parser_AST.term Prims.option) = (fun env is_top_level p -> (match (p.FStar_Parser_AST.pat) with
| FStar_Parser_AST.PatAscribed (p, t) -> begin
(

let _60_676 = (destruct_app_pattern env is_top_level p)
in (match (_60_676) with
| (name, args, _60_675) -> begin
(name, args, Some (t))
end))
end
| FStar_Parser_AST.PatApp ({FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (id, _60_681); FStar_Parser_AST.prange = _60_678}, args) when is_top_level -> begin
(let _149_150 = (let _149_149 = (FStar_Parser_DesugarEnv.qualify env id)
in FStar_Util.Inr (_149_149))
in (_149_150, args, None))
end
| FStar_Parser_AST.PatApp ({FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (id, _60_692); FStar_Parser_AST.prange = _60_689}, args) -> begin
(FStar_Util.Inl (id), args, None)
end
| _60_700 -> begin
(FStar_All.failwith "Not an app pattern")
end))


type bnd =
| TBinder of (FStar_Absyn_Syntax.btvdef * FStar_Absyn_Syntax.knd * FStar_Absyn_Syntax.aqual)
| VBinder of (FStar_Absyn_Syntax.bvvdef * FStar_Absyn_Syntax.typ * FStar_Absyn_Syntax.aqual)
| LetBinder of (FStar_Ident.lident * FStar_Absyn_Syntax.typ)


let is_TBinder = (fun _discr_ -> (match (_discr_) with
| TBinder (_) -> begin
true
end
| _ -> begin
false
end))


let is_VBinder = (fun _discr_ -> (match (_discr_) with
| VBinder (_) -> begin
true
end
| _ -> begin
false
end))


let is_LetBinder = (fun _discr_ -> (match (_discr_) with
| LetBinder (_) -> begin
true
end
| _ -> begin
false
end))


let ___TBinder____0 = (fun projectee -> (match (projectee) with
| TBinder (_60_703) -> begin
_60_703
end))


let ___VBinder____0 = (fun projectee -> (match (projectee) with
| VBinder (_60_706) -> begin
_60_706
end))


let ___LetBinder____0 = (fun projectee -> (match (projectee) with
| LetBinder (_60_709) -> begin
_60_709
end))


let binder_of_bnd : bnd  ->  ((((FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, FStar_Absyn_Syntax.knd) FStar_Absyn_Syntax.withinfo_t, ((FStar_Absyn_Syntax.exp', (FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, FStar_Absyn_Syntax.typ) FStar_Absyn_Syntax.withinfo_t) FStar_Util.either * FStar_Absyn_Syntax.aqual) = (fun _60_3 -> (match (_60_3) with
| TBinder (a, k, aq) -> begin
(FStar_Util.Inl ((FStar_Absyn_Util.bvd_to_bvar_s a k)), aq)
end
| VBinder (x, t, aq) -> begin
(FStar_Util.Inr ((FStar_Absyn_Util.bvd_to_bvar_s x t)), aq)
end
| _60_722 -> begin
(FStar_All.failwith "Impossible")
end))


let trans_aqual : FStar_Parser_AST.arg_qualifier Prims.option  ->  FStar_Absyn_Syntax.arg_qualifier Prims.option = (fun _60_4 -> (match (_60_4) with
| Some (FStar_Parser_AST.Implicit) -> begin
Some (imp_tag)
end
| Some (FStar_Parser_AST.Equality) -> begin
Some (FStar_Absyn_Syntax.Equality)
end
| _60_729 -> begin
None
end))


let as_binder : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.arg_qualifier Prims.option  ->  ((FStar_Ident.ident Prims.option * FStar_Absyn_Syntax.knd), (FStar_Ident.ident Prims.option * FStar_Absyn_Syntax.typ)) FStar_Util.either  ->  (FStar_Absyn_Syntax.binder * FStar_Parser_DesugarEnv.env) = (fun env imp _60_5 -> (match (_60_5) with
| FStar_Util.Inl (None, k) -> begin
(let _149_203 = (FStar_Absyn_Syntax.null_t_binder k)
in (_149_203, env))
end
| FStar_Util.Inr (None, t) -> begin
(let _149_204 = (FStar_Absyn_Syntax.null_v_binder t)
in (_149_204, env))
end
| FStar_Util.Inl (Some (a), k) -> begin
(

let _60_748 = (FStar_Parser_DesugarEnv.push_local_tbinding env a)
in (match (_60_748) with
| (env, a) -> begin
((FStar_Util.Inl ((FStar_Absyn_Util.bvd_to_bvar_s a k)), (trans_aqual imp)), env)
end))
end
| FStar_Util.Inr (Some (x), t) -> begin
(

let _60_756 = (FStar_Parser_DesugarEnv.push_local_vbinding env x)
in (match (_60_756) with
| (env, x) -> begin
((FStar_Util.Inr ((FStar_Absyn_Util.bvd_to_bvar_s x t)), (trans_aqual imp)), env)
end))
end))


type env_t =
FStar_Parser_DesugarEnv.env


type lenv_t =
(FStar_Absyn_Syntax.btvdef, FStar_Absyn_Syntax.bvvdef) FStar_Util.either Prims.list


let label_conjuncts : Prims.string  ->  Prims.bool  ->  Prims.string Prims.option  ->  FStar_Parser_AST.term  ->  FStar_Parser_AST.term = (fun tag polarity label_opt f -> (

let label = (fun f -> (

let msg = (match (label_opt) with
| Some (l) -> begin
l
end
| _60_766 -> begin
(let _149_215 = (FStar_Range.string_of_range f.FStar_Parser_AST.range)
in (FStar_Util.format2 "%s at %s" tag _149_215))
end)
in (FStar_Parser_AST.mk_term (FStar_Parser_AST.Labeled ((f, msg, polarity))) f.FStar_Parser_AST.range f.FStar_Parser_AST.level)))
in (

let rec aux = (fun f -> (match (f.FStar_Parser_AST.tm) with
| FStar_Parser_AST.Paren (g) -> begin
(let _149_219 = (let _149_218 = (aux g)
in FStar_Parser_AST.Paren (_149_218))
in (FStar_Parser_AST.mk_term _149_219 f.FStar_Parser_AST.range f.FStar_Parser_AST.level))
end
| FStar_Parser_AST.Op ("/\\", f1::f2::[]) -> begin
(let _149_225 = (let _149_224 = (let _149_223 = (let _149_222 = (aux f1)
in (let _149_221 = (let _149_220 = (aux f2)
in (_149_220)::[])
in (_149_222)::_149_221))
in ("/\\", _149_223))
in FStar_Parser_AST.Op (_149_224))
in (FStar_Parser_AST.mk_term _149_225 f.FStar_Parser_AST.range f.FStar_Parser_AST.level))
end
| FStar_Parser_AST.If (f1, f2, f3) -> begin
(let _149_229 = (let _149_228 = (let _149_227 = (aux f2)
in (let _149_226 = (aux f3)
in (f1, _149_227, _149_226)))
in FStar_Parser_AST.If (_149_228))
in (FStar_Parser_AST.mk_term _149_229 f.FStar_Parser_AST.range f.FStar_Parser_AST.level))
end
| FStar_Parser_AST.Abs (binders, g) -> begin
(let _149_232 = (let _149_231 = (let _149_230 = (aux g)
in (binders, _149_230))
in FStar_Parser_AST.Abs (_149_231))
in (FStar_Parser_AST.mk_term _149_232 f.FStar_Parser_AST.range f.FStar_Parser_AST.level))
end
| _60_788 -> begin
(label f)
end))
in (aux f))))


let mk_lb : (FStar_Absyn_Syntax.lbname * FStar_Absyn_Syntax.typ * FStar_Absyn_Syntax.exp)  ->  FStar_Absyn_Syntax.letbinding = (fun _60_792 -> (match (_60_792) with
| (n, t, e) -> begin
{FStar_Absyn_Syntax.lbname = n; FStar_Absyn_Syntax.lbtyp = t; FStar_Absyn_Syntax.lbeff = FStar_Absyn_Const.effect_ALL_lid; FStar_Absyn_Syntax.lbdef = e}
end))


let rec desugar_data_pat : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.pattern  ->  (env_t * bnd * FStar_Absyn_Syntax.pat) = (fun env p -> (

let resolvex = (fun l e x -> (match ((FStar_All.pipe_right l (FStar_Util.find_opt (fun _60_6 -> (match (_60_6) with
| FStar_Util.Inr (y) -> begin
(y.FStar_Absyn_Syntax.ppname.FStar_Ident.idText = x.FStar_Ident.idText)
end
| _60_803 -> begin
false
end))))) with
| Some (FStar_Util.Inr (y)) -> begin
(l, e, y)
end
| _60_808 -> begin
(

let _60_811 = (FStar_Parser_DesugarEnv.push_local_vbinding e x)
in (match (_60_811) with
| (e, x) -> begin
((FStar_Util.Inr (x))::l, e, x)
end))
end))
in (

let resolvea = (fun l e a -> (match ((FStar_All.pipe_right l (FStar_Util.find_opt (fun _60_7 -> (match (_60_7) with
| FStar_Util.Inl (b) -> begin
(b.FStar_Absyn_Syntax.ppname.FStar_Ident.idText = a.FStar_Ident.idText)
end
| _60_820 -> begin
false
end))))) with
| Some (FStar_Util.Inl (b)) -> begin
(l, e, b)
end
| _60_825 -> begin
(

let _60_828 = (FStar_Parser_DesugarEnv.push_local_tbinding e a)
in (match (_60_828) with
| (e, a) -> begin
((FStar_Util.Inl (a))::l, e, a)
end))
end))
in (

let rec aux = (fun loc env p -> (

let pos = (fun q -> (FStar_Absyn_Syntax.withinfo q None p.FStar_Parser_AST.prange))
in (

let pos_r = (fun r q -> (FStar_Absyn_Syntax.withinfo q None r))
in (match (p.FStar_Parser_AST.pat) with
| FStar_Parser_AST.PatOr ([]) -> begin
(FStar_All.failwith "impossible")
end
| FStar_Parser_AST.PatOr (p::ps) -> begin
(

let _60_850 = (aux loc env p)
in (match (_60_850) with
| (loc, env, var, p, _60_849) -> begin
(

let _60_867 = (FStar_List.fold_left (fun _60_854 p -> (match (_60_854) with
| (loc, env, ps) -> begin
(

let _60_863 = (aux loc env p)
in (match (_60_863) with
| (loc, env, _60_859, p, _60_862) -> begin
(loc, env, (p)::ps)
end))
end)) (loc, env, []) ps)
in (match (_60_867) with
| (loc, env, ps) -> begin
(

let pat = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_disj ((p)::(FStar_List.rev ps))))
in (

let _60_869 = (let _149_304 = (FStar_Absyn_Syntax.pat_vars pat)
in (Prims.ignore _149_304))
in (loc, env, var, pat, false)))
end))
end))
end
| FStar_Parser_AST.PatAscribed (p, t) -> begin
(

let p = if (is_kind env t) then begin
(match (p.FStar_Parser_AST.pat) with
| FStar_Parser_AST.PatTvar (_60_876) -> begin
p
end
| FStar_Parser_AST.PatVar (x, imp) -> begin
(

let _60_882 = p
in {FStar_Parser_AST.pat = FStar_Parser_AST.PatTvar ((x, imp)); FStar_Parser_AST.prange = _60_882.FStar_Parser_AST.prange})
end
| _60_885 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected pattern", p.FStar_Parser_AST.prange))))
end)
end else begin
p
end
in (

let _60_892 = (aux loc env p)
in (match (_60_892) with
| (loc, env', binder, p, imp) -> begin
(

let binder = (match (binder) with
| LetBinder (_60_894) -> begin
(FStar_All.failwith "impossible")
end
| TBinder (x, _60_898, aq) -> begin
(let _149_306 = (let _149_305 = (desugar_kind env t)
in (x, _149_305, aq))
in TBinder (_149_306))
end
| VBinder (x, _60_904, aq) -> begin
(

let t = (close_fun env t)
in (let _149_308 = (let _149_307 = (desugar_typ env t)
in (x, _149_307, aq))
in VBinder (_149_308)))
end)
in (loc, env', binder, p, imp))
end)))
end
| FStar_Parser_AST.PatTvar (a, aq) -> begin
(

let imp = (aq = Some (FStar_Parser_AST.Implicit))
in (

let aq = (trans_aqual aq)
in if (a.FStar_Ident.idText = "\'_") then begin
(

let a = (FStar_All.pipe_left FStar_Absyn_Util.new_bvd (Some (p.FStar_Parser_AST.prange)))
in (let _149_309 = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_twild ((FStar_Absyn_Util.bvd_to_bvar_s a FStar_Absyn_Syntax.kun))))
in (loc, env, TBinder ((a, FStar_Absyn_Syntax.kun, aq)), _149_309, imp)))
end else begin
(

let _60_920 = (resolvea loc env a)
in (match (_60_920) with
| (loc, env, abvd) -> begin
(let _149_310 = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_tvar ((FStar_Absyn_Util.bvd_to_bvar_s abvd FStar_Absyn_Syntax.kun))))
in (loc, env, TBinder ((abvd, FStar_Absyn_Syntax.kun, aq)), _149_310, imp))
end))
end))
end
| FStar_Parser_AST.PatWild -> begin
(

let x = (FStar_Absyn_Util.new_bvd (Some (p.FStar_Parser_AST.prange)))
in (

let y = (FStar_Absyn_Util.new_bvd (Some (p.FStar_Parser_AST.prange)))
in (let _149_311 = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_wild ((FStar_Absyn_Util.bvd_to_bvar_s y FStar_Absyn_Syntax.tun))))
in (loc, env, VBinder ((x, FStar_Absyn_Syntax.tun, None)), _149_311, false))))
end
| FStar_Parser_AST.PatConst (c) -> begin
(

let x = (FStar_Absyn_Util.new_bvd (Some (p.FStar_Parser_AST.prange)))
in (let _149_312 = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_constant (c)))
in (loc, env, VBinder ((x, FStar_Absyn_Syntax.tun, None)), _149_312, false)))
end
| FStar_Parser_AST.PatVar (x, aq) -> begin
(

let imp = (aq = Some (FStar_Parser_AST.Implicit))
in (

let aq = (trans_aqual aq)
in (

let _60_936 = (resolvex loc env x)
in (match (_60_936) with
| (loc, env, xbvd) -> begin
(let _149_313 = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_var ((FStar_Absyn_Util.bvd_to_bvar_s xbvd FStar_Absyn_Syntax.tun))))
in (loc, env, VBinder ((xbvd, FStar_Absyn_Syntax.tun, aq)), _149_313, imp))
end))))
end
| FStar_Parser_AST.PatName (l) -> begin
(

let l = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_datacon env) l)
in (

let x = (FStar_Absyn_Util.new_bvd (Some (p.FStar_Parser_AST.prange)))
in (let _149_314 = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_cons ((l, Some (FStar_Absyn_Syntax.Data_ctor), []))))
in (loc, env, VBinder ((x, FStar_Absyn_Syntax.tun, None)), _149_314, false))))
end
| FStar_Parser_AST.PatApp ({FStar_Parser_AST.pat = FStar_Parser_AST.PatName (l); FStar_Parser_AST.prange = _60_942}, args) -> begin
(

let _60_964 = (FStar_List.fold_right (fun arg _60_953 -> (match (_60_953) with
| (loc, env, args) -> begin
(

let _60_960 = (aux loc env arg)
in (match (_60_960) with
| (loc, env, _60_957, arg, imp) -> begin
(loc, env, ((arg, imp))::args)
end))
end)) args (loc, env, []))
in (match (_60_964) with
| (loc, env, args) -> begin
(

let l = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_datacon env) l)
in (

let x = (FStar_Absyn_Util.new_bvd (Some (p.FStar_Parser_AST.prange)))
in (let _149_317 = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_cons ((l, Some (FStar_Absyn_Syntax.Data_ctor), args))))
in (loc, env, VBinder ((x, FStar_Absyn_Syntax.tun, None)), _149_317, false))))
end))
end
| FStar_Parser_AST.PatApp (_60_968) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected pattern", p.FStar_Parser_AST.prange))))
end
| FStar_Parser_AST.PatList (pats) -> begin
(

let _60_988 = (FStar_List.fold_right (fun pat _60_976 -> (match (_60_976) with
| (loc, env, pats) -> begin
(

let _60_984 = (aux loc env pat)
in (match (_60_984) with
| (loc, env, _60_980, pat, _60_983) -> begin
(loc, env, (pat)::pats)
end))
end)) pats (loc, env, []))
in (match (_60_988) with
| (loc, env, pats) -> begin
(

let pat = (let _149_324 = (let _149_323 = (let _149_322 = (FStar_Range.end_range p.FStar_Parser_AST.prange)
in (pos_r _149_322))
in (FStar_All.pipe_left _149_323 (FStar_Absyn_Syntax.Pat_cons (((FStar_Absyn_Util.fv FStar_Absyn_Const.nil_lid), Some (FStar_Absyn_Syntax.Data_ctor), [])))))
in (FStar_List.fold_right (fun hd tl -> (

let r = (FStar_Range.union_ranges hd.FStar_Absyn_Syntax.p tl.FStar_Absyn_Syntax.p)
in (FStar_All.pipe_left (pos_r r) (FStar_Absyn_Syntax.Pat_cons (((FStar_Absyn_Util.fv FStar_Absyn_Const.cons_lid), Some (FStar_Absyn_Syntax.Data_ctor), ((hd, false))::((tl, false))::[])))))) pats _149_324))
in (

let x = (FStar_Absyn_Util.new_bvd (Some (p.FStar_Parser_AST.prange)))
in (loc, env, VBinder ((x, FStar_Absyn_Syntax.tun, None)), pat, false)))
end))
end
| FStar_Parser_AST.PatTuple (args, dep) -> begin
(

let _60_1014 = (FStar_List.fold_left (fun _60_1001 p -> (match (_60_1001) with
| (loc, env, pats) -> begin
(

let _60_1010 = (aux loc env p)
in (match (_60_1010) with
| (loc, env, _60_1006, pat, _60_1009) -> begin
(loc, env, ((pat, false))::pats)
end))
end)) (loc, env, []) args)
in (match (_60_1014) with
| (loc, env, args) -> begin
(

let args = (FStar_List.rev args)
in (

let l = if dep then begin
(FStar_Absyn_Util.mk_dtuple_data_lid (FStar_List.length args) p.FStar_Parser_AST.prange)
end else begin
(FStar_Absyn_Util.mk_tuple_data_lid (FStar_List.length args) p.FStar_Parser_AST.prange)
end
in (

let constr = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_lid env) l)
in (

let l = (match (constr.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_fvar (v, _60_1020) -> begin
v
end
| _60_1024 -> begin
(FStar_All.failwith "impossible")
end)
in (

let x = (FStar_Absyn_Util.new_bvd (Some (p.FStar_Parser_AST.prange)))
in (let _149_327 = (FStar_All.pipe_left pos (FStar_Absyn_Syntax.Pat_cons ((l, Some (FStar_Absyn_Syntax.Data_ctor), args))))
in (loc, env, VBinder ((x, FStar_Absyn_Syntax.tun, None)), _149_327, false)))))))
end))
end
| FStar_Parser_AST.PatRecord ([]) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected pattern", p.FStar_Parser_AST.prange))))
end
| FStar_Parser_AST.PatRecord (fields) -> begin
(

let _60_1034 = (FStar_List.hd fields)
in (match (_60_1034) with
| (f, _60_1033) -> begin
(

let _60_1038 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_record_by_field_name env) f)
in (match (_60_1038) with
| (record, _60_1037) -> begin
(

let fields = (FStar_All.pipe_right fields (FStar_List.map (fun _60_1041 -> (match (_60_1041) with
| (f, p) -> begin
(let _149_329 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.qualify_field_to_record env record) f)
in (_149_329, p))
end))))
in (

let args = (FStar_All.pipe_right record.FStar_Parser_DesugarEnv.fields (FStar_List.map (fun _60_1046 -> (match (_60_1046) with
| (f, _60_1045) -> begin
(match ((FStar_All.pipe_right fields (FStar_List.tryFind (fun _60_1050 -> (match (_60_1050) with
| (g, _60_1049) -> begin
(FStar_Ident.lid_equals f g)
end))))) with
| None -> begin
(FStar_Parser_AST.mk_pattern FStar_Parser_AST.PatWild p.FStar_Parser_AST.prange)
end
| Some (_60_1053, p) -> begin
p
end)
end))))
in (

let app = (FStar_Parser_AST.mk_pattern (FStar_Parser_AST.PatApp (((FStar_Parser_AST.mk_pattern (FStar_Parser_AST.PatName (record.FStar_Parser_DesugarEnv.constrname)) p.FStar_Parser_AST.prange), args))) p.FStar_Parser_AST.prange)
in (

let _60_1065 = (aux loc env app)
in (match (_60_1065) with
| (env, e, b, p, _60_1064) -> begin
(

let p = (match (p.FStar_Absyn_Syntax.v) with
| FStar_Absyn_Syntax.Pat_cons (fv, _60_1068, args) -> begin
(let _149_337 = (let _149_336 = (let _149_335 = (let _149_334 = (let _149_333 = (let _149_332 = (FStar_All.pipe_right record.FStar_Parser_DesugarEnv.fields (FStar_List.map Prims.fst))
in (record.FStar_Parser_DesugarEnv.typename, _149_332))
in FStar_Absyn_Syntax.Record_ctor (_149_333))
in Some (_149_334))
in (fv, _149_335, args))
in FStar_Absyn_Syntax.Pat_cons (_149_336))
in (FStar_All.pipe_left pos _149_337))
end
| _60_1073 -> begin
p
end)
in (env, e, b, p, false))
end)))))
end))
end))
end))))
in (

let _60_1082 = (aux [] env p)
in (match (_60_1082) with
| (_60_1076, env, b, p, _60_1081) -> begin
(env, b, p)
end))))))
and desugar_binding_pat_maybe_top : Prims.bool  ->  FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.pattern  ->  (env_t * bnd * FStar_Absyn_Syntax.pat Prims.option) = (fun top env p -> if top then begin
(match (p.FStar_Parser_AST.pat) with
| FStar_Parser_AST.PatVar (x, _60_1088) -> begin
(let _149_343 = (let _149_342 = (let _149_341 = (FStar_Parser_DesugarEnv.qualify env x)
in (_149_341, FStar_Absyn_Syntax.tun))
in LetBinder (_149_342))
in (env, _149_343, None))
end
| FStar_Parser_AST.PatAscribed ({FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (x, _60_1095); FStar_Parser_AST.prange = _60_1092}, t) -> begin
(let _149_347 = (let _149_346 = (let _149_345 = (FStar_Parser_DesugarEnv.qualify env x)
in (let _149_344 = (desugar_typ env t)
in (_149_345, _149_344)))
in LetBinder (_149_346))
in (env, _149_347, None))
end
| _60_1103 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected pattern at the top-level", p.FStar_Parser_AST.prange))))
end)
end else begin
(

let _60_1107 = (desugar_data_pat env p)
in (match (_60_1107) with
| (env, binder, p) -> begin
(

let p = (match (p.FStar_Absyn_Syntax.v) with
| (FStar_Absyn_Syntax.Pat_var (_)) | (FStar_Absyn_Syntax.Pat_tvar (_)) | (FStar_Absyn_Syntax.Pat_wild (_)) -> begin
None
end
| _60_1118 -> begin
Some (p)
end)
in (env, binder, p))
end))
end)
and desugar_binding_pat : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.pattern  ->  (env_t * bnd * FStar_Absyn_Syntax.pat Prims.option) = (fun env p -> (desugar_binding_pat_maybe_top false env p))
and desugar_match_pat_maybe_top : Prims.bool  ->  FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.pattern  ->  (env_t * FStar_Absyn_Syntax.pat) = (fun _60_1122 env pat -> (

let _60_1130 = (desugar_data_pat env pat)
in (match (_60_1130) with
| (env, _60_1128, pat) -> begin
(env, pat)
end)))
and desugar_match_pat : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.pattern  ->  (env_t * FStar_Absyn_Syntax.pat) = (fun env p -> (desugar_match_pat_maybe_top false env p))
and desugar_typ_or_exp : env_t  ->  FStar_Parser_AST.term  ->  (FStar_Absyn_Syntax.typ, FStar_Absyn_Syntax.exp) FStar_Util.either = (fun env t -> if (is_type env t) then begin
(let _149_357 = (desugar_typ env t)
in FStar_Util.Inl (_149_357))
end else begin
(let _149_358 = (desugar_exp env t)
in FStar_Util.Inr (_149_358))
end)
and desugar_exp : env_t  ->  FStar_Parser_AST.term  ->  FStar_Absyn_Syntax.exp = (fun env e -> (desugar_exp_maybe_top false env e))
and desugar_exp_maybe_top : Prims.bool  ->  env_t  ->  FStar_Parser_AST.term  ->  FStar_Absyn_Syntax.exp = (fun top_level env top -> (

let pos = (fun e -> (e None top.FStar_Parser_AST.range))
in (

let setpos = (fun e -> (

let _60_1144 = e
in {FStar_Absyn_Syntax.n = _60_1144.FStar_Absyn_Syntax.n; FStar_Absyn_Syntax.tk = _60_1144.FStar_Absyn_Syntax.tk; FStar_Absyn_Syntax.pos = top.FStar_Parser_AST.range; FStar_Absyn_Syntax.fvs = _60_1144.FStar_Absyn_Syntax.fvs; FStar_Absyn_Syntax.uvs = _60_1144.FStar_Absyn_Syntax.uvs}))
in (match ((let _149_378 = (unparen top)
in _149_378.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.Const (c) -> begin
(FStar_All.pipe_left pos (FStar_Absyn_Syntax.mk_Exp_constant c))
end
| FStar_Parser_AST.Op (s, args) -> begin
(match ((op_as_vlid env (FStar_List.length args) top.FStar_Parser_AST.range s)) with
| None -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (((Prims.strcat "Unexpected operator: " s), top.FStar_Parser_AST.range))))
end
| Some (l) -> begin
(

let op = (FStar_Absyn_Util.fvar None l (FStar_Ident.range_of_lid l))
in (

let args = (FStar_All.pipe_right args (FStar_List.map (fun t -> (let _149_382 = (desugar_typ_or_exp env t)
in (_149_382, None)))))
in (let _149_383 = (FStar_Absyn_Util.mk_exp_app op args)
in (FStar_All.pipe_left setpos _149_383))))
end)
end
| (FStar_Parser_AST.Var (l)) | (FStar_Parser_AST.Name (l)) -> begin
if (l.FStar_Ident.str = "ref") then begin
(match ((FStar_Parser_DesugarEnv.try_lookup_lid env FStar_Absyn_Const.alloc_lid)) with
| None -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Identifier \'ref\' not found; include lib/FStar.ST.fst in your path", (FStar_Ident.range_of_lid l)))))
end
| Some (e) -> begin
(setpos e)
end)
end else begin
(let _149_384 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_lid env) l)
in (FStar_All.pipe_left setpos _149_384))
end
end
| FStar_Parser_AST.Construct (l, args) -> begin
(

let dt = (let _149_389 = (let _149_388 = (let _149_387 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_datacon env) l)
in (_149_387, Some (FStar_Absyn_Syntax.Data_ctor)))
in (FStar_Absyn_Syntax.mk_Exp_fvar _149_388))
in (FStar_All.pipe_left pos _149_389))
in (match (args) with
| [] -> begin
dt
end
| _60_1171 -> begin
(

let args = (FStar_List.map (fun _60_1174 -> (match (_60_1174) with
| (t, imp) -> begin
(

let te = (desugar_typ_or_exp env t)
in (arg_withimp_e imp te))
end)) args)
in (let _149_394 = (let _149_393 = (let _149_392 = (let _149_391 = (FStar_Absyn_Util.mk_exp_app dt args)
in (_149_391, FStar_Absyn_Syntax.Data_app))
in FStar_Absyn_Syntax.Meta_desugared (_149_392))
in (FStar_Absyn_Syntax.mk_Exp_meta _149_393))
in (FStar_All.pipe_left setpos _149_394)))
end))
end
| FStar_Parser_AST.Abs (binders, body) -> begin
(

let _60_1211 = (FStar_List.fold_left (fun _60_1183 pat -> (match (_60_1183) with
| (env, ftvs) -> begin
(match (pat.FStar_Parser_AST.pat) with
| FStar_Parser_AST.PatAscribed ({FStar_Parser_AST.pat = FStar_Parser_AST.PatTvar (a, imp); FStar_Parser_AST.prange = _60_1186}, t) -> begin
(

let ftvs = (let _149_397 = (free_type_vars env t)
in (FStar_List.append _149_397 ftvs))
in (let _149_399 = (let _149_398 = (FStar_Parser_DesugarEnv.push_local_tbinding env a)
in (FStar_All.pipe_left Prims.fst _149_398))
in (_149_399, ftvs)))
end
| FStar_Parser_AST.PatTvar (a, _60_1198) -> begin
(let _149_401 = (let _149_400 = (FStar_Parser_DesugarEnv.push_local_tbinding env a)
in (FStar_All.pipe_left Prims.fst _149_400))
in (_149_401, ftvs))
end
| FStar_Parser_AST.PatAscribed (_60_1202, t) -> begin
(let _149_403 = (let _149_402 = (free_type_vars env t)
in (FStar_List.append _149_402 ftvs))
in (env, _149_403))
end
| _60_1207 -> begin
(env, ftvs)
end)
end)) (env, []) binders)
in (match (_60_1211) with
| (_60_1209, ftv) -> begin
(

let ftv = (sort_ftv ftv)
in (

let binders = (let _149_405 = (FStar_All.pipe_right ftv (FStar_List.map (fun a -> (FStar_Parser_AST.mk_pattern (FStar_Parser_AST.PatTvar ((a, Some (FStar_Parser_AST.Implicit)))) top.FStar_Parser_AST.range))))
in (FStar_List.append _149_405 binders))
in (

let rec aux = (fun env bs sc_pat_opt _60_8 -> (match (_60_8) with
| [] -> begin
(

let body = (desugar_exp env body)
in (

let body = (match (sc_pat_opt) with
| Some (sc, pat) -> begin
(FStar_Absyn_Syntax.mk_Exp_match (sc, ((pat, None, body))::[]) None body.FStar_Absyn_Syntax.pos)
end
| None -> begin
body
end)
in (FStar_Absyn_Syntax.mk_Exp_abs' ((FStar_List.rev bs), body) None top.FStar_Parser_AST.range)))
end
| p::rest -> begin
(

let _60_1234 = (desugar_binding_pat env p)
in (match (_60_1234) with
| (env, b, pat) -> begin
(

let _60_1294 = (match (b) with
| LetBinder (_60_1236) -> begin
(FStar_All.failwith "Impossible")
end
| TBinder (a, k, aq) -> begin
(let _149_414 = (binder_of_bnd b)
in (_149_414, sc_pat_opt))
end
| VBinder (x, t, aq) -> begin
(

let b = (FStar_Absyn_Util.bvd_to_bvar_s x t)
in (

let sc_pat_opt = (match ((pat, sc_pat_opt)) with
| (None, _60_1251) -> begin
sc_pat_opt
end
| (Some (p), None) -> begin
(let _149_416 = (let _149_415 = (FStar_Absyn_Util.bvar_to_exp b)
in (_149_415, p))
in Some (_149_416))
end
| (Some (p), Some (sc, p')) -> begin
(match ((sc.FStar_Absyn_Syntax.n, p'.FStar_Absyn_Syntax.v)) with
| (FStar_Absyn_Syntax.Exp_bvar (_60_1265), _60_1268) -> begin
(

let tup = (FStar_Absyn_Util.mk_tuple_data_lid 2 top.FStar_Parser_AST.range)
in (

let sc = (let _149_423 = (let _149_422 = (FStar_Absyn_Util.fvar (Some (FStar_Absyn_Syntax.Data_ctor)) tup top.FStar_Parser_AST.range)
in (let _149_421 = (let _149_420 = (FStar_Absyn_Syntax.varg sc)
in (let _149_419 = (let _149_418 = (let _149_417 = (FStar_Absyn_Util.bvar_to_exp b)
in (FStar_All.pipe_left FStar_Absyn_Syntax.varg _149_417))
in (_149_418)::[])
in (_149_420)::_149_419))
in (_149_422, _149_421)))
in (FStar_Absyn_Syntax.mk_Exp_app _149_423 None top.FStar_Parser_AST.range))
in (

let p = (let _149_424 = (FStar_Range.union_ranges p'.FStar_Absyn_Syntax.p p.FStar_Absyn_Syntax.p)
in (FStar_Absyn_Util.withinfo (FStar_Absyn_Syntax.Pat_cons (((FStar_Absyn_Util.fv tup), Some (FStar_Absyn_Syntax.Data_ctor), ((p', false))::((p, false))::[]))) None _149_424))
in Some ((sc, p)))))
end
| (FStar_Absyn_Syntax.Exp_app (_60_1274, args), FStar_Absyn_Syntax.Pat_cons (_60_1279, _60_1281, pats)) -> begin
(

let tup = (FStar_Absyn_Util.mk_tuple_data_lid (1 + (FStar_List.length args)) top.FStar_Parser_AST.range)
in (

let sc = (let _149_430 = (let _149_429 = (FStar_Absyn_Util.fvar (Some (FStar_Absyn_Syntax.Data_ctor)) tup top.FStar_Parser_AST.range)
in (let _149_428 = (let _149_427 = (let _149_426 = (let _149_425 = (FStar_Absyn_Util.bvar_to_exp b)
in (FStar_All.pipe_left FStar_Absyn_Syntax.varg _149_425))
in (_149_426)::[])
in (FStar_List.append args _149_427))
in (_149_429, _149_428)))
in (FStar_Absyn_Syntax.mk_Exp_app _149_430 None top.FStar_Parser_AST.range))
in (

let p = (let _149_431 = (FStar_Range.union_ranges p'.FStar_Absyn_Syntax.p p.FStar_Absyn_Syntax.p)
in (FStar_Absyn_Util.withinfo (FStar_Absyn_Syntax.Pat_cons (((FStar_Absyn_Util.fv tup), Some (FStar_Absyn_Syntax.Data_ctor), (FStar_List.append pats (((p, false))::[]))))) None _149_431))
in Some ((sc, p)))))
end
| _60_1290 -> begin
(FStar_All.failwith "Impossible")
end)
end)
in ((FStar_Util.Inr (b), aq), sc_pat_opt)))
end)
in (match (_60_1294) with
| (b, sc_pat_opt) -> begin
(aux env ((b)::bs) sc_pat_opt rest)
end))
end))
end))
in (aux env [] None binders))))
end))
end
| FStar_Parser_AST.App ({FStar_Parser_AST.tm = FStar_Parser_AST.Var (a); FStar_Parser_AST.range = _60_1298; FStar_Parser_AST.level = _60_1296}, arg, _60_1304) when ((FStar_Ident.lid_equals a FStar_Absyn_Const.assert_lid) || (FStar_Ident.lid_equals a FStar_Absyn_Const.assume_lid)) -> begin
(

let phi = (desugar_formula env arg)
in (let _149_441 = (let _149_440 = (let _149_439 = (FStar_Absyn_Util.fvar None a (FStar_Ident.range_of_lid a))
in (let _149_438 = (let _149_437 = (FStar_All.pipe_left FStar_Absyn_Syntax.targ phi)
in (let _149_436 = (let _149_435 = (let _149_434 = (FStar_Absyn_Syntax.mk_Exp_constant FStar_Const.Const_unit None top.FStar_Parser_AST.range)
in (FStar_All.pipe_left FStar_Absyn_Syntax.varg _149_434))
in (_149_435)::[])
in (_149_437)::_149_436))
in (_149_439, _149_438)))
in (FStar_Absyn_Syntax.mk_Exp_app _149_440))
in (FStar_All.pipe_left pos _149_441)))
end
| FStar_Parser_AST.App (_60_1309) -> begin
(

let rec aux = (fun args e -> (match ((let _149_446 = (unparen e)
in _149_446.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.App (e, t, imp) -> begin
(

let arg = (let _149_447 = (desugar_typ_or_exp env t)
in (FStar_All.pipe_left (arg_withimp_e imp) _149_447))
in (aux ((arg)::args) e))
end
| _60_1321 -> begin
(

let head = (desugar_exp env e)
in (FStar_All.pipe_left pos (FStar_Absyn_Syntax.mk_Exp_app (head, args))))
end))
in (aux [] top))
end
| FStar_Parser_AST.Seq (t1, t2) -> begin
(let _149_453 = (let _149_452 = (let _149_451 = (let _149_450 = (desugar_exp env (FStar_Parser_AST.mk_term (FStar_Parser_AST.Let ((false, (((FStar_Parser_AST.mk_pattern FStar_Parser_AST.PatWild t1.FStar_Parser_AST.range), t1))::[], t2))) top.FStar_Parser_AST.range FStar_Parser_AST.Expr))
in (_149_450, FStar_Absyn_Syntax.Sequence))
in FStar_Absyn_Syntax.Meta_desugared (_149_451))
in (FStar_Absyn_Syntax.mk_Exp_meta _149_452))
in (FStar_All.pipe_left setpos _149_453))
end
| FStar_Parser_AST.Let (is_rec, (pat, _snd)::_tl, body) -> begin
(

let ds_let_rec = (fun _60_1337 -> (match (()) with
| () -> begin
(

let bindings = ((pat, _snd))::_tl
in (

let funs = (FStar_All.pipe_right bindings (FStar_List.map (fun _60_1341 -> (match (_60_1341) with
| (p, def) -> begin
if (is_app_pattern p) then begin
(let _149_457 = (destruct_app_pattern env top_level p)
in (_149_457, def))
end else begin
(match ((FStar_Parser_AST.un_function p def)) with
| Some (p, def) -> begin
(let _149_458 = (destruct_app_pattern env top_level p)
in (_149_458, def))
end
| _60_1347 -> begin
(match (p.FStar_Parser_AST.pat) with
| FStar_Parser_AST.PatAscribed ({FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (id, _60_1352); FStar_Parser_AST.prange = _60_1349}, t) -> begin
if top_level then begin
(let _149_461 = (let _149_460 = (let _149_459 = (FStar_Parser_DesugarEnv.qualify env id)
in FStar_Util.Inr (_149_459))
in (_149_460, [], Some (t)))
in (_149_461, def))
end else begin
((FStar_Util.Inl (id), [], Some (t)), def)
end
end
| FStar_Parser_AST.PatVar (id, _60_1361) -> begin
if top_level then begin
(let _149_464 = (let _149_463 = (let _149_462 = (FStar_Parser_DesugarEnv.qualify env id)
in FStar_Util.Inr (_149_462))
in (_149_463, [], None))
in (_149_464, def))
end else begin
((FStar_Util.Inl (id), [], None), def)
end
end
| _60_1365 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected let binding", p.FStar_Parser_AST.prange))))
end)
end)
end
end))))
in (

let _60_1391 = (FStar_List.fold_left (fun _60_1369 _60_1378 -> (match ((_60_1369, _60_1378)) with
| ((env, fnames), ((f, _60_1372, _60_1374), _60_1377)) -> begin
(

let _60_1388 = (match (f) with
| FStar_Util.Inl (x) -> begin
(

let _60_1383 = (FStar_Parser_DesugarEnv.push_local_vbinding env x)
in (match (_60_1383) with
| (env, xx) -> begin
(env, FStar_Util.Inl (xx))
end))
end
| FStar_Util.Inr (l) -> begin
(let _149_467 = (FStar_Parser_DesugarEnv.push_rec_binding env (FStar_Parser_DesugarEnv.Binding_let (l)))
in (_149_467, FStar_Util.Inr (l)))
end)
in (match (_60_1388) with
| (env, lbname) -> begin
(env, (lbname)::fnames)
end))
end)) (env, []) funs)
in (match (_60_1391) with
| (env', fnames) -> begin
(

let fnames = (FStar_List.rev fnames)
in (

let desugar_one_def = (fun env lbname _60_1402 -> (match (_60_1402) with
| ((_60_1397, args, result_t), def) -> begin
(

let def = (match (result_t) with
| None -> begin
def
end
| Some (t) -> begin
(let _149_474 = (FStar_Range.union_ranges t.FStar_Parser_AST.range def.FStar_Parser_AST.range)
in (FStar_Parser_AST.mk_term (FStar_Parser_AST.Ascribed ((def, t))) _149_474 FStar_Parser_AST.Expr))
end)
in (

let def = (match (args) with
| [] -> begin
def
end
| _60_1409 -> begin
(FStar_Parser_AST.mk_term (FStar_Parser_AST.un_curry_abs args def) top.FStar_Parser_AST.range top.FStar_Parser_AST.level)
end)
in (

let body = (desugar_exp env def)
in (mk_lb (lbname, FStar_Absyn_Syntax.tun, body)))))
end))
in (

let lbs = (FStar_List.map2 (desugar_one_def (if is_rec then begin
env'
end else begin
env
end)) fnames funs)
in (

let body = (desugar_exp env' body)
in (FStar_All.pipe_left pos (FStar_Absyn_Syntax.mk_Exp_let ((is_rec, lbs), body)))))))
end))))
end))
in (

let ds_non_rec = (fun pat t1 t2 -> (

let t1 = (desugar_exp env t1)
in (

let _60_1422 = (desugar_binding_pat_maybe_top top_level env pat)
in (match (_60_1422) with
| (env, binder, pat) -> begin
(match (binder) with
| TBinder (_60_1424) -> begin
(FStar_All.failwith "Unexpected type binder in let")
end
| LetBinder (l, t) -> begin
(

let body = (desugar_exp env t2)
in (FStar_All.pipe_left pos (FStar_Absyn_Syntax.mk_Exp_let ((false, ({FStar_Absyn_Syntax.lbname = FStar_Util.Inr (l); FStar_Absyn_Syntax.lbtyp = t; FStar_Absyn_Syntax.lbeff = FStar_Absyn_Const.effect_ALL_lid; FStar_Absyn_Syntax.lbdef = t1})::[]), body))))
end
| VBinder (x, t, _60_1434) -> begin
(

let body = (desugar_exp env t2)
in (

let body = (match (pat) with
| (None) | (Some ({FStar_Absyn_Syntax.v = FStar_Absyn_Syntax.Pat_wild (_); FStar_Absyn_Syntax.sort = _; FStar_Absyn_Syntax.p = _})) -> begin
body
end
| Some (pat) -> begin
(let _149_486 = (let _149_485 = (FStar_Absyn_Util.bvd_to_exp x t)
in (_149_485, ((pat, None, body))::[]))
in (FStar_Absyn_Syntax.mk_Exp_match _149_486 None body.FStar_Absyn_Syntax.pos))
end)
in (FStar_All.pipe_left pos (FStar_Absyn_Syntax.mk_Exp_let ((false, ((mk_lb (FStar_Util.Inl (x), t, t1)))::[]), body)))))
end)
end))))
in if (is_rec || (is_app_pattern pat)) then begin
(ds_let_rec ())
end else begin
(ds_non_rec pat _snd body)
end))
end
| FStar_Parser_AST.If (t1, t2, t3) -> begin
(let _149_499 = (let _149_498 = (let _149_497 = (desugar_exp env t1)
in (let _149_496 = (let _149_495 = (let _149_491 = (desugar_exp env t2)
in ((FStar_Absyn_Util.withinfo (FStar_Absyn_Syntax.Pat_constant (FStar_Const.Const_bool (true))) None t2.FStar_Parser_AST.range), None, _149_491))
in (let _149_494 = (let _149_493 = (let _149_492 = (desugar_exp env t3)
in ((FStar_Absyn_Util.withinfo (FStar_Absyn_Syntax.Pat_constant (FStar_Const.Const_bool (false))) None t3.FStar_Parser_AST.range), None, _149_492))
in (_149_493)::[])
in (_149_495)::_149_494))
in (_149_497, _149_496)))
in (FStar_Absyn_Syntax.mk_Exp_match _149_498))
in (FStar_All.pipe_left pos _149_499))
end
| FStar_Parser_AST.TryWith (e, branches) -> begin
(

let r = top.FStar_Parser_AST.range
in (

let handler = (FStar_Parser_AST.mk_function branches r r)
in (

let body = (FStar_Parser_AST.mk_function ((((FStar_Parser_AST.mk_pattern (FStar_Parser_AST.PatConst (FStar_Const.Const_unit)) r), None, e))::[]) r r)
in (

let a1 = (FStar_Parser_AST.mk_term (FStar_Parser_AST.App (((FStar_Parser_AST.mk_term (FStar_Parser_AST.Var (FStar_Absyn_Const.try_with_lid)) r top.FStar_Parser_AST.level), body, FStar_Parser_AST.Nothing))) r top.FStar_Parser_AST.level)
in (

let a2 = (FStar_Parser_AST.mk_term (FStar_Parser_AST.App ((a1, handler, FStar_Parser_AST.Nothing))) r top.FStar_Parser_AST.level)
in (desugar_exp env a2))))))
end
| FStar_Parser_AST.Match (e, branches) -> begin
(

let desugar_branch = (fun _60_1473 -> (match (_60_1473) with
| (pat, wopt, b) -> begin
(

let _60_1476 = (desugar_match_pat env pat)
in (match (_60_1476) with
| (env, pat) -> begin
(

let wopt = (match (wopt) with
| None -> begin
None
end
| Some (e) -> begin
(let _149_502 = (desugar_exp env e)
in Some (_149_502))
end)
in (

let b = (desugar_exp env b)
in (pat, wopt, b)))
end))
end))
in (let _149_508 = (let _149_507 = (let _149_506 = (desugar_exp env e)
in (let _149_505 = (FStar_List.map desugar_branch branches)
in (_149_506, _149_505)))
in (FStar_Absyn_Syntax.mk_Exp_match _149_507))
in (FStar_All.pipe_left pos _149_508)))
end
| FStar_Parser_AST.Ascribed (e, t) -> begin
(let _149_514 = (let _149_513 = (let _149_512 = (desugar_exp env e)
in (let _149_511 = (desugar_typ env t)
in (_149_512, _149_511, None)))
in (FStar_Absyn_Syntax.mk_Exp_ascribed _149_513))
in (FStar_All.pipe_left pos _149_514))
end
| FStar_Parser_AST.Record (_60_1487, []) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected empty record", top.FStar_Parser_AST.range))))
end
| FStar_Parser_AST.Record (eopt, fields) -> begin
(

let _60_1498 = (FStar_List.hd fields)
in (match (_60_1498) with
| (f, _60_1497) -> begin
(

let qfn = (fun g -> (FStar_Ident.lid_of_ids (FStar_List.append f.FStar_Ident.ns ((g)::[]))))
in (

let _60_1504 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_record_by_field_name env) f)
in (match (_60_1504) with
| (record, _60_1503) -> begin
(

let get_field = (fun xopt f -> (

let fn = f.FStar_Ident.ident
in (

let found = (FStar_All.pipe_right fields (FStar_Util.find_opt (fun _60_1512 -> (match (_60_1512) with
| (g, _60_1511) -> begin
(

let gn = g.FStar_Ident.ident
in (fn.FStar_Ident.idText = gn.FStar_Ident.idText))
end))))
in (match (found) with
| Some (_60_1516, e) -> begin
(let _149_522 = (qfn fn)
in (_149_522, e))
end
| None -> begin
(match (xopt) with
| None -> begin
(let _149_525 = (let _149_524 = (let _149_523 = (FStar_Util.format1 "Field %s is missing" (FStar_Ident.text_of_lid f))
in (_149_523, top.FStar_Parser_AST.range))
in FStar_Absyn_Syntax.Error (_149_524))
in (Prims.raise _149_525))
end
| Some (x) -> begin
(let _149_526 = (qfn fn)
in (_149_526, (FStar_Parser_AST.mk_term (FStar_Parser_AST.Project ((x, f))) x.FStar_Parser_AST.range x.FStar_Parser_AST.level)))
end)
end))))
in (

let recterm = (match (eopt) with
| None -> begin
(let _149_531 = (let _149_530 = (FStar_All.pipe_right record.FStar_Parser_DesugarEnv.fields (FStar_List.map (fun _60_1528 -> (match (_60_1528) with
| (f, _60_1527) -> begin
(let _149_529 = (let _149_528 = (get_field None f)
in (FStar_All.pipe_left Prims.snd _149_528))
in (_149_529, FStar_Parser_AST.Nothing))
end))))
in (record.FStar_Parser_DesugarEnv.constrname, _149_530))
in FStar_Parser_AST.Construct (_149_531))
end
| Some (e) -> begin
(

let x = (FStar_Absyn_Util.genident (Some (e.FStar_Parser_AST.range)))
in (

let xterm = (let _149_533 = (let _149_532 = (FStar_Ident.lid_of_ids ((x)::[]))
in FStar_Parser_AST.Var (_149_532))
in (FStar_Parser_AST.mk_term _149_533 x.FStar_Ident.idRange FStar_Parser_AST.Expr))
in (

let record = (let _149_536 = (let _149_535 = (FStar_All.pipe_right record.FStar_Parser_DesugarEnv.fields (FStar_List.map (fun _60_1536 -> (match (_60_1536) with
| (f, _60_1535) -> begin
(get_field (Some (xterm)) f)
end))))
in (None, _149_535))
in FStar_Parser_AST.Record (_149_536))
in FStar_Parser_AST.Let ((false, (((FStar_Parser_AST.mk_pattern (FStar_Parser_AST.PatVar ((x, None))) x.FStar_Ident.idRange), e))::[], (FStar_Parser_AST.mk_term record top.FStar_Parser_AST.range top.FStar_Parser_AST.level))))))
end)
in (

let recterm = (FStar_Parser_AST.mk_term recterm top.FStar_Parser_AST.range top.FStar_Parser_AST.level)
in (

let e = (desugar_exp env recterm)
in (match (e.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_meta (FStar_Absyn_Syntax.Meta_desugared ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_fvar (fv, _60_1559); FStar_Absyn_Syntax.tk = _60_1556; FStar_Absyn_Syntax.pos = _60_1554; FStar_Absyn_Syntax.fvs = _60_1552; FStar_Absyn_Syntax.uvs = _60_1550}, args); FStar_Absyn_Syntax.tk = _60_1548; FStar_Absyn_Syntax.pos = _60_1546; FStar_Absyn_Syntax.fvs = _60_1544; FStar_Absyn_Syntax.uvs = _60_1542}, FStar_Absyn_Syntax.Data_app)) -> begin
(

let e = (let _149_546 = (let _149_545 = (let _149_544 = (let _149_543 = (let _149_542 = (let _149_541 = (let _149_540 = (let _149_539 = (FStar_All.pipe_right record.FStar_Parser_DesugarEnv.fields (FStar_List.map Prims.fst))
in (record.FStar_Parser_DesugarEnv.typename, _149_539))
in FStar_Absyn_Syntax.Record_ctor (_149_540))
in Some (_149_541))
in (fv, _149_542))
in (FStar_Absyn_Syntax.mk_Exp_fvar _149_543 None e.FStar_Absyn_Syntax.pos))
in (_149_544, args))
in (FStar_Absyn_Syntax.mk_Exp_app _149_545))
in (FStar_All.pipe_left pos _149_546))
in (FStar_Absyn_Syntax.mk_Exp_meta (FStar_Absyn_Syntax.Meta_desugared ((e, FStar_Absyn_Syntax.Data_app)))))
end
| _60_1573 -> begin
e
end)))))
end)))
end))
end
| FStar_Parser_AST.Project (e, f) -> begin
(

let _60_1580 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_projector_by_field_name env) f)
in (match (_60_1580) with
| (fieldname, is_rec) -> begin
(

let e = (desugar_exp env e)
in (

let fn = (

let _60_1585 = (FStar_Util.prefix fieldname.FStar_Ident.ns)
in (match (_60_1585) with
| (ns, _60_1584) -> begin
(FStar_Ident.lid_of_ids (FStar_List.append ns ((f.FStar_Ident.ident)::[])))
end))
in (

let qual = if is_rec then begin
Some (FStar_Absyn_Syntax.Record_projector (fn))
end else begin
None
end
in (let _149_553 = (let _149_552 = (let _149_551 = (FStar_Absyn_Util.fvar qual fieldname (FStar_Ident.range_of_lid f))
in (let _149_550 = (let _149_549 = (FStar_Absyn_Syntax.varg e)
in (_149_549)::[])
in (_149_551, _149_550)))
in (FStar_Absyn_Syntax.mk_Exp_app _149_552))
in (FStar_All.pipe_left pos _149_553)))))
end))
end
| FStar_Parser_AST.Paren (e) -> begin
(desugar_exp env e)
end
| _60_1591 -> begin
(FStar_Parser_AST.error "Unexpected term" top top.FStar_Parser_AST.range)
end))))
and desugar_typ : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  FStar_Absyn_Syntax.typ = (fun env top -> (

let wpos = (fun t -> (t None top.FStar_Parser_AST.range))
in (

let setpos = (fun t -> (

let _60_1598 = t
in {FStar_Absyn_Syntax.n = _60_1598.FStar_Absyn_Syntax.n; FStar_Absyn_Syntax.tk = _60_1598.FStar_Absyn_Syntax.tk; FStar_Absyn_Syntax.pos = top.FStar_Parser_AST.range; FStar_Absyn_Syntax.fvs = _60_1598.FStar_Absyn_Syntax.fvs; FStar_Absyn_Syntax.uvs = _60_1598.FStar_Absyn_Syntax.uvs}))
in (

let top = (unparen top)
in (

let head_and_args = (fun t -> (

let rec aux = (fun args t -> (match ((let _149_576 = (unparen t)
in _149_576.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.App (t, arg, imp) -> begin
(aux (((arg, imp))::args) t)
end
| FStar_Parser_AST.Construct (l, args') -> begin
({FStar_Parser_AST.tm = FStar_Parser_AST.Name (l); FStar_Parser_AST.range = t.FStar_Parser_AST.range; FStar_Parser_AST.level = t.FStar_Parser_AST.level}, (FStar_List.append args' args))
end
| _60_1616 -> begin
(t, args)
end))
in (aux [] t)))
in (match (top.FStar_Parser_AST.tm) with
| FStar_Parser_AST.Wild -> begin
(setpos FStar_Absyn_Syntax.tun)
end
| FStar_Parser_AST.Requires (t, lopt) -> begin
(

let t = (label_conjuncts "pre-condition" true lopt t)
in if (is_type env t) then begin
(desugar_typ env t)
end else begin
(let _149_577 = (desugar_exp env t)
in (FStar_All.pipe_right _149_577 FStar_Absyn_Util.b2t))
end)
end
| FStar_Parser_AST.Ensures (t, lopt) -> begin
(

let t = (label_conjuncts "post-condition" false lopt t)
in if (is_type env t) then begin
(desugar_typ env t)
end else begin
(let _149_578 = (desugar_exp env t)
in (FStar_All.pipe_right _149_578 FStar_Absyn_Util.b2t))
end)
end
| FStar_Parser_AST.Op ("*", t1::_60_1630::[]) -> begin
if (is_type env t1) then begin
(

let rec flatten = (fun t -> (match (t.FStar_Parser_AST.tm) with
| FStar_Parser_AST.Op ("*", t1::t2::[]) -> begin
(

let rest = (flatten t2)
in (t1)::rest)
end
| _60_1645 -> begin
(t)::[]
end))
in (

let targs = (let _149_583 = (flatten top)
in (FStar_All.pipe_right _149_583 (FStar_List.map (fun t -> (let _149_582 = (desugar_typ env t)
in (FStar_Absyn_Syntax.targ _149_582))))))
in (

let tup = (let _149_584 = (FStar_Absyn_Util.mk_tuple_lid (FStar_List.length targs) top.FStar_Parser_AST.range)
in (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_typ_name env) _149_584))
in (FStar_All.pipe_left wpos (FStar_Absyn_Syntax.mk_Typ_app (tup, targs))))))
end else begin
(let _149_590 = (let _149_589 = (let _149_588 = (let _149_587 = (FStar_Parser_AST.term_to_string t1)
in (FStar_Util.format1 "The operator \"*\" is resolved here as multiplication since \"%s\" is a term, although a type was expected" _149_587))
in (_149_588, top.FStar_Parser_AST.range))
in FStar_Absyn_Syntax.Error (_149_589))
in (Prims.raise _149_590))
end
end
| FStar_Parser_AST.Op ("=!=", args) -> begin
(desugar_typ env (FStar_Parser_AST.mk_term (FStar_Parser_AST.Op (("~", ((FStar_Parser_AST.mk_term (FStar_Parser_AST.Op (("==", args))) top.FStar_Parser_AST.range top.FStar_Parser_AST.level))::[]))) top.FStar_Parser_AST.range top.FStar_Parser_AST.level))
end
| FStar_Parser_AST.Op (s, args) -> begin
(match ((op_as_tylid env (FStar_List.length args) top.FStar_Parser_AST.range s)) with
| None -> begin
(let _149_591 = (desugar_exp env top)
in (FStar_All.pipe_right _149_591 FStar_Absyn_Util.b2t))
end
| Some (l) -> begin
(

let args = (FStar_List.map (fun t -> (let _149_593 = (desugar_typ_or_exp env t)
in (FStar_All.pipe_left (arg_withimp_t FStar_Parser_AST.Nothing) _149_593))) args)
in (let _149_594 = (FStar_Absyn_Util.ftv l FStar_Absyn_Syntax.kun)
in (FStar_Absyn_Util.mk_typ_app _149_594 args)))
end)
end
| FStar_Parser_AST.Tvar (a) -> begin
(let _149_595 = (FStar_Parser_DesugarEnv.fail_or2 (FStar_Parser_DesugarEnv.try_lookup_typ_var env) a)
in (FStar_All.pipe_left setpos _149_595))
end
| (FStar_Parser_AST.Var (l)) | (FStar_Parser_AST.Name (l)) when ((FStar_List.length l.FStar_Ident.ns) = 0) -> begin
(match ((FStar_Parser_DesugarEnv.try_lookup_typ_var env l.FStar_Ident.ident)) with
| Some (t) -> begin
(setpos t)
end
| None -> begin
(let _149_596 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_typ_name env) l)
in (FStar_All.pipe_left setpos _149_596))
end)
end
| (FStar_Parser_AST.Var (l)) | (FStar_Parser_AST.Name (l)) -> begin
(

let l = (FStar_Absyn_Util.set_lid_range l top.FStar_Parser_AST.range)
in (let _149_597 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_typ_name env) l)
in (FStar_All.pipe_left setpos _149_597)))
end
| FStar_Parser_AST.Construct (l, args) -> begin
(

let t = (let _149_598 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_typ_name env) l)
in (FStar_All.pipe_left setpos _149_598))
in (

let args = (FStar_List.map (fun _60_1681 -> (match (_60_1681) with
| (t, imp) -> begin
(let _149_600 = (desugar_typ_or_exp env t)
in (FStar_All.pipe_left (arg_withimp_t imp) _149_600))
end)) args)
in (FStar_Absyn_Util.mk_typ_app t args)))
end
| FStar_Parser_AST.Abs (binders, body) -> begin
(

let rec aux = (fun env bs _60_9 -> (match (_60_9) with
| [] -> begin
(

let body = (desugar_typ env body)
in (FStar_All.pipe_left wpos (FStar_Absyn_Syntax.mk_Typ_lam ((FStar_List.rev bs), body))))
end
| hd::tl -> begin
(

let _60_1699 = (desugar_binding_pat env hd)
in (match (_60_1699) with
| (env, bnd, pat) -> begin
(match (pat) with
| Some (q) -> begin
(let _149_612 = (let _149_611 = (let _149_610 = (let _149_609 = (FStar_Absyn_Print.pat_to_string q)
in (FStar_Util.format1 "Pattern matching at the type level is not supported; got %s\n" _149_609))
in (_149_610, hd.FStar_Parser_AST.prange))
in FStar_Absyn_Syntax.Error (_149_611))
in (Prims.raise _149_612))
end
| None -> begin
(

let b = (binder_of_bnd bnd)
in (aux env ((b)::bs) tl))
end)
end))
end))
in (aux env [] binders))
end
| FStar_Parser_AST.App (_60_1705) -> begin
(

let rec aux = (fun args e -> (match ((let _149_617 = (unparen e)
in _149_617.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.App (e, arg, imp) -> begin
(

let arg = (let _149_618 = (desugar_typ_or_exp env arg)
in (FStar_All.pipe_left (arg_withimp_t imp) _149_618))
in (aux ((arg)::args) e))
end
| _60_1717 -> begin
(

let head = (desugar_typ env e)
in (FStar_All.pipe_left wpos (FStar_Absyn_Syntax.mk_Typ_app (head, args))))
end))
in (aux [] top))
end
| FStar_Parser_AST.Product ([], t) -> begin
(FStar_All.failwith "Impossible: product with no binders")
end
| FStar_Parser_AST.Product (binders, t) -> begin
(

let _60_1729 = (uncurry binders t)
in (match (_60_1729) with
| (bs, t) -> begin
(

let rec aux = (fun env bs _60_10 -> (match (_60_10) with
| [] -> begin
(

let cod = (desugar_comp top.FStar_Parser_AST.range true env t)
in (FStar_All.pipe_left wpos (FStar_Absyn_Syntax.mk_Typ_fun ((FStar_List.rev bs), cod))))
end
| hd::tl -> begin
(

let mlenv = (FStar_Parser_DesugarEnv.default_ml env)
in (

let bb = (desugar_binder mlenv hd)
in (

let _60_1743 = (as_binder env hd.FStar_Parser_AST.aqual bb)
in (match (_60_1743) with
| (b, env) -> begin
(aux env ((b)::bs) tl)
end))))
end))
in (aux env [] bs))
end))
end
| FStar_Parser_AST.Refine (b, f) -> begin
(match ((desugar_exp_binder env b)) with
| (None, _60_1750) -> begin
(FStar_All.failwith "Missing binder in refinement")
end
| b -> begin
(

let _60_1764 = (match ((as_binder env None (FStar_Util.Inr (b)))) with
| ((FStar_Util.Inr (x), _60_1756), env) -> begin
(x, env)
end
| _60_1761 -> begin
(FStar_All.failwith "impossible")
end)
in (match (_60_1764) with
| (b, env) -> begin
(

let f = if (is_type env f) then begin
(desugar_formula env f)
end else begin
(let _149_629 = (desugar_exp env f)
in (FStar_All.pipe_right _149_629 FStar_Absyn_Util.b2t))
end
in (FStar_All.pipe_left wpos (FStar_Absyn_Syntax.mk_Typ_refine (b, f))))
end))
end)
end
| (FStar_Parser_AST.NamedTyp (_, t)) | (FStar_Parser_AST.Paren (t)) -> begin
(desugar_typ env t)
end
| FStar_Parser_AST.Ascribed (t, k) -> begin
(let _149_637 = (let _149_636 = (let _149_635 = (desugar_typ env t)
in (let _149_634 = (desugar_kind env k)
in (_149_635, _149_634)))
in (FStar_Absyn_Syntax.mk_Typ_ascribed' _149_636))
in (FStar_All.pipe_left wpos _149_637))
end
| FStar_Parser_AST.Sum (binders, t) -> begin
(

let _60_1798 = (FStar_List.fold_left (fun _60_1783 b -> (match (_60_1783) with
| (env, tparams, typs) -> begin
(

let _60_1787 = (desugar_exp_binder env b)
in (match (_60_1787) with
| (xopt, t) -> begin
(

let _60_1793 = (match (xopt) with
| None -> begin
(let _149_640 = (FStar_Absyn_Util.new_bvd (Some (top.FStar_Parser_AST.range)))
in (env, _149_640))
end
| Some (x) -> begin
(FStar_Parser_DesugarEnv.push_local_vbinding env x)
end)
in (match (_60_1793) with
| (env, x) -> begin
(let _149_644 = (let _149_643 = (let _149_642 = (let _149_641 = (FStar_Absyn_Util.close_with_lam tparams t)
in (FStar_All.pipe_left FStar_Absyn_Syntax.targ _149_641))
in (_149_642)::[])
in (FStar_List.append typs _149_643))
in (env, (FStar_List.append tparams (((FStar_Util.Inr ((FStar_Absyn_Util.bvd_to_bvar_s x t)), None))::[])), _149_644))
end))
end))
end)) (env, [], []) (FStar_List.append binders (((FStar_Parser_AST.mk_binder (FStar_Parser_AST.NoName (t)) t.FStar_Parser_AST.range FStar_Parser_AST.Type None))::[])))
in (match (_60_1798) with
| (env, _60_1796, targs) -> begin
(

let tup = (let _149_645 = (FStar_Absyn_Util.mk_dtuple_lid (FStar_List.length targs) top.FStar_Parser_AST.range)
in (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_typ_name env) _149_645))
in (FStar_All.pipe_left wpos (FStar_Absyn_Syntax.mk_Typ_app (tup, targs))))
end))
end
| FStar_Parser_AST.Record (_60_1801) -> begin
(FStar_All.failwith "Unexpected record type")
end
| FStar_Parser_AST.Let (false, (x, v)::[], t) -> begin
(

let let_v = (FStar_Parser_AST.mk_term (FStar_Parser_AST.App (((FStar_Parser_AST.mk_term (FStar_Parser_AST.Name (FStar_Absyn_Const.let_in_typ)) top.FStar_Parser_AST.range top.FStar_Parser_AST.level), v, FStar_Parser_AST.Nothing))) v.FStar_Parser_AST.range v.FStar_Parser_AST.level)
in (

let t' = (FStar_Parser_AST.mk_term (FStar_Parser_AST.App ((let_v, (FStar_Parser_AST.mk_term (FStar_Parser_AST.Abs (((x)::[], t))) t.FStar_Parser_AST.range t.FStar_Parser_AST.level), FStar_Parser_AST.Nothing))) top.FStar_Parser_AST.range top.FStar_Parser_AST.level)
in (desugar_typ env t')))
end
| (FStar_Parser_AST.If (_)) | (FStar_Parser_AST.Labeled (_)) -> begin
(desugar_formula env top)
end
| _60_1820 when (top.FStar_Parser_AST.level = FStar_Parser_AST.Formula) -> begin
(desugar_formula env top)
end
| _60_1822 -> begin
(FStar_Parser_AST.error "Expected a type" top top.FStar_Parser_AST.range)
end))))))
and desugar_comp : FStar_Range.range  ->  Prims.bool  ->  FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  FStar_Absyn_Syntax.comp = (fun r default_ok env t -> (

let fail = (fun msg -> (Prims.raise (FStar_Absyn_Syntax.Error ((msg, r)))))
in (

let pre_process_comp_typ = (fun t -> (

let _60_1833 = (head_and_args t)
in (match (_60_1833) with
| (head, args) -> begin
(match (head.FStar_Parser_AST.tm) with
| FStar_Parser_AST.Name (lemma) when (lemma.FStar_Ident.ident.FStar_Ident.idText = "Lemma") -> begin
(

let unit = ((FStar_Parser_AST.mk_term (FStar_Parser_AST.Name (FStar_Absyn_Const.unit_lid)) t.FStar_Parser_AST.range FStar_Parser_AST.Type), FStar_Parser_AST.Nothing)
in (

let nil_pat = ((FStar_Parser_AST.mk_term (FStar_Parser_AST.Name (FStar_Absyn_Const.nil_lid)) t.FStar_Parser_AST.range FStar_Parser_AST.Expr), FStar_Parser_AST.Nothing)
in (

let _60_1859 = (FStar_All.pipe_right args (FStar_List.partition (fun _60_1841 -> (match (_60_1841) with
| (arg, _60_1840) -> begin
(match ((let _149_657 = (unparen arg)
in _149_657.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.App ({FStar_Parser_AST.tm = FStar_Parser_AST.Var (d); FStar_Parser_AST.range = _60_1845; FStar_Parser_AST.level = _60_1843}, _60_1850, _60_1852) -> begin
(d.FStar_Ident.ident.FStar_Ident.idText = "decreases")
end
| _60_1856 -> begin
false
end)
end))))
in (match (_60_1859) with
| (decreases_clause, args) -> begin
(

let args = (match (args) with
| [] -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Not enough arguments to \'Lemma\'", t.FStar_Parser_AST.range))))
end
| ens::[] -> begin
(

let req_true = ((FStar_Parser_AST.mk_term (FStar_Parser_AST.Requires (((FStar_Parser_AST.mk_term (FStar_Parser_AST.Name (FStar_Absyn_Const.true_lid)) t.FStar_Parser_AST.range FStar_Parser_AST.Formula), None))) t.FStar_Parser_AST.range FStar_Parser_AST.Type), FStar_Parser_AST.Nothing)
in (unit)::(req_true)::(ens)::(nil_pat)::[])
end
| req::ens::[] -> begin
(unit)::(req)::(ens)::(nil_pat)::[]
end
| more -> begin
(unit)::more
end)
in (

let t = (FStar_Parser_AST.mk_term (FStar_Parser_AST.Construct ((lemma, (FStar_List.append args decreases_clause)))) t.FStar_Parser_AST.range t.FStar_Parser_AST.level)
in (desugar_typ env t)))
end))))
end
| FStar_Parser_AST.Name (tot) when (((tot.FStar_Ident.ident.FStar_Ident.idText = "Tot") && (not ((FStar_Parser_DesugarEnv.is_effect_name env FStar_Absyn_Const.effect_Tot_lid)))) && (let _149_658 = (FStar_Parser_DesugarEnv.current_module env)
in (FStar_Ident.lid_equals _149_658 FStar_Absyn_Const.prims_lid))) -> begin
(

let args = (FStar_List.map (fun _60_1874 -> (match (_60_1874) with
| (t, imp) -> begin
(let _149_660 = (desugar_typ_or_exp env t)
in (FStar_All.pipe_left (arg_withimp_t imp) _149_660))
end)) args)
in (let _149_661 = (FStar_Absyn_Util.ftv FStar_Absyn_Const.effect_Tot_lid FStar_Absyn_Syntax.kun)
in (FStar_Absyn_Util.mk_typ_app _149_661 args)))
end
| _60_1877 -> begin
(desugar_typ env t)
end)
end)))
in (

let t = (pre_process_comp_typ t)
in (

let _60_1881 = (FStar_Absyn_Util.head_and_args t)
in (match (_60_1881) with
| (head, args) -> begin
(match ((let _149_663 = (let _149_662 = (FStar_Absyn_Util.compress_typ head)
in _149_662.FStar_Absyn_Syntax.n)
in (_149_663, args))) with
| (FStar_Absyn_Syntax.Typ_const (eff), (FStar_Util.Inl (result_typ), _60_1888)::rest) -> begin
(

let _60_1928 = (FStar_All.pipe_right rest (FStar_List.partition (fun _60_11 -> (match (_60_11) with
| (FStar_Util.Inr (_60_1894), _60_1897) -> begin
false
end
| (FStar_Util.Inl (t), _60_1902) -> begin
(match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_const (fv); FStar_Absyn_Syntax.tk = _60_1911; FStar_Absyn_Syntax.pos = _60_1909; FStar_Absyn_Syntax.fvs = _60_1907; FStar_Absyn_Syntax.uvs = _60_1905}, (FStar_Util.Inr (_60_1916), _60_1919)::[]) -> begin
(FStar_Ident.lid_equals fv.FStar_Absyn_Syntax.v FStar_Absyn_Const.decreases_lid)
end
| _60_1925 -> begin
false
end)
end))))
in (match (_60_1928) with
| (dec, rest) -> begin
(

let decreases_clause = (FStar_All.pipe_right dec (FStar_List.map (fun _60_12 -> (match (_60_12) with
| (FStar_Util.Inl (t), _60_1933) -> begin
(match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_app (_60_1936, (FStar_Util.Inr (arg), _60_1940)::[]) -> begin
FStar_Absyn_Syntax.DECREASES (arg)
end
| _60_1946 -> begin
(FStar_All.failwith "impos")
end)
end
| _60_1948 -> begin
(FStar_All.failwith "impos")
end))))
in if ((FStar_Parser_DesugarEnv.is_effect_name env eff.FStar_Absyn_Syntax.v) || (FStar_Ident.lid_equals eff.FStar_Absyn_Syntax.v FStar_Absyn_Const.effect_Tot_lid)) then begin
if ((FStar_Ident.lid_equals eff.FStar_Absyn_Syntax.v FStar_Absyn_Const.effect_Tot_lid) && ((FStar_List.length decreases_clause) = 0)) then begin
(FStar_Absyn_Syntax.mk_Total result_typ)
end else begin
(

let flags = if (FStar_Ident.lid_equals eff.FStar_Absyn_Syntax.v FStar_Absyn_Const.effect_Lemma_lid) then begin
(FStar_Absyn_Syntax.LEMMA)::[]
end else begin
if (FStar_Ident.lid_equals eff.FStar_Absyn_Syntax.v FStar_Absyn_Const.effect_Tot_lid) then begin
(FStar_Absyn_Syntax.TOTAL)::[]
end else begin
if (FStar_Ident.lid_equals eff.FStar_Absyn_Syntax.v FStar_Absyn_Const.effect_ML_lid) then begin
(FStar_Absyn_Syntax.MLEFFECT)::[]
end else begin
[]
end
end
end
in (

let rest = if (FStar_Ident.lid_equals eff.FStar_Absyn_Syntax.v FStar_Absyn_Const.effect_Lemma_lid) then begin
(match (rest) with
| req::ens::(FStar_Util.Inr (pat), aq)::[] -> begin
(let _149_670 = (let _149_669 = (let _149_668 = (let _149_667 = (let _149_666 = (FStar_Absyn_Syntax.mk_Exp_meta (FStar_Absyn_Syntax.Meta_desugared ((pat, FStar_Absyn_Syntax.Meta_smt_pat))))
in FStar_Util.Inr (_149_666))
in (_149_667, aq))
in (_149_668)::[])
in (ens)::_149_669)
in (req)::_149_670)
end
| _60_1959 -> begin
rest
end)
end else begin
rest
end
in (FStar_Absyn_Syntax.mk_Comp {FStar_Absyn_Syntax.effect_name = eff.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.result_typ = result_typ; FStar_Absyn_Syntax.effect_args = rest; FStar_Absyn_Syntax.flags = (FStar_List.append flags decreases_clause)})))
end
end else begin
if default_ok then begin
(env.FStar_Parser_DesugarEnv.default_result_effect t r)
end else begin
(let _149_672 = (let _149_671 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.format1 "%s is not an effect" _149_671))
in (fail _149_672))
end
end)
end))
end
| _60_1962 -> begin
if default_ok then begin
(env.FStar_Parser_DesugarEnv.default_result_effect t r)
end else begin
(let _149_674 = (let _149_673 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.format1 "%s is not an effect" _149_673))
in (fail _149_674))
end
end)
end))))))
and desugar_kind : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  FStar_Absyn_Syntax.knd = (fun env k -> (

let pos = (fun f -> (f k.FStar_Parser_AST.range))
in (

let setpos = (fun kk -> (

let _60_1969 = kk
in {FStar_Absyn_Syntax.n = _60_1969.FStar_Absyn_Syntax.n; FStar_Absyn_Syntax.tk = _60_1969.FStar_Absyn_Syntax.tk; FStar_Absyn_Syntax.pos = k.FStar_Parser_AST.range; FStar_Absyn_Syntax.fvs = _60_1969.FStar_Absyn_Syntax.fvs; FStar_Absyn_Syntax.uvs = _60_1969.FStar_Absyn_Syntax.uvs}))
in (

let k = (unparen k)
in (match (k.FStar_Parser_AST.tm) with
| FStar_Parser_AST.Name ({FStar_Ident.ns = _60_1978; FStar_Ident.ident = _60_1976; FStar_Ident.nsstr = _60_1974; FStar_Ident.str = "Type"}) -> begin
(setpos FStar_Absyn_Syntax.mk_Kind_type)
end
| FStar_Parser_AST.Name ({FStar_Ident.ns = _60_1987; FStar_Ident.ident = _60_1985; FStar_Ident.nsstr = _60_1983; FStar_Ident.str = "Effect"}) -> begin
(setpos FStar_Absyn_Syntax.mk_Kind_effect)
end
| FStar_Parser_AST.Name (l) -> begin
(match ((let _149_686 = (FStar_Parser_DesugarEnv.qualify_lid env l)
in (FStar_Parser_DesugarEnv.find_kind_abbrev env _149_686))) with
| Some (l) -> begin
(FStar_All.pipe_left pos (FStar_Absyn_Syntax.mk_Kind_abbrev ((l, []), FStar_Absyn_Syntax.mk_Kind_unknown)))
end
| _60_1995 -> begin
(FStar_Parser_AST.error "Unexpected term where kind was expected" k k.FStar_Parser_AST.range)
end)
end
| FStar_Parser_AST.Wild -> begin
(setpos FStar_Absyn_Syntax.kun)
end
| FStar_Parser_AST.Product (bs, k) -> begin
(

let _60_2003 = (uncurry bs k)
in (match (_60_2003) with
| (bs, k) -> begin
(

let rec aux = (fun env bs _60_13 -> (match (_60_13) with
| [] -> begin
(let _149_697 = (let _149_696 = (let _149_695 = (desugar_kind env k)
in ((FStar_List.rev bs), _149_695))
in (FStar_Absyn_Syntax.mk_Kind_arrow _149_696))
in (FStar_All.pipe_left pos _149_697))
end
| hd::tl -> begin
(

let _60_2014 = (let _149_699 = (let _149_698 = (FStar_Parser_DesugarEnv.default_ml env)
in (desugar_binder _149_698 hd))
in (FStar_All.pipe_right _149_699 (as_binder env hd.FStar_Parser_AST.aqual)))
in (match (_60_2014) with
| (b, env) -> begin
(aux env ((b)::bs) tl)
end))
end))
in (aux env [] bs))
end))
end
| FStar_Parser_AST.Construct (l, args) -> begin
(match ((FStar_Parser_DesugarEnv.find_kind_abbrev env l)) with
| None -> begin
(FStar_Parser_AST.error "Unexpected term where kind was expected" k k.FStar_Parser_AST.range)
end
| Some (l) -> begin
(

let args = (FStar_List.map (fun _60_2024 -> (match (_60_2024) with
| (t, b) -> begin
(

let qual = if (b = FStar_Parser_AST.Hash) then begin
Some (imp_tag)
end else begin
None
end
in (let _149_701 = (desugar_typ_or_exp env t)
in (_149_701, qual)))
end)) args)
in (FStar_All.pipe_left pos (FStar_Absyn_Syntax.mk_Kind_abbrev ((l, args), FStar_Absyn_Syntax.mk_Kind_unknown))))
end)
end
| _60_2028 -> begin
(FStar_Parser_AST.error "Unexpected term where kind was expected" k k.FStar_Parser_AST.range)
end)))))
and desugar_formula' : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.term  ->  FStar_Absyn_Syntax.typ = (fun env f -> (

let connective = (fun s -> (match (s) with
| "/\\" -> begin
Some (FStar_Absyn_Const.and_lid)
end
| "\\/" -> begin
Some (FStar_Absyn_Const.or_lid)
end
| "==>" -> begin
Some (FStar_Absyn_Const.imp_lid)
end
| "<==>" -> begin
Some (FStar_Absyn_Const.iff_lid)
end
| "~" -> begin
Some (FStar_Absyn_Const.not_lid)
end
| _60_2039 -> begin
None
end))
in (

let pos = (fun t -> (t None f.FStar_Parser_AST.range))
in (

let setpos = (fun t -> (

let _60_2044 = t
in {FStar_Absyn_Syntax.n = _60_2044.FStar_Absyn_Syntax.n; FStar_Absyn_Syntax.tk = _60_2044.FStar_Absyn_Syntax.tk; FStar_Absyn_Syntax.pos = f.FStar_Parser_AST.range; FStar_Absyn_Syntax.fvs = _60_2044.FStar_Absyn_Syntax.fvs; FStar_Absyn_Syntax.uvs = _60_2044.FStar_Absyn_Syntax.uvs}))
in (

let desugar_quant = (fun q qt b pats body -> (

let tk = (desugar_binder env (

let _60_2052 = b
in {FStar_Parser_AST.b = _60_2052.FStar_Parser_AST.b; FStar_Parser_AST.brange = _60_2052.FStar_Parser_AST.brange; FStar_Parser_AST.blevel = FStar_Parser_AST.Formula; FStar_Parser_AST.aqual = _60_2052.FStar_Parser_AST.aqual}))
in (

let desugar_pats = (fun env pats -> (FStar_List.map (fun es -> (FStar_All.pipe_right es (FStar_List.map (fun e -> (let _149_737 = (desugar_typ_or_exp env e)
in (FStar_All.pipe_left (arg_withimp_t FStar_Parser_AST.Nothing) _149_737)))))) pats))
in (match (tk) with
| FStar_Util.Inl (Some (a), k) -> begin
(

let _60_2067 = (FStar_Parser_DesugarEnv.push_local_tbinding env a)
in (match (_60_2067) with
| (env, a) -> begin
(

let pats = (desugar_pats env pats)
in (

let body = (desugar_formula env body)
in (

let body = (match (pats) with
| [] -> begin
body
end
| _60_2072 -> begin
(let _149_738 = (FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_pattern ((body, pats))))
in (FStar_All.pipe_left setpos _149_738))
end)
in (

let body = (let _149_744 = (let _149_743 = (let _149_742 = (let _149_741 = (FStar_Absyn_Syntax.t_binder (FStar_Absyn_Util.bvd_to_bvar_s a k))
in (_149_741)::[])
in (_149_742, body))
in (FStar_Absyn_Syntax.mk_Typ_lam _149_743))
in (FStar_All.pipe_left pos _149_744))
in (let _149_749 = (let _149_748 = (let _149_745 = (FStar_Ident.set_lid_range qt b.FStar_Parser_AST.brange)
in (FStar_Absyn_Util.ftv _149_745 FStar_Absyn_Syntax.kun))
in (let _149_747 = (let _149_746 = (FStar_Absyn_Syntax.targ body)
in (_149_746)::[])
in (FStar_Absyn_Util.mk_typ_app _149_748 _149_747)))
in (FStar_All.pipe_left setpos _149_749))))))
end))
end
| FStar_Util.Inr (Some (x), t) -> begin
(

let _60_2082 = (FStar_Parser_DesugarEnv.push_local_vbinding env x)
in (match (_60_2082) with
| (env, x) -> begin
(

let pats = (desugar_pats env pats)
in (

let body = (desugar_formula env body)
in (

let body = (match (pats) with
| [] -> begin
body
end
| _60_2087 -> begin
(FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_pattern ((body, pats))))
end)
in (

let body = (let _149_755 = (let _149_754 = (let _149_753 = (let _149_752 = (FStar_Absyn_Syntax.v_binder (FStar_Absyn_Util.bvd_to_bvar_s x t))
in (_149_752)::[])
in (_149_753, body))
in (FStar_Absyn_Syntax.mk_Typ_lam _149_754))
in (FStar_All.pipe_left pos _149_755))
in (let _149_760 = (let _149_759 = (let _149_756 = (FStar_Ident.set_lid_range q b.FStar_Parser_AST.brange)
in (FStar_Absyn_Util.ftv _149_756 FStar_Absyn_Syntax.kun))
in (let _149_758 = (let _149_757 = (FStar_Absyn_Syntax.targ body)
in (_149_757)::[])
in (FStar_Absyn_Util.mk_typ_app _149_759 _149_758)))
in (FStar_All.pipe_left setpos _149_760))))))
end))
end
| _60_2091 -> begin
(FStar_All.failwith "impossible")
end))))
in (

let push_quant = (fun q binders pats body -> (match (binders) with
| b::b'::_rest -> begin
(

let rest = (b')::_rest
in (

let body = (let _149_775 = (q (rest, pats, body))
in (let _149_774 = (FStar_Range.union_ranges b'.FStar_Parser_AST.brange body.FStar_Parser_AST.range)
in (FStar_Parser_AST.mk_term _149_775 _149_774 FStar_Parser_AST.Formula)))
in (let _149_776 = (q ((b)::[], [], body))
in (FStar_Parser_AST.mk_term _149_776 f.FStar_Parser_AST.range FStar_Parser_AST.Formula))))
end
| _60_2105 -> begin
(FStar_All.failwith "impossible")
end))
in (match ((let _149_777 = (unparen f)
in _149_777.FStar_Parser_AST.tm)) with
| FStar_Parser_AST.Labeled (f, l, p) -> begin
(

let f = (desugar_formula env f)
in (FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_labeled ((f, l, FStar_Absyn_Syntax.dummyRange, p)))))
end
| FStar_Parser_AST.Op ("==", hd::_args) -> begin
(

let args = (hd)::_args
in (

let args = (FStar_List.map (fun t -> (let _149_779 = (desugar_typ_or_exp env t)
in (FStar_All.pipe_left (arg_withimp_t FStar_Parser_AST.Nothing) _149_779))) args)
in (

let eq = if (is_type env hd) then begin
(let _149_780 = (FStar_Ident.set_lid_range FStar_Absyn_Const.eqT_lid f.FStar_Parser_AST.range)
in (FStar_Absyn_Util.ftv _149_780 FStar_Absyn_Syntax.kun))
end else begin
(let _149_781 = (FStar_Ident.set_lid_range FStar_Absyn_Const.eq2_lid f.FStar_Parser_AST.range)
in (FStar_Absyn_Util.ftv _149_781 FStar_Absyn_Syntax.kun))
end
in (FStar_Absyn_Util.mk_typ_app eq args))))
end
| FStar_Parser_AST.Op (s, args) -> begin
(match (((connective s), args)) with
| (Some (conn), _60_2131::_60_2129::[]) -> begin
(let _149_786 = (let _149_782 = (FStar_Ident.set_lid_range conn f.FStar_Parser_AST.range)
in (FStar_Absyn_Util.ftv _149_782 FStar_Absyn_Syntax.kun))
in (let _149_785 = (FStar_List.map (fun x -> (let _149_784 = (desugar_formula env x)
in (FStar_All.pipe_left FStar_Absyn_Syntax.targ _149_784))) args)
in (FStar_Absyn_Util.mk_typ_app _149_786 _149_785)))
end
| _60_2136 -> begin
if (is_type env f) then begin
(desugar_typ env f)
end else begin
(let _149_787 = (desugar_exp env f)
in (FStar_All.pipe_right _149_787 FStar_Absyn_Util.b2t))
end
end)
end
| FStar_Parser_AST.If (f1, f2, f3) -> begin
(let _149_792 = (let _149_788 = (FStar_Ident.set_lid_range FStar_Absyn_Const.ite_lid f.FStar_Parser_AST.range)
in (FStar_Absyn_Util.ftv _149_788 FStar_Absyn_Syntax.kun))
in (let _149_791 = (FStar_List.map (fun x -> (match ((desugar_typ_or_exp env x)) with
| FStar_Util.Inl (t) -> begin
(FStar_Absyn_Syntax.targ t)
end
| FStar_Util.Inr (v) -> begin
(let _149_790 = (FStar_Absyn_Util.b2t v)
in (FStar_All.pipe_left FStar_Absyn_Syntax.targ _149_790))
end)) ((f1)::(f2)::(f3)::[]))
in (FStar_Absyn_Util.mk_typ_app _149_792 _149_791)))
end
| (FStar_Parser_AST.QForall ([], _, _)) | (FStar_Parser_AST.QExists ([], _, _)) -> begin
(FStar_All.failwith "Impossible: Quantifier without binders")
end
| FStar_Parser_AST.QForall (_1::_2::_3, pats, body) -> begin
(

let binders = (_1)::(_2)::_3
in (let _149_794 = (push_quant (fun x -> FStar_Parser_AST.QForall (x)) binders pats body)
in (desugar_formula env _149_794)))
end
| FStar_Parser_AST.QExists (_1::_2::_3, pats, body) -> begin
(

let binders = (_1)::(_2)::_3
in (let _149_796 = (push_quant (fun x -> FStar_Parser_AST.QExists (x)) binders pats body)
in (desugar_formula env _149_796)))
end
| FStar_Parser_AST.QForall (b::[], pats, body) -> begin
(desugar_quant FStar_Absyn_Const.forall_lid FStar_Absyn_Const.allTyp_lid b pats body)
end
| FStar_Parser_AST.QExists (b::[], pats, body) -> begin
(desugar_quant FStar_Absyn_Const.exists_lid FStar_Absyn_Const.allTyp_lid b pats body)
end
| FStar_Parser_AST.Paren (f) -> begin
(desugar_formula env f)
end
| _60_2198 -> begin
if (is_type env f) then begin
(desugar_typ env f)
end else begin
(let _149_797 = (desugar_exp env f)
in (FStar_All.pipe_left FStar_Absyn_Util.b2t _149_797))
end
end)))))))
and desugar_formula : env_t  ->  FStar_Parser_AST.term  ->  FStar_Absyn_Syntax.typ = (fun env t -> (desugar_formula' (

let _60_2201 = env
in {FStar_Parser_DesugarEnv.curmodule = _60_2201.FStar_Parser_DesugarEnv.curmodule; FStar_Parser_DesugarEnv.modules = _60_2201.FStar_Parser_DesugarEnv.modules; FStar_Parser_DesugarEnv.open_namespaces = _60_2201.FStar_Parser_DesugarEnv.open_namespaces; FStar_Parser_DesugarEnv.modul_abbrevs = _60_2201.FStar_Parser_DesugarEnv.modul_abbrevs; FStar_Parser_DesugarEnv.sigaccum = _60_2201.FStar_Parser_DesugarEnv.sigaccum; FStar_Parser_DesugarEnv.localbindings = _60_2201.FStar_Parser_DesugarEnv.localbindings; FStar_Parser_DesugarEnv.recbindings = _60_2201.FStar_Parser_DesugarEnv.recbindings; FStar_Parser_DesugarEnv.phase = FStar_Parser_AST.Formula; FStar_Parser_DesugarEnv.sigmap = _60_2201.FStar_Parser_DesugarEnv.sigmap; FStar_Parser_DesugarEnv.default_result_effect = _60_2201.FStar_Parser_DesugarEnv.default_result_effect; FStar_Parser_DesugarEnv.iface = _60_2201.FStar_Parser_DesugarEnv.iface; FStar_Parser_DesugarEnv.admitted_iface = _60_2201.FStar_Parser_DesugarEnv.admitted_iface}) t))
and desugar_binder : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.binder  ->  ((FStar_Ident.ident Prims.option * FStar_Absyn_Syntax.knd), (FStar_Ident.ident Prims.option * FStar_Absyn_Syntax.typ)) FStar_Util.either = (fun env b -> if (is_type_binder env b) then begin
(let _149_802 = (desugar_type_binder env b)
in FStar_Util.Inl (_149_802))
end else begin
(let _149_803 = (desugar_exp_binder env b)
in FStar_Util.Inr (_149_803))
end)
and typars_of_binders : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.binder Prims.list  ->  (FStar_Parser_DesugarEnv.env * ((((FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, FStar_Absyn_Syntax.knd) FStar_Absyn_Syntax.withinfo_t, ((FStar_Absyn_Syntax.exp', (FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, FStar_Absyn_Syntax.typ) FStar_Absyn_Syntax.withinfo_t) FStar_Util.either * FStar_Absyn_Syntax.arg_qualifier Prims.option) Prims.list) = (fun env bs -> (

let _60_2234 = (FStar_List.fold_left (fun _60_2209 b -> (match (_60_2209) with
| (env, out) -> begin
(

let tk = (desugar_binder env (

let _60_2211 = b
in {FStar_Parser_AST.b = _60_2211.FStar_Parser_AST.b; FStar_Parser_AST.brange = _60_2211.FStar_Parser_AST.brange; FStar_Parser_AST.blevel = FStar_Parser_AST.Formula; FStar_Parser_AST.aqual = _60_2211.FStar_Parser_AST.aqual}))
in (match (tk) with
| FStar_Util.Inl (Some (a), k) -> begin
(

let _60_2221 = (FStar_Parser_DesugarEnv.push_local_tbinding env a)
in (match (_60_2221) with
| (env, a) -> begin
(env, ((FStar_Util.Inl ((FStar_Absyn_Util.bvd_to_bvar_s a k)), (trans_aqual b.FStar_Parser_AST.aqual)))::out)
end))
end
| FStar_Util.Inr (Some (x), t) -> begin
(

let _60_2229 = (FStar_Parser_DesugarEnv.push_local_vbinding env x)
in (match (_60_2229) with
| (env, x) -> begin
(env, ((FStar_Util.Inr ((FStar_Absyn_Util.bvd_to_bvar_s x t)), (trans_aqual b.FStar_Parser_AST.aqual)))::out)
end))
end
| _60_2231 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected binder", b.FStar_Parser_AST.brange))))
end))
end)) (env, []) bs)
in (match (_60_2234) with
| (env, tpars) -> begin
(env, (FStar_List.rev tpars))
end)))
and desugar_exp_binder : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.binder  ->  (FStar_Ident.ident Prims.option * FStar_Absyn_Syntax.typ) = (fun env b -> (match (b.FStar_Parser_AST.b) with
| FStar_Parser_AST.Annotated (x, t) -> begin
(let _149_810 = (desugar_typ env t)
in (Some (x), _149_810))
end
| FStar_Parser_AST.TVariable (t) -> begin
(let _149_811 = (FStar_Parser_DesugarEnv.fail_or2 (FStar_Parser_DesugarEnv.try_lookup_typ_var env) t)
in (None, _149_811))
end
| FStar_Parser_AST.NoName (t) -> begin
(let _149_812 = (desugar_typ env t)
in (None, _149_812))
end
| FStar_Parser_AST.Variable (x) -> begin
(Some (x), FStar_Absyn_Syntax.tun)
end
| _60_2248 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected domain of an arrow or sum (expected a type)", b.FStar_Parser_AST.brange))))
end))
and desugar_type_binder : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.binder  ->  (FStar_Ident.ident Prims.option * FStar_Absyn_Syntax.knd) = (fun env b -> (

let fail = (fun _60_2252 -> (match (()) with
| () -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Unexpected domain of an arrow or sum (expected a kind)", b.FStar_Parser_AST.brange))))
end))
in (match (b.FStar_Parser_AST.b) with
| (FStar_Parser_AST.Annotated (x, t)) | (FStar_Parser_AST.TAnnotated (x, t)) -> begin
(let _149_817 = (desugar_kind env t)
in (Some (x), _149_817))
end
| FStar_Parser_AST.NoName (t) -> begin
(let _149_818 = (desugar_kind env t)
in (None, _149_818))
end
| FStar_Parser_AST.TVariable (x) -> begin
(Some (x), (

let _60_2263 = FStar_Absyn_Syntax.mk_Kind_type
in {FStar_Absyn_Syntax.n = _60_2263.FStar_Absyn_Syntax.n; FStar_Absyn_Syntax.tk = _60_2263.FStar_Absyn_Syntax.tk; FStar_Absyn_Syntax.pos = b.FStar_Parser_AST.brange; FStar_Absyn_Syntax.fvs = _60_2263.FStar_Absyn_Syntax.fvs; FStar_Absyn_Syntax.uvs = _60_2263.FStar_Absyn_Syntax.uvs}))
end
| _60_2266 -> begin
(fail ())
end)))


let gather_tc_binders : ((((FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.withinfo_t, ((FStar_Absyn_Syntax.exp', (FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, (FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.withinfo_t) FStar_Util.either * FStar_Absyn_Syntax.arg_qualifier Prims.option) Prims.list  ->  (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax  ->  ((((FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.withinfo_t, ((FStar_Absyn_Syntax.exp', (FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, (FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.withinfo_t) FStar_Util.either * FStar_Absyn_Syntax.arg_qualifier Prims.option) Prims.list = (fun tps k -> (

let rec aux = (fun bs k -> (match (k.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_arrow (binders, k) -> begin
(aux (FStar_List.append bs binders) k)
end
| FStar_Absyn_Syntax.Kind_abbrev (_60_2277, k) -> begin
(aux bs k)
end
| _60_2282 -> begin
bs
end))
in (let _149_827 = (aux tps k)
in (FStar_All.pipe_right _149_827 FStar_Absyn_Util.name_binders))))


let mk_data_discriminators : FStar_Absyn_Syntax.qualifier Prims.list  ->  FStar_Parser_DesugarEnv.env  ->  FStar_Ident.lid  ->  ((((FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.withinfo_t, ((FStar_Absyn_Syntax.exp', (FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, (FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.withinfo_t) FStar_Util.either * FStar_Absyn_Syntax.arg_qualifier Prims.option) Prims.list  ->  (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax  ->  FStar_Ident.lident Prims.list  ->  FStar_Absyn_Syntax.sigelt Prims.list = (fun quals env t tps k datas -> (

let quals = (fun q -> if ((FStar_All.pipe_left Prims.op_Negation env.FStar_Parser_DesugarEnv.iface) || env.FStar_Parser_DesugarEnv.admitted_iface) then begin
(FStar_List.append ((FStar_Absyn_Syntax.Assumption)::q) quals)
end else begin
(FStar_List.append q quals)
end)
in (

let binders = (gather_tc_binders tps k)
in (

let p = (FStar_Ident.range_of_lid t)
in (

let imp_binders = (FStar_All.pipe_right binders (FStar_List.map (fun _60_2296 -> (match (_60_2296) with
| (x, _60_2295) -> begin
(x, Some (imp_tag))
end))))
in (

let binders = (let _149_848 = (let _149_847 = (let _149_846 = (let _149_845 = (let _149_844 = (FStar_Absyn_Util.ftv t FStar_Absyn_Syntax.kun)
in (let _149_843 = (FStar_Absyn_Util.args_of_non_null_binders binders)
in (_149_844, _149_843)))
in (FStar_Absyn_Syntax.mk_Typ_app' _149_845 None p))
in (FStar_All.pipe_left FStar_Absyn_Syntax.null_v_binder _149_846))
in (_149_847)::[])
in (FStar_List.append imp_binders _149_848))
in (

let disc_type = (let _149_851 = (let _149_850 = (let _149_849 = (FStar_Absyn_Util.ftv FStar_Absyn_Const.bool_lid FStar_Absyn_Syntax.ktype)
in (FStar_Absyn_Util.total_comp _149_849 p))
in (binders, _149_850))
in (FStar_Absyn_Syntax.mk_Typ_fun _149_851 None p))
in (FStar_All.pipe_right datas (FStar_List.map (fun d -> (

let disc_name = (FStar_Absyn_Util.mk_discriminator d)
in (let _149_854 = (let _149_853 = (quals ((FStar_Absyn_Syntax.Logic)::(FStar_Absyn_Syntax.Discriminator (d))::[]))
in (disc_name, disc_type, _149_853, (FStar_Ident.range_of_lid disc_name)))
in FStar_Absyn_Syntax.Sig_val_decl (_149_854)))))))))))))


let mk_indexed_projectors = (fun fvq refine_domain env _60_2308 lid formals t -> (match (_60_2308) with
| (tc, tps, k) -> begin
(

let binders = (gather_tc_binders tps k)
in (

let p = (FStar_Ident.range_of_lid lid)
in (

let pos = (fun q -> (FStar_Absyn_Syntax.withinfo q None p))
in (

let projectee = (let _149_865 = (FStar_Absyn_Syntax.mk_ident ("projectee", p))
in (let _149_864 = (FStar_Absyn_Util.genident (Some (p)))
in {FStar_Absyn_Syntax.ppname = _149_865; FStar_Absyn_Syntax.realname = _149_864}))
in (

let arg_exp = (FStar_Absyn_Util.bvd_to_exp projectee FStar_Absyn_Syntax.tun)
in (

let arg_binder = (

let arg_typ = (let _149_868 = (let _149_867 = (FStar_Absyn_Util.ftv tc FStar_Absyn_Syntax.kun)
in (let _149_866 = (FStar_Absyn_Util.args_of_non_null_binders binders)
in (_149_867, _149_866)))
in (FStar_Absyn_Syntax.mk_Typ_app' _149_868 None p))
in if (not (refine_domain)) then begin
(FStar_Absyn_Syntax.v_binder (FStar_Absyn_Util.bvd_to_bvar_s projectee arg_typ))
end else begin
(

let disc_name = (FStar_Absyn_Util.mk_discriminator lid)
in (

let x = (FStar_Absyn_Util.gen_bvar arg_typ)
in (let _149_878 = (let _149_877 = (let _149_876 = (let _149_875 = (let _149_874 = (let _149_873 = (let _149_872 = (FStar_Absyn_Util.fvar None disc_name p)
in (let _149_871 = (let _149_870 = (let _149_869 = (FStar_Absyn_Util.bvar_to_exp x)
in (FStar_All.pipe_left FStar_Absyn_Syntax.varg _149_869))
in (_149_870)::[])
in (_149_872, _149_871)))
in (FStar_Absyn_Syntax.mk_Exp_app _149_873 None p))
in (FStar_Absyn_Util.b2t _149_874))
in (x, _149_875))
in (FStar_Absyn_Syntax.mk_Typ_refine _149_876 None p))
in (FStar_All.pipe_left (FStar_Absyn_Util.bvd_to_bvar_s projectee) _149_877))
in (FStar_All.pipe_left FStar_Absyn_Syntax.v_binder _149_878))))
end)
in (

let imp_binders = (FStar_All.pipe_right binders (FStar_List.map (fun _60_2325 -> (match (_60_2325) with
| (x, _60_2324) -> begin
(x, Some (imp_tag))
end))))
in (

let binders = (FStar_List.append imp_binders ((arg_binder)::[]))
in (

let arg = (FStar_Absyn_Util.arg_of_non_null_binder arg_binder)
in (

let subst = (let _149_886 = (FStar_All.pipe_right formals (FStar_List.mapi (fun i f -> (match ((Prims.fst f)) with
| FStar_Util.Inl (a) -> begin
(

let _60_2336 = (FStar_Absyn_Util.mk_field_projector_name lid a i)
in (match (_60_2336) with
| (field_name, _60_2335) -> begin
(

let proj = (let _149_883 = (let _149_882 = (FStar_Absyn_Util.ftv field_name FStar_Absyn_Syntax.kun)
in (_149_882, (arg)::[]))
in (FStar_Absyn_Syntax.mk_Typ_app _149_883 None p))
in (FStar_Util.Inl ((a.FStar_Absyn_Syntax.v, proj)))::[])
end))
end
| FStar_Util.Inr (x) -> begin
(

let _60_2343 = (FStar_Absyn_Util.mk_field_projector_name lid x i)
in (match (_60_2343) with
| (field_name, _60_2342) -> begin
(

let proj = (let _149_885 = (let _149_884 = (FStar_Absyn_Util.fvar None field_name p)
in (_149_884, (arg)::[]))
in (FStar_Absyn_Syntax.mk_Exp_app _149_885 None p))
in (FStar_Util.Inr ((x.FStar_Absyn_Syntax.v, proj)))::[])
end))
end))))
in (FStar_All.pipe_right _149_886 FStar_List.flatten))
in (

let ntps = (FStar_List.length tps)
in (

let all_params = (let _149_888 = (FStar_All.pipe_right tps (FStar_List.map (fun _60_2350 -> (match (_60_2350) with
| (b, _60_2349) -> begin
(b, Some (imp_tag))
end))))
in (FStar_List.append _149_888 formals))
in (let _149_918 = (FStar_All.pipe_right formals (FStar_List.mapi (fun i ax -> (match ((Prims.fst ax)) with
| FStar_Util.Inl (a) -> begin
(

let _60_2359 = (FStar_Absyn_Util.mk_field_projector_name lid a i)
in (match (_60_2359) with
| (field_name, _60_2358) -> begin
(

let kk = (let _149_892 = (let _149_891 = (FStar_Absyn_Util.subst_kind subst a.FStar_Absyn_Syntax.sort)
in (binders, _149_891))
in (FStar_Absyn_Syntax.mk_Kind_arrow _149_892 p))
in (FStar_Absyn_Syntax.Sig_tycon ((field_name, [], kk, [], [], (FStar_Absyn_Syntax.Logic)::(FStar_Absyn_Syntax.Projector ((lid, FStar_Util.Inl (a.FStar_Absyn_Syntax.v))))::[], (FStar_Ident.range_of_lid field_name))))::[])
end))
end
| FStar_Util.Inr (x) -> begin
(

let _60_2366 = (FStar_Absyn_Util.mk_field_projector_name lid x i)
in (match (_60_2366) with
| (field_name, _60_2365) -> begin
(

let t = (let _149_895 = (let _149_894 = (let _149_893 = (FStar_Absyn_Util.subst_typ subst x.FStar_Absyn_Syntax.sort)
in (FStar_Absyn_Util.total_comp _149_893 p))
in (binders, _149_894))
in (FStar_Absyn_Syntax.mk_Typ_fun _149_895 None p))
in (

let quals = (fun q -> if ((not (env.FStar_Parser_DesugarEnv.iface)) || env.FStar_Parser_DesugarEnv.admitted_iface) then begin
(FStar_Absyn_Syntax.Assumption)::q
end else begin
q
end)
in (

let quals = (quals ((FStar_Absyn_Syntax.Logic)::(FStar_Absyn_Syntax.Projector ((lid, FStar_Util.Inr (x.FStar_Absyn_Syntax.v))))::[]))
in (

let impl = if (((let _149_898 = (FStar_Parser_DesugarEnv.current_module env)
in (FStar_Ident.lid_equals FStar_Absyn_Const.prims_lid _149_898)) || (fvq <> FStar_Absyn_Syntax.Data_ctor)) || (let _149_900 = (let _149_899 = (FStar_Parser_DesugarEnv.current_module env)
in _149_899.FStar_Ident.str)
in (FStar_Options.dont_gen_projectors _149_900))) then begin
[]
end else begin
(

let projection = (FStar_Absyn_Util.gen_bvar FStar_Absyn_Syntax.tun)
in (

let as_imp = (fun _60_14 -> (match (_60_14) with
| Some (FStar_Absyn_Syntax.Implicit (_60_2374)) -> begin
true
end
| _60_2378 -> begin
false
end))
in (

let arg_pats = (let _149_915 = (FStar_All.pipe_right all_params (FStar_List.mapi (fun j by -> (match (by) with
| (FStar_Util.Inl (_60_2383), imp) -> begin
if (j < ntps) then begin
[]
end else begin
(let _149_908 = (let _149_907 = (let _149_906 = (let _149_905 = (FStar_Absyn_Util.gen_bvar FStar_Absyn_Syntax.kun)
in FStar_Absyn_Syntax.Pat_tvar (_149_905))
in (pos _149_906))
in (_149_907, (as_imp imp)))
in (_149_908)::[])
end
end
| (FStar_Util.Inr (_60_2388), imp) -> begin
if ((i + ntps) = j) then begin
(let _149_910 = (let _149_909 = (pos (FStar_Absyn_Syntax.Pat_var (projection)))
in (_149_909, (as_imp imp)))
in (_149_910)::[])
end else begin
if (j < ntps) then begin
[]
end else begin
(let _149_914 = (let _149_913 = (let _149_912 = (let _149_911 = (FStar_Absyn_Util.gen_bvar FStar_Absyn_Syntax.tun)
in FStar_Absyn_Syntax.Pat_wild (_149_911))
in (pos _149_912))
in (_149_913, (as_imp imp)))
in (_149_914)::[])
end
end
end))))
in (FStar_All.pipe_right _149_915 FStar_List.flatten))
in (

let pat = (let _149_917 = (FStar_All.pipe_right (FStar_Absyn_Syntax.Pat_cons (((FStar_Absyn_Util.fv lid), Some (fvq), arg_pats))) pos)
in (let _149_916 = (FStar_Absyn_Util.bvar_to_exp projection)
in (_149_917, None, _149_916)))
in (

let body = (FStar_Absyn_Syntax.mk_Exp_match (arg_exp, (pat)::[]) None p)
in (

let imp = (FStar_Absyn_Syntax.mk_Exp_abs (binders, body) None (FStar_Ident.range_of_lid field_name))
in (

let lb = {FStar_Absyn_Syntax.lbname = FStar_Util.Inr (field_name); FStar_Absyn_Syntax.lbtyp = FStar_Absyn_Syntax.tun; FStar_Absyn_Syntax.lbeff = FStar_Absyn_Const.effect_Tot_lid; FStar_Absyn_Syntax.lbdef = imp}
in (FStar_Absyn_Syntax.Sig_let (((false, (lb)::[]), p, [], quals)))::[])))))))
end
in (FStar_Absyn_Syntax.Sig_val_decl ((field_name, t, quals, (FStar_Ident.range_of_lid field_name))))::impl))))
end))
end))))
in (FStar_All.pipe_right _149_918 FStar_List.flatten))))))))))))))
end))


let mk_data_projectors : FStar_Parser_DesugarEnv.env  ->  FStar_Absyn_Syntax.sigelt  ->  FStar_Absyn_Syntax.sigelt Prims.list = (fun env _60_17 -> (match (_60_17) with
| FStar_Absyn_Syntax.Sig_datacon (lid, t, tycon, quals, _60_2405, _60_2407) when (not ((FStar_Ident.lid_equals lid FStar_Absyn_Const.lexcons_lid))) -> begin
(

let refine_domain = if (FStar_All.pipe_right quals (FStar_Util.for_some (fun _60_15 -> (match (_60_15) with
| FStar_Absyn_Syntax.RecordConstructor (_60_2412) -> begin
true
end
| _60_2415 -> begin
false
end)))) then begin
false
end else begin
(

let _60_2421 = tycon
in (match (_60_2421) with
| (l, _60_2418, _60_2420) -> begin
(match ((FStar_Parser_DesugarEnv.find_all_datacons env l)) with
| Some (l) -> begin
((FStar_List.length l) > 1)
end
| _60_2425 -> begin
true
end)
end))
end
in (match ((FStar_Absyn_Util.function_formals t)) with
| Some (formals, cod) -> begin
(

let cod = (FStar_Absyn_Util.comp_result cod)
in (

let qual = (match ((FStar_Util.find_map quals (fun _60_16 -> (match (_60_16) with
| FStar_Absyn_Syntax.RecordConstructor (fns) -> begin
Some (FStar_Absyn_Syntax.Record_ctor ((lid, fns)))
end
| _60_2436 -> begin
None
end)))) with
| None -> begin
FStar_Absyn_Syntax.Data_ctor
end
| Some (q) -> begin
q
end)
in (mk_indexed_projectors qual refine_domain env tycon lid formals cod)))
end
| _60_2442 -> begin
[]
end))
end
| _60_2444 -> begin
[]
end))


let rec desugar_tycon : FStar_Parser_DesugarEnv.env  ->  FStar_Range.range  ->  FStar_Absyn_Syntax.qualifier Prims.list  ->  FStar_Parser_AST.tycon Prims.list  ->  (env_t * FStar_Absyn_Syntax.sigelts) = (fun env rng quals tcs -> (

let tycon_id = (fun _60_18 -> (match (_60_18) with
| (FStar_Parser_AST.TyconAbstract (id, _, _)) | (FStar_Parser_AST.TyconAbbrev (id, _, _, _)) | (FStar_Parser_AST.TyconRecord (id, _, _, _)) | (FStar_Parser_AST.TyconVariant (id, _, _, _)) -> begin
id
end))
in (

let binder_to_term = (fun b -> (match (b.FStar_Parser_AST.b) with
| (FStar_Parser_AST.Annotated (x, _)) | (FStar_Parser_AST.Variable (x)) -> begin
(let _149_938 = (let _149_937 = (FStar_Ident.lid_of_ids ((x)::[]))
in FStar_Parser_AST.Var (_149_937))
in (FStar_Parser_AST.mk_term _149_938 x.FStar_Ident.idRange FStar_Parser_AST.Expr))
end
| (FStar_Parser_AST.TAnnotated (a, _)) | (FStar_Parser_AST.TVariable (a)) -> begin
(FStar_Parser_AST.mk_term (FStar_Parser_AST.Tvar (a)) a.FStar_Ident.idRange FStar_Parser_AST.Type)
end
| FStar_Parser_AST.NoName (t) -> begin
t
end))
in (

let tot = (FStar_Parser_AST.mk_term (FStar_Parser_AST.Name (FStar_Absyn_Const.effect_Tot_lid)) rng FStar_Parser_AST.Expr)
in (

let with_constructor_effect = (fun t -> (FStar_Parser_AST.mk_term (FStar_Parser_AST.App ((tot, t, FStar_Parser_AST.Nothing))) t.FStar_Parser_AST.range t.FStar_Parser_AST.level))
in (

let apply_binders = (fun t binders -> (

let imp_of_aqual = (fun b -> (match (b.FStar_Parser_AST.aqual) with
| Some (FStar_Parser_AST.Implicit) -> begin
FStar_Parser_AST.Hash
end
| _60_2509 -> begin
FStar_Parser_AST.Nothing
end))
in (FStar_List.fold_left (fun out b -> (let _149_951 = (let _149_950 = (let _149_949 = (binder_to_term b)
in (out, _149_949, (imp_of_aqual b)))
in FStar_Parser_AST.App (_149_950))
in (FStar_Parser_AST.mk_term _149_951 out.FStar_Parser_AST.range out.FStar_Parser_AST.level))) t binders)))
in (

let tycon_record_as_variant = (fun _60_19 -> (match (_60_19) with
| FStar_Parser_AST.TyconRecord (id, parms, kopt, fields) -> begin
(

let constrName = (FStar_Ident.mk_ident ((Prims.strcat "Mk" id.FStar_Ident.idText), id.FStar_Ident.idRange))
in (

let mfields = (FStar_List.map (fun _60_2522 -> (match (_60_2522) with
| (x, t) -> begin
(FStar_Parser_AST.mk_binder (FStar_Parser_AST.Annotated (((FStar_Absyn_Util.mangle_field_name x), t))) x.FStar_Ident.idRange FStar_Parser_AST.Expr None)
end)) fields)
in (

let result = (let _149_957 = (let _149_956 = (let _149_955 = (FStar_Ident.lid_of_ids ((id)::[]))
in FStar_Parser_AST.Var (_149_955))
in (FStar_Parser_AST.mk_term _149_956 id.FStar_Ident.idRange FStar_Parser_AST.Type))
in (apply_binders _149_957 parms))
in (

let constrTyp = (FStar_Parser_AST.mk_term (FStar_Parser_AST.Product ((mfields, (with_constructor_effect result)))) id.FStar_Ident.idRange FStar_Parser_AST.Type)
in (let _149_959 = (FStar_All.pipe_right fields (FStar_List.map (fun _60_2529 -> (match (_60_2529) with
| (x, _60_2528) -> begin
(FStar_Parser_DesugarEnv.qualify env x)
end))))
in (FStar_Parser_AST.TyconVariant ((id, parms, kopt, ((constrName, Some (constrTyp), false))::[])), _149_959))))))
end
| _60_2531 -> begin
(FStar_All.failwith "impossible")
end))
in (

let desugar_abstract_tc = (fun quals _env mutuals _60_20 -> (match (_60_20) with
| FStar_Parser_AST.TyconAbstract (id, binders, kopt) -> begin
(

let _60_2545 = (typars_of_binders _env binders)
in (match (_60_2545) with
| (_env', typars) -> begin
(

let k = (match (kopt) with
| None -> begin
FStar_Absyn_Syntax.kun
end
| Some (k) -> begin
(desugar_kind _env' k)
end)
in (

let tconstr = (let _149_970 = (let _149_969 = (let _149_968 = (FStar_Ident.lid_of_ids ((id)::[]))
in FStar_Parser_AST.Var (_149_968))
in (FStar_Parser_AST.mk_term _149_969 id.FStar_Ident.idRange FStar_Parser_AST.Type))
in (apply_binders _149_970 binders))
in (

let qlid = (FStar_Parser_DesugarEnv.qualify _env id)
in (

let se = FStar_Absyn_Syntax.Sig_tycon ((qlid, typars, k, mutuals, [], quals, rng))
in (

let _env = (FStar_Parser_DesugarEnv.push_rec_binding _env (FStar_Parser_DesugarEnv.Binding_tycon (qlid)))
in (

let _env2 = (FStar_Parser_DesugarEnv.push_rec_binding _env' (FStar_Parser_DesugarEnv.Binding_tycon (qlid)))
in (_env, _env2, se, tconstr)))))))
end))
end
| _60_2556 -> begin
(FStar_All.failwith "Unexpected tycon")
end))
in (

let push_tparam = (fun env _60_21 -> (match (_60_21) with
| (FStar_Util.Inr (x), _60_2563) -> begin
(FStar_Parser_DesugarEnv.push_bvvdef env x.FStar_Absyn_Syntax.v)
end
| (FStar_Util.Inl (a), _60_2568) -> begin
(FStar_Parser_DesugarEnv.push_btvdef env a.FStar_Absyn_Syntax.v)
end))
in (

let push_tparams = (FStar_List.fold_left push_tparam)
in (match (tcs) with
| FStar_Parser_AST.TyconAbstract (_60_2572)::[] -> begin
(

let tc = (FStar_List.hd tcs)
in (

let _60_2583 = (desugar_abstract_tc quals env [] tc)
in (match (_60_2583) with
| (_60_2577, _60_2579, se, _60_2582) -> begin
(

let quals = if ((FStar_All.pipe_right quals (FStar_List.contains FStar_Absyn_Syntax.Assumption)) || (FStar_All.pipe_right quals (FStar_List.contains FStar_Absyn_Syntax.New))) then begin
quals
end else begin
(

let _60_2584 = (let _149_980 = (FStar_Range.string_of_range rng)
in (let _149_979 = (let _149_978 = (let _149_977 = (FStar_Absyn_Util.lids_of_sigelt se)
in (FStar_All.pipe_right _149_977 (FStar_List.map FStar_Absyn_Print.sli)))
in (FStar_All.pipe_right _149_978 (FStar_String.concat ", ")))
in (FStar_Util.print2 "%s (Warning): Adding an implicit \'new\' qualifier on %s\n" _149_980 _149_979)))
in (FStar_Absyn_Syntax.New)::quals)
end
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env se)
in (env, (se)::[])))
end)))
end
| FStar_Parser_AST.TyconAbbrev (id, binders, kopt, t)::[] -> begin
(

let _60_2597 = (typars_of_binders env binders)
in (match (_60_2597) with
| (env', typars) -> begin
(

let k = (match (kopt) with
| None -> begin
if (FStar_Util.for_some (fun _60_22 -> (match (_60_22) with
| FStar_Absyn_Syntax.Effect -> begin
true
end
| _60_2602 -> begin
false
end)) quals) then begin
FStar_Absyn_Syntax.mk_Kind_effect
end else begin
FStar_Absyn_Syntax.kun
end
end
| Some (k) -> begin
(desugar_kind env' k)
end)
in (

let t0 = t
in (

let quals = if (FStar_All.pipe_right quals (FStar_Util.for_some (fun _60_23 -> (match (_60_23) with
| FStar_Absyn_Syntax.Logic -> begin
true
end
| _60_2610 -> begin
false
end)))) then begin
quals
end else begin
if (t0.FStar_Parser_AST.level = FStar_Parser_AST.Formula) then begin
(FStar_Absyn_Syntax.Logic)::quals
end else begin
quals
end
end
in (

let se = if (FStar_All.pipe_right quals (FStar_List.contains FStar_Absyn_Syntax.Effect)) then begin
(

let c = (desugar_comp t.FStar_Parser_AST.range false env' t)
in (let _149_986 = (let _149_985 = (FStar_Parser_DesugarEnv.qualify env id)
in (let _149_984 = (FStar_All.pipe_right quals (FStar_List.filter (fun _60_24 -> (match (_60_24) with
| FStar_Absyn_Syntax.Effect -> begin
false
end
| _60_2616 -> begin
true
end))))
in (_149_985, typars, c, _149_984, rng)))
in FStar_Absyn_Syntax.Sig_effect_abbrev (_149_986)))
end else begin
(

let t = (desugar_typ env' t)
in (let _149_988 = (let _149_987 = (FStar_Parser_DesugarEnv.qualify env id)
in (_149_987, typars, k, t, quals, rng))
in FStar_Absyn_Syntax.Sig_typ_abbrev (_149_988)))
end
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env se)
in (env, (se)::[]))))))
end))
end
| FStar_Parser_AST.TyconRecord (_60_2621)::[] -> begin
(

let trec = (FStar_List.hd tcs)
in (

let _60_2627 = (tycon_record_as_variant trec)
in (match (_60_2627) with
| (t, fs) -> begin
(desugar_tycon env rng ((FStar_Absyn_Syntax.RecordType (fs))::quals) ((t)::[]))
end)))
end
| _60_2631::_60_2629 -> begin
(

let env0 = env
in (

let mutuals = (FStar_List.map (fun x -> (FStar_All.pipe_left (FStar_Parser_DesugarEnv.qualify env) (tycon_id x))) tcs)
in (

let rec collect_tcs = (fun quals et tc -> (

let _60_2642 = et
in (match (_60_2642) with
| (env, tcs) -> begin
(match (tc) with
| FStar_Parser_AST.TyconRecord (_60_2644) -> begin
(

let trec = tc
in (

let _60_2649 = (tycon_record_as_variant trec)
in (match (_60_2649) with
| (t, fs) -> begin
(collect_tcs ((FStar_Absyn_Syntax.RecordType (fs))::quals) (env, tcs) t)
end)))
end
| FStar_Parser_AST.TyconVariant (id, binders, kopt, constructors) -> begin
(

let _60_2661 = (desugar_abstract_tc quals env mutuals (FStar_Parser_AST.TyconAbstract ((id, binders, kopt))))
in (match (_60_2661) with
| (env, _60_2658, se, tconstr) -> begin
(env, (FStar_Util.Inl ((se, constructors, tconstr, quals)))::tcs)
end))
end
| FStar_Parser_AST.TyconAbbrev (id, binders, kopt, t) -> begin
(

let _60_2673 = (desugar_abstract_tc quals env mutuals (FStar_Parser_AST.TyconAbstract ((id, binders, kopt))))
in (match (_60_2673) with
| (env, _60_2670, se, tconstr) -> begin
(env, (FStar_Util.Inr ((se, t, quals)))::tcs)
end))
end
| _60_2675 -> begin
(FStar_All.failwith "Unrecognized mutual type definition")
end)
end)))
in (

let _60_2678 = (FStar_List.fold_left (collect_tcs quals) (env, []) tcs)
in (match (_60_2678) with
| (env, tcs) -> begin
(

let tcs = (FStar_List.rev tcs)
in (

let sigelts = (FStar_All.pipe_right tcs (FStar_List.collect (fun _60_26 -> (match (_60_26) with
| FStar_Util.Inr (FStar_Absyn_Syntax.Sig_tycon (id, tpars, k, _60_2685, _60_2687, _60_2689, _60_2691), t, quals) -> begin
(

let env_tps = (push_tparams env tpars)
in (

let t = (desugar_typ env_tps t)
in (FStar_Absyn_Syntax.Sig_typ_abbrev ((id, tpars, k, t, [], rng)))::[]))
end
| FStar_Util.Inl (FStar_Absyn_Syntax.Sig_tycon (tname, tpars, k, mutuals, _60_2705, tags, _60_2708), constrs, tconstr, quals) -> begin
(

let tycon = (tname, tpars, k)
in (

let env_tps = (push_tparams env tpars)
in (

let _60_2739 = (let _149_1004 = (FStar_All.pipe_right constrs (FStar_List.map (fun _60_2721 -> (match (_60_2721) with
| (id, topt, of_notation) -> begin
(

let t = if of_notation then begin
(match (topt) with
| Some (t) -> begin
(FStar_Parser_AST.mk_term (FStar_Parser_AST.Product ((((FStar_Parser_AST.mk_binder (FStar_Parser_AST.NoName (t)) t.FStar_Parser_AST.range t.FStar_Parser_AST.level None))::[], tconstr))) t.FStar_Parser_AST.range t.FStar_Parser_AST.level)
end
| None -> begin
tconstr
end)
end else begin
(match (topt) with
| None -> begin
(FStar_All.failwith "Impossible")
end
| Some (t) -> begin
t
end)
end
in (

let t = (let _149_999 = (FStar_Parser_DesugarEnv.default_total env_tps)
in (let _149_998 = (close env_tps t)
in (desugar_typ _149_999 _149_998)))
in (

let name = (FStar_Parser_DesugarEnv.qualify env id)
in (

let quals = (FStar_All.pipe_right tags (FStar_List.collect (fun _60_25 -> (match (_60_25) with
| FStar_Absyn_Syntax.RecordType (fns) -> begin
(FStar_Absyn_Syntax.RecordConstructor (fns))::[]
end
| _60_2735 -> begin
[]
end))))
in (let _149_1003 = (let _149_1002 = (let _149_1001 = (FStar_All.pipe_right t FStar_Absyn_Util.name_function_binders)
in (name, _149_1001, tycon, quals, mutuals, rng))
in FStar_Absyn_Syntax.Sig_datacon (_149_1002))
in (name, _149_1003))))))
end))))
in (FStar_All.pipe_left FStar_List.split _149_1004))
in (match (_60_2739) with
| (constrNames, constrs) -> begin
(FStar_Absyn_Syntax.Sig_tycon ((tname, tpars, k, mutuals, constrNames, tags, rng)))::constrs
end))))
end
| _60_2741 -> begin
(FStar_All.failwith "impossible")
end))))
in (

let bundle = (let _149_1006 = (let _149_1005 = (FStar_List.collect FStar_Absyn_Util.lids_of_sigelt sigelts)
in (sigelts, quals, _149_1005, rng))
in FStar_Absyn_Syntax.Sig_bundle (_149_1006))
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env0 bundle)
in (

let data_ops = (FStar_All.pipe_right sigelts (FStar_List.collect (mk_data_projectors env)))
in (

let discs = (FStar_All.pipe_right sigelts (FStar_List.collect (fun _60_27 -> (match (_60_27) with
| FStar_Absyn_Syntax.Sig_tycon (tname, tps, k, _60_2751, constrs, quals, _60_2755) -> begin
(mk_data_discriminators quals env tname tps k constrs)
end
| _60_2759 -> begin
[]
end))))
in (

let ops = (FStar_List.append discs data_ops)
in (

let env = (FStar_List.fold_left FStar_Parser_DesugarEnv.push_sigelt env ops)
in (env, (FStar_List.append ((bundle)::[]) ops))))))))))
end)))))
end
| [] -> begin
(FStar_All.failwith "impossible")
end)))))))))))


let desugar_binders : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.binder Prims.list  ->  (FStar_Parser_DesugarEnv.env * FStar_Absyn_Syntax.binder Prims.list) = (fun env binders -> (

let _60_2790 = (FStar_List.fold_left (fun _60_2768 b -> (match (_60_2768) with
| (env, binders) -> begin
(match ((desugar_binder env b)) with
| FStar_Util.Inl (Some (a), k) -> begin
(

let _60_2777 = (FStar_Parser_DesugarEnv.push_local_tbinding env a)
in (match (_60_2777) with
| (env, a) -> begin
(let _149_1015 = (let _149_1014 = (FStar_Absyn_Syntax.t_binder (FStar_Absyn_Util.bvd_to_bvar_s a k))
in (_149_1014)::binders)
in (env, _149_1015))
end))
end
| FStar_Util.Inr (Some (x), t) -> begin
(

let _60_2785 = (FStar_Parser_DesugarEnv.push_local_vbinding env x)
in (match (_60_2785) with
| (env, x) -> begin
(let _149_1017 = (let _149_1016 = (FStar_Absyn_Syntax.v_binder (FStar_Absyn_Util.bvd_to_bvar_s x t))
in (_149_1016)::binders)
in (env, _149_1017))
end))
end
| _60_2787 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Missing name in binder", b.FStar_Parser_AST.brange))))
end)
end)) (env, []) binders)
in (match (_60_2790) with
| (env, binders) -> begin
(env, (FStar_List.rev binders))
end)))


let trans_qual : FStar_Range.range  ->  FStar_Parser_AST.qualifier  ->  FStar_Absyn_Syntax.qualifier = (fun r _60_28 -> (match (_60_28) with
| FStar_Parser_AST.Private -> begin
FStar_Absyn_Syntax.Private
end
| FStar_Parser_AST.Assumption -> begin
FStar_Absyn_Syntax.Assumption
end
| FStar_Parser_AST.Opaque -> begin
FStar_Absyn_Syntax.Opaque
end
| FStar_Parser_AST.Logic -> begin
FStar_Absyn_Syntax.Logic
end
| FStar_Parser_AST.Abstract -> begin
FStar_Absyn_Syntax.Abstract
end
| FStar_Parser_AST.New -> begin
FStar_Absyn_Syntax.New
end
| FStar_Parser_AST.TotalEffect -> begin
FStar_Absyn_Syntax.TotalEffect
end
| FStar_Parser_AST.DefaultEffect -> begin
FStar_Absyn_Syntax.DefaultEffect (None)
end
| FStar_Parser_AST.Effect -> begin
FStar_Absyn_Syntax.Effect
end
| (FStar_Parser_AST.Inline) | (FStar_Parser_AST.Irreducible) | (FStar_Parser_AST.Unfoldable) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("This qualifier is supported only with the --universes option", r))))
end))


let trans_pragma : FStar_Parser_AST.pragma  ->  FStar_Absyn_Syntax.pragma = (fun _60_29 -> (match (_60_29) with
| FStar_Parser_AST.SetOptions (s) -> begin
FStar_Absyn_Syntax.SetOptions (s)
end
| FStar_Parser_AST.ResetOptions (s) -> begin
FStar_Absyn_Syntax.ResetOptions (s)
end))


let trans_quals : FStar_Range.range  ->  FStar_Parser_AST.qualifier Prims.list  ->  FStar_Absyn_Syntax.qualifier Prims.list = (fun r -> (FStar_List.map (trans_qual r)))


let rec desugar_decl : env_t  ->  FStar_Parser_AST.decl  ->  (env_t * FStar_Absyn_Syntax.sigelts) = (fun env d -> (

let trans_quals = (trans_quals d.FStar_Parser_AST.drange)
in (match (d.FStar_Parser_AST.d) with
| FStar_Parser_AST.Pragma (p) -> begin
(

let se = FStar_Absyn_Syntax.Sig_pragma (((trans_pragma p), d.FStar_Parser_AST.drange))
in (env, (se)::[]))
end
| FStar_Parser_AST.TopLevelModule (_60_2818) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Multiple modules in a file are no longer supported", d.FStar_Parser_AST.drange))))
end
| FStar_Parser_AST.Open (lid) -> begin
(

let env = (FStar_Parser_DesugarEnv.push_namespace env lid)
in (env, []))
end
| FStar_Parser_AST.ModuleAbbrev (x, l) -> begin
(let _149_1035 = (FStar_Parser_DesugarEnv.push_module_abbrev env x l)
in (_149_1035, []))
end
| FStar_Parser_AST.Tycon (qual, tcs) -> begin
(let _149_1036 = (trans_quals qual)
in (desugar_tycon env d.FStar_Parser_AST.drange _149_1036 tcs))
end
| FStar_Parser_AST.ToplevelLet (quals, isrec, lets) -> begin
(match ((let _149_1038 = (let _149_1037 = (desugar_exp_maybe_top true env (FStar_Parser_AST.mk_term (FStar_Parser_AST.Let ((isrec, lets, (FStar_Parser_AST.mk_term (FStar_Parser_AST.Const (FStar_Const.Const_unit)) d.FStar_Parser_AST.drange FStar_Parser_AST.Expr)))) d.FStar_Parser_AST.drange FStar_Parser_AST.Expr))
in (FStar_All.pipe_left FStar_Absyn_Util.compress_exp _149_1037))
in _149_1038.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Exp_let (lbs, _60_2838) -> begin
(

let lids = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.map (fun lb -> (match (lb.FStar_Absyn_Syntax.lbname) with
| FStar_Util.Inr (l) -> begin
l
end
| _60_2845 -> begin
(FStar_All.failwith "impossible")
end))))
in (

let quals = (match (quals) with
| _60_2850::_60_2848 -> begin
(trans_quals quals)
end
| _60_2853 -> begin
(FStar_All.pipe_right (Prims.snd lbs) (FStar_List.collect (fun _60_30 -> (match (_60_30) with
| {FStar_Absyn_Syntax.lbname = FStar_Util.Inl (_60_2862); FStar_Absyn_Syntax.lbtyp = _60_2860; FStar_Absyn_Syntax.lbeff = _60_2858; FStar_Absyn_Syntax.lbdef = _60_2856} -> begin
[]
end
| {FStar_Absyn_Syntax.lbname = FStar_Util.Inr (l); FStar_Absyn_Syntax.lbtyp = _60_2870; FStar_Absyn_Syntax.lbeff = _60_2868; FStar_Absyn_Syntax.lbdef = _60_2866} -> begin
(FStar_Parser_DesugarEnv.lookup_letbinding_quals env l)
end))))
end)
in (

let s = FStar_Absyn_Syntax.Sig_let ((lbs, d.FStar_Parser_AST.drange, lids, quals))
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env s)
in (env, (s)::[])))))
end
| _60_2878 -> begin
(FStar_All.failwith "Desugaring a let did not produce a let")
end)
end
| FStar_Parser_AST.Main (t) -> begin
(

let e = (desugar_exp env t)
in (

let se = FStar_Absyn_Syntax.Sig_main ((e, d.FStar_Parser_AST.drange))
in (env, (se)::[])))
end
| FStar_Parser_AST.Assume (atag, id, t) -> begin
(

let f = (desugar_formula env t)
in (let _149_1044 = (let _149_1043 = (let _149_1042 = (let _149_1041 = (FStar_Parser_DesugarEnv.qualify env id)
in (_149_1041, f, (FStar_Absyn_Syntax.Assumption)::[], d.FStar_Parser_AST.drange))
in FStar_Absyn_Syntax.Sig_assume (_149_1042))
in (_149_1043)::[])
in (env, _149_1044)))
end
| FStar_Parser_AST.Val (quals, id, t) -> begin
(

let t = (let _149_1045 = (close_fun env t)
in (desugar_typ env _149_1045))
in (

let quals = if (env.FStar_Parser_DesugarEnv.iface && env.FStar_Parser_DesugarEnv.admitted_iface) then begin
(let _149_1046 = (trans_quals quals)
in (FStar_Absyn_Syntax.Assumption)::_149_1046)
end else begin
(trans_quals quals)
end
in (

let se = (let _149_1048 = (let _149_1047 = (FStar_Parser_DesugarEnv.qualify env id)
in (_149_1047, t, quals, d.FStar_Parser_AST.drange))
in FStar_Absyn_Syntax.Sig_val_decl (_149_1048))
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env se)
in (env, (se)::[])))))
end
| FStar_Parser_AST.Exception (id, None) -> begin
(

let t = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_typ_name env) FStar_Absyn_Const.exn_lid)
in (

let l = (FStar_Parser_DesugarEnv.qualify env id)
in (

let se = FStar_Absyn_Syntax.Sig_datacon ((l, t, (FStar_Absyn_Const.exn_lid, [], FStar_Absyn_Syntax.ktype), (FStar_Absyn_Syntax.ExceptionConstructor)::[], (FStar_Absyn_Const.exn_lid)::[], d.FStar_Parser_AST.drange))
in (

let se' = FStar_Absyn_Syntax.Sig_bundle (((se)::[], (FStar_Absyn_Syntax.ExceptionConstructor)::[], (l)::[], d.FStar_Parser_AST.drange))
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env se')
in (

let data_ops = (mk_data_projectors env se)
in (

let discs = (mk_data_discriminators [] env FStar_Absyn_Const.exn_lid [] FStar_Absyn_Syntax.ktype ((l)::[]))
in (

let env = (FStar_List.fold_left FStar_Parser_DesugarEnv.push_sigelt env (FStar_List.append discs data_ops))
in (env, (FStar_List.append ((se')::discs) data_ops))))))))))
end
| FStar_Parser_AST.Exception (id, Some (term)) -> begin
(

let t = (desugar_typ env term)
in (

let t = (let _149_1053 = (let _149_1052 = (let _149_1049 = (FStar_Absyn_Syntax.null_v_binder t)
in (_149_1049)::[])
in (let _149_1051 = (let _149_1050 = (FStar_Parser_DesugarEnv.fail_or env (FStar_Parser_DesugarEnv.try_lookup_typ_name env) FStar_Absyn_Const.exn_lid)
in (FStar_Absyn_Syntax.mk_Total _149_1050))
in (_149_1052, _149_1051)))
in (FStar_Absyn_Syntax.mk_Typ_fun _149_1053 None d.FStar_Parser_AST.drange))
in (

let l = (FStar_Parser_DesugarEnv.qualify env id)
in (

let se = FStar_Absyn_Syntax.Sig_datacon ((l, t, (FStar_Absyn_Const.exn_lid, [], FStar_Absyn_Syntax.ktype), (FStar_Absyn_Syntax.ExceptionConstructor)::[], (FStar_Absyn_Const.exn_lid)::[], d.FStar_Parser_AST.drange))
in (

let se' = FStar_Absyn_Syntax.Sig_bundle (((se)::[], (FStar_Absyn_Syntax.ExceptionConstructor)::[], (l)::[], d.FStar_Parser_AST.drange))
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env se')
in (

let data_ops = (mk_data_projectors env se)
in (

let discs = (mk_data_discriminators [] env FStar_Absyn_Const.exn_lid [] FStar_Absyn_Syntax.ktype ((l)::[]))
in (

let env = (FStar_List.fold_left FStar_Parser_DesugarEnv.push_sigelt env (FStar_List.append discs data_ops))
in (env, (FStar_List.append ((se')::discs) data_ops)))))))))))
end
| FStar_Parser_AST.KindAbbrev (id, binders, k) -> begin
(

let _60_2931 = (desugar_binders env binders)
in (match (_60_2931) with
| (env_k, binders) -> begin
(

let k = (desugar_kind env_k k)
in (

let name = (FStar_Parser_DesugarEnv.qualify env id)
in (

let se = FStar_Absyn_Syntax.Sig_kind_abbrev ((name, binders, k, d.FStar_Parser_AST.drange))
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env se)
in (env, (se)::[])))))
end))
end
| FStar_Parser_AST.NewEffectForFree (_60_2937) -> begin
(FStar_All.failwith "effects for free only supported in conjunction with --universes")
end
| FStar_Parser_AST.NewEffect (quals, FStar_Parser_AST.RedefineEffect (eff_name, eff_binders, defn)) -> begin
(

let env0 = env
in (

let _60_2950 = (desugar_binders env eff_binders)
in (match (_60_2950) with
| (env, binders) -> begin
(

let defn = (desugar_typ env defn)
in (

let _60_2954 = (FStar_Absyn_Util.head_and_args defn)
in (match (_60_2954) with
| (head, args) -> begin
(match (head.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_const (eff) -> begin
(match ((FStar_Parser_DesugarEnv.try_lookup_effect_defn env eff.FStar_Absyn_Syntax.v)) with
| None -> begin
(let _149_1058 = (let _149_1057 = (let _149_1056 = (let _149_1055 = (let _149_1054 = (FStar_Absyn_Print.sli eff.FStar_Absyn_Syntax.v)
in (Prims.strcat "Effect " _149_1054))
in (Prims.strcat _149_1055 " not found"))
in (_149_1056, d.FStar_Parser_AST.drange))
in FStar_Absyn_Syntax.Error (_149_1057))
in (Prims.raise _149_1058))
end
| Some (ed) -> begin
(

let subst = (FStar_Absyn_Util.subst_of_list ed.FStar_Absyn_Syntax.binders args)
in (

let sub = (FStar_Absyn_Util.subst_typ subst)
in (

let ed = (let _149_1076 = (FStar_Parser_DesugarEnv.qualify env0 eff_name)
in (let _149_1075 = (trans_quals quals)
in (let _149_1074 = (FStar_Absyn_Util.subst_kind subst ed.FStar_Absyn_Syntax.signature)
in (let _149_1073 = (sub ed.FStar_Absyn_Syntax.ret)
in (let _149_1072 = (sub ed.FStar_Absyn_Syntax.bind_wp)
in (let _149_1071 = (sub ed.FStar_Absyn_Syntax.bind_wlp)
in (let _149_1070 = (sub ed.FStar_Absyn_Syntax.if_then_else)
in (let _149_1069 = (sub ed.FStar_Absyn_Syntax.ite_wp)
in (let _149_1068 = (sub ed.FStar_Absyn_Syntax.ite_wlp)
in (let _149_1067 = (sub ed.FStar_Absyn_Syntax.wp_binop)
in (let _149_1066 = (sub ed.FStar_Absyn_Syntax.wp_as_type)
in (let _149_1065 = (sub ed.FStar_Absyn_Syntax.close_wp)
in (let _149_1064 = (sub ed.FStar_Absyn_Syntax.close_wp_t)
in (let _149_1063 = (sub ed.FStar_Absyn_Syntax.assert_p)
in (let _149_1062 = (sub ed.FStar_Absyn_Syntax.assume_p)
in (let _149_1061 = (sub ed.FStar_Absyn_Syntax.null_wp)
in (let _149_1060 = (sub ed.FStar_Absyn_Syntax.trivial)
in {FStar_Absyn_Syntax.mname = _149_1076; FStar_Absyn_Syntax.binders = binders; FStar_Absyn_Syntax.qualifiers = _149_1075; FStar_Absyn_Syntax.signature = _149_1074; FStar_Absyn_Syntax.ret = _149_1073; FStar_Absyn_Syntax.bind_wp = _149_1072; FStar_Absyn_Syntax.bind_wlp = _149_1071; FStar_Absyn_Syntax.if_then_else = _149_1070; FStar_Absyn_Syntax.ite_wp = _149_1069; FStar_Absyn_Syntax.ite_wlp = _149_1068; FStar_Absyn_Syntax.wp_binop = _149_1067; FStar_Absyn_Syntax.wp_as_type = _149_1066; FStar_Absyn_Syntax.close_wp = _149_1065; FStar_Absyn_Syntax.close_wp_t = _149_1064; FStar_Absyn_Syntax.assert_p = _149_1063; FStar_Absyn_Syntax.assume_p = _149_1062; FStar_Absyn_Syntax.null_wp = _149_1061; FStar_Absyn_Syntax.trivial = _149_1060})))))))))))))))))
in (

let se = FStar_Absyn_Syntax.Sig_new_effect ((ed, d.FStar_Parser_AST.drange))
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env0 se)
in (env, (se)::[]))))))
end)
end
| _60_2966 -> begin
(let _149_1080 = (let _149_1079 = (let _149_1078 = (let _149_1077 = (FStar_Absyn_Print.typ_to_string head)
in (Prims.strcat _149_1077 " is not an effect"))
in (_149_1078, d.FStar_Parser_AST.drange))
in FStar_Absyn_Syntax.Error (_149_1079))
in (Prims.raise _149_1080))
end)
end)))
end)))
end
| FStar_Parser_AST.NewEffect (quals, FStar_Parser_AST.DefineEffect (eff_name, eff_binders, eff_kind, eff_decls)) -> begin
(

let env0 = env
in (

let env = (FStar_Parser_DesugarEnv.enter_monad_scope env eff_name)
in (

let _60_2980 = (desugar_binders env eff_binders)
in (match (_60_2980) with
| (env, binders) -> begin
(

let eff_k = (desugar_kind env eff_kind)
in (

let _60_2991 = (FStar_All.pipe_right eff_decls (FStar_List.fold_left (fun _60_2984 decl -> (match (_60_2984) with
| (env, out) -> begin
(

let _60_2988 = (desugar_decl env decl)
in (match (_60_2988) with
| (env, ses) -> begin
(let _149_1084 = (let _149_1083 = (FStar_List.hd ses)
in (_149_1083)::out)
in (env, _149_1084))
end))
end)) (env, [])))
in (match (_60_2991) with
| (env, decls) -> begin
(

let decls = (FStar_List.rev decls)
in (

let lookup = (fun s -> (match ((let _149_1088 = (let _149_1087 = (FStar_Absyn_Syntax.mk_ident (s, d.FStar_Parser_AST.drange))
in (FStar_Parser_DesugarEnv.qualify env _149_1087))
in (FStar_Parser_DesugarEnv.try_resolve_typ_abbrev env _149_1088))) with
| None -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (((Prims.strcat (Prims.strcat (Prims.strcat "Monad " eff_name.FStar_Ident.idText) " expects definition of ") s), d.FStar_Parser_AST.drange))))
end
| Some (t) -> begin
t
end))
in (

let ed = (let _149_1104 = (FStar_Parser_DesugarEnv.qualify env0 eff_name)
in (let _149_1103 = (trans_quals quals)
in (let _149_1102 = (lookup "return")
in (let _149_1101 = (lookup "bind_wp")
in (let _149_1100 = (lookup "bind_wlp")
in (let _149_1099 = (lookup "if_then_else")
in (let _149_1098 = (lookup "ite_wp")
in (let _149_1097 = (lookup "ite_wlp")
in (let _149_1096 = (lookup "wp_binop")
in (let _149_1095 = (lookup "wp_as_type")
in (let _149_1094 = (lookup "close_wp")
in (let _149_1093 = (lookup "close_wp_t")
in (let _149_1092 = (lookup "assert_p")
in (let _149_1091 = (lookup "assume_p")
in (let _149_1090 = (lookup "null_wp")
in (let _149_1089 = (lookup "trivial")
in {FStar_Absyn_Syntax.mname = _149_1104; FStar_Absyn_Syntax.binders = binders; FStar_Absyn_Syntax.qualifiers = _149_1103; FStar_Absyn_Syntax.signature = eff_k; FStar_Absyn_Syntax.ret = _149_1102; FStar_Absyn_Syntax.bind_wp = _149_1101; FStar_Absyn_Syntax.bind_wlp = _149_1100; FStar_Absyn_Syntax.if_then_else = _149_1099; FStar_Absyn_Syntax.ite_wp = _149_1098; FStar_Absyn_Syntax.ite_wlp = _149_1097; FStar_Absyn_Syntax.wp_binop = _149_1096; FStar_Absyn_Syntax.wp_as_type = _149_1095; FStar_Absyn_Syntax.close_wp = _149_1094; FStar_Absyn_Syntax.close_wp_t = _149_1093; FStar_Absyn_Syntax.assert_p = _149_1092; FStar_Absyn_Syntax.assume_p = _149_1091; FStar_Absyn_Syntax.null_wp = _149_1090; FStar_Absyn_Syntax.trivial = _149_1089}))))))))))))))))
in (

let se = FStar_Absyn_Syntax.Sig_new_effect ((ed, d.FStar_Parser_AST.drange))
in (

let env = (FStar_Parser_DesugarEnv.push_sigelt env0 se)
in (env, (se)::[]))))))
end)))
end))))
end
| FStar_Parser_AST.SubEffect (l) -> begin
(

let lookup = (fun l -> (match ((FStar_Parser_DesugarEnv.try_lookup_effect_name env l)) with
| None -> begin
(let _149_1111 = (let _149_1110 = (let _149_1109 = (let _149_1108 = (let _149_1107 = (FStar_Absyn_Print.sli l)
in (Prims.strcat "Effect name " _149_1107))
in (Prims.strcat _149_1108 " not found"))
in (_149_1109, d.FStar_Parser_AST.drange))
in FStar_Absyn_Syntax.Error (_149_1110))
in (Prims.raise _149_1111))
end
| Some (l) -> begin
l
end))
in (

let src = (lookup l.FStar_Parser_AST.msource)
in (

let dst = (lookup l.FStar_Parser_AST.mdest)
in (

let lift = (desugar_typ env l.FStar_Parser_AST.lift_op)
in (

let se = FStar_Absyn_Syntax.Sig_sub_effect (({FStar_Absyn_Syntax.source = src; FStar_Absyn_Syntax.target = dst; FStar_Absyn_Syntax.lift = lift}, d.FStar_Parser_AST.drange))
in (env, (se)::[]))))))
end)))


let desugar_decls : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.decl Prims.list  ->  (FStar_Parser_DesugarEnv.env * FStar_Absyn_Syntax.sigelts) = (fun env decls -> (FStar_List.fold_left (fun _60_3016 d -> (match (_60_3016) with
| (env, sigelts) -> begin
(

let _60_3020 = (desugar_decl env d)
in (match (_60_3020) with
| (env, se) -> begin
(env, (FStar_List.append sigelts se))
end))
end)) (env, []) decls))


let open_prims_all : FStar_Parser_AST.decl Prims.list = ((FStar_Parser_AST.mk_decl (FStar_Parser_AST.Open (FStar_Absyn_Const.prims_lid)) FStar_Absyn_Syntax.dummyRange))::((FStar_Parser_AST.mk_decl (FStar_Parser_AST.Open (FStar_Absyn_Const.all_lid)) FStar_Absyn_Syntax.dummyRange))::[]


let desugar_modul_common : FStar_Absyn_Syntax.modul Prims.option  ->  FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.modul  ->  (env_t * FStar_Absyn_Syntax.modul * Prims.bool) = (fun curmod env m -> (

let open_ns = (fun mname d -> (

let d = if ((FStar_List.length mname.FStar_Ident.ns) <> 0) then begin
(let _149_1131 = (let _149_1130 = (let _149_1128 = (FStar_Absyn_Syntax.lid_of_ids mname.FStar_Ident.ns)
in FStar_Parser_AST.Open (_149_1128))
in (let _149_1129 = (FStar_Absyn_Syntax.range_of_lid mname)
in (FStar_Parser_AST.mk_decl _149_1130 _149_1129)))
in (_149_1131)::d)
end else begin
d
end
in d))
in (

let env = (match (curmod) with
| None -> begin
env
end
| Some (prev_mod) -> begin
(FStar_Parser_DesugarEnv.finish_module_or_interface env prev_mod)
end)
in (

let _60_3047 = (match (m) with
| FStar_Parser_AST.Interface (mname, decls, admitted) -> begin
(let _149_1133 = (FStar_Parser_DesugarEnv.prepare_module_or_interface true admitted env mname)
in (let _149_1132 = (open_ns mname decls)
in (_149_1133, mname, _149_1132, true)))
end
| FStar_Parser_AST.Module (mname, decls) -> begin
(let _149_1135 = (FStar_Parser_DesugarEnv.prepare_module_or_interface false false env mname)
in (let _149_1134 = (open_ns mname decls)
in (_149_1135, mname, _149_1134, false)))
end)
in (match (_60_3047) with
| ((env, pop_when_done), mname, decls, intf) -> begin
(

let _60_3050 = (desugar_decls env decls)
in (match (_60_3050) with
| (env, sigelts) -> begin
(

let modul = {FStar_Absyn_Syntax.name = mname; FStar_Absyn_Syntax.declarations = sigelts; FStar_Absyn_Syntax.exports = []; FStar_Absyn_Syntax.is_interface = intf; FStar_Absyn_Syntax.is_deserialized = false}
in (env, modul, pop_when_done))
end))
end)))))


let desugar_partial_modul : FStar_Absyn_Syntax.modul Prims.option  ->  FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.modul  ->  (FStar_Parser_DesugarEnv.env * FStar_Absyn_Syntax.modul) = (fun curmod env m -> (

let m = if (FStar_Options.interactive_fsi ()) then begin
(match (m) with
| FStar_Parser_AST.Module (mname, decls) -> begin
FStar_Parser_AST.Interface ((mname, decls, true))
end
| FStar_Parser_AST.Interface (mname, _60_3061, _60_3063) -> begin
(FStar_All.failwith (Prims.strcat "Impossible: " mname.FStar_Ident.ident.FStar_Ident.idText))
end)
end else begin
m
end
in (

let _60_3071 = (desugar_modul_common curmod env m)
in (match (_60_3071) with
| (x, y, _60_3070) -> begin
(x, y)
end))))


let desugar_modul : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.modul  ->  (env_t * FStar_Absyn_Syntax.modul) = (fun env m -> (

let _60_3077 = (desugar_modul_common None env m)
in (match (_60_3077) with
| (env, modul, pop_when_done) -> begin
(

let env = (FStar_Parser_DesugarEnv.finish_module_or_interface env modul)
in (

let _60_3079 = if (FStar_Options.dump_module modul.FStar_Absyn_Syntax.name.FStar_Ident.str) then begin
(let _149_1146 = (FStar_Absyn_Print.modul_to_string modul)
in (FStar_Util.print1 "%s\n" _149_1146))
end else begin
()
end
in (let _149_1147 = if pop_when_done then begin
(FStar_Parser_DesugarEnv.export_interface modul.FStar_Absyn_Syntax.name env)
end else begin
env
end
in (_149_1147, modul))))
end)))


let desugar_file : FStar_Parser_DesugarEnv.env  ->  FStar_Parser_AST.file  ->  (FStar_Parser_DesugarEnv.env * FStar_Absyn_Syntax.modul Prims.list) = (fun env f -> (

let _60_3092 = (FStar_List.fold_left (fun _60_3085 m -> (match (_60_3085) with
| (env, mods) -> begin
(

let _60_3089 = (desugar_modul env m)
in (match (_60_3089) with
| (env, m) -> begin
(env, (m)::mods)
end))
end)) (env, []) f)
in (match (_60_3092) with
| (env, mods) -> begin
(env, (FStar_List.rev mods))
end)))


let add_modul_to_env : FStar_Absyn_Syntax.modul  ->  FStar_Parser_DesugarEnv.env  ->  FStar_Parser_DesugarEnv.env = (fun m en -> (

let _60_3097 = (FStar_Parser_DesugarEnv.prepare_module_or_interface false false en m.FStar_Absyn_Syntax.name)
in (match (_60_3097) with
| (en, pop_when_done) -> begin
(

let en = (FStar_List.fold_left FStar_Parser_DesugarEnv.push_sigelt (

let _60_3098 = en
in {FStar_Parser_DesugarEnv.curmodule = Some (m.FStar_Absyn_Syntax.name); FStar_Parser_DesugarEnv.modules = _60_3098.FStar_Parser_DesugarEnv.modules; FStar_Parser_DesugarEnv.open_namespaces = _60_3098.FStar_Parser_DesugarEnv.open_namespaces; FStar_Parser_DesugarEnv.modul_abbrevs = _60_3098.FStar_Parser_DesugarEnv.modul_abbrevs; FStar_Parser_DesugarEnv.sigaccum = _60_3098.FStar_Parser_DesugarEnv.sigaccum; FStar_Parser_DesugarEnv.localbindings = _60_3098.FStar_Parser_DesugarEnv.localbindings; FStar_Parser_DesugarEnv.recbindings = _60_3098.FStar_Parser_DesugarEnv.recbindings; FStar_Parser_DesugarEnv.phase = _60_3098.FStar_Parser_DesugarEnv.phase; FStar_Parser_DesugarEnv.sigmap = _60_3098.FStar_Parser_DesugarEnv.sigmap; FStar_Parser_DesugarEnv.default_result_effect = _60_3098.FStar_Parser_DesugarEnv.default_result_effect; FStar_Parser_DesugarEnv.iface = _60_3098.FStar_Parser_DesugarEnv.iface; FStar_Parser_DesugarEnv.admitted_iface = _60_3098.FStar_Parser_DesugarEnv.admitted_iface}) m.FStar_Absyn_Syntax.exports)
in (

let env = (FStar_Parser_DesugarEnv.finish_module_or_interface en m)
in if pop_when_done then begin
(FStar_Parser_DesugarEnv.export_interface m.FStar_Absyn_Syntax.name env)
end else begin
env
end))
end)))




