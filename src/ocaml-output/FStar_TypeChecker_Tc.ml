
open Prims
let log : FStar_TypeChecker_Env.env  ->  Prims.bool = (fun env -> ((FStar_ST.read FStar_Options.log_types) && (not ((let _196_3 = (FStar_TypeChecker_Env.current_module env)
in (FStar_Ident.lid_equals FStar_Syntax_Const.prims_lid _196_3))))))

let rng : FStar_TypeChecker_Env.env  ->  FStar_Range.range = (fun env -> (FStar_TypeChecker_Env.get_range env))

let instantiate_both : FStar_TypeChecker_Env.env  ->  FStar_TypeChecker_Env.env = (fun env -> (let _94_17 = env
in {FStar_TypeChecker_Env.solver = _94_17.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_17.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_17.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_17.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_17.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_17.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_17.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_17.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_17.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = true; FStar_TypeChecker_Env.effects = _94_17.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_17.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_17.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _94_17.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_17.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_17.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_17.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_17.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_17.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_17.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_17.FStar_TypeChecker_Env.use_bv_sorts}))

let no_inst : FStar_TypeChecker_Env.env  ->  FStar_TypeChecker_Env.env = (fun env -> (let _94_20 = env
in {FStar_TypeChecker_Env.solver = _94_20.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_20.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_20.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_20.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_20.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_20.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_20.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_20.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_20.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = false; FStar_TypeChecker_Env.effects = _94_20.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_20.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_20.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _94_20.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_20.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_20.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_20.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_20.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_20.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_20.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_20.FStar_TypeChecker_Env.use_bv_sorts}))

let mk_lex_list : (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax Prims.list  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax = (fun vs -> (FStar_List.fold_right (fun v tl -> (let r = if (tl.FStar_Syntax_Syntax.pos = FStar_Range.dummyRange) then begin
v.FStar_Syntax_Syntax.pos
end else begin
(FStar_Range.union_ranges v.FStar_Syntax_Syntax.pos tl.FStar_Syntax_Syntax.pos)
end
in (let _196_17 = (let _196_16 = (FStar_Syntax_Syntax.as_arg v)
in (let _196_15 = (let _196_14 = (FStar_Syntax_Syntax.as_arg tl)
in (_196_14)::[])
in (_196_16)::_196_15))
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.lex_pair _196_17 (Some (FStar_Syntax_Util.lex_t.FStar_Syntax_Syntax.n)) r)))) vs FStar_Syntax_Util.lex_top))

let is_eq : FStar_Syntax_Syntax.arg_qualifier Prims.option  ->  Prims.bool = (fun _94_1 -> (match (_94_1) with
| Some (FStar_Syntax_Syntax.Equality) -> begin
true
end
| _94_30 -> begin
false
end))

let steps : FStar_TypeChecker_Env.env  ->  FStar_TypeChecker_Normalize.step Prims.list = (fun env -> if (FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str) then begin
(FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.Inline)::(FStar_TypeChecker_Normalize.SNComp)::[]
end else begin
(FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.Inline)::[]
end)

let unfold_whnf : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env t -> (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.WHNF)::(FStar_TypeChecker_Normalize.Unfold)::(FStar_TypeChecker_Normalize.Beta)::[]) env t))

let norm : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env t -> (let _196_30 = (steps env)
in (FStar_TypeChecker_Normalize.normalize _196_30 env t)))

let norm_c : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun env c -> (let _196_35 = (steps env)
in (FStar_TypeChecker_Normalize.normalize_comp _196_35 env c)))

let fxv_check : FStar_Syntax_Syntax.term  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.bv Prims.list * (FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.bv  ->  Prims.bool))  ->  Prims.unit = (fun head env kt fvs -> (let rec aux = (fun try_norm t -> if (FStar_Util.set_is_empty fvs) then begin
()
end else begin
(let fvs' = (let _196_54 = if try_norm then begin
(norm env t)
end else begin
t
end
in (FStar_Syntax_Free.names _196_54))
in (let a = (FStar_Util.set_intersect fvs fvs')
in if (FStar_Util.set_is_empty a) then begin
()
end else begin
if (not (try_norm)) then begin
(aux true t)
end else begin
(let fail = (fun _94_48 -> (match (()) with
| () -> begin
(let escaping = (let _196_58 = (let _196_57 = (FStar_Util.set_elements a)
in (FStar_All.pipe_right _196_57 (FStar_List.map FStar_Syntax_Print.bv_to_string)))
in (FStar_All.pipe_right _196_58 (FStar_String.concat ", ")))
in (let msg = if ((FStar_Util.set_count a) > 1) then begin
(let _196_59 = (FStar_TypeChecker_Normalize.term_to_string env head)
in (FStar_Util.format2 "Bound variables \'{%s}\' in the type of \'%s\' escape because of impure applications; add explicit let-bindings" escaping _196_59))
end else begin
(let _196_60 = (FStar_TypeChecker_Normalize.term_to_string env head)
in (FStar_Util.format2 "Bound variable \'%s\' in the type of \'%s\' escapes because of impure applications; add explicit let-bindings" escaping _196_60))
end
in (let _196_63 = (let _196_62 = (let _196_61 = (FStar_TypeChecker_Env.get_range env)
in (msg, _196_61))
in FStar_Syntax_Syntax.Error (_196_62))
in (Prims.raise _196_63))))
end))
in (let s = (let _196_64 = (FStar_TypeChecker_Recheck.check t)
in (FStar_TypeChecker_Util.new_uvar env _196_64))
in (match ((FStar_TypeChecker_Rel.try_teq env t s)) with
| Some (g) -> begin
(FStar_TypeChecker_Rel.force_trivial_guard env g)
end
| _94_55 -> begin
(fail ())
end)))
end
end))
end)
in (aux false kt)))

let check_no_escape : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.bv Prims.list  ->  FStar_Syntax_Syntax.term  ->  Prims.unit = (fun env bs t -> (let fvs = (FStar_Syntax_Free.names t)
in if (FStar_Util.for_some (fun x -> (FStar_Util.set_mem x fvs)) bs) then begin
(let _94_64 = (FStar_Syntax_Util.type_u ())
in (match (_94_64) with
| (k, _94_63) -> begin
(let tnarrow = (FStar_TypeChecker_Util.new_uvar env k)
in (let _196_72 = (FStar_TypeChecker_Rel.teq env t tnarrow)
in (FStar_All.pipe_left (FStar_TypeChecker_Rel.force_trivial_guard env) _196_72)))
end))
end else begin
()
end))

let maybe_push_binding : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.binder  ->  FStar_TypeChecker_Env.env = (fun env b -> if (FStar_Syntax_Syntax.is_null_binder b) then begin
env
end else begin
(let _94_68 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_78 = (FStar_Syntax_Print.bv_to_string (Prims.fst b))
in (let _196_77 = (FStar_Syntax_Print.term_to_string (Prims.fst b).FStar_Syntax_Syntax.sort)
in (FStar_Util.print2 "Pushing binder %s at type %s\n" _196_78 _196_77)))
end else begin
()
end
in (FStar_TypeChecker_Env.push_bv env (Prims.fst b)))
end)

let maybe_make_subst = (fun _94_2 -> (match (_94_2) with
| FStar_Util.Inr (Some (x), e) -> begin
(FStar_Syntax_Syntax.NT ((x, e)))::[]
end
| _94_77 -> begin
[]
end))

let maybe_extend_subst : FStar_Syntax_Syntax.subst_t  ->  FStar_Syntax_Syntax.binder  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.subst_t = (fun s b v -> if (FStar_Syntax_Syntax.is_null_binder b) then begin
s
end else begin
(FStar_Syntax_Syntax.NT (((Prims.fst b), v)))::s
end)

let set_lcomp_result : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.lcomp = (fun lc t -> (let _94_83 = lc
in {FStar_Syntax_Syntax.eff_name = _94_83.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.res_typ = t; FStar_Syntax_Syntax.cflags = _94_83.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = (fun _94_85 -> (match (()) with
| () -> begin
(let _196_91 = (lc.FStar_Syntax_Syntax.comp ())
in (FStar_Syntax_Util.set_result_typ _196_91 t))
end))}))

let value_check_expected_typ : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term, FStar_Syntax_Syntax.lcomp) FStar_Util.either  ->  FStar_TypeChecker_Env.guard_t  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e tlc guard -> (let lc = (match (tlc) with
| FStar_Util.Inl (t) -> begin
(let _196_100 = if (not ((FStar_Syntax_Util.is_pure_or_ghost_function t))) then begin
(FStar_Syntax_Syntax.mk_Total t)
end else begin
(FStar_TypeChecker_Util.return_value env t e)
end
in (FStar_Syntax_Util.lcomp_of_comp _196_100))
end
| FStar_Util.Inr (lc) -> begin
lc
end)
in (let t = lc.FStar_Syntax_Syntax.res_typ
in (let _94_117 = (match ((FStar_TypeChecker_Env.expected_typ env)) with
| None -> begin
(e, lc, guard)
end
| Some (t') -> begin
(let _94_99 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_102 = (FStar_Syntax_Print.term_to_string t)
in (let _196_101 = (FStar_Syntax_Print.term_to_string t')
in (FStar_Util.print2 "Computed return type %s; expected type %s\n" _196_102 _196_101)))
end else begin
()
end
in (let _94_103 = (FStar_TypeChecker_Util.maybe_coerce_bool_to_type env e lc t')
in (match (_94_103) with
| (e, lc) -> begin
(let t = lc.FStar_Syntax_Syntax.res_typ
in (let _94_107 = (FStar_TypeChecker_Util.check_and_ascribe env e t t')
in (match (_94_107) with
| (e, g) -> begin
(let _94_108 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_104 = (FStar_Syntax_Print.term_to_string t)
in (let _196_103 = (FStar_TypeChecker_Rel.guard_to_string env g)
in (FStar_Util.print2 "check_and_ascribe: type is %s\n\tguard is %s\n" _196_104 _196_103)))
end else begin
()
end
in (let g = (FStar_TypeChecker_Rel.conj_guard g guard)
in (let _94_113 = (let _196_110 = (FStar_All.pipe_left (fun _196_109 -> Some (_196_109)) (FStar_TypeChecker_Errors.subtyping_failed env t t'))
in (FStar_TypeChecker_Util.strengthen_precondition _196_110 env e lc g))
in (match (_94_113) with
| (lc, g) -> begin
(e, (set_lcomp_result lc t'), g)
end))))
end)))
end)))
end)
in (match (_94_117) with
| (e, lc, g) -> begin
(let _94_118 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_111 = (FStar_Syntax_Print.lcomp_to_string lc)
in (FStar_Util.print1 "Return comp type is %s\n" _196_111))
end else begin
()
end
in (e, lc, g))
end)))))

let comp_check_expected_typ : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.lcomp  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e lc -> (match ((FStar_TypeChecker_Env.expected_typ env)) with
| None -> begin
(e, lc, FStar_TypeChecker_Rel.trivial_guard)
end
| Some (t) -> begin
(let _94_128 = (FStar_TypeChecker_Util.maybe_coerce_bool_to_type env e lc t)
in (match (_94_128) with
| (e, lc) -> begin
(FStar_TypeChecker_Util.weaken_result_typ env e lc t)
end))
end))

let check_expected_effect : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp Prims.option  ->  (FStar_Syntax_Syntax.term * (FStar_Syntax_Syntax.comp', Prims.unit) FStar_Syntax_Syntax.syntax)  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp * FStar_TypeChecker_Env.guard_t) = (fun env copt _94_133 -> (match (_94_133) with
| (e, c) -> begin
(let expected_c_opt = (match (copt) with
| Some (_94_135) -> begin
copt
end
| None -> begin
if (FStar_Syntax_Util.is_tot_or_gtot_comp c) then begin
None
end else begin
(let c1 = (FStar_TypeChecker_Normalize.unfold_effect_abbrev env c)
in (let md = (FStar_TypeChecker_Env.get_effect_decl env c1.FStar_Syntax_Syntax.effect_name)
in (match ((FStar_TypeChecker_Env.default_effect env md.FStar_Syntax_Syntax.mname)) with
| None -> begin
None
end
| Some (l) -> begin
(let flags = if (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_Tot_lid) then begin
(FStar_Syntax_Syntax.TOTAL)::[]
end else begin
if (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_ML_lid) then begin
(FStar_Syntax_Syntax.MLEFFECT)::[]
end else begin
[]
end
end
in (let def = (FStar_Syntax_Syntax.mk_Comp {FStar_Syntax_Syntax.effect_name = l; FStar_Syntax_Syntax.result_typ = c1.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = flags})
in Some (def)))
end)))
end
end)
in (match (expected_c_opt) with
| None -> begin
(let _196_124 = (norm_c env c)
in (e, _196_124, FStar_TypeChecker_Rel.trivial_guard))
end
| Some (expected_c) -> begin
(let _94_149 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_127 = (FStar_Syntax_Print.term_to_string e)
in (let _196_126 = (FStar_Syntax_Print.comp_to_string c)
in (let _196_125 = (FStar_Syntax_Print.comp_to_string expected_c)
in (FStar_Util.print3 "\n\n(%s) About to check\n\t%s\nagainst expected effect\n\t%s\n" _196_127 _196_126 _196_125))))
end else begin
()
end
in (let c = (norm_c env c)
in (let _94_152 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_130 = (FStar_Syntax_Print.term_to_string e)
in (let _196_129 = (FStar_Syntax_Print.comp_to_string c)
in (let _196_128 = (FStar_Syntax_Print.comp_to_string expected_c)
in (FStar_Util.print3 "\n\nAfter normalization (%s) About to check\n\t%s\nagainst expected effect\n\t%s\n" _196_130 _196_129 _196_128))))
end else begin
()
end
in (let _94_158 = (FStar_TypeChecker_Util.check_comp env e c expected_c)
in (match (_94_158) with
| (e, _94_156, g) -> begin
(let g = (let _196_131 = (FStar_TypeChecker_Env.get_range env)
in (FStar_TypeChecker_Util.label_guard _196_131 "could not prove post-condition" g))
in (let _94_160 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_133 = (FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos)
in (let _196_132 = (FStar_TypeChecker_Rel.guard_to_string env g)
in (FStar_Util.print2 "(%s) DONE check_expected_effect; guard is: %s\n" _196_133 _196_132)))
end else begin
()
end
in (e, expected_c, g)))
end)))))
end))
end))

let no_logical_guard = (fun env _94_166 -> (match (_94_166) with
| (te, kt, f) -> begin
(match ((FStar_TypeChecker_Rel.guard_form f)) with
| FStar_TypeChecker_Common.Trivial -> begin
(te, kt, f)
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(let _196_139 = (let _196_138 = (let _196_137 = (FStar_TypeChecker_Errors.unexpected_non_trivial_precondition_on_term env f)
in (let _196_136 = (FStar_TypeChecker_Env.get_range env)
in (_196_137, _196_136)))
in FStar_Syntax_Syntax.Error (_196_138))
in (Prims.raise _196_139))
end)
end))

let print_expected_ty : FStar_TypeChecker_Env.env  ->  Prims.unit = (fun env -> (match ((FStar_TypeChecker_Env.expected_typ env)) with
| None -> begin
(FStar_Util.print_string "Expected type is None")
end
| Some (t) -> begin
(let _196_142 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print1 "Expected type is %s" _196_142))
end))

let with_implicits = (fun imps _94_178 -> (match (_94_178) with
| (e, l, g) -> begin
(e, l, (let _94_179 = g
in {FStar_TypeChecker_Env.guard_f = _94_179.FStar_TypeChecker_Env.guard_f; FStar_TypeChecker_Env.deferred = _94_179.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = _94_179.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = (FStar_List.append imps g.FStar_TypeChecker_Env.implicits)}))
end))

let add_implicit : (FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.uvar * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.typ * FStar_Range.range)  ->  FStar_TypeChecker_Env.guard_t  ->  FStar_TypeChecker_Env.guard_t = (fun u g -> (let _94_183 = g
in {FStar_TypeChecker_Env.guard_f = _94_183.FStar_TypeChecker_Env.guard_f; FStar_TypeChecker_Env.deferred = _94_183.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = _94_183.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = (u)::g.FStar_TypeChecker_Env.implicits}))

let check_smt_pat = (fun env t bs c -> if (FStar_Syntax_Util.is_smt_lemma t) then begin
(match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp ({FStar_Syntax_Syntax.effect_name = _94_207; FStar_Syntax_Syntax.result_typ = _94_205; FStar_Syntax_Syntax.effect_args = (pre, _94_201)::(post, _94_197)::(pats, _94_193)::[]; FStar_Syntax_Syntax.flags = _94_190}) -> begin
(let rec extract_pats = (fun pats -> (match ((let _196_155 = (FStar_Syntax_Subst.compress pats)
in _196_155.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (cons, _94_220); FStar_Syntax_Syntax.tk = _94_217; FStar_Syntax_Syntax.pos = _94_215; FStar_Syntax_Syntax.vars = _94_213}, _94_233::(hd, _94_230)::(tl, _94_226)::[]) when (FStar_Ident.lid_equals cons.FStar_Syntax_Syntax.v FStar_Syntax_Const.cons_lid) -> begin
(let _94_239 = (FStar_Syntax_Util.head_and_args hd)
in (match (_94_239) with
| (head, args) -> begin
(let pat = (match (args) with
| (_::arg::[]) | (arg::[]) -> begin
(arg)::[]
end
| _94_246 -> begin
[]
end)
in (let _196_156 = (extract_pats tl)
in (FStar_List.append pat _196_156)))
end))
end
| _94_249 -> begin
[]
end))
in (let pats = (let _196_157 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env pats)
in (extract_pats _196_157))
in (let fvs = (let _196_161 = (FStar_Syntax_Syntax.new_bv_set ())
in (FStar_List.fold_left (fun out _94_255 -> (match (_94_255) with
| (a, _94_254) -> begin
(let _196_160 = (FStar_Syntax_Free.names a)
in (FStar_Util.set_union out _196_160))
end)) _196_161 pats))
in (match ((FStar_All.pipe_right bs (FStar_Util.find_opt (fun _94_260 -> (match (_94_260) with
| (b, _94_259) -> begin
(not ((FStar_Util.set_mem b fvs)))
end))))) with
| None -> begin
()
end
| Some (x, _94_264) -> begin
(let _196_164 = (let _196_163 = (FStar_Syntax_Print.bv_to_string x)
in (FStar_Util.format1 "Pattern misses at least one bound variables: %s" _196_163))
in (FStar_TypeChecker_Errors.warn t.FStar_Syntax_Syntax.pos _196_164))
end))))
end
| _94_268 -> begin
(FStar_All.failwith "Impossible")
end)
end else begin
()
end)

let guard_letrecs : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.comp  ->  (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.typ) Prims.list = (fun env actuals expected_c -> (match (env.FStar_TypeChecker_Env.letrecs) with
| [] -> begin
[]
end
| letrecs -> begin
(let r = (FStar_TypeChecker_Env.get_range env)
in (let env = (let _94_275 = env
in {FStar_TypeChecker_Env.solver = _94_275.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_275.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_275.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_275.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_275.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_275.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_275.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_275.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_275.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_275.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_275.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_275.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = []; FStar_TypeChecker_Env.top_level = _94_275.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_275.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_275.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_275.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_275.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_275.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_275.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_275.FStar_TypeChecker_Env.use_bv_sorts})
in (let precedes = (let _196_171 = (FStar_TypeChecker_Env.get_range env)
in (FStar_Syntax_Syntax.fvar None FStar_Syntax_Const.precedes_lid _196_171))
in (let decreases_clause = (fun bs c -> (let filter_types_and_functions = (fun bs -> (FStar_All.pipe_right bs (FStar_List.collect (fun _94_287 -> (match (_94_287) with
| (b, _94_286) -> begin
(let t = (let _196_179 = (FStar_Syntax_Util.unrefine b.FStar_Syntax_Syntax.sort)
in (unfold_whnf env _196_179))
in (match (t.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_type (_)) | (FStar_Syntax_Syntax.Tm_arrow (_)) -> begin
[]
end
| _94_296 -> begin
(let _196_180 = (FStar_Syntax_Syntax.bv_to_name b)
in (_196_180)::[])
end))
end)))))
in (let as_lex_list = (fun dec -> (let _94_302 = (FStar_Syntax_Util.head_and_args dec)
in (match (_94_302) with
| (head, _94_301) -> begin
(match (head.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv, _94_305) when (FStar_Ident.lid_equals fv.FStar_Syntax_Syntax.v FStar_Syntax_Const.lexcons_lid) -> begin
dec
end
| _94_309 -> begin
(mk_lex_list ((dec)::[]))
end)
end)))
in (let ct = (FStar_Syntax_Util.comp_to_comp_typ c)
in (match ((FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags (FStar_List.tryFind (fun _94_3 -> (match (_94_3) with
| FStar_Syntax_Syntax.DECREASES (_94_313) -> begin
true
end
| _94_316 -> begin
false
end))))) with
| Some (FStar_Syntax_Syntax.DECREASES (dec)) -> begin
(as_lex_list dec)
end
| _94_321 -> begin
(let xs = (FStar_All.pipe_right bs filter_types_and_functions)
in (match (xs) with
| x::[] -> begin
x
end
| _94_326 -> begin
(mk_lex_list xs)
end))
end)))))
in (let previous_dec = (decreases_clause actuals expected_c)
in (let guard_one_letrec = (fun _94_331 -> (match (_94_331) with
| (l, t) -> begin
(match ((let _196_186 = (FStar_Syntax_Subst.compress t)
in _196_186.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (formals, c) -> begin
(let formals = (FStar_All.pipe_right formals (FStar_List.map (fun _94_338 -> (match (_94_338) with
| (x, imp) -> begin
if (FStar_Syntax_Syntax.is_null_bv x) then begin
(let _196_190 = (let _196_189 = (let _196_188 = (FStar_Syntax_Syntax.range_of_bv x)
in Some (_196_188))
in (FStar_Syntax_Syntax.new_bv _196_189 x.FStar_Syntax_Syntax.sort))
in (_196_190, imp))
end else begin
(x, imp)
end
end))))
in (let _94_342 = (FStar_Syntax_Subst.open_comp formals c)
in (match (_94_342) with
| (formals, c) -> begin
(let dec = (decreases_clause formals c)
in (let precedes = (let _196_194 = (let _196_193 = (FStar_Syntax_Syntax.as_arg dec)
in (let _196_192 = (let _196_191 = (FStar_Syntax_Syntax.as_arg previous_dec)
in (_196_191)::[])
in (_196_193)::_196_192))
in (FStar_Syntax_Syntax.mk_Tm_app precedes _196_194 None r))
in (let _94_349 = (FStar_Util.prefix formals)
in (match (_94_349) with
| (bs, (last, imp)) -> begin
(let last = (let _94_350 = last
in (let _196_195 = (FStar_Syntax_Util.refine last precedes)
in {FStar_Syntax_Syntax.ppname = _94_350.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_350.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _196_195}))
in (let refined_formals = (FStar_List.append bs (((last, imp))::[]))
in (let t' = (FStar_Syntax_Util.arrow refined_formals c)
in (let _94_355 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_198 = (FStar_Syntax_Print.lbname_to_string l)
in (let _196_197 = (FStar_Syntax_Print.term_to_string t)
in (let _196_196 = (FStar_Syntax_Print.term_to_string t')
in (FStar_Util.print3 "Refined let rec %s\n\tfrom type %s\n\tto type %s\n" _196_198 _196_197 _196_196))))
end else begin
()
end
in (l, t')))))
end))))
end)))
end
| _94_358 -> begin
(FStar_All.failwith "Impossible: Annotated type of \'let rec\' is not an arrow")
end)
end))
in (FStar_All.pipe_right letrecs (FStar_List.map guard_one_letrec))))))))
end))

let rec tc_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (tc_maybe_toplevel_term (let _94_361 = env
in {FStar_TypeChecker_Env.solver = _94_361.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_361.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_361.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_361.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_361.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_361.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_361.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_361.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_361.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_361.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_361.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_361.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_361.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = _94_361.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_361.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_361.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_361.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_361.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_361.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_361.FStar_TypeChecker_Env.use_bv_sorts}) e))
and tc_maybe_toplevel_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (let env = if (e.FStar_Syntax_Syntax.pos = FStar_Range.dummyRange) then begin
env
end else begin
(FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos)
end
in (let _94_366 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_264 = (let _196_262 = (FStar_TypeChecker_Env.get_range env)
in (FStar_All.pipe_left FStar_Range.string_of_range _196_262))
in (let _196_263 = (FStar_Syntax_Print.tag_of_term e)
in (FStar_Util.print2 "%s (%s)\n" _196_264 _196_263)))
end else begin
()
end
in (let top = e
in (match (e.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (_94_370) -> begin
(let _196_268 = (FStar_Syntax_Subst.compress e)
in (tc_term env _196_268))
end
| (FStar_Syntax_Syntax.Tm_uinst (_)) | (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_bvar (_)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_abs (_)) | (FStar_Syntax_Syntax.Tm_arrow (_)) | (FStar_Syntax_Syntax.Tm_refine (_)) | (FStar_Syntax_Syntax.Tm_type (_)) | (FStar_Syntax_Syntax.Tm_unknown) -> begin
(tc_value env e)
end
| FStar_Syntax_Syntax.Tm_meta (e, FStar_Syntax_Syntax.Meta_pattern (pats)) -> begin
(let _94_410 = (FStar_Syntax_Util.type_u ())
in (match (_94_410) with
| (t, u) -> begin
(let _94_414 = (tc_check_tot_or_gtot_term env e t)
in (match (_94_414) with
| (e, c, g) -> begin
(let _94_421 = (let _94_418 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_418) with
| (env, _94_417) -> begin
(tc_pats env pats)
end))
in (match (_94_421) with
| (pats, g') -> begin
(let g' = (let _94_422 = g'
in {FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial; FStar_TypeChecker_Env.deferred = _94_422.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = _94_422.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = _94_422.FStar_TypeChecker_Env.implicits})
in (let _196_270 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta ((e, FStar_Syntax_Syntax.Meta_pattern (pats)))) (Some (t.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (let _196_269 = (FStar_TypeChecker_Rel.conj_guard g g')
in (_196_270, c, _196_269))))
end))
end))
end))
end
| FStar_Syntax_Syntax.Tm_meta (e, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Sequence)) -> begin
(match ((let _196_271 = (FStar_Syntax_Subst.compress e)
in _196_271.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_let ((_94_431, {FStar_Syntax_Syntax.lbname = x; FStar_Syntax_Syntax.lbunivs = _94_438; FStar_Syntax_Syntax.lbtyp = _94_436; FStar_Syntax_Syntax.lbeff = _94_434; FStar_Syntax_Syntax.lbdef = e1}::[]), e2) -> begin
(let _94_449 = (let _196_272 = (FStar_TypeChecker_Env.set_expected_typ env FStar_TypeChecker_Recheck.t_unit)
in (tc_term _196_272 e1))
in (match (_94_449) with
| (e1, c1, g1) -> begin
(let _94_453 = (tc_term env e2)
in (match (_94_453) with
| (e2, c2, g2) -> begin
(let c = (FStar_TypeChecker_Util.bind env (Some (e1)) c1 (None, c2))
in (let e = (let _196_277 = (let _196_276 = (let _196_275 = (let _196_274 = (let _196_273 = (FStar_Syntax_Syntax.mk_lb (x, [], c1.FStar_Syntax_Syntax.eff_name, FStar_TypeChecker_Recheck.t_unit, e1))
in (_196_273)::[])
in (false, _196_274))
in (_196_275, e2))
in FStar_Syntax_Syntax.Tm_let (_196_276))
in (FStar_Syntax_Syntax.mk _196_277 (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos))
in (let e = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta ((e, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Sequence)))) (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (let _196_278 = (FStar_TypeChecker_Rel.conj_guard g1 g2)
in (e, c, _196_278)))))
end))
end))
end
| _94_458 -> begin
(let _94_462 = (tc_term env e)
in (match (_94_462) with
| (e, c, g) -> begin
(let e = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta ((e, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Sequence)))) (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (e, c, g))
end))
end)
end
| FStar_Syntax_Syntax.Tm_meta (e, m) -> begin
(let _94_471 = (tc_term env e)
in (match (_94_471) with
| (e, c, g) -> begin
(let e = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta ((e, m))) (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (e, c, g))
end))
end
| FStar_Syntax_Syntax.Tm_ascribed (e, t, _94_476) -> begin
(let _94_481 = (FStar_Syntax_Util.type_u ())
in (match (_94_481) with
| (k, u) -> begin
(let _94_486 = (tc_check_tot_or_gtot_term env t k)
in (match (_94_486) with
| (t, _94_484, f) -> begin
(let _94_490 = (let _196_279 = (FStar_TypeChecker_Env.set_expected_typ env t)
in (tc_term _196_279 e))
in (match (_94_490) with
| (e, c, g) -> begin
(let _94_494 = (let _196_283 = (FStar_TypeChecker_Env.set_range env t.FStar_Syntax_Syntax.pos)
in (FStar_TypeChecker_Util.strengthen_precondition (Some ((fun _94_491 -> (match (()) with
| () -> begin
FStar_TypeChecker_Errors.ill_kinded_type
end)))) _196_283 e c f))
in (match (_94_494) with
| (c, f) -> begin
(let _94_498 = (let _196_284 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_ascribed ((e, t, Some (c.FStar_Syntax_Syntax.eff_name)))) (Some (t.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (comp_check_expected_typ env _196_284 c))
in (match (_94_498) with
| (e, c, f2) -> begin
(let _196_286 = (let _196_285 = (FStar_TypeChecker_Rel.conj_guard g f2)
in (FStar_TypeChecker_Rel.conj_guard f _196_285))
in (e, c, _196_286))
end))
end))
end))
end))
end))
end
| FStar_Syntax_Syntax.Tm_app (head, args) -> begin
(let env0 = env
in (let env = (let _196_288 = (let _196_287 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (FStar_All.pipe_right _196_287 Prims.fst))
in (FStar_All.pipe_right _196_288 instantiate_both))
in (let _94_505 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_290 = (FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos)
in (let _196_289 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.print2 "(%s) Checking app %s\n" _196_290 _196_289)))
end else begin
()
end
in (let _94_510 = (tc_term (no_inst env) head)
in (match (_94_510) with
| (head, chead, g_head) -> begin
(let _94_514 = if (FStar_TypeChecker_Util.short_circuit_head head) then begin
(let _196_291 = (FStar_TypeChecker_Env.expected_typ env0)
in (check_short_circuit_args env head chead g_head args _196_291))
end else begin
(let _196_292 = (FStar_TypeChecker_Env.expected_typ env0)
in (check_application_args env head chead g_head args _196_292))
end
in (match (_94_514) with
| (e, c, g) -> begin
(let _94_515 = if (FStar_TypeChecker_Env.debug env FStar_Options.Extreme) then begin
(let _196_293 = (FStar_TypeChecker_Rel.print_pending_implicits g)
in (FStar_Util.print1 "Introduced {%s} implicits in application\n" _196_293))
end else begin
()
end
in (let c = if (((FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str) && (not ((FStar_Syntax_Util.is_lcomp_partial_return c)))) && (FStar_Syntax_Util.is_pure_or_ghost_lcomp c)) then begin
(FStar_TypeChecker_Util.maybe_assume_result_eq_pure_term env e c)
end else begin
c
end
in (let _94_522 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_299 = (FStar_Syntax_Print.term_to_string e)
in (let _196_298 = (let _196_294 = (c.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_left FStar_Syntax_Print.comp_to_string _196_294))
in (let _196_297 = (let _196_296 = (FStar_TypeChecker_Env.expected_typ env0)
in (FStar_All.pipe_right _196_296 (fun x -> (match (x) with
| None -> begin
"None"
end
| Some (t) -> begin
(FStar_Syntax_Print.term_to_string t)
end))))
in (FStar_Util.print3 "(%s) About to check %s against expected typ %s\n" _196_299 _196_298 _196_297))))
end else begin
()
end
in (let _94_527 = (comp_check_expected_typ env0 e c)
in (match (_94_527) with
| (e, c, g') -> begin
(let _94_528 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_302 = (FStar_Syntax_Print.term_to_string e)
in (let _196_301 = (let _196_300 = (c.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_left FStar_Syntax_Print.comp_to_string _196_300))
in (FStar_Util.print2 "(%s) checked ... got %s\n" _196_302 _196_301)))
end else begin
()
end
in (let gimp = (match ((let _196_303 = (FStar_Syntax_Subst.compress head)
in _196_303.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_uvar (u, _94_532) -> begin
(let imp = (env0, u, e, c.FStar_Syntax_Syntax.res_typ, e.FStar_Syntax_Syntax.pos)
in (let _94_536 = FStar_TypeChecker_Rel.trivial_guard
in {FStar_TypeChecker_Env.guard_f = _94_536.FStar_TypeChecker_Env.guard_f; FStar_TypeChecker_Env.deferred = _94_536.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = _94_536.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = (imp)::[]}))
end
| _94_539 -> begin
FStar_TypeChecker_Rel.trivial_guard
end)
in (let gres = (let _196_304 = (FStar_TypeChecker_Rel.conj_guard g' gimp)
in (FStar_TypeChecker_Rel.conj_guard g _196_304))
in (let _94_542 = if (FStar_TypeChecker_Env.debug env FStar_Options.Extreme) then begin
(let _196_305 = (FStar_TypeChecker_Rel.guard_to_string env gres)
in (FStar_Util.print1 "Guard from application node is %s\n" _196_305))
end else begin
()
end
in (e, c, gres)))))
end)))))
end))
end)))))
end
| FStar_Syntax_Syntax.Tm_match (e1, eqns) -> begin
(let _94_550 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_550) with
| (env1, topt) -> begin
(let env1 = (instantiate_both env1)
in (let _94_555 = (tc_term env1 e1)
in (match (_94_555) with
| (e1, c1, g1) -> begin
(let _94_566 = (match (topt) with
| Some (t) -> begin
(env, t)
end
| None -> begin
(let _94_562 = (FStar_Syntax_Util.type_u ())
in (match (_94_562) with
| (k, _94_561) -> begin
(let res_t = (FStar_TypeChecker_Util.new_uvar env k)
in (let _196_306 = (FStar_TypeChecker_Env.set_expected_typ env res_t)
in (_196_306, res_t)))
end))
end)
in (match (_94_566) with
| (env_branches, res_t) -> begin
(let guard_x = (FStar_Syntax_Syntax.gen_bv "scrutinee" (Some (e1.FStar_Syntax_Syntax.pos)) c1.FStar_Syntax_Syntax.res_typ)
in (let t_eqns = (FStar_All.pipe_right eqns (FStar_List.map (tc_eqn guard_x env_branches)))
in (let _94_583 = (let _94_580 = (FStar_List.fold_right (fun _94_574 _94_577 -> (match ((_94_574, _94_577)) with
| ((_94_570, f, c, g), (caccum, gaccum)) -> begin
(let _196_309 = (FStar_TypeChecker_Rel.conj_guard g gaccum)
in (((f, c))::caccum, _196_309))
end)) t_eqns ([], FStar_TypeChecker_Rel.trivial_guard))
in (match (_94_580) with
| (cases, g) -> begin
(let _196_310 = (FStar_TypeChecker_Util.bind_cases env res_t cases)
in (_196_310, g))
end))
in (match (_94_583) with
| (c_branches, g_branches) -> begin
(let cres = (FStar_TypeChecker_Util.bind env (Some (e1)) c1 (Some (guard_x), c_branches))
in (let e = (let _196_314 = (let _196_313 = (let _196_312 = (FStar_List.map (fun _94_592 -> (match (_94_592) with
| (f, _94_587, _94_589, _94_591) -> begin
f
end)) t_eqns)
in (e1, _196_312))
in FStar_Syntax_Syntax.Tm_match (_196_313))
in (FStar_Syntax_Syntax.mk _196_314 (Some (cres.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos))
in (let e = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_ascribed ((e, cres.FStar_Syntax_Syntax.res_typ, Some (cres.FStar_Syntax_Syntax.eff_name)))) None e.FStar_Syntax_Syntax.pos)
in (let _94_595 = if (FStar_TypeChecker_Env.debug env FStar_Options.Extreme) then begin
(let _196_317 = (FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos)
in (let _196_316 = (let _196_315 = (cres.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_left FStar_Syntax_Print.comp_to_string _196_315))
in (FStar_Util.print2 "(%s) comp type = %s\n" _196_317 _196_316)))
end else begin
()
end
in (let _196_318 = (FStar_TypeChecker_Rel.conj_guard g1 g_branches)
in (e, cres, _196_318))))))
end))))
end))
end)))
end))
end
| FStar_Syntax_Syntax.Tm_let ((false, {FStar_Syntax_Syntax.lbname = FStar_Util.Inr (_94_607); FStar_Syntax_Syntax.lbunivs = _94_605; FStar_Syntax_Syntax.lbtyp = _94_603; FStar_Syntax_Syntax.lbeff = _94_601; FStar_Syntax_Syntax.lbdef = _94_599}::[]), _94_613) -> begin
(let _94_616 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_319 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.print1 "%s\n" _196_319))
end else begin
()
end
in (check_top_level_let env top))
end
| FStar_Syntax_Syntax.Tm_let ((false, _94_620), _94_623) -> begin
(check_inner_let env top)
end
| FStar_Syntax_Syntax.Tm_let ((true, {FStar_Syntax_Syntax.lbname = FStar_Util.Inr (_94_638); FStar_Syntax_Syntax.lbunivs = _94_636; FStar_Syntax_Syntax.lbtyp = _94_634; FStar_Syntax_Syntax.lbeff = _94_632; FStar_Syntax_Syntax.lbdef = _94_630}::_94_628), _94_644) -> begin
(let _94_647 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_320 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.print1 "%s\n" _196_320))
end else begin
()
end
in (check_top_level_let_rec env top))
end
| FStar_Syntax_Syntax.Tm_let ((true, _94_651), _94_654) -> begin
(check_inner_let_rec env top)
end)))))
and tc_value : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (let check_instantiated_fvar = (fun env v dc e t -> (let _94_668 = (FStar_TypeChecker_Util.maybe_instantiate env e t)
in (match (_94_668) with
| (e, t, implicits) -> begin
(let tc = if (FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str) then begin
FStar_Util.Inl (t)
end else begin
(let _196_334 = (let _196_333 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp _196_333))
in FStar_Util.Inr (_196_334))
end
in (let is_data_ctor = (fun _94_4 -> (match (_94_4) with
| (Some (FStar_Syntax_Syntax.Data_ctor)) | (Some (FStar_Syntax_Syntax.Record_ctor (_))) -> begin
true
end
| _94_678 -> begin
false
end))
in if ((is_data_ctor dc) && (not ((FStar_TypeChecker_Env.is_datacon env v.FStar_Syntax_Syntax.v)))) then begin
(let _196_340 = (let _196_339 = (let _196_338 = (FStar_Util.format1 "Expected a data constructor; got %s" v.FStar_Syntax_Syntax.v.FStar_Ident.str)
in (let _196_337 = (FStar_TypeChecker_Env.get_range env)
in (_196_338, _196_337)))
in FStar_Syntax_Syntax.Error (_196_339))
in (Prims.raise _196_340))
end else begin
(value_check_expected_typ env e tc implicits)
end))
end)))
in (let env = (FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos)
in (let top = (FStar_Syntax_Subst.compress e)
in (match (top.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_bvar (x) -> begin
(FStar_All.failwith "Impossible: Violation of locally nameless convention")
end
| FStar_Syntax_Syntax.Tm_uvar (u, t1) -> begin
(let g = (match ((let _196_341 = (FStar_Syntax_Subst.compress t1)
in _196_341.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (_94_689) -> begin
FStar_TypeChecker_Rel.trivial_guard
end
| _94_692 -> begin
(let imp = (env, u, top, t1, top.FStar_Syntax_Syntax.pos)
in (let _94_694 = FStar_TypeChecker_Rel.trivial_guard
in {FStar_TypeChecker_Env.guard_f = _94_694.FStar_TypeChecker_Env.guard_f; FStar_TypeChecker_Env.deferred = _94_694.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = _94_694.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = (imp)::[]}))
end)
in (value_check_expected_typ env e (FStar_Util.Inl (t1)) g))
end
| FStar_Syntax_Syntax.Tm_unknown -> begin
(let _94_700 = (FStar_Syntax_Util.type_u ())
in (match (_94_700) with
| (t, u) -> begin
(let e = (FStar_TypeChecker_Util.new_uvar env t)
in (value_check_expected_typ env e (FStar_Util.Inl (t)) FStar_TypeChecker_Rel.trivial_guard))
end))
end
| FStar_Syntax_Syntax.Tm_name (x) -> begin
(let t = if env.FStar_TypeChecker_Env.use_bv_sorts then begin
x.FStar_Syntax_Syntax.sort
end else begin
(FStar_TypeChecker_Env.lookup_bv env x)
end
in (let e = (FStar_Syntax_Syntax.bv_to_name (let _94_705 = x
in {FStar_Syntax_Syntax.ppname = _94_705.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_705.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t}))
in (let _94_711 = (FStar_TypeChecker_Util.maybe_instantiate env e t)
in (match (_94_711) with
| (e, t, implicits) -> begin
(let tc = if (FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str) then begin
FStar_Util.Inl (t)
end else begin
(let _196_343 = (let _196_342 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp _196_342))
in FStar_Util.Inr (_196_343))
end
in (value_check_expected_typ env e tc implicits))
end))))
end
| FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (v, dc); FStar_Syntax_Syntax.tk = _94_718; FStar_Syntax_Syntax.pos = _94_716; FStar_Syntax_Syntax.vars = _94_714}, us) -> begin
(let us = (FStar_List.map (tc_universe env) us)
in (let _94_730 = (FStar_TypeChecker_Env.lookup_lid env v.FStar_Syntax_Syntax.v)
in (match (_94_730) with
| (us', t) -> begin
(let _94_737 = if ((FStar_List.length us) <> (FStar_List.length us')) then begin
(let _196_346 = (let _196_345 = (let _196_344 = (FStar_TypeChecker_Env.get_range env)
in ("Unexpected number of universe instantiations", _196_344))
in FStar_Syntax_Syntax.Error (_196_345))
in (Prims.raise _196_346))
end else begin
(FStar_List.iter2 (fun u' u -> (match (u') with
| FStar_Syntax_Syntax.U_unif (u'') -> begin
(FStar_Unionfind.change u'' (Some (u)))
end
| _94_736 -> begin
(FStar_All.failwith "Impossible")
end)) us' us)
end
in (let e = (let _196_349 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar (((let _94_739 = v
in {FStar_Syntax_Syntax.v = _94_739.FStar_Syntax_Syntax.v; FStar_Syntax_Syntax.ty = t; FStar_Syntax_Syntax.p = _94_739.FStar_Syntax_Syntax.p}), dc))) (Some (t.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos)
in (FStar_Syntax_Syntax.mk_Tm_uinst _196_349 us))
in (check_instantiated_fvar env v dc e t)))
end)))
end
| FStar_Syntax_Syntax.Tm_fvar (v, dc) -> begin
(let _94_748 = (FStar_TypeChecker_Env.lookup_lid env v.FStar_Syntax_Syntax.v)
in (match (_94_748) with
| (us, t) -> begin
(let e = (let _196_350 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar (((let _94_749 = v
in {FStar_Syntax_Syntax.v = _94_749.FStar_Syntax_Syntax.v; FStar_Syntax_Syntax.ty = t; FStar_Syntax_Syntax.p = _94_749.FStar_Syntax_Syntax.p}), dc))) (Some (t.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos)
in (FStar_Syntax_Syntax.mk_Tm_uinst _196_350 us))
in (check_instantiated_fvar env v dc e t))
end))
end
| FStar_Syntax_Syntax.Tm_constant (c) -> begin
(let t = (FStar_TypeChecker_Recheck.check e)
in (let e = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (c)) (Some (t.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos)
in (value_check_expected_typ env e (FStar_Util.Inl (t)) FStar_TypeChecker_Rel.trivial_guard)))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(let _94_762 = (FStar_Syntax_Subst.open_comp bs c)
in (match (_94_762) with
| (bs, c) -> begin
(let env0 = env
in (let _94_767 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_767) with
| (env, _94_766) -> begin
(let _94_772 = (tc_binders env bs)
in (match (_94_772) with
| (bs, env, g, us) -> begin
(let _94_776 = (tc_comp env c)
in (match (_94_776) with
| (c, uc, f) -> begin
(let e = (let _94_777 = (FStar_Syntax_Util.arrow bs c)
in {FStar_Syntax_Syntax.n = _94_777.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.tk = _94_777.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = top.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _94_777.FStar_Syntax_Syntax.vars})
in (let _94_780 = (check_smt_pat env e bs c)
in (let u = FStar_Syntax_Syntax.U_max ((uc)::us)
in (let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u)) None top.FStar_Syntax_Syntax.pos)
in (let g = (let _196_351 = (FStar_TypeChecker_Rel.close_guard bs f)
in (FStar_TypeChecker_Rel.conj_guard g _196_351))
in (value_check_expected_typ env0 e (FStar_Util.Inl (t)) g))))))
end))
end))
end)))
end))
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
(let u = (tc_universe env u)
in (let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_succ (u))) None top.FStar_Syntax_Syntax.pos)
in (let e = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u)) (Some (t.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (value_check_expected_typ env e (FStar_Util.Inl (t)) FStar_TypeChecker_Rel.trivial_guard))))
end
| FStar_Syntax_Syntax.Tm_refine (x, phi) -> begin
(let _94_796 = (let _196_353 = (let _196_352 = (FStar_Syntax_Syntax.mk_binder x)
in (_196_352)::[])
in (FStar_Syntax_Subst.open_term _196_353 phi))
in (match (_94_796) with
| (x, phi) -> begin
(let env0 = env
in (let _94_801 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_801) with
| (env, _94_800) -> begin
(let _94_806 = (let _196_354 = (FStar_List.hd x)
in (tc_binder env _196_354))
in (match (_94_806) with
| (x, env, f1, u) -> begin
(let _94_807 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_357 = (FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos)
in (let _196_356 = (FStar_Syntax_Print.term_to_string phi)
in (let _196_355 = (FStar_Syntax_Print.bv_to_string (Prims.fst x))
in (FStar_Util.print3 "(%s) Checking refinement formula %s; binder is %s\n" _196_357 _196_356 _196_355))))
end else begin
()
end
in (let _94_812 = (FStar_Syntax_Util.type_u ())
in (match (_94_812) with
| (t_phi, _94_811) -> begin
(let _94_817 = (tc_check_tot_or_gtot_term env phi t_phi)
in (match (_94_817) with
| (phi, _94_815, f2) -> begin
(let e = (let _94_818 = (FStar_Syntax_Util.refine (Prims.fst x) phi)
in {FStar_Syntax_Syntax.n = _94_818.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.tk = _94_818.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = top.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _94_818.FStar_Syntax_Syntax.vars})
in (let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u)) None top.FStar_Syntax_Syntax.pos)
in (let g = (let _196_358 = (FStar_TypeChecker_Rel.close_guard ((x)::[]) f2)
in (FStar_TypeChecker_Rel.conj_guard f1 _196_358))
in (value_check_expected_typ env0 e (FStar_Util.Inl (t)) g))))
end))
end)))
end))
end)))
end))
end
| FStar_Syntax_Syntax.Tm_abs (bs, body, _94_826) -> begin
(let bs = (FStar_TypeChecker_Util.maybe_add_implicit_binders env bs)
in (let _94_832 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_359 = (FStar_Syntax_Print.term_to_string (let _94_830 = top
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((bs, body, None)); FStar_Syntax_Syntax.tk = _94_830.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = _94_830.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _94_830.FStar_Syntax_Syntax.vars}))
in (FStar_Util.print1 "Abstraction is: %s\n" _196_359))
end else begin
()
end
in (let _94_836 = (FStar_Syntax_Subst.open_term bs body)
in (match (_94_836) with
| (bs, body) -> begin
(tc_abs env top bs body)
end))))
end
| _94_838 -> begin
(let _196_361 = (let _196_360 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.format1 "Unexpected value: %s" _196_360))
in (FStar_All.failwith _196_361))
end)))))
and tc_comp : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  (FStar_Syntax_Syntax.comp * FStar_Syntax_Syntax.universe * FStar_TypeChecker_Env.guard_t) = (fun env c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t) -> begin
(let _94_845 = (FStar_Syntax_Util.type_u ())
in (match (_94_845) with
| (k, u) -> begin
(let _94_850 = (tc_check_tot_or_gtot_term env t k)
in (match (_94_850) with
| (t, _94_848, g) -> begin
(let _196_364 = (FStar_Syntax_Syntax.mk_Total t)
in (_196_364, u, g))
end))
end))
end
| FStar_Syntax_Syntax.GTotal (t) -> begin
(let _94_855 = (FStar_Syntax_Util.type_u ())
in (match (_94_855) with
| (k, u) -> begin
(let _94_860 = (tc_check_tot_or_gtot_term env t k)
in (match (_94_860) with
| (t, _94_858, g) -> begin
(let _196_365 = (FStar_Syntax_Syntax.mk_GTotal t)
in (_196_365, u, g))
end))
end))
end
| FStar_Syntax_Syntax.Comp (c) -> begin
(let kc = (FStar_TypeChecker_Env.lookup_effect_lid env c.FStar_Syntax_Syntax.effect_name)
in (let _94_864 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_367 = (FStar_Syntax_Print.lid_to_string c.FStar_Syntax_Syntax.effect_name)
in (let _196_366 = (FStar_Syntax_Print.term_to_string kc)
in (FStar_Util.print2 "Type of effect %s is %s\n" _196_367 _196_366)))
end else begin
()
end
in (let head = (FStar_Syntax_Syntax.fvar None c.FStar_Syntax_Syntax.effect_name (FStar_Ident.range_of_lid c.FStar_Syntax_Syntax.effect_name))
in (let tc = (let _196_369 = (let _196_368 = (FStar_Syntax_Syntax.as_arg c.FStar_Syntax_Syntax.result_typ)
in (_196_368)::c.FStar_Syntax_Syntax.effect_args)
in (FStar_Syntax_Syntax.mk_Tm_app head _196_369 None c.FStar_Syntax_Syntax.result_typ.FStar_Syntax_Syntax.pos))
in (let _94_872 = (tc_check_tot_or_gtot_term env tc FStar_Syntax_Syntax.teff)
in (match (_94_872) with
| (tc, _94_870, f) -> begin
(let _94_876 = (FStar_Syntax_Util.head_and_args tc)
in (match (_94_876) with
| (_94_874, args) -> begin
(let _94_879 = (let _196_371 = (FStar_List.hd args)
in (let _196_370 = (FStar_List.tl args)
in (_196_371, _196_370)))
in (match (_94_879) with
| (res, args) -> begin
(let _94_895 = (let _196_373 = (FStar_All.pipe_right c.FStar_Syntax_Syntax.flags (FStar_List.map (fun _94_5 -> (match (_94_5) with
| FStar_Syntax_Syntax.DECREASES (e) -> begin
(let _94_886 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_886) with
| (env, _94_885) -> begin
(let _94_891 = (tc_tot_or_gtot_term env e)
in (match (_94_891) with
| (e, _94_889, g) -> begin
(FStar_Syntax_Syntax.DECREASES (e), g)
end))
end))
end
| f -> begin
(f, FStar_TypeChecker_Rel.trivial_guard)
end))))
in (FStar_All.pipe_right _196_373 FStar_List.unzip))
in (match (_94_895) with
| (flags, guards) -> begin
(let u = (match ((FStar_TypeChecker_Recheck.check (Prims.fst res))) with
| {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_type (u); FStar_Syntax_Syntax.tk = _94_901; FStar_Syntax_Syntax.pos = _94_899; FStar_Syntax_Syntax.vars = _94_897} -> begin
u
end
| _94_906 -> begin
(FStar_All.failwith "Impossible")
end)
in (let _196_375 = (FStar_Syntax_Syntax.mk_Comp (let _94_908 = c
in {FStar_Syntax_Syntax.effect_name = _94_908.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = (Prims.fst res); FStar_Syntax_Syntax.effect_args = args; FStar_Syntax_Syntax.flags = _94_908.FStar_Syntax_Syntax.flags}))
in (let _196_374 = (FStar_List.fold_left FStar_TypeChecker_Rel.conj_guard f guards)
in (_196_375, u, _196_374))))
end))
end))
end))
end))))))
end))
and tc_universe : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe = (fun env u -> (let rec aux = (fun u -> (let u = (FStar_Syntax_Subst.compress_univ u)
in (match (u) with
| FStar_Syntax_Syntax.U_bvar (_94_916) -> begin
(FStar_All.failwith "Impossible: locally nameless")
end
| FStar_Syntax_Syntax.U_unknown -> begin
(FStar_All.failwith "Unknown universe")
end
| (FStar_Syntax_Syntax.U_unif (_)) | (FStar_Syntax_Syntax.U_zero) -> begin
u
end
| FStar_Syntax_Syntax.U_succ (u) -> begin
(let _196_380 = (aux u)
in FStar_Syntax_Syntax.U_succ (_196_380))
end
| FStar_Syntax_Syntax.U_max (us) -> begin
(let _196_381 = (FStar_List.map aux us)
in FStar_Syntax_Syntax.U_max (_196_381))
end
| FStar_Syntax_Syntax.U_name (x) -> begin
if (env.FStar_TypeChecker_Env.use_bv_sorts || (FStar_TypeChecker_Env.lookup_univ env x)) then begin
u
end else begin
(let _196_385 = (let _196_384 = (let _196_383 = (FStar_Util.format1 "Universe variable \'%s\' not found" x.FStar_Ident.idText)
in (let _196_382 = (FStar_TypeChecker_Env.get_range env)
in (_196_383, _196_382)))
in FStar_Syntax_Syntax.Error (_196_384))
in (Prims.raise _196_385))
end
end)))
in (match (u) with
| FStar_Syntax_Syntax.U_unknown -> begin
(let _196_386 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _196_386 Prims.snd))
end
| _94_931 -> begin
(aux u)
end)))
and tc_abs : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env top bs body -> (let fail = (fun msg t -> (let _196_395 = (let _196_394 = (let _196_393 = (FStar_TypeChecker_Errors.expected_a_term_of_type_t_got_a_function env msg t top)
in (_196_393, top.FStar_Syntax_Syntax.pos))
in FStar_Syntax_Syntax.Error (_196_394))
in (Prims.raise _196_395)))
in (let check_binders = (fun env bs bs_expected -> (let rec aux = (fun _94_949 bs bs_expected -> (match (_94_949) with
| (env, out, g, subst) -> begin
(match ((bs, bs_expected)) with
| ([], []) -> begin
(env, (FStar_List.rev out), None, g, subst)
end
| ((hd, imp)::bs, (hd_expected, imp')::bs_expected) -> begin
(let _94_976 = (match ((imp, imp')) with
| ((None, Some (FStar_Syntax_Syntax.Implicit))) | ((Some (FStar_Syntax_Syntax.Implicit), None)) -> begin
(let _196_412 = (let _196_411 = (let _196_410 = (let _196_408 = (FStar_Syntax_Print.bv_to_string hd)
in (FStar_Util.format1 "Inconsistent implicit argument annotation on argument %s" _196_408))
in (let _196_409 = (FStar_Syntax_Syntax.range_of_bv hd)
in (_196_410, _196_409)))
in FStar_Syntax_Syntax.Error (_196_411))
in (Prims.raise _196_412))
end
| _94_975 -> begin
()
end)
in (let expected_t = (FStar_Syntax_Subst.subst subst hd_expected.FStar_Syntax_Syntax.sort)
in (let _94_993 = (match ((let _196_413 = (FStar_Syntax_Util.unmeta hd.FStar_Syntax_Syntax.sort)
in _196_413.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
(expected_t, g)
end
| _94_981 -> begin
(let _94_982 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_414 = (FStar_Syntax_Print.bv_to_string hd)
in (FStar_Util.print1 "Checking binder %s\n" _196_414))
end else begin
()
end
in (let _94_988 = (tc_tot_or_gtot_term env hd.FStar_Syntax_Syntax.sort)
in (match (_94_988) with
| (t, _94_986, g1) -> begin
(let g2 = (FStar_TypeChecker_Rel.teq env t expected_t)
in (let g = (let _196_415 = (FStar_TypeChecker_Rel.conj_guard g1 g2)
in (FStar_TypeChecker_Rel.conj_guard g _196_415))
in (t, g)))
end)))
end)
in (match (_94_993) with
| (t, g) -> begin
(let hd = (let _94_994 = hd
in {FStar_Syntax_Syntax.ppname = _94_994.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_994.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t})
in (let b = (hd, imp)
in (let b_expected = (hd_expected, imp')
in (let env = (maybe_push_binding env b)
in (let subst = (let _196_416 = (FStar_Syntax_Syntax.bv_to_name hd)
in (maybe_extend_subst subst b_expected _196_416))
in (aux (env, (b)::out, g, subst) bs bs_expected))))))
end))))
end
| (rest, []) -> begin
(env, (FStar_List.rev out), Some (FStar_Util.Inl (rest)), g, subst)
end
| ([], rest) -> begin
(env, (FStar_List.rev out), Some (FStar_Util.Inr (rest)), g, subst)
end)
end))
in (aux (env, [], FStar_TypeChecker_Rel.trivial_guard, []) bs bs_expected)))
in (let rec expected_function_typ = (fun env t0 -> (match (t0) with
| None -> begin
(let _94_1014 = (match (env.FStar_TypeChecker_Env.letrecs) with
| [] -> begin
()
end
| _94_1013 -> begin
(FStar_All.failwith "Impossible: Can\'t have a let rec annotation but no expected type")
end)
in (let _94_1021 = (tc_binders env bs)
in (match (_94_1021) with
| (bs, envbody, g, _94_1020) -> begin
(None, bs, [], None, envbody, g)
end)))
end
| Some (t) -> begin
(let t = (FStar_Syntax_Subst.compress t)
in (let rec as_function_typ = (fun norm t -> (match ((let _196_425 = (FStar_Syntax_Subst.compress t)
in _196_425.FStar_Syntax_Syntax.n)) with
| (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (_); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _)) -> begin
(let _94_1048 = (match (env.FStar_TypeChecker_Env.letrecs) with
| [] -> begin
()
end
| _94_1047 -> begin
(FStar_All.failwith "Impossible")
end)
in (let _94_1055 = (tc_binders env bs)
in (match (_94_1055) with
| (bs, envbody, g, _94_1054) -> begin
(let _94_1059 = (FStar_TypeChecker_Env.clear_expected_typ envbody)
in (match (_94_1059) with
| (envbody, _94_1058) -> begin
(Some ((t, true)), bs, [], None, envbody, g)
end))
end)))
end
| FStar_Syntax_Syntax.Tm_refine (b, _94_1062) -> begin
(let _94_1072 = (as_function_typ norm b.FStar_Syntax_Syntax.sort)
in (match (_94_1072) with
| (_94_1066, bs, bs', copt, env, g) -> begin
(Some ((t, false)), bs, bs', copt, env, g)
end))
end
| FStar_Syntax_Syntax.Tm_arrow (bs_expected, c_expected) -> begin
(let _94_1079 = (FStar_Syntax_Subst.open_comp bs_expected c_expected)
in (match (_94_1079) with
| (bs_expected, c_expected) -> begin
(let check_actuals_against_formals = (fun env bs bs_expected -> (let rec handle_more = (fun _94_1090 c_expected -> (match (_94_1090) with
| (env, bs, more, guard, subst) -> begin
(match (more) with
| None -> begin
(let _196_436 = (FStar_Syntax_Subst.subst_comp subst c_expected)
in (env, bs, guard, _196_436))
end
| Some (FStar_Util.Inr (more_bs_expected)) -> begin
(let c = (let _196_437 = (FStar_Syntax_Util.arrow more_bs_expected c_expected)
in (FStar_Syntax_Syntax.mk_Total _196_437))
in (let _196_438 = (FStar_Syntax_Subst.subst_comp subst c)
in (env, bs, guard, _196_438)))
end
| Some (FStar_Util.Inl (more_bs)) -> begin
(let c = (FStar_Syntax_Subst.subst_comp subst c_expected)
in if (FStar_Syntax_Util.is_total_comp c) then begin
(let t = (unfold_whnf env (FStar_Syntax_Util.comp_result c))
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs_expected, c_expected) -> begin
(let _94_1111 = (check_binders env more_bs bs_expected)
in (match (_94_1111) with
| (env, bs', more, guard', subst) -> begin
(let _196_440 = (let _196_439 = (FStar_TypeChecker_Rel.conj_guard guard guard')
in (env, (FStar_List.append bs bs'), more, _196_439, subst))
in (handle_more _196_440 c_expected))
end))
end
| _94_1113 -> begin
(let _196_442 = (let _196_441 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format1 "More arguments than annotated type (%s)" _196_441))
in (fail _196_442 t))
end))
end else begin
(fail "Function definition takes more arguments than expected from its annotated type" t)
end)
end)
end))
in (let _196_443 = (check_binders env bs bs_expected)
in (handle_more _196_443 c_expected))))
in (let mk_letrec_env = (fun envbody bs c -> (let letrecs = (guard_letrecs envbody bs c)
in (let envbody = (let _94_1119 = envbody
in {FStar_TypeChecker_Env.solver = _94_1119.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1119.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1119.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1119.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1119.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1119.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1119.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1119.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_1119.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_1119.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1119.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1119.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = []; FStar_TypeChecker_Env.top_level = _94_1119.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_1119.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_1119.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_1119.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1119.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1119.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1119.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1119.FStar_TypeChecker_Env.use_bv_sorts})
in (FStar_All.pipe_right letrecs (FStar_List.fold_left (fun _94_1124 _94_1127 -> (match ((_94_1124, _94_1127)) with
| ((env, letrec_binders), (l, t)) -> begin
(let _94_1133 = (let _196_453 = (let _196_452 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (FStar_All.pipe_right _196_452 Prims.fst))
in (tc_term _196_453 t))
in (match (_94_1133) with
| (t, _94_1130, _94_1132) -> begin
(let env = (FStar_TypeChecker_Env.push_let_binding env l ([], t))
in (let lb = (match (l) with
| FStar_Util.Inl (x) -> begin
(let _196_454 = (FStar_Syntax_Syntax.mk_binder (let _94_1137 = x
in {FStar_Syntax_Syntax.ppname = _94_1137.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_1137.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t}))
in (_196_454)::letrec_binders)
end
| _94_1140 -> begin
letrec_binders
end)
in (env, lb)))
end))
end)) (envbody, []))))))
in (let _94_1146 = (check_actuals_against_formals env bs bs_expected)
in (match (_94_1146) with
| (envbody, bs, g, c) -> begin
(let _94_1149 = if (FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str) then begin
(mk_letrec_env envbody bs c)
end else begin
(envbody, [])
end
in (match (_94_1149) with
| (envbody, letrecs) -> begin
(let envbody = (FStar_TypeChecker_Env.set_expected_typ envbody (FStar_Syntax_Util.comp_result c))
in (Some ((t, false)), bs, letrecs, Some (c), envbody, g))
end))
end))))
end))
end
| _94_1152 -> begin
if (not (norm)) then begin
(let _196_455 = (unfold_whnf env t)
in (as_function_typ true _196_455))
end else begin
(let _94_1161 = (expected_function_typ env None)
in (match (_94_1161) with
| (_94_1154, bs, _94_1157, c_opt, envbody, g) -> begin
(Some ((t, false)), bs, [], c_opt, envbody, g)
end))
end
end))
in (as_function_typ false t)))
end))
in (let use_eq = env.FStar_TypeChecker_Env.use_eq
in (let _94_1165 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_1165) with
| (env, topt) -> begin
(let _94_1169 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_456 = (match (topt) with
| None -> begin
"None"
end
| Some (t) -> begin
(FStar_Syntax_Print.term_to_string t)
end)
in (FStar_Util.print2 "!!!!!!!!!!!!!!!Expected type is %s, top_level=%s\n" _196_456 (if env.FStar_TypeChecker_Env.top_level then begin
"true"
end else begin
"false"
end)))
end else begin
()
end
in (let _94_1177 = (expected_function_typ env topt)
in (match (_94_1177) with
| (tfun_opt, bs, letrec_binders, c_opt, envbody, g) -> begin
(let _94_1183 = (tc_term (let _94_1178 = envbody
in {FStar_TypeChecker_Env.solver = _94_1178.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1178.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1178.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1178.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1178.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1178.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1178.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1178.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_1178.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_1178.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1178.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1178.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_1178.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = _94_1178.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = use_eq; FStar_TypeChecker_Env.is_iface = _94_1178.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1178.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1178.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1178.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1178.FStar_TypeChecker_Env.use_bv_sorts}) body)
in (match (_94_1183) with
| (body, cbody, guard_body) -> begin
(let _94_1184 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_462 = (FStar_Syntax_Print.term_to_string body)
in (let _196_461 = (let _196_457 = (cbody.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_left FStar_Syntax_Print.comp_to_string _196_457))
in (let _196_460 = (FStar_TypeChecker_Rel.guard_to_string env guard_body)
in (let _196_459 = (let _196_458 = (cbody.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_left FStar_Syntax_Print.comp_to_string _196_458))
in (FStar_Util.print4 "!!!!!!!!!!!!!!!body %s has type %s\nguard is %s\nAgain cbody=%s\n" _196_462 _196_461 _196_460 _196_459)))))
end else begin
()
end
in (let guard_body = (FStar_TypeChecker_Rel.solve_deferred_constraints envbody guard_body)
in (let _94_1187 = if (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("Implicits"))) then begin
(let _196_465 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length guard_body.FStar_TypeChecker_Env.implicits))
in (let _196_464 = (let _196_463 = (cbody.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_left FStar_Syntax_Print.comp_to_string _196_463))
in (FStar_Util.print2 "Introduced %s implicits in body of abstraction\nAfter solving constraints, cbody is %s\n" _196_465 _196_464)))
end else begin
()
end
in (let _94_1194 = (let _196_467 = (let _196_466 = (cbody.FStar_Syntax_Syntax.comp ())
in (body, _196_466))
in (check_expected_effect (let _94_1189 = envbody
in {FStar_TypeChecker_Env.solver = _94_1189.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1189.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1189.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1189.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1189.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1189.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1189.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1189.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_1189.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_1189.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1189.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1189.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_1189.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _94_1189.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_1189.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = use_eq; FStar_TypeChecker_Env.is_iface = _94_1189.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1189.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1189.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1189.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1189.FStar_TypeChecker_Env.use_bv_sorts}) c_opt _196_467))
in (match (_94_1194) with
| (body, cbody, guard) -> begin
(let guard = (FStar_TypeChecker_Rel.conj_guard guard_body guard)
in (let guard = if (env.FStar_TypeChecker_Env.top_level || (not ((FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str)))) then begin
(let _196_468 = (FStar_TypeChecker_Rel.conj_guard g guard)
in (FStar_TypeChecker_Rel.discharge_guard envbody _196_468))
end else begin
(let guard = (FStar_TypeChecker_Rel.close_guard (FStar_List.append bs letrec_binders) guard)
in (FStar_TypeChecker_Rel.conj_guard g guard))
end
in (let tfun_computed = (FStar_Syntax_Util.arrow bs cbody)
in (let e = (FStar_Syntax_Util.abs bs body (Some ((FStar_Syntax_Util.lcomp_of_comp cbody))))
in (let _94_1217 = (match (tfun_opt) with
| Some (t, use_teq) -> begin
(let t = (FStar_Syntax_Subst.compress t)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (_94_1206) -> begin
(e, t, guard)
end
| _94_1209 -> begin
(let _94_1212 = if use_teq then begin
(let _196_469 = (FStar_TypeChecker_Rel.teq env t tfun_computed)
in (e, _196_469))
end else begin
(FStar_TypeChecker_Util.check_and_ascribe env e tfun_computed t)
end
in (match (_94_1212) with
| (e, guard') -> begin
(let _196_470 = (FStar_TypeChecker_Rel.conj_guard guard guard')
in (e, t, _196_470))
end))
end))
end
| None -> begin
(e, tfun_computed, guard)
end)
in (match (_94_1217) with
| (e, tfun, guard) -> begin
(let c = if env.FStar_TypeChecker_Env.top_level then begin
(FStar_Syntax_Syntax.mk_Total tfun)
end else begin
(FStar_TypeChecker_Util.return_value env tfun e)
end
in (let _94_1221 = (FStar_TypeChecker_Util.strengthen_precondition None env e (FStar_Syntax_Util.lcomp_of_comp c) guard)
in (match (_94_1221) with
| (c, g) -> begin
(e, c, g)
end)))
end))))))
end)))))
end))
end)))
end)))))))
and check_application_args : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.lcomp  ->  FStar_TypeChecker_Env.guard_t  ->  FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.typ Prims.option  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env head chead ghead args expected_topt -> (let n_args = (FStar_List.length args)
in (let r = (FStar_TypeChecker_Env.get_range env)
in (let thead = chead.FStar_Syntax_Syntax.res_typ
in (let _94_1231 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_479 = (FStar_Range.string_of_range head.FStar_Syntax_Syntax.pos)
in (let _196_478 = (FStar_Syntax_Print.term_to_string thead)
in (FStar_Util.print2 "(%s) Type of head is %s\n" _196_479 _196_478)))
end else begin
()
end
in (let rec check_function_app = (fun norm tf -> (match ((let _196_484 = (FStar_Syntax_Util.unrefine tf)
in _196_484.FStar_Syntax_Syntax.n)) with
| (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (_); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _)) -> begin
(let rec tc_args = (fun env args -> (match (args) with
| [] -> begin
([], [], FStar_TypeChecker_Rel.trivial_guard)
end
| (e, imp)::tl -> begin
(let _94_1265 = (tc_term env e)
in (match (_94_1265) with
| (e, c, g_e) -> begin
(let _94_1269 = (tc_args env tl)
in (match (_94_1269) with
| (args, comps, g_rest) -> begin
(let _196_489 = (FStar_TypeChecker_Rel.conj_guard g_e g_rest)
in (((e, imp))::args, (c)::comps, _196_489))
end))
end))
end))
in (let _94_1273 = (tc_args env args)
in (match (_94_1273) with
| (args, comps, g_args) -> begin
(let bs = (let _196_491 = (FStar_All.pipe_right comps (FStar_List.map (fun c -> (c.FStar_Syntax_Syntax.res_typ, None))))
in (FStar_Syntax_Util.null_binders_of_tks _196_491))
in (let ml_or_tot = (match ((FStar_TypeChecker_Env.try_lookup_effect_lid env FStar_Syntax_Const.effect_ML_lid)) with
| None -> begin
(fun t r -> (FStar_Syntax_Syntax.mk_Total t))
end
| _94_1280 -> begin
FStar_Syntax_Util.ml_comp
end)
in (let ml_or_tot = (match (expected_topt) with
| None -> begin
ml_or_tot
end
| Some (t) -> begin
(match ((let _196_506 = (FStar_Syntax_Subst.compress t)
in _196_506.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_type (_94_1286) -> begin
(fun t r -> (FStar_Syntax_Syntax.mk_GTotal t))
end
| _94_1291 -> begin
ml_or_tot
end)
end)
in (let cres = (let _196_511 = (let _196_510 = (let _196_509 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _196_509 Prims.fst))
in (FStar_TypeChecker_Util.new_uvar env _196_510))
in (ml_or_tot _196_511 r))
in (let bs_cres = (FStar_Syntax_Util.arrow bs cres)
in (let _94_1295 = if (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) FStar_Options.Extreme) then begin
(let _196_514 = (FStar_Syntax_Print.term_to_string head)
in (let _196_513 = (FStar_Syntax_Print.term_to_string tf)
in (let _196_512 = (FStar_Syntax_Print.term_to_string bs_cres)
in (FStar_Util.print3 "Forcing the type of %s from %s to %s\n" _196_514 _196_513 _196_512))))
end else begin
()
end
in (let _94_1297 = (let _196_515 = (FStar_TypeChecker_Rel.teq env tf bs_cres)
in (FStar_All.pipe_left (FStar_TypeChecker_Rel.force_trivial_guard env) _196_515))
in (let comp = (let _196_518 = (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp cres)
in (FStar_List.fold_right (fun c out -> (FStar_TypeChecker_Util.bind env None c (None, out))) ((chead)::comps) _196_518))
in (let _196_520 = (FStar_Syntax_Syntax.mk_Tm_app head args (Some (comp.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) r)
in (let _196_519 = (FStar_TypeChecker_Rel.conj_guard ghead g_args)
in (_196_520, comp, _196_519)))))))))))
end)))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(let _94_1308 = (FStar_Syntax_Subst.open_comp bs c)
in (match (_94_1308) with
| (bs, c) -> begin
(let rec tc_args = (fun _94_1316 bs cres args -> (match (_94_1316) with
| (subst, outargs, arg_rets, comps, g, fvs) -> begin
(match ((bs, args)) with
| ((x, Some (FStar_Syntax_Syntax.Implicit))::rest, (_94_1329, None)::_94_1327) -> begin
(let t = (FStar_Syntax_Subst.subst subst x.FStar_Syntax_Syntax.sort)
in (let _94_1335 = (fxv_check head env t fvs)
in (let _94_1340 = (FStar_TypeChecker_Util.new_implicit_var env t)
in (match (_94_1340) with
| (varg, u, implicits) -> begin
(let subst = (FStar_Syntax_Syntax.NT ((x, varg)))::subst
in (let arg = (let _196_555 = (FStar_Syntax_Syntax.as_implicit true)
in (varg, _196_555))
in (let _196_561 = (let _196_560 = (FStar_TypeChecker_Rel.conj_guard implicits g)
in (subst, (arg)::outargs, (arg)::arg_rets, comps, _196_560, fvs))
in (tc_args _196_561 rest cres args))))
end))))
end
| ((x, aqual)::rest, (e, aq)::rest') -> begin
(let _94_1368 = (match ((aqual, aq)) with
| ((Some (FStar_Syntax_Syntax.Implicit), Some (FStar_Syntax_Syntax.Implicit))) | ((None, None)) | ((Some (FStar_Syntax_Syntax.Equality), None)) -> begin
()
end
| _94_1367 -> begin
(Prims.raise (FStar_Syntax_Syntax.Error (("Inconsistent implicit qualifier", e.FStar_Syntax_Syntax.pos))))
end)
in (let targ = (FStar_Syntax_Subst.subst subst x.FStar_Syntax_Syntax.sort)
in (let x = (let _94_1371 = x
in {FStar_Syntax_Syntax.ppname = _94_1371.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_1371.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = targ})
in (let _94_1374 = if (FStar_TypeChecker_Env.debug env FStar_Options.Extreme) then begin
(let _196_562 = (FStar_Syntax_Print.term_to_string targ)
in (FStar_Util.print1 "\tType of arg (after subst) = %s\n" _196_562))
end else begin
()
end
in (let _94_1376 = (fxv_check head env targ fvs)
in (let env = (FStar_TypeChecker_Env.set_expected_typ env targ)
in (let env = (let _94_1379 = env
in {FStar_TypeChecker_Env.solver = _94_1379.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1379.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1379.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1379.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1379.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1379.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1379.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1379.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_1379.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_1379.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1379.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1379.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_1379.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _94_1379.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_1379.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = (is_eq aqual); FStar_TypeChecker_Env.is_iface = _94_1379.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1379.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1379.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1379.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1379.FStar_TypeChecker_Env.use_bv_sorts})
in (let _94_1382 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_565 = (FStar_Syntax_Print.tag_of_term e)
in (let _196_564 = (FStar_Syntax_Print.term_to_string e)
in (let _196_563 = (FStar_Syntax_Print.term_to_string targ)
in (FStar_Util.print3 "Checking arg (%s) %s at type %s\n" _196_565 _196_564 _196_563))))
end else begin
()
end
in (let _94_1387 = (tc_term env e)
in (match (_94_1387) with
| (e, c, g_e) -> begin
(let g = (FStar_TypeChecker_Rel.conj_guard g g_e)
in (let arg = (e, aq)
in if (FStar_Syntax_Util.is_tot_or_gtot_lcomp c) then begin
(let subst = (let _196_566 = (FStar_List.hd bs)
in (maybe_extend_subst subst _196_566 e))
in (tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, g, fvs) rest cres rest'))
end else begin
if (FStar_TypeChecker_Util.is_pure_or_ghost_effect env c.FStar_Syntax_Syntax.eff_name) then begin
(let subst = (let _196_571 = (FStar_List.hd bs)
in (maybe_extend_subst subst _196_571 e))
in (let _94_1394 = (((Some (x), c))::comps, g)
in (match (_94_1394) with
| (comps, guard) -> begin
(tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, guard, fvs) rest cres rest')
end)))
end else begin
if (let _196_576 = (FStar_List.hd bs)
in (FStar_Syntax_Syntax.is_null_binder _196_576)) then begin
(let newx = (FStar_Syntax_Syntax.new_bv (Some (e.FStar_Syntax_Syntax.pos)) c.FStar_Syntax_Syntax.res_typ)
in (let arg' = (let _196_577 = (FStar_Syntax_Syntax.bv_to_name newx)
in (FStar_All.pipe_left FStar_Syntax_Syntax.as_arg _196_577))
in (tc_args (subst, (arg)::outargs, (arg')::arg_rets, ((Some (newx), c))::comps, g, fvs) rest cres rest')))
end else begin
(let _196_586 = (let _196_585 = (let _196_583 = (let _196_582 = (FStar_Syntax_Syntax.bv_to_name x)
in (FStar_Syntax_Syntax.as_arg _196_582))
in (_196_583)::arg_rets)
in (let _196_584 = (FStar_Util.set_add x fvs)
in (subst, (arg)::outargs, _196_585, ((Some (x), c))::comps, g, _196_584)))
in (tc_args _196_586 rest cres rest'))
end
end
end))
end))))))))))
end
| (_94_1398, []) -> begin
(let _94_1401 = (fxv_check head env cres.FStar_Syntax_Syntax.res_typ fvs)
in (let _94_1419 = (match (bs) with
| [] -> begin
(let cres = (FStar_TypeChecker_Util.subst_lcomp subst cres)
in (let g = (FStar_TypeChecker_Rel.conj_guard ghead g)
in (let refine_with_equality = ((FStar_Syntax_Util.is_pure_or_ghost_lcomp cres) && (FStar_All.pipe_right comps (FStar_Util.for_some (fun _94_1409 -> (match (_94_1409) with
| (_94_1407, c) -> begin
(not ((FStar_Syntax_Util.is_pure_or_ghost_lcomp c)))
end)))))
in (let cres = if refine_with_equality then begin
(let _196_588 = (FStar_Syntax_Syntax.mk_Tm_app head (FStar_List.rev arg_rets) (Some (cres.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) r)
in (FStar_TypeChecker_Util.maybe_assume_result_eq_pure_term env _196_588 cres))
end else begin
(let _94_1411 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_591 = (FStar_Syntax_Print.term_to_string head)
in (let _196_590 = (FStar_Syntax_Print.lcomp_to_string cres)
in (let _196_589 = (FStar_TypeChecker_Rel.guard_to_string env g)
in (FStar_Util.print3 "Not refining result: f=%s; cres=%s; guard=%s\n" _196_591 _196_590 _196_589))))
end else begin
()
end
in cres)
end
in (cres, g)))))
end
| _94_1415 -> begin
(let g = (let _196_592 = (FStar_TypeChecker_Rel.conj_guard ghead g)
in (FStar_All.pipe_right _196_592 (FStar_TypeChecker_Rel.solve_deferred_constraints env)))
in (let _196_597 = (let _196_596 = (let _196_595 = (let _196_594 = (let _196_593 = (cres.FStar_Syntax_Syntax.comp ())
in (FStar_Syntax_Util.arrow bs _196_593))
in (FStar_All.pipe_left (FStar_Syntax_Subst.subst subst) _196_594))
in (FStar_Syntax_Syntax.mk_Total _196_595))
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp _196_596))
in (_196_597, g)))
end)
in (match (_94_1419) with
| (cres, g) -> begin
(let _94_1420 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_598 = (FStar_Syntax_Print.lcomp_to_string cres)
in (FStar_Util.print1 "\t Type of result cres is %s\n" _196_598))
end else begin
()
end
in (let comp = (FStar_List.fold_left (fun out c -> (FStar_TypeChecker_Util.bind env None (Prims.snd c) ((Prims.fst c), out))) cres comps)
in (let comp = (FStar_TypeChecker_Util.bind env None chead (None, comp))
in (let app = (FStar_Syntax_Syntax.mk_Tm_app head (FStar_List.rev outargs) (Some (comp.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) r)
in (let comp = (FStar_TypeChecker_Util.record_application_site env app comp)
in (let _94_1430 = (FStar_TypeChecker_Util.strengthen_precondition None env app comp g)
in (match (_94_1430) with
| (comp, g) -> begin
(let _94_1431 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_604 = (FStar_TypeChecker_Normalize.term_to_string env app)
in (let _196_603 = (let _196_602 = (comp.FStar_Syntax_Syntax.comp ())
in (FStar_Syntax_Print.comp_to_string _196_602))
in (FStar_Util.print2 "\t Type of app term %s is %s\n" _196_604 _196_603)))
end else begin
()
end
in (app, comp, g))
end)))))))
end)))
end
| ([], arg::_94_1435) -> begin
(let rec aux = (fun norm tres -> (let tres = (let _196_609 = (FStar_Syntax_Subst.compress tres)
in (FStar_All.pipe_right _196_609 FStar_Syntax_Util.unrefine))
in (match (tres.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, cres') -> begin
(let _94_1447 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_610 = (FStar_Range.string_of_range tres.FStar_Syntax_Syntax.pos)
in (FStar_Util.print1 "%s: Warning: Potentially redundant explicit currying of a function type \n" _196_610))
end else begin
()
end
in (tc_args (subst, outargs, arg_rets, ((None, cres))::comps, g, fvs) bs (FStar_Syntax_Util.lcomp_of_comp cres') args))
end
| _94_1450 when (not (norm)) -> begin
(let _196_615 = (unfold_whnf env tres)
in (aux true _196_615))
end
| _94_1452 -> begin
(let _196_621 = (let _196_620 = (let _196_619 = (let _196_617 = (FStar_TypeChecker_Normalize.term_to_string env tf)
in (let _196_616 = (FStar_Util.string_of_int n_args)
in (FStar_Util.format2 "Too many arguments to function of type %s; got %s arguments" _196_617 _196_616)))
in (let _196_618 = (FStar_Syntax_Syntax.argpos arg)
in (_196_619, _196_618)))
in FStar_Syntax_Syntax.Error (_196_620))
in (Prims.raise _196_621))
end)))
in (aux false cres.FStar_Syntax_Syntax.res_typ))
end)
end))
in (let _196_623 = (let _196_622 = (FStar_Syntax_Syntax.new_bv_set ())
in ([], [], [], [], FStar_TypeChecker_Rel.trivial_guard, _196_622))
in (tc_args _196_623 bs (FStar_Syntax_Util.lcomp_of_comp c) args)))
end))
end
| _94_1454 -> begin
if (not (norm)) then begin
(let _196_624 = (unfold_whnf env tf)
in (check_function_app true _196_624))
end else begin
(let _196_627 = (let _196_626 = (let _196_625 = (FStar_TypeChecker_Errors.expected_function_typ env tf)
in (_196_625, head.FStar_Syntax_Syntax.pos))
in FStar_Syntax_Syntax.Error (_196_626))
in (Prims.raise _196_627))
end
end))
in (let _196_629 = (let _196_628 = (FStar_Syntax_Util.unrefine thead)
in (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.WHNF)::[]) env _196_628))
in (check_function_app false _196_629))))))))
and check_short_circuit_args : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.lcomp  ->  FStar_TypeChecker_Env.guard_t  ->  FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.typ Prims.option  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env head chead g_head args expected_topt -> (let r = (FStar_TypeChecker_Env.get_range env)
in (let tf = (FStar_Syntax_Subst.compress chead.FStar_Syntax_Syntax.res_typ)
in (match (tf.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) when ((FStar_Syntax_Util.is_total_comp c) && ((FStar_List.length bs) = (FStar_List.length args))) -> begin
(let res_t = (FStar_Syntax_Util.comp_result c)
in (let _94_1490 = (FStar_List.fold_left2 (fun _94_1471 _94_1474 _94_1477 -> (match ((_94_1471, _94_1474, _94_1477)) with
| ((seen, guard, ghost), (e, aq), (b, aq')) -> begin
(let _94_1478 = if (aq <> aq') then begin
(Prims.raise (FStar_Syntax_Syntax.Error (("Inconsistent implicit qualifiers", e.FStar_Syntax_Syntax.pos))))
end else begin
()
end
in (let _94_1483 = (tc_check_tot_or_gtot_term env e b.FStar_Syntax_Syntax.sort)
in (match (_94_1483) with
| (e, c, g) -> begin
(let short = (FStar_TypeChecker_Util.short_circuit head seen)
in (let g = (let _196_639 = (FStar_TypeChecker_Rel.guard_of_guard_formula short)
in (FStar_TypeChecker_Rel.imp_guard _196_639 g))
in (let ghost = (ghost || ((not ((FStar_Syntax_Util.is_total_lcomp c))) && (not ((FStar_TypeChecker_Util.is_pure_effect env c.FStar_Syntax_Syntax.eff_name)))))
in (let _196_643 = (let _196_641 = (let _196_640 = (FStar_Syntax_Syntax.as_arg e)
in (_196_640)::[])
in (FStar_List.append seen _196_641))
in (let _196_642 = (FStar_TypeChecker_Rel.conj_guard guard g)
in (_196_643, _196_642, ghost))))))
end)))
end)) ([], g_head, false) args bs)
in (match (_94_1490) with
| (args, guard, ghost) -> begin
(let e = (FStar_Syntax_Syntax.mk_Tm_app head args (Some (res_t.FStar_Syntax_Syntax.n)) r)
in (let c = if ghost then begin
(let _196_644 = (FStar_Syntax_Syntax.mk_GTotal res_t)
in (FStar_All.pipe_right _196_644 FStar_Syntax_Util.lcomp_of_comp))
end else begin
(FStar_Syntax_Util.lcomp_of_comp c)
end
in (let _94_1495 = (FStar_TypeChecker_Util.strengthen_precondition None env e c guard)
in (match (_94_1495) with
| (c, g) -> begin
(e, c, g)
end))))
end)))
end
| _94_1497 -> begin
(check_application_args env head chead g_head args expected_topt)
end))))
and tc_eqn : FStar_Syntax_Syntax.bv  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.branch  ->  ((FStar_Syntax_Syntax.pat * FStar_Syntax_Syntax.term Prims.option * FStar_Syntax_Syntax.term) * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun scrutinee env branch -> (let _94_1504 = (FStar_Syntax_Subst.open_branch branch)
in (match (_94_1504) with
| (pattern, when_clause, branch_exp) -> begin
(let _94_1509 = branch
in (match (_94_1509) with
| (cpat, _94_1507, cbr) -> begin
(let tc_pat = (fun allow_implicits pat_t p0 -> (let _94_1517 = (FStar_TypeChecker_Util.pat_as_exps allow_implicits env p0)
in (match (_94_1517) with
| (pat_bvs, exps, p) -> begin
(let _94_1518 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_656 = (FStar_Syntax_Print.pat_to_string p0)
in (let _196_655 = (FStar_Syntax_Print.pat_to_string p)
in (FStar_Util.print2 "Pattern %s elaborated to %s\n" _196_656 _196_655)))
end else begin
()
end
in (let pat_env = (FStar_List.fold_left FStar_TypeChecker_Env.push_bv env pat_bvs)
in (let _94_1524 = (FStar_TypeChecker_Env.clear_expected_typ pat_env)
in (match (_94_1524) with
| (env1, _94_1523) -> begin
(let env1 = (let _94_1525 = env1
in {FStar_TypeChecker_Env.solver = _94_1525.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1525.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1525.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1525.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1525.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1525.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1525.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1525.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = true; FStar_TypeChecker_Env.instantiate_imp = _94_1525.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1525.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1525.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_1525.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _94_1525.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_1525.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_1525.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_1525.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1525.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1525.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1525.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1525.FStar_TypeChecker_Env.use_bv_sorts})
in (let expected_pat_t = (FStar_TypeChecker_Rel.unrefine env pat_t)
in (let _94_1564 = (let _196_679 = (FStar_All.pipe_right exps (FStar_List.map (fun e -> (let _94_1530 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_659 = (FStar_Syntax_Print.term_to_string e)
in (let _196_658 = (FStar_Syntax_Print.term_to_string pat_t)
in (FStar_Util.print2 "Checking pattern expression %s against expected type %s\n" _196_659 _196_658)))
end else begin
()
end
in (let _94_1535 = (tc_term env1 e)
in (match (_94_1535) with
| (e, lc, g) -> begin
(let _94_1536 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_661 = (FStar_TypeChecker_Normalize.term_to_string env e)
in (let _196_660 = (FStar_TypeChecker_Normalize.term_to_string env lc.FStar_Syntax_Syntax.res_typ)
in (FStar_Util.print2 "Pre-checked pattern expression %s at type %s\n" _196_661 _196_660)))
end else begin
()
end
in (let g' = (FStar_TypeChecker_Rel.teq env lc.FStar_Syntax_Syntax.res_typ expected_pat_t)
in (let g = (FStar_TypeChecker_Rel.conj_guard g g')
in (let _94_1542 = (let _196_662 = (FStar_TypeChecker_Rel.discharge_guard env (let _94_1540 = g
in {FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial; FStar_TypeChecker_Env.deferred = _94_1540.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = _94_1540.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = _94_1540.FStar_TypeChecker_Env.implicits}))
in (FStar_All.pipe_right _196_662 FStar_TypeChecker_Rel.resolve_implicits))
in (let e' = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env e)
in (let uvars_to_string = (fun uvs -> (let _196_667 = (let _196_666 = (FStar_All.pipe_right uvs FStar_Util.set_elements)
in (FStar_All.pipe_right _196_666 (FStar_List.map (fun _94_1550 -> (match (_94_1550) with
| (u, _94_1549) -> begin
(FStar_Syntax_Print.uvar_to_string u)
end)))))
in (FStar_All.pipe_right _196_667 (FStar_String.concat ", "))))
in (let uvs1 = (FStar_Syntax_Free.uvars e')
in (let uvs2 = (FStar_Syntax_Free.uvars expected_pat_t)
in (let _94_1558 = if (let _196_668 = (FStar_Util.set_is_subset_of uvs1 uvs2)
in (FStar_All.pipe_left Prims.op_Negation _196_668)) then begin
(let unresolved = (let _196_669 = (FStar_Util.set_difference uvs1 uvs2)
in (FStar_All.pipe_right _196_669 FStar_Util.set_elements))
in (let _196_677 = (let _196_676 = (let _196_675 = (let _196_674 = (FStar_TypeChecker_Normalize.term_to_string env e')
in (let _196_673 = (FStar_TypeChecker_Normalize.term_to_string env expected_pat_t)
in (let _196_672 = (let _196_671 = (FStar_All.pipe_right unresolved (FStar_List.map (fun _94_1557 -> (match (_94_1557) with
| (u, _94_1556) -> begin
(FStar_Syntax_Print.uvar_to_string u)
end))))
in (FStar_All.pipe_right _196_671 (FStar_String.concat ", ")))
in (FStar_Util.format3 "Implicit pattern variables in %s could not be resolved against expected type %s;Variables {%s} were unresolved; please bind them explicitly" _196_674 _196_673 _196_672))))
in (_196_675, p.FStar_Syntax_Syntax.p))
in FStar_Syntax_Syntax.Error (_196_676))
in (Prims.raise _196_677)))
end else begin
()
end
in (let _94_1560 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_678 = (FStar_TypeChecker_Normalize.term_to_string env e)
in (FStar_Util.print1 "Done checking pattern expression %s\n" _196_678))
end else begin
()
end
in (e, e')))))))))))
end))))))
in (FStar_All.pipe_right _196_679 FStar_List.unzip))
in (match (_94_1564) with
| (exps, norm_exps) -> begin
(let p = (FStar_TypeChecker_Util.decorate_pattern env p exps)
in (p, pat_bvs, pat_env, exps, norm_exps))
end))))
end))))
end)))
in (let pat_t = scrutinee.FStar_Syntax_Syntax.sort
in (let scrutinee_tm = (FStar_Syntax_Syntax.bv_to_name scrutinee)
in (let _94_1571 = (let _196_680 = (FStar_TypeChecker_Env.push_bv env scrutinee)
in (FStar_All.pipe_right _196_680 FStar_TypeChecker_Env.clear_expected_typ))
in (match (_94_1571) with
| (scrutinee_env, _94_1570) -> begin
(let _94_1577 = (tc_pat true pat_t pattern)
in (match (_94_1577) with
| (pattern, pat_bvs, pat_env, disj_exps, norm_disj_exps) -> begin
(let _94_1587 = (match (when_clause) with
| None -> begin
(None, FStar_TypeChecker_Rel.trivial_guard)
end
| Some (e) -> begin
if (FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str) then begin
(Prims.raise (FStar_Syntax_Syntax.Error (("When clauses are not yet supported in --verify mode; they will be some day", e.FStar_Syntax_Syntax.pos))))
end else begin
(let _94_1584 = (let _196_681 = (FStar_TypeChecker_Env.set_expected_typ pat_env FStar_TypeChecker_Recheck.t_bool)
in (tc_term _196_681 e))
in (match (_94_1584) with
| (e, c, g) -> begin
(Some (e), g)
end))
end
end)
in (match (_94_1587) with
| (when_clause, g_when) -> begin
(let _94_1591 = (tc_term pat_env branch_exp)
in (match (_94_1591) with
| (branch_exp, c, g_branch) -> begin
(let when_condition = (match (when_clause) with
| None -> begin
None
end
| Some (w) -> begin
(let _196_683 = (FStar_Syntax_Util.mk_eq FStar_Syntax_Util.t_bool FStar_Syntax_Util.t_bool w FStar_Syntax_Const.exp_true_bool)
in (FStar_All.pipe_left (fun _196_682 -> Some (_196_682)) _196_683))
end)
in (let _94_1645 = (let eqs = (FStar_All.pipe_right disj_exps (FStar_List.fold_left (fun fopt e -> (let e = (FStar_Syntax_Subst.compress e)
in (match (e.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) -> begin
fopt
end
| _94_1609 -> begin
(let clause = (FStar_Syntax_Util.mk_eq pat_t pat_t scrutinee_tm e)
in (match (fopt) with
| None -> begin
Some (clause)
end
| Some (f) -> begin
(let _196_687 = (FStar_Syntax_Util.mk_disj clause f)
in (FStar_All.pipe_left (fun _196_686 -> Some (_196_686)) _196_687))
end))
end))) None))
in (let _94_1640 = (match ((eqs, when_condition)) with
| (None, None) -> begin
(c, g_when, g_branch)
end
| (Some (f), None) -> begin
(let gf = FStar_TypeChecker_Common.NonTrivial (f)
in (let g = (FStar_TypeChecker_Rel.guard_of_guard_formula gf)
in (let _196_690 = (FStar_TypeChecker_Util.weaken_precondition env c gf)
in (let _196_689 = (FStar_TypeChecker_Rel.imp_guard g g_when)
in (let _196_688 = (FStar_TypeChecker_Rel.imp_guard g g_branch)
in (_196_690, _196_689, _196_688))))))
end
| (Some (f), Some (w)) -> begin
(let g_f = FStar_TypeChecker_Common.NonTrivial (f)
in (let g_fw = (let _196_691 = (FStar_Syntax_Util.mk_conj f w)
in FStar_TypeChecker_Common.NonTrivial (_196_691))
in (let _196_696 = (FStar_TypeChecker_Util.weaken_precondition env c g_fw)
in (let _196_695 = (let _196_692 = (FStar_TypeChecker_Rel.guard_of_guard_formula g_f)
in (FStar_TypeChecker_Rel.imp_guard _196_692 g_when))
in (let _196_694 = (let _196_693 = (FStar_TypeChecker_Rel.guard_of_guard_formula g_fw)
in (FStar_TypeChecker_Rel.imp_guard _196_693 g_branch))
in (_196_696, _196_695, _196_694))))))
end
| (None, Some (w)) -> begin
(let g_w = FStar_TypeChecker_Common.NonTrivial (w)
in (let g = (FStar_TypeChecker_Rel.guard_of_guard_formula g_w)
in (let _196_698 = (FStar_TypeChecker_Util.weaken_precondition env c g_w)
in (let _196_697 = (FStar_TypeChecker_Rel.imp_guard g g_branch)
in (_196_698, g_when, _196_697)))))
end)
in (match (_94_1640) with
| (c_weak, g_when_weak, g_branch_weak) -> begin
(let binders = (FStar_List.map FStar_Syntax_Syntax.mk_binder pat_bvs)
in (let _196_701 = (FStar_TypeChecker_Util.close_comp env pat_bvs c_weak)
in (let _196_700 = (FStar_TypeChecker_Rel.close_guard binders g_when_weak)
in (let _196_699 = (FStar_TypeChecker_Rel.close_guard binders g_branch_weak)
in (_196_701, _196_700, _196_699)))))
end)))
in (match (_94_1645) with
| (c, g_when, g_branch) -> begin
(let branch_guard = (let rec build_branch_guard = (fun scrutinee_tm pat_exp -> (let discriminate = (fun scrutinee_tm f -> if ((let _196_711 = (let _196_710 = (FStar_TypeChecker_Env.typ_of_datacon env f.FStar_Syntax_Syntax.v)
in (FStar_TypeChecker_Env.datacons_of_typ env _196_710))
in (FStar_List.length _196_711)) > 1) then begin
(let disc = (let _196_712 = (FStar_Syntax_Util.mk_discriminator f.FStar_Syntax_Syntax.v)
in (FStar_Syntax_Syntax.fvar None _196_712 (FStar_Ident.range_of_lid f.FStar_Syntax_Syntax.v)))
in (let disc = (let _196_714 = (let _196_713 = (FStar_Syntax_Syntax.as_arg scrutinee_tm)
in (_196_713)::[])
in (FStar_Syntax_Syntax.mk_Tm_app disc _196_714 None scrutinee_tm.FStar_Syntax_Syntax.pos))
in (let _196_715 = (FStar_Syntax_Util.mk_eq FStar_Syntax_Util.t_bool FStar_Syntax_Util.t_bool disc FStar_Syntax_Const.exp_true_bool)
in (_196_715)::[])))
end else begin
[]
end)
in (let fail = (fun _94_1655 -> (match (()) with
| () -> begin
(let _196_721 = (let _196_720 = (FStar_Range.string_of_range pat_exp.FStar_Syntax_Syntax.pos)
in (let _196_719 = (FStar_Syntax_Print.term_to_string pat_exp)
in (let _196_718 = (FStar_Syntax_Print.tag_of_term pat_exp)
in (FStar_Util.format3 "tc_eqn: Impossible (%s) %s (%s)" _196_720 _196_719 _196_718))))
in (FStar_All.failwith _196_721))
end))
in (let rec head_constructor = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (f, _94_1660) -> begin
f
end
| FStar_Syntax_Syntax.Tm_uinst (t, _94_1665) -> begin
(head_constructor t)
end
| _94_1669 -> begin
(fail ())
end))
in (let pat_exp = (let _196_724 = (FStar_Syntax_Subst.compress pat_exp)
in (FStar_All.pipe_right _196_724 FStar_Syntax_Util.unmeta))
in (match (pat_exp.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (_); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_unit)) -> begin
[]
end
| FStar_Syntax_Syntax.Tm_constant (_94_1694) -> begin
(let _196_729 = (let _196_728 = (let _196_727 = (FStar_Syntax_Syntax.as_arg scrutinee_tm)
in (let _196_726 = (let _196_725 = (FStar_Syntax_Syntax.as_arg pat_exp)
in (_196_725)::[])
in (_196_727)::_196_726))
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.teq _196_728 None scrutinee_tm.FStar_Syntax_Syntax.pos))
in (_196_729)::[])
end
| (FStar_Syntax_Syntax.Tm_uinst (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) -> begin
(let f = (head_constructor pat_exp)
in if (not ((FStar_TypeChecker_Env.is_datacon env f.FStar_Syntax_Syntax.v))) then begin
[]
end else begin
(let _196_730 = (head_constructor pat_exp)
in (discriminate scrutinee_tm _196_730))
end)
end
| FStar_Syntax_Syntax.Tm_app (head, args) -> begin
(let f = (head_constructor head)
in if (not ((FStar_TypeChecker_Env.is_datacon env f.FStar_Syntax_Syntax.v))) then begin
[]
end else begin
(let sub_term_guards = (let _196_736 = (FStar_All.pipe_right args (FStar_List.mapi (fun i _94_1712 -> (match (_94_1712) with
| (ei, _94_1711) -> begin
(let projector = (FStar_TypeChecker_Env.lookup_projector env f.FStar_Syntax_Syntax.v i)
in (let sub_term = (let _196_735 = (FStar_Syntax_Syntax.fvar None projector f.FStar_Syntax_Syntax.p)
in (let _196_734 = (let _196_733 = (FStar_Syntax_Syntax.as_arg scrutinee_tm)
in (_196_733)::[])
in (FStar_Syntax_Syntax.mk_Tm_app _196_735 _196_734 None f.FStar_Syntax_Syntax.p)))
in (build_branch_guard sub_term ei)))
end))))
in (FStar_All.pipe_right _196_736 FStar_List.flatten))
in (let _196_737 = (discriminate scrutinee_tm f)
in (FStar_List.append _196_737 sub_term_guards)))
end)
end
| _94_1717 -> begin
[]
end))))))
in (let build_and_check_branch_guard = (fun scrutinee_tm pat -> if (not ((FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str))) then begin
(FStar_Syntax_Syntax.fvar None FStar_Syntax_Const.true_lid scrutinee_tm.FStar_Syntax_Syntax.pos)
end else begin
(let t = (let _196_742 = (build_branch_guard scrutinee_tm pat)
in (FStar_All.pipe_left FStar_Syntax_Util.mk_conj_l _196_742))
in (let _94_1725 = (FStar_Syntax_Util.type_u ())
in (match (_94_1725) with
| (k, _94_1724) -> begin
(let _94_1731 = (tc_check_tot_or_gtot_term scrutinee_env t k)
in (match (_94_1731) with
| (t, _94_1728, _94_1730) -> begin
t
end))
end)))
end)
in (let branch_guard = (let _196_743 = (FStar_All.pipe_right norm_disj_exps (FStar_List.map (build_and_check_branch_guard scrutinee_tm)))
in (FStar_All.pipe_right _196_743 FStar_Syntax_Util.mk_disj_l))
in (let branch_guard = (match (when_condition) with
| None -> begin
branch_guard
end
| Some (w) -> begin
(FStar_Syntax_Util.mk_conj branch_guard w)
end)
in branch_guard))))
in (let guard = (FStar_TypeChecker_Rel.conj_guard g_when g_branch)
in (let _94_1739 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_744 = (FStar_TypeChecker_Rel.guard_to_string env guard)
in (FStar_All.pipe_left (FStar_Util.print1 "Carrying guard from match: %s\n") _196_744))
end else begin
()
end
in (let _196_745 = (FStar_Syntax_Subst.close_branch (pattern, when_clause, branch_exp))
in (_196_745, branch_guard, c, guard)))))
end)))
end))
end))
end))
end)))))
end))
end)))
and check_top_level_let : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (let env = (instantiate_both env)
in (match (e.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((false, lb::[]), e2) -> begin
(let _94_1756 = (check_let_bound_def true env lb)
in (match (_94_1756) with
| (e1, univ_vars, c1, g1, annotated) -> begin
(let _94_1768 = if (annotated && (not (env.FStar_TypeChecker_Env.generalize))) then begin
(g1, e1, univ_vars, c1)
end else begin
(let g1 = (let _196_748 = (FStar_TypeChecker_Rel.solve_deferred_constraints env g1)
in (FStar_All.pipe_right _196_748 FStar_TypeChecker_Rel.resolve_implicits))
in (let _94_1763 = (let _196_752 = (let _196_751 = (let _196_750 = (let _196_749 = (c1.FStar_Syntax_Syntax.comp ())
in (lb.FStar_Syntax_Syntax.lbname, e1, _196_749))
in (_196_750)::[])
in (FStar_TypeChecker_Util.generalize env _196_751))
in (FStar_List.hd _196_752))
in (match (_94_1763) with
| (_94_1759, univs, e1, c1) -> begin
(g1, e1, univs, (FStar_Syntax_Util.lcomp_of_comp c1))
end)))
end
in (match (_94_1768) with
| (g1, e1, univ_vars, c1) -> begin
(let _94_1778 = if (FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str) then begin
(let _94_1771 = (FStar_TypeChecker_Util.check_top_level env g1 c1)
in (match (_94_1771) with
| (ok, c1) -> begin
if ok then begin
(e2, c1)
end else begin
(let _94_1772 = if (FStar_ST.read FStar_Options.warn_top_level_effects) then begin
(let _196_753 = (FStar_TypeChecker_Env.get_range env)
in (FStar_TypeChecker_Errors.warn _196_753 FStar_TypeChecker_Errors.top_level_effect))
end else begin
()
end
in (let _196_754 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta ((e2, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Masked_effect)))) None e2.FStar_Syntax_Syntax.pos)
in (_196_754, c1)))
end
end))
end else begin
(let _94_1774 = (FStar_TypeChecker_Rel.force_trivial_guard env g1)
in (let _196_755 = (c1.FStar_Syntax_Syntax.comp ())
in (e2, _196_755)))
end
in (match (_94_1778) with
| (e2, c1) -> begin
(let cres = (let _196_756 = (FStar_Syntax_Util.ml_comp FStar_TypeChecker_Recheck.t_unit e.FStar_Syntax_Syntax.pos)
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp _196_756))
in (let _94_1780 = (FStar_ST.op_Colon_Equals e2.FStar_Syntax_Syntax.tk (Some (FStar_TypeChecker_Recheck.t_unit.FStar_Syntax_Syntax.n)))
in (let lb = (FStar_Syntax_Util.close_univs_and_mk_letbinding None lb.FStar_Syntax_Syntax.lbname univ_vars (FStar_Syntax_Util.comp_result c1) (FStar_Syntax_Util.comp_effect_name c1) e1)
in (let _196_757 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((false, (lb)::[]), e2))) (Some (FStar_TypeChecker_Recheck.t_unit.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos)
in (_196_757, cres, FStar_TypeChecker_Rel.trivial_guard)))))
end))
end))
end))
end
| _94_1784 -> begin
(FStar_All.failwith "Impossible")
end)))
and check_inner_let : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (let env = (instantiate_both env)
in (match (e.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((false, lb::[]), e2) -> begin
(let env = (let _94_1795 = env
in {FStar_TypeChecker_Env.solver = _94_1795.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1795.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1795.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1795.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1795.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1795.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1795.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1795.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_1795.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_1795.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1795.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1795.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_1795.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = _94_1795.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_1795.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_1795.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1795.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1795.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1795.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1795.FStar_TypeChecker_Env.use_bv_sorts})
in (let _94_1804 = (let _196_761 = (let _196_760 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (FStar_All.pipe_right _196_760 Prims.fst))
in (check_let_bound_def false _196_761 lb))
in (match (_94_1804) with
| (e1, _94_1800, c1, g1, annotated) -> begin
(let lb = (FStar_Syntax_Util.mk_letbinding lb.FStar_Syntax_Syntax.lbname [] c1.FStar_Syntax_Syntax.res_typ c1.FStar_Syntax_Syntax.eff_name e1)
in (let x = (let _94_1806 = (FStar_Util.left lb.FStar_Syntax_Syntax.lbname)
in {FStar_Syntax_Syntax.ppname = _94_1806.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_1806.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = c1.FStar_Syntax_Syntax.res_typ})
in (let _94_1811 = (let _196_763 = (let _196_762 = (FStar_Syntax_Syntax.mk_binder x)
in (_196_762)::[])
in (FStar_Syntax_Subst.open_term _196_763 e2))
in (match (_94_1811) with
| (xb, e2) -> begin
(let xbinder = (FStar_List.hd xb)
in (let x = (Prims.fst xbinder)
in (let _94_1817 = (let _196_764 = (FStar_TypeChecker_Env.push_bv env x)
in (tc_term _196_764 e2))
in (match (_94_1817) with
| (e2, c2, g2) -> begin
(let cres = (FStar_TypeChecker_Util.bind env (Some (e1)) c1 (Some (x), c2))
in (let e = (let _196_767 = (let _196_766 = (let _196_765 = (FStar_Syntax_Subst.close xb e2)
in ((false, (lb)::[]), _196_765))
in FStar_Syntax_Syntax.Tm_let (_196_766))
in (FStar_Syntax_Syntax.mk _196_767 (Some (cres.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos))
in (let x_eq_e1 = (let _196_770 = (let _196_769 = (FStar_Syntax_Syntax.bv_to_name x)
in (FStar_Syntax_Util.mk_eq c1.FStar_Syntax_Syntax.res_typ c1.FStar_Syntax_Syntax.res_typ _196_769 e1))
in (FStar_All.pipe_left (fun _196_768 -> FStar_TypeChecker_Common.NonTrivial (_196_768)) _196_770))
in (let g2 = (let _196_772 = (let _196_771 = (FStar_TypeChecker_Rel.guard_of_guard_formula x_eq_e1)
in (FStar_TypeChecker_Rel.imp_guard _196_771 g2))
in (FStar_TypeChecker_Rel.close_guard xb _196_772))
in (let guard = (FStar_TypeChecker_Rel.conj_guard g1 g2)
in if annotated then begin
(e, cres, guard)
end else begin
(let _94_1823 = (check_no_escape env ((x)::[]) cres.FStar_Syntax_Syntax.res_typ)
in (e, cres, guard))
end)))))
end))))
end))))
end)))
end
| _94_1826 -> begin
(FStar_All.failwith "Impossible")
end)))
and check_top_level_let_rec : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env top -> (let env = (instantiate_both env)
in (match (top.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((true, lbs), e2) -> begin
(let _94_1838 = (FStar_Syntax_Subst.open_let_rec lbs e2)
in (match (_94_1838) with
| (lbs, e2) -> begin
(let _94_1841 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_1841) with
| (env0, topt) -> begin
(let _94_1844 = (build_let_rec_env true env0 lbs)
in (match (_94_1844) with
| (lbs, rec_env) -> begin
(let _94_1847 = (check_let_recs rec_env lbs)
in (match (_94_1847) with
| (lbs, g_lbs) -> begin
(let g_lbs = (let _196_775 = (FStar_TypeChecker_Rel.solve_deferred_constraints env g_lbs)
in (FStar_All.pipe_right _196_775 FStar_TypeChecker_Rel.resolve_implicits))
in (let all_lb_names = (let _196_778 = (FStar_All.pipe_right lbs (FStar_List.map (fun lb -> (FStar_Util.right lb.FStar_Syntax_Syntax.lbname))))
in (FStar_All.pipe_right _196_778 (fun _196_777 -> Some (_196_777))))
in (let lbs = if (not (env.FStar_TypeChecker_Env.generalize)) then begin
(FStar_All.pipe_right lbs (FStar_List.map (fun lb -> if (lb.FStar_Syntax_Syntax.lbunivs = []) then begin
lb
end else begin
(FStar_Syntax_Util.close_univs_and_mk_letbinding all_lb_names lb.FStar_Syntax_Syntax.lbname lb.FStar_Syntax_Syntax.lbunivs lb.FStar_Syntax_Syntax.lbtyp lb.FStar_Syntax_Syntax.lbeff lb.FStar_Syntax_Syntax.lbdef)
end)))
end else begin
(let ecs = (let _196_782 = (FStar_All.pipe_right lbs (FStar_List.map (fun lb -> (let _196_781 = (FStar_Syntax_Syntax.mk_Total lb.FStar_Syntax_Syntax.lbtyp)
in (lb.FStar_Syntax_Syntax.lbname, lb.FStar_Syntax_Syntax.lbdef, _196_781)))))
in (FStar_TypeChecker_Util.generalize env _196_782))
in (FStar_All.pipe_right ecs (FStar_List.map (fun _94_1858 -> (match (_94_1858) with
| (x, uvs, e, c) -> begin
(FStar_Syntax_Util.close_univs_and_mk_letbinding all_lb_names x uvs (FStar_Syntax_Util.comp_result c) (FStar_Syntax_Util.comp_effect_name c) e)
end)))))
end
in (let cres = (let _196_784 = (FStar_Syntax_Syntax.mk_Total FStar_TypeChecker_Recheck.t_unit)
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp _196_784))
in (let _94_1861 = (FStar_ST.op_Colon_Equals e2.FStar_Syntax_Syntax.tk (Some (FStar_TypeChecker_Recheck.t_unit.FStar_Syntax_Syntax.n)))
in (let _94_1865 = (FStar_Syntax_Subst.close_let_rec lbs e2)
in (match (_94_1865) with
| (lbs, e2) -> begin
(let _196_786 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((true, lbs), e2))) (Some (FStar_TypeChecker_Recheck.t_unit.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (let _196_785 = (FStar_TypeChecker_Rel.discharge_guard env g_lbs)
in (_196_786, cres, _196_785)))
end)))))))
end))
end))
end))
end))
end
| _94_1867 -> begin
(FStar_All.failwith "Impossible")
end)))
and check_inner_let_rec : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env top -> (let env = (instantiate_both env)
in (match (top.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((true, lbs), e2) -> begin
(let _94_1879 = (FStar_Syntax_Subst.open_let_rec lbs e2)
in (match (_94_1879) with
| (lbs, e2) -> begin
(let _94_1882 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_1882) with
| (env0, topt) -> begin
(let _94_1885 = (build_let_rec_env false env0 lbs)
in (match (_94_1885) with
| (lbs, rec_env) -> begin
(let _94_1888 = (check_let_recs rec_env lbs)
in (match (_94_1888) with
| (lbs, g_lbs) -> begin
(let _94_1906 = (FStar_All.pipe_right lbs (FStar_List.fold_left (fun _94_1891 _94_1900 -> (match ((_94_1891, _94_1900)) with
| ((bvs, env), {FStar_Syntax_Syntax.lbname = x; FStar_Syntax_Syntax.lbunivs = _94_1898; FStar_Syntax_Syntax.lbtyp = t; FStar_Syntax_Syntax.lbeff = _94_1895; FStar_Syntax_Syntax.lbdef = _94_1893}) -> begin
(let env = (FStar_TypeChecker_Env.push_let_binding env x ([], t))
in (let _196_792 = (let _196_791 = (let _94_1902 = (FStar_Util.left x)
in {FStar_Syntax_Syntax.ppname = _94_1902.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_1902.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t})
in (_196_791)::bvs)
in (_196_792, env)))
end)) ([], env)))
in (match (_94_1906) with
| (bvs, env) -> begin
(let bvs = (FStar_List.rev bvs)
in (let _94_1911 = (tc_term env e2)
in (match (_94_1911) with
| (e2, cres, g2) -> begin
(let guard = (FStar_TypeChecker_Rel.conj_guard g_lbs g2)
in (let cres = (FStar_TypeChecker_Util.close_comp env bvs cres)
in (let tres = (norm env cres.FStar_Syntax_Syntax.res_typ)
in (let cres = (let _94_1915 = cres
in {FStar_Syntax_Syntax.eff_name = _94_1915.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.res_typ = tres; FStar_Syntax_Syntax.cflags = _94_1915.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = _94_1915.FStar_Syntax_Syntax.comp})
in (let _94_1920 = (FStar_Syntax_Subst.close_let_rec lbs e2)
in (match (_94_1920) with
| (lbs, e2) -> begin
(let e = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((true, lbs), e2))) (Some (tres.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (match (topt) with
| Some (_94_1923) -> begin
(e, cres, guard)
end
| None -> begin
(let _94_1926 = (check_no_escape env bvs tres)
in (e, cres, guard))
end))
end))))))
end)))
end))
end))
end))
end))
end))
end
| _94_1929 -> begin
(FStar_All.failwith "Impossible")
end)))
and build_let_rec_env : Prims.bool  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.letbinding Prims.list  ->  (FStar_Syntax_Syntax.letbinding Prims.list * FStar_TypeChecker_Env.env_t) = (fun top_level env lbs -> (let env0 = env
in (let _94_1962 = (FStar_List.fold_left (fun _94_1936 lb -> (match (_94_1936) with
| (lbs, env) -> begin
(let _94_1941 = (FStar_TypeChecker_Util.extract_let_rec_annotation env lb)
in (match (_94_1941) with
| (univ_vars, t, check_t) -> begin
(let env = (FStar_TypeChecker_Env.push_univ_vars env univ_vars)
in (let e = (FStar_Syntax_Util.unascribe lb.FStar_Syntax_Syntax.lbdef)
in (let t = if (not (check_t)) then begin
t
end else begin
if (top_level && (not (env.FStar_TypeChecker_Env.generalize))) then begin
t
end else begin
(let _94_1950 = (let _196_799 = (let _196_798 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_left Prims.fst _196_798))
in (tc_check_tot_or_gtot_term (let _94_1944 = env0
in {FStar_TypeChecker_Env.solver = _94_1944.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1944.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1944.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1944.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1944.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1944.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1944.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1944.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_1944.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_1944.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1944.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1944.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_1944.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _94_1944.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = true; FStar_TypeChecker_Env.use_eq = _94_1944.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_1944.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1944.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1944.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1944.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1944.FStar_TypeChecker_Env.use_bv_sorts}) t _196_799))
in (match (_94_1950) with
| (t, _94_1948, g) -> begin
(let _94_1951 = (FStar_TypeChecker_Rel.force_trivial_guard env0 g)
in (norm env0 t))
end))
end
end
in (let env = if ((FStar_Syntax_Util.is_pure_or_ghost_function t) && (FStar_Options.should_verify env.FStar_TypeChecker_Env.curmodule.FStar_Ident.str)) then begin
(let _94_1954 = env
in {FStar_TypeChecker_Env.solver = _94_1954.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1954.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1954.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1954.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1954.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1954.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1954.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1954.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_1954.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_1954.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1954.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1954.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = ((lb.FStar_Syntax_Syntax.lbname, t))::env.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _94_1954.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_1954.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_1954.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_1954.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1954.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1954.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1954.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1954.FStar_TypeChecker_Env.use_bv_sorts})
end else begin
(FStar_TypeChecker_Env.push_let_binding env lb.FStar_Syntax_Syntax.lbname ([], t))
end
in (let lb = (let _94_1957 = lb
in {FStar_Syntax_Syntax.lbname = _94_1957.FStar_Syntax_Syntax.lbname; FStar_Syntax_Syntax.lbunivs = univ_vars; FStar_Syntax_Syntax.lbtyp = t; FStar_Syntax_Syntax.lbeff = _94_1957.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = e})
in ((lb)::lbs, env))))))
end))
end)) ([], env) lbs)
in (match (_94_1962) with
| (lbs, env) -> begin
((FStar_List.rev lbs), env)
end))))
and check_let_recs : FStar_TypeChecker_Env.env_t  ->  FStar_Syntax_Syntax.letbinding Prims.list  ->  (FStar_Syntax_Syntax.letbinding Prims.list * FStar_TypeChecker_Env.guard_t) = (fun env lbs -> (let _94_1975 = (let _196_804 = (FStar_All.pipe_right lbs (FStar_List.map (fun lb -> (let _94_1969 = (let _196_803 = (FStar_TypeChecker_Env.set_expected_typ env lb.FStar_Syntax_Syntax.lbtyp)
in (tc_tot_or_gtot_term _196_803 lb.FStar_Syntax_Syntax.lbdef))
in (match (_94_1969) with
| (e, c, g) -> begin
(let _94_1970 = if (not ((FStar_Syntax_Util.is_total_lcomp c))) then begin
(Prims.raise (FStar_Syntax_Syntax.Error (("Expected let rec to be a Tot term; got effect GTot", e.FStar_Syntax_Syntax.pos))))
end else begin
()
end
in (let lb = (FStar_Syntax_Util.mk_letbinding lb.FStar_Syntax_Syntax.lbname lb.FStar_Syntax_Syntax.lbunivs lb.FStar_Syntax_Syntax.lbtyp FStar_Syntax_Const.effect_Tot_lid e)
in (lb, g)))
end)))))
in (FStar_All.pipe_right _196_804 FStar_List.unzip))
in (match (_94_1975) with
| (lbs, gs) -> begin
(let g_lbs = (FStar_List.fold_right FStar_TypeChecker_Rel.conj_guard gs FStar_TypeChecker_Rel.trivial_guard)
in (lbs, g_lbs))
end)))
and check_let_bound_def : Prims.bool  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.letbinding  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t * Prims.bool) = (fun top_level env lb -> (let _94_1983 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (_94_1983) with
| (env1, _94_1982) -> begin
(let e1 = lb.FStar_Syntax_Syntax.lbdef
in (let _94_1989 = (check_lbtyp top_level env lb)
in (match (_94_1989) with
| (topt, wf_annot, univ_vars, env1) -> begin
(let _94_1990 = if ((not (top_level)) && (univ_vars <> [])) then begin
(Prims.raise (FStar_Syntax_Syntax.Error (("Inner let-bound definitions cannot be universe polymorphic", e1.FStar_Syntax_Syntax.pos))))
end else begin
()
end
in (let _94_1997 = (tc_maybe_toplevel_term (let _94_1992 = env1
in {FStar_TypeChecker_Env.solver = _94_1992.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_1992.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_1992.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_1992.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_1992.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_1992.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_1992.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_1992.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_1992.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_1992.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_1992.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_1992.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_1992.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = top_level; FStar_TypeChecker_Env.check_uvars = _94_1992.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_1992.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_1992.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_1992.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_1992.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_1992.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_1992.FStar_TypeChecker_Env.use_bv_sorts}) e1)
in (match (_94_1997) with
| (e1, c1, g1) -> begin
(let _94_2001 = (let _196_811 = (FStar_TypeChecker_Env.set_range env1 e1.FStar_Syntax_Syntax.pos)
in (FStar_TypeChecker_Util.strengthen_precondition (Some ((fun _94_1998 -> (match (()) with
| () -> begin
FStar_TypeChecker_Errors.ill_kinded_type
end)))) _196_811 e1 c1 wf_annot))
in (match (_94_2001) with
| (c1, guard_f) -> begin
(let g1 = (FStar_TypeChecker_Rel.conj_guard g1 guard_f)
in (let _94_2003 = if (FStar_TypeChecker_Env.debug env FStar_Options.Extreme) then begin
(let _196_812 = (FStar_TypeChecker_Rel.guard_to_string env g1)
in (FStar_Util.print1 "checked top-level def, guard is %s\n" _196_812))
end else begin
()
end
in (let _196_813 = (FStar_Option.isSome topt)
in (e1, univ_vars, c1, g1, _196_813))))
end))
end)))
end)))
end)))
and check_lbtyp : Prims.bool  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.letbinding  ->  (FStar_Syntax_Syntax.typ Prims.option * FStar_TypeChecker_Env.guard_t * FStar_Syntax_Syntax.univ_names * FStar_TypeChecker_Env.env) = (fun top_level env lb -> (let t = (FStar_Syntax_Subst.compress lb.FStar_Syntax_Syntax.lbtyp)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
(let _94_2010 = if (lb.FStar_Syntax_Syntax.lbunivs <> []) then begin
(FStar_All.failwith "Impossible: non-empty universe variables but the type is unknown")
end else begin
()
end
in (None, FStar_TypeChecker_Rel.trivial_guard, [], env))
end
| _94_2013 -> begin
(let _94_2016 = (FStar_Syntax_Subst.open_univ_vars lb.FStar_Syntax_Syntax.lbunivs t)
in (match (_94_2016) with
| (univ_vars, t) -> begin
(let env1 = (FStar_TypeChecker_Env.push_univ_vars env univ_vars)
in if (top_level && (not (env.FStar_TypeChecker_Env.generalize))) then begin
(let _196_817 = (FStar_TypeChecker_Env.set_expected_typ env1 t)
in (Some (t), FStar_TypeChecker_Rel.trivial_guard, univ_vars, _196_817))
end else begin
(let _94_2021 = (FStar_Syntax_Util.type_u ())
in (match (_94_2021) with
| (k, _94_2020) -> begin
(let _94_2026 = (tc_check_tot_or_gtot_term env1 t k)
in (match (_94_2026) with
| (t, _94_2024, g) -> begin
(let _94_2027 = if (FStar_TypeChecker_Env.debug env FStar_Options.Medium) then begin
(let _196_820 = (let _196_818 = (FStar_Syntax_Syntax.range_of_lbname lb.FStar_Syntax_Syntax.lbname)
in (FStar_Range.string_of_range _196_818))
in (let _196_819 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "(%s) Checked type annotation %s\n" _196_820 _196_819)))
end else begin
()
end
in (let t = (norm env1 t)
in (let _196_821 = (FStar_TypeChecker_Env.set_expected_typ env1 t)
in (Some (t), g, univ_vars, _196_821))))
end))
end))
end)
end))
end)))
and tc_binder : FStar_TypeChecker_Env.env  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier Prims.option)  ->  ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier Prims.option) * FStar_TypeChecker_Env.env * FStar_TypeChecker_Env.guard_t * FStar_Syntax_Syntax.universe) = (fun env _94_2033 -> (match (_94_2033) with
| (x, imp) -> begin
(let _94_2036 = (FStar_Syntax_Util.type_u ())
in (match (_94_2036) with
| (tu, u) -> begin
(let _94_2041 = (tc_check_tot_or_gtot_term env x.FStar_Syntax_Syntax.sort tu)
in (match (_94_2041) with
| (t, _94_2039, g) -> begin
(let x = ((let _94_2042 = x
in {FStar_Syntax_Syntax.ppname = _94_2042.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_2042.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t}), imp)
in (let _94_2045 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_825 = (FStar_Syntax_Print.bv_to_string (Prims.fst x))
in (let _196_824 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "Pushing binder %s at type %s\n" _196_825 _196_824)))
end else begin
()
end
in (let _196_826 = (maybe_push_binding env x)
in (x, _196_826, g, u))))
end))
end))
end))
and tc_binders : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.binders  ->  ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier Prims.option) Prims.list * FStar_TypeChecker_Env.env * FStar_TypeChecker_Env.guard_t * FStar_Syntax_Syntax.universe Prims.list) = (fun env bs -> (let rec aux = (fun env bs -> (match (bs) with
| [] -> begin
([], env, FStar_TypeChecker_Rel.trivial_guard, [])
end
| b::bs -> begin
(let _94_2060 = (tc_binder env b)
in (match (_94_2060) with
| (b, env', g, u) -> begin
(let _94_2065 = (aux env' bs)
in (match (_94_2065) with
| (bs, env', g', us) -> begin
(let _196_834 = (let _196_833 = (FStar_TypeChecker_Rel.close_guard ((b)::[]) g')
in (FStar_TypeChecker_Rel.conj_guard g _196_833))
in ((b)::bs, env', _196_834, (u)::us))
end))
end))
end))
in (aux env bs)))
and tc_pats : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.args Prims.list  ->  (FStar_Syntax_Syntax.args Prims.list * FStar_TypeChecker_Env.guard_t) = (fun env pats -> (let tc_args = (fun env args -> (FStar_List.fold_right (fun _94_2073 _94_2076 -> (match ((_94_2073, _94_2076)) with
| ((t, imp), (args, g)) -> begin
(let _94_2081 = (tc_term env t)
in (match (_94_2081) with
| (t, _94_2079, g') -> begin
(let _196_843 = (FStar_TypeChecker_Rel.conj_guard g g')
in (((t, imp))::args, _196_843))
end))
end)) args ([], FStar_TypeChecker_Rel.trivial_guard)))
in (FStar_List.fold_right (fun p _94_2085 -> (match (_94_2085) with
| (pats, g) -> begin
(let _94_2088 = (tc_args env p)
in (match (_94_2088) with
| (args, g') -> begin
(let _196_846 = (FStar_TypeChecker_Rel.conj_guard g g')
in ((args)::pats, _196_846))
end))
end)) pats ([], FStar_TypeChecker_Rel.trivial_guard))))
and tc_tot_or_gtot_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (let _94_2094 = (tc_maybe_toplevel_term env e)
in (match (_94_2094) with
| (e, c, g) -> begin
if (FStar_Syntax_Util.is_tot_or_gtot_lcomp c) then begin
(e, c, g)
end else begin
(let g = (FStar_TypeChecker_Rel.solve_deferred_constraints env g)
in (let c = (c.FStar_Syntax_Syntax.comp ())
in (let _94_2097 = if (FStar_TypeChecker_Env.debug env FStar_Options.High) then begin
(let _196_849 = (FStar_Syntax_Print.comp_to_string c)
in (FStar_Util.print1 "About to normalize %s\n" _196_849))
end else begin
()
end
in (let c = (norm_c env c)
in (let _94_2102 = if (FStar_TypeChecker_Util.is_pure_effect env (FStar_Syntax_Util.comp_effect_name c)) then begin
(let _196_850 = (FStar_Syntax_Syntax.mk_Total (FStar_Syntax_Util.comp_result c))
in (_196_850, false))
end else begin
(let _196_851 = (FStar_Syntax_Syntax.mk_GTotal (FStar_Syntax_Util.comp_result c))
in (_196_851, true))
end
in (match (_94_2102) with
| (target_comp, allow_ghost) -> begin
(match ((FStar_TypeChecker_Rel.sub_comp env c target_comp)) with
| Some (g') -> begin
(let _196_852 = (FStar_TypeChecker_Rel.conj_guard g g')
in (e, (FStar_Syntax_Util.lcomp_of_comp target_comp), _196_852))
end
| _94_2106 -> begin
if allow_ghost then begin
(let _196_855 = (let _196_854 = (let _196_853 = (FStar_TypeChecker_Errors.expected_ghost_expression e c)
in (_196_853, e.FStar_Syntax_Syntax.pos))
in FStar_Syntax_Syntax.Error (_196_854))
in (Prims.raise _196_855))
end else begin
(let _196_858 = (let _196_857 = (let _196_856 = (FStar_TypeChecker_Errors.expected_pure_expression e c)
in (_196_856, e.FStar_Syntax_Syntax.pos))
in FStar_Syntax_Syntax.Error (_196_857))
in (Prims.raise _196_858))
end
end)
end))))))
end
end)))
and tc_check_tot_or_gtot_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e t -> (let env = (FStar_TypeChecker_Env.set_expected_typ env t)
in (tc_tot_or_gtot_term env e)))

let tc_trivial_guard : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp) = (fun env t -> (let _94_2116 = (tc_tot_or_gtot_term env t)
in (match (_94_2116) with
| (t, c, g) -> begin
(let _94_2117 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in (t, c))
end)))

let tc_check_trivial_guard : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term = (fun env t k -> (let _94_2125 = (tc_check_tot_or_gtot_term env t k)
in (match (_94_2125) with
| (t, c, g) -> begin
(let _94_2126 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in t)
end)))

let check_and_gen : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.tscheme = (fun env t k -> (let _196_878 = (tc_check_trivial_guard env t k)
in (FStar_TypeChecker_Util.generalize_universes env _196_878)))

let check_nogen = (fun env t k -> (let t = (tc_check_trivial_guard env t k)
in (let _196_882 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env t)
in ([], _196_882))))

let tc_tparams : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.binders * FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.universes) = (fun env tps -> (let _94_2141 = (tc_binders env tps)
in (match (_94_2141) with
| (tps, env, g, us) -> begin
(let _94_2142 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in (tps, env, us))
end)))

let monad_signature : FStar_TypeChecker_Env.env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.term) = (fun env m s -> (let fail = (fun _94_2148 -> (match (()) with
| () -> begin
(let _196_897 = (let _196_896 = (let _196_895 = (FStar_TypeChecker_Errors.unexpected_signature_for_monad env m s)
in (_196_895, (FStar_Ident.range_of_lid m)))
in FStar_Syntax_Syntax.Error (_196_896))
in (Prims.raise _196_897))
end))
in (let s = (FStar_Syntax_Subst.compress s)
in (match (s.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(let bs = (FStar_Syntax_Subst.open_binders bs)
in (match (bs) with
| (a, _94_2165)::(wp, _94_2161)::(_wlp, _94_2157)::[] -> begin
(a, wp.FStar_Syntax_Syntax.sort)
end
| _94_2169 -> begin
(fail ())
end))
end
| _94_2171 -> begin
(fail ())
end))))

let open_univ_vars : FStar_Syntax_Syntax.univ_names  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier Prims.option) Prims.list  ->  FStar_Syntax_Syntax.comp  ->  (FStar_Syntax_Syntax.univ_names * (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier Prims.option) Prims.list * FStar_Syntax_Syntax.comp) = (fun uvs binders c -> (match (binders) with
| [] -> begin
(let _94_2178 = (FStar_Syntax_Subst.open_univ_vars_comp uvs c)
in (match (_94_2178) with
| (uvs, c) -> begin
(uvs, [], c)
end))
end
| _94_2180 -> begin
(let t' = (FStar_Syntax_Util.arrow binders c)
in (let _94_2184 = (FStar_Syntax_Subst.open_univ_vars uvs t')
in (match (_94_2184) with
| (uvs, t') -> begin
(match ((let _196_904 = (FStar_Syntax_Subst.compress t')
in _196_904.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (binders, c) -> begin
(uvs, binders, c)
end
| _94_2190 -> begin
(FStar_All.failwith "Impossible")
end)
end)))
end))

let open_effect_decl : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.eff_decl  ->  (FStar_Syntax_Syntax.eff_decl * FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.term) = (fun env ed -> (let fail = (fun t -> (let _196_913 = (let _196_912 = (let _196_911 = (FStar_TypeChecker_Errors.unexpected_signature_for_monad env ed.FStar_Syntax_Syntax.mname t)
in (_196_911, (FStar_Ident.range_of_lid ed.FStar_Syntax_Syntax.mname)))
in FStar_Syntax_Syntax.Error (_196_912))
in (Prims.raise _196_913)))
in (let _94_2219 = (match ((let _196_914 = (FStar_Syntax_Subst.compress ed.FStar_Syntax_Syntax.signature)
in _196_914.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(let bs = (FStar_Syntax_Subst.open_binders bs)
in (match (bs) with
| (a, _94_2210)::(wp, _94_2206)::(_wlp, _94_2202)::[] -> begin
(a, wp.FStar_Syntax_Syntax.sort)
end
| _94_2214 -> begin
(fail ed.FStar_Syntax_Syntax.signature)
end))
end
| _94_2216 -> begin
(fail ed.FStar_Syntax_Syntax.signature)
end)
in (match (_94_2219) with
| (a, wp) -> begin
(let ed = (match (ed.FStar_Syntax_Syntax.binders) with
| [] -> begin
ed
end
| _94_2222 -> begin
(let opening = (FStar_Syntax_Subst.opening_of_binders ed.FStar_Syntax_Syntax.binders)
in (let op = (fun ts -> (let _94_2226 = ()
in (let t0 = (Prims.snd ts)
in (let t1 = (FStar_Syntax_Subst.subst opening (Prims.snd ts))
in ([], t1)))))
in (let _94_2230 = ed
in (let _196_929 = (op ed.FStar_Syntax_Syntax.ret)
in (let _196_928 = (op ed.FStar_Syntax_Syntax.bind_wp)
in (let _196_927 = (op ed.FStar_Syntax_Syntax.bind_wlp)
in (let _196_926 = (op ed.FStar_Syntax_Syntax.if_then_else)
in (let _196_925 = (op ed.FStar_Syntax_Syntax.ite_wp)
in (let _196_924 = (op ed.FStar_Syntax_Syntax.ite_wlp)
in (let _196_923 = (op ed.FStar_Syntax_Syntax.wp_binop)
in (let _196_922 = (op ed.FStar_Syntax_Syntax.wp_as_type)
in (let _196_921 = (op ed.FStar_Syntax_Syntax.close_wp)
in (let _196_920 = (op ed.FStar_Syntax_Syntax.assert_p)
in (let _196_919 = (op ed.FStar_Syntax_Syntax.assume_p)
in (let _196_918 = (op ed.FStar_Syntax_Syntax.null_wp)
in (let _196_917 = (op ed.FStar_Syntax_Syntax.trivial)
in {FStar_Syntax_Syntax.qualifiers = _94_2230.FStar_Syntax_Syntax.qualifiers; FStar_Syntax_Syntax.mname = _94_2230.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.univs = _94_2230.FStar_Syntax_Syntax.univs; FStar_Syntax_Syntax.binders = _94_2230.FStar_Syntax_Syntax.binders; FStar_Syntax_Syntax.signature = _94_2230.FStar_Syntax_Syntax.signature; FStar_Syntax_Syntax.ret = _196_929; FStar_Syntax_Syntax.bind_wp = _196_928; FStar_Syntax_Syntax.bind_wlp = _196_927; FStar_Syntax_Syntax.if_then_else = _196_926; FStar_Syntax_Syntax.ite_wp = _196_925; FStar_Syntax_Syntax.ite_wlp = _196_924; FStar_Syntax_Syntax.wp_binop = _196_923; FStar_Syntax_Syntax.wp_as_type = _196_922; FStar_Syntax_Syntax.close_wp = _196_921; FStar_Syntax_Syntax.assert_p = _196_920; FStar_Syntax_Syntax.assume_p = _196_919; FStar_Syntax_Syntax.null_wp = _196_918; FStar_Syntax_Syntax.trivial = _196_917}))))))))))))))))
end)
in (ed, a, wp))
end))))

let tc_eff_decl : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.eff_decl  ->  FStar_Syntax_Syntax.eff_decl = (fun env0 ed -> (let _94_2235 = ()
in (let _94_2239 = (FStar_Syntax_Subst.open_term ed.FStar_Syntax_Syntax.binders ed.FStar_Syntax_Syntax.signature)
in (match (_94_2239) with
| (binders, signature) -> begin
(let _94_2244 = (tc_tparams env0 binders)
in (match (_94_2244) with
| (binders, env, _94_2243) -> begin
(let _94_2248 = (tc_trivial_guard env signature)
in (match (_94_2248) with
| (signature, _94_2247) -> begin
(let ed = (let _94_2249 = ed
in {FStar_Syntax_Syntax.qualifiers = _94_2249.FStar_Syntax_Syntax.qualifiers; FStar_Syntax_Syntax.mname = _94_2249.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.univs = _94_2249.FStar_Syntax_Syntax.univs; FStar_Syntax_Syntax.binders = binders; FStar_Syntax_Syntax.signature = signature; FStar_Syntax_Syntax.ret = _94_2249.FStar_Syntax_Syntax.ret; FStar_Syntax_Syntax.bind_wp = _94_2249.FStar_Syntax_Syntax.bind_wp; FStar_Syntax_Syntax.bind_wlp = _94_2249.FStar_Syntax_Syntax.bind_wlp; FStar_Syntax_Syntax.if_then_else = _94_2249.FStar_Syntax_Syntax.if_then_else; FStar_Syntax_Syntax.ite_wp = _94_2249.FStar_Syntax_Syntax.ite_wp; FStar_Syntax_Syntax.ite_wlp = _94_2249.FStar_Syntax_Syntax.ite_wlp; FStar_Syntax_Syntax.wp_binop = _94_2249.FStar_Syntax_Syntax.wp_binop; FStar_Syntax_Syntax.wp_as_type = _94_2249.FStar_Syntax_Syntax.wp_as_type; FStar_Syntax_Syntax.close_wp = _94_2249.FStar_Syntax_Syntax.close_wp; FStar_Syntax_Syntax.assert_p = _94_2249.FStar_Syntax_Syntax.assert_p; FStar_Syntax_Syntax.assume_p = _94_2249.FStar_Syntax_Syntax.assume_p; FStar_Syntax_Syntax.null_wp = _94_2249.FStar_Syntax_Syntax.null_wp; FStar_Syntax_Syntax.trivial = _94_2249.FStar_Syntax_Syntax.trivial})
in (let _94_2255 = (open_effect_decl env ed)
in (match (_94_2255) with
| (ed, a, wp_a) -> begin
(let env = (let _196_934 = (FStar_Syntax_Syntax.new_bv None ed.FStar_Syntax_Syntax.signature)
in (FStar_TypeChecker_Env.push_bv env _196_934))
in (let _94_2257 = if (FStar_TypeChecker_Env.debug env0 FStar_Options.Low) then begin
(let _196_937 = (FStar_Syntax_Print.lid_to_string ed.FStar_Syntax_Syntax.mname)
in (let _196_936 = (FStar_Syntax_Print.binders_to_string " " ed.FStar_Syntax_Syntax.binders)
in (let _196_935 = (FStar_Syntax_Print.term_to_string ed.FStar_Syntax_Syntax.signature)
in (FStar_Util.print3 "Checked effect signature: %s %s : %s\n" _196_937 _196_936 _196_935))))
end else begin
()
end
in (let check_and_gen' = (fun env _94_2264 k -> (match (_94_2264) with
| (_94_2262, t) -> begin
(check_and_gen env t k)
end))
in (let ret = (let expected_k = (let _196_949 = (let _196_947 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_946 = (let _196_945 = (let _196_944 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.null_binder _196_944))
in (_196_945)::[])
in (_196_947)::_196_946))
in (let _196_948 = (FStar_Syntax_Syntax.mk_GTotal wp_a)
in (FStar_Syntax_Util.arrow _196_949 _196_948)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.ret expected_k))
in (let bind_wp = (let wlp_a = wp_a
in (let b = (let _196_951 = (let _196_950 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _196_950 Prims.fst))
in (FStar_Syntax_Syntax.new_bv (Some ((FStar_Ident.range_of_lid ed.FStar_Syntax_Syntax.mname))) _196_951))
in (let wp_b = (let _196_955 = (let _196_954 = (let _196_953 = (let _196_952 = (FStar_Syntax_Syntax.bv_to_name b)
in (a, _196_952))
in FStar_Syntax_Syntax.NT (_196_953))
in (_196_954)::[])
in (FStar_Syntax_Subst.subst _196_955 wp_a))
in (let a_wp_b = (let _196_959 = (let _196_957 = (let _196_956 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.null_binder _196_956))
in (_196_957)::[])
in (let _196_958 = (FStar_Syntax_Syntax.mk_Total wp_b)
in (FStar_Syntax_Util.arrow _196_959 _196_958)))
in (let a_wlp_b = a_wp_b
in (let expected_k = (let _196_972 = (let _196_970 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_969 = (let _196_968 = (FStar_Syntax_Syntax.mk_binder b)
in (let _196_967 = (let _196_966 = (FStar_Syntax_Syntax.null_binder wp_a)
in (let _196_965 = (let _196_964 = (FStar_Syntax_Syntax.null_binder wlp_a)
in (let _196_963 = (let _196_962 = (FStar_Syntax_Syntax.null_binder a_wp_b)
in (let _196_961 = (let _196_960 = (FStar_Syntax_Syntax.null_binder a_wlp_b)
in (_196_960)::[])
in (_196_962)::_196_961))
in (_196_964)::_196_963))
in (_196_966)::_196_965))
in (_196_968)::_196_967))
in (_196_970)::_196_969))
in (let _196_971 = (FStar_Syntax_Syntax.mk_Total wp_b)
in (FStar_Syntax_Util.arrow _196_972 _196_971)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.bind_wp expected_k)))))))
in (let bind_wlp = (let wlp_a = wp_a
in (let b = (let _196_974 = (let _196_973 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _196_973 Prims.fst))
in (FStar_Syntax_Syntax.new_bv (Some ((FStar_Ident.range_of_lid ed.FStar_Syntax_Syntax.mname))) _196_974))
in (let wlp_b = (let _196_978 = (let _196_977 = (let _196_976 = (let _196_975 = (FStar_Syntax_Syntax.bv_to_name b)
in (a, _196_975))
in FStar_Syntax_Syntax.NT (_196_976))
in (_196_977)::[])
in (FStar_Syntax_Subst.subst _196_978 wlp_a))
in (let a_wlp_b = (let _196_982 = (let _196_980 = (let _196_979 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.null_binder _196_979))
in (_196_980)::[])
in (let _196_981 = (FStar_Syntax_Syntax.mk_Total wlp_b)
in (FStar_Syntax_Util.arrow _196_982 _196_981)))
in (let expected_k = (let _196_991 = (let _196_989 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_988 = (let _196_987 = (FStar_Syntax_Syntax.mk_binder b)
in (let _196_986 = (let _196_985 = (FStar_Syntax_Syntax.null_binder wlp_a)
in (let _196_984 = (let _196_983 = (FStar_Syntax_Syntax.null_binder a_wlp_b)
in (_196_983)::[])
in (_196_985)::_196_984))
in (_196_987)::_196_986))
in (_196_989)::_196_988))
in (let _196_990 = (FStar_Syntax_Syntax.mk_Total wlp_b)
in (FStar_Syntax_Util.arrow _196_991 _196_990)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.bind_wlp expected_k))))))
in (let if_then_else = (let p = (let _196_993 = (let _196_992 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _196_992 Prims.fst))
in (FStar_Syntax_Syntax.new_bv (Some ((FStar_Ident.range_of_lid ed.FStar_Syntax_Syntax.mname))) _196_993))
in (let expected_k = (let _196_1002 = (let _196_1000 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_999 = (let _196_998 = (FStar_Syntax_Syntax.mk_binder p)
in (let _196_997 = (let _196_996 = (FStar_Syntax_Syntax.null_binder wp_a)
in (let _196_995 = (let _196_994 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_196_994)::[])
in (_196_996)::_196_995))
in (_196_998)::_196_997))
in (_196_1000)::_196_999))
in (let _196_1001 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _196_1002 _196_1001)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.if_then_else expected_k)))
in (let ite_wp = (let wlp_a = wp_a
in (let expected_k = (let _196_1009 = (let _196_1007 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1006 = (let _196_1005 = (FStar_Syntax_Syntax.null_binder wlp_a)
in (let _196_1004 = (let _196_1003 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_196_1003)::[])
in (_196_1005)::_196_1004))
in (_196_1007)::_196_1006))
in (let _196_1008 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _196_1009 _196_1008)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.ite_wp expected_k)))
in (let ite_wlp = (let wlp_a = wp_a
in (let expected_k = (let _196_1014 = (let _196_1012 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1011 = (let _196_1010 = (FStar_Syntax_Syntax.null_binder wlp_a)
in (_196_1010)::[])
in (_196_1012)::_196_1011))
in (let _196_1013 = (FStar_Syntax_Syntax.mk_Total wlp_a)
in (FStar_Syntax_Util.arrow _196_1014 _196_1013)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.ite_wlp expected_k)))
in (let wp_binop = (let bin_op = (let _94_2292 = (FStar_Syntax_Util.type_u ())
in (match (_94_2292) with
| (t1, u1) -> begin
(let _94_2295 = (FStar_Syntax_Util.type_u ())
in (match (_94_2295) with
| (t2, u2) -> begin
(let t = (let _196_1015 = (FStar_TypeChecker_Env.get_range env)
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_max ((u1)::(u2)::[]))) None _196_1015))
in (let _196_1020 = (let _196_1018 = (FStar_Syntax_Syntax.null_binder t1)
in (let _196_1017 = (let _196_1016 = (FStar_Syntax_Syntax.null_binder t2)
in (_196_1016)::[])
in (_196_1018)::_196_1017))
in (let _196_1019 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.arrow _196_1020 _196_1019))))
end))
end))
in (let expected_k = (let _196_1029 = (let _196_1027 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1026 = (let _196_1025 = (FStar_Syntax_Syntax.null_binder wp_a)
in (let _196_1024 = (let _196_1023 = (FStar_Syntax_Syntax.null_binder bin_op)
in (let _196_1022 = (let _196_1021 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_196_1021)::[])
in (_196_1023)::_196_1022))
in (_196_1025)::_196_1024))
in (_196_1027)::_196_1026))
in (let _196_1028 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _196_1029 _196_1028)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.wp_binop expected_k)))
in (let wp_as_type = (let _94_2303 = (FStar_Syntax_Util.type_u ())
in (match (_94_2303) with
| (t, _94_2302) -> begin
(let expected_k = (let _196_1034 = (let _196_1032 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1031 = (let _196_1030 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_196_1030)::[])
in (_196_1032)::_196_1031))
in (let _196_1033 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.arrow _196_1034 _196_1033)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.wp_as_type expected_k))
end))
in (let close_wp = (let b = (let _196_1036 = (let _196_1035 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _196_1035 Prims.fst))
in (FStar_Syntax_Syntax.new_bv (Some ((FStar_Ident.range_of_lid ed.FStar_Syntax_Syntax.mname))) _196_1036))
in (let b_wp_a = (let _196_1040 = (let _196_1038 = (let _196_1037 = (FStar_Syntax_Syntax.bv_to_name b)
in (FStar_Syntax_Syntax.null_binder _196_1037))
in (_196_1038)::[])
in (let _196_1039 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _196_1040 _196_1039)))
in (let expected_k = (let _196_1047 = (let _196_1045 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1044 = (let _196_1043 = (FStar_Syntax_Syntax.mk_binder b)
in (let _196_1042 = (let _196_1041 = (FStar_Syntax_Syntax.null_binder b_wp_a)
in (_196_1041)::[])
in (_196_1043)::_196_1042))
in (_196_1045)::_196_1044))
in (let _196_1046 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _196_1047 _196_1046)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.close_wp expected_k))))
in (let assert_p = (let expected_k = (let _196_1056 = (let _196_1054 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1053 = (let _196_1052 = (let _196_1049 = (let _196_1048 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _196_1048 Prims.fst))
in (FStar_Syntax_Syntax.null_binder _196_1049))
in (let _196_1051 = (let _196_1050 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_196_1050)::[])
in (_196_1052)::_196_1051))
in (_196_1054)::_196_1053))
in (let _196_1055 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _196_1056 _196_1055)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.assert_p expected_k))
in (let assume_p = (let expected_k = (let _196_1065 = (let _196_1063 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1062 = (let _196_1061 = (let _196_1058 = (let _196_1057 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _196_1057 Prims.fst))
in (FStar_Syntax_Syntax.null_binder _196_1058))
in (let _196_1060 = (let _196_1059 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_196_1059)::[])
in (_196_1061)::_196_1060))
in (_196_1063)::_196_1062))
in (let _196_1064 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _196_1065 _196_1064)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.assume_p expected_k))
in (let null_wp = (let expected_k = (let _196_1068 = (let _196_1066 = (FStar_Syntax_Syntax.mk_binder a)
in (_196_1066)::[])
in (let _196_1067 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _196_1068 _196_1067)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.null_wp expected_k))
in (let trivial_wp = (let _94_2319 = (FStar_Syntax_Util.type_u ())
in (match (_94_2319) with
| (t, _94_2318) -> begin
(let expected_k = (let _196_1073 = (let _196_1071 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1070 = (let _196_1069 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_196_1069)::[])
in (_196_1071)::_196_1070))
in (let _196_1072 = (FStar_Syntax_Syntax.mk_GTotal t)
in (FStar_Syntax_Util.arrow _196_1073 _196_1072)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.trivial expected_k))
end))
in (let t = (let _196_1074 = (FStar_Syntax_Syntax.mk_Total ed.FStar_Syntax_Syntax.signature)
in (FStar_Syntax_Util.arrow ed.FStar_Syntax_Syntax.binders _196_1074))
in (let _94_2325 = (FStar_TypeChecker_Util.generalize_universes env0 t)
in (match (_94_2325) with
| (univs, t) -> begin
(let _94_2341 = (match ((let _196_1076 = (let _196_1075 = (FStar_Syntax_Subst.compress t)
in _196_1075.FStar_Syntax_Syntax.n)
in (binders, _196_1076))) with
| ([], _94_2328) -> begin
([], t)
end
| (_94_2331, FStar_Syntax_Syntax.Tm_arrow (binders, c)) -> begin
(binders, (FStar_Syntax_Util.comp_result c))
end
| _94_2338 -> begin
(FStar_All.failwith "Impossible")
end)
in (match (_94_2341) with
| (binders, signature) -> begin
(let close = (fun ts -> (let _196_1079 = (FStar_Syntax_Subst.close_tscheme binders ts)
in (FStar_Syntax_Subst.close_univ_vars_tscheme univs _196_1079)))
in (let ed = (let _94_2344 = ed
in (let _196_1092 = (close ret)
in (let _196_1091 = (close bind_wp)
in (let _196_1090 = (close bind_wlp)
in (let _196_1089 = (close if_then_else)
in (let _196_1088 = (close ite_wp)
in (let _196_1087 = (close ite_wlp)
in (let _196_1086 = (close wp_binop)
in (let _196_1085 = (close wp_as_type)
in (let _196_1084 = (close close_wp)
in (let _196_1083 = (close assert_p)
in (let _196_1082 = (close assume_p)
in (let _196_1081 = (close null_wp)
in (let _196_1080 = (close trivial_wp)
in {FStar_Syntax_Syntax.qualifiers = _94_2344.FStar_Syntax_Syntax.qualifiers; FStar_Syntax_Syntax.mname = _94_2344.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.univs = univs; FStar_Syntax_Syntax.binders = binders; FStar_Syntax_Syntax.signature = signature; FStar_Syntax_Syntax.ret = _196_1092; FStar_Syntax_Syntax.bind_wp = _196_1091; FStar_Syntax_Syntax.bind_wlp = _196_1090; FStar_Syntax_Syntax.if_then_else = _196_1089; FStar_Syntax_Syntax.ite_wp = _196_1088; FStar_Syntax_Syntax.ite_wlp = _196_1087; FStar_Syntax_Syntax.wp_binop = _196_1086; FStar_Syntax_Syntax.wp_as_type = _196_1085; FStar_Syntax_Syntax.close_wp = _196_1084; FStar_Syntax_Syntax.assert_p = _196_1083; FStar_Syntax_Syntax.assume_p = _196_1082; FStar_Syntax_Syntax.null_wp = _196_1081; FStar_Syntax_Syntax.trivial = _196_1080}))))))))))))))
in (let _94_2347 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_1093 = (FStar_Syntax_Print.eff_decl_to_string ed)
in (FStar_Util.print_string _196_1093))
end else begin
()
end
in ed)))
end))
end)))))))))))))))))))
end)))
end))
end))
end))))

let tc_lex_t = (fun env ses quals lids -> (let _94_2353 = ()
in (let _94_2361 = ()
in (match (ses) with
| FStar_Syntax_Syntax.Sig_inductive_typ (lex_t, [], [], t, _94_2390, _94_2392, [], r)::FStar_Syntax_Syntax.Sig_datacon (lex_top, [], _t_top, _lex_t_top, 0, [], _94_2381, r1)::FStar_Syntax_Syntax.Sig_datacon (lex_cons, [], _t_cons, _lex_t_cons, 0, [], _94_2370, r2)::[] when (((FStar_Ident.lid_equals lex_t FStar_Syntax_Const.lex_t_lid) && (FStar_Ident.lid_equals lex_top FStar_Syntax_Const.lextop_lid)) && (FStar_Ident.lid_equals lex_cons FStar_Syntax_Const.lexcons_lid)) -> begin
(let u = (FStar_Syntax_Syntax.new_univ_name (Some (r)))
in (let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_name (u))) None r)
in (let t = (FStar_Syntax_Subst.close_univ_vars ((u)::[]) t)
in (let tc = FStar_Syntax_Syntax.Sig_inductive_typ ((lex_t, (u)::[], [], t, [], (FStar_Syntax_Const.lextop_lid)::(FStar_Syntax_Const.lexcons_lid)::[], [], r))
in (let utop = (FStar_Syntax_Syntax.new_univ_name (Some (r1)))
in (let lex_top_t = (let _196_1100 = (let _196_1099 = (let _196_1098 = (FStar_Syntax_Syntax.fvar None FStar_Syntax_Const.lex_t_lid r1)
in (_196_1098, (FStar_Syntax_Syntax.U_name (utop))::[]))
in FStar_Syntax_Syntax.Tm_uinst (_196_1099))
in (FStar_Syntax_Syntax.mk _196_1100 None r1))
in (let lex_top_t = (FStar_Syntax_Subst.close_univ_vars ((utop)::[]) lex_top_t)
in (let dc_lextop = FStar_Syntax_Syntax.Sig_datacon ((lex_top, (utop)::[], lex_top_t, FStar_Syntax_Const.lex_t_lid, 0, [], [], r1))
in (let ucons1 = (FStar_Syntax_Syntax.new_univ_name (Some (r2)))
in (let ucons2 = (FStar_Syntax_Syntax.new_univ_name (Some (r2)))
in (let lex_cons_t = (let a = (let _196_1101 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_name (ucons1))) None r2)
in (FStar_Syntax_Syntax.new_bv (Some (r2)) _196_1101))
in (let hd = (let _196_1102 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.new_bv (Some (r2)) _196_1102))
in (let tl = (let _196_1106 = (let _196_1105 = (let _196_1104 = (let _196_1103 = (FStar_Syntax_Syntax.fvar None FStar_Syntax_Const.lex_t_lid r2)
in (_196_1103, (FStar_Syntax_Syntax.U_name (ucons2))::[]))
in FStar_Syntax_Syntax.Tm_uinst (_196_1104))
in (FStar_Syntax_Syntax.mk _196_1105 None r2))
in (FStar_Syntax_Syntax.new_bv (Some (r2)) _196_1106))
in (let res = (let _196_1109 = (let _196_1108 = (let _196_1107 = (FStar_Syntax_Syntax.fvar None FStar_Syntax_Const.lex_t_lid r2)
in (_196_1107, (FStar_Syntax_Syntax.U_max ((FStar_Syntax_Syntax.U_name (ucons1))::(FStar_Syntax_Syntax.U_name (ucons2))::[]))::[]))
in FStar_Syntax_Syntax.Tm_uinst (_196_1108))
in (FStar_Syntax_Syntax.mk _196_1109 None r2))
in (let _196_1110 = (FStar_Syntax_Syntax.mk_Total res)
in (FStar_Syntax_Util.arrow (((a, Some (FStar_Syntax_Syntax.Implicit)))::((hd, None))::((tl, None))::[]) _196_1110))))))
in (let lex_cons_t = (FStar_Syntax_Subst.close_univ_vars ((ucons1)::(ucons2)::[]) lex_cons_t)
in (let dc_lexcons = FStar_Syntax_Syntax.Sig_datacon ((lex_cons, (ucons1)::(ucons2)::[], lex_cons_t, FStar_Syntax_Const.lex_t_lid, 0, [], [], r2))
in (let _196_1112 = (let _196_1111 = (FStar_TypeChecker_Env.get_range env)
in ((tc)::(dc_lextop)::(dc_lexcons)::[], [], lids, _196_1111))
in FStar_Syntax_Syntax.Sig_bundle (_196_1112)))))))))))))))
end
| _94_2416 -> begin
(let _196_1114 = (let _196_1113 = (FStar_Syntax_Print.sigelt_to_string (FStar_Syntax_Syntax.Sig_bundle ((ses, [], lids, FStar_Range.dummyRange))))
in (FStar_Util.format1 "Unexpected lex_t: %s\n" _196_1113))
in (FStar_All.failwith _196_1114))
end))))

let tc_inductive : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  FStar_Syntax_Syntax.qualifier Prims.list  ->  FStar_Ident.lident Prims.list  ->  FStar_Syntax_Syntax.sigelt = (fun env ses quals lids -> (let warn_positivity = (fun l r -> (let _196_1128 = (let _196_1127 = (FStar_Syntax_Print.lid_to_string l)
in (FStar_Util.format1 "Positivity check is not yet implemented (%s)" _196_1127))
in (FStar_TypeChecker_Errors.warn r _196_1128)))
in (let env0 = env
in (let tc_tycon = (fun env s -> (match (s) with
| FStar_Syntax_Syntax.Sig_inductive_typ (tc, uvs, tps, k, mutuals, data, quals, r) -> begin
(let _94_2438 = ()
in (let _94_2440 = (warn_positivity tc r)
in (let _94_2444 = (FStar_Syntax_Subst.open_term tps k)
in (match (_94_2444) with
| (tps, k) -> begin
(let _94_2448 = (tc_tparams env tps)
in (match (_94_2448) with
| (tps, env_tps, us) -> begin
(let _94_2451 = (FStar_Syntax_Util.arrow_formals k)
in (match (_94_2451) with
| (indices, t) -> begin
(let _94_2455 = (tc_tparams env_tps indices)
in (match (_94_2455) with
| (indices, env', us') -> begin
(let _94_2459 = (tc_trivial_guard env' t)
in (match (_94_2459) with
| (t, _94_2458) -> begin
(let k = (let _196_1133 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.arrow indices _196_1133))
in (let _94_2463 = (FStar_Syntax_Util.type_u ())
in (match (_94_2463) with
| (t_type, u) -> begin
(let _94_2464 = (let _196_1134 = (FStar_TypeChecker_Rel.teq env' t t_type)
in (FStar_TypeChecker_Rel.force_trivial_guard env' _196_1134))
in (let refined_tps = (FStar_All.pipe_right tps (FStar_List.map (fun _94_2468 -> (match (_94_2468) with
| (x, imp) -> begin
(let y = (FStar_Syntax_Syntax.freshen_bv x)
in (let refined = (let _196_1138 = (let _196_1137 = (FStar_Syntax_Syntax.bv_to_name x)
in (let _196_1136 = (FStar_Syntax_Syntax.bv_to_name y)
in (FStar_Syntax_Util.mk_eq x.FStar_Syntax_Syntax.sort x.FStar_Syntax_Syntax.sort _196_1137 _196_1136)))
in (FStar_Syntax_Util.refine y _196_1138))
in ((let _94_2471 = x
in {FStar_Syntax_Syntax.ppname = _94_2471.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _94_2471.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = refined}), imp)))
end))))
in (let t_tc = (let _196_1139 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.arrow (FStar_List.append refined_tps indices) _196_1139))
in (let tps = (FStar_Syntax_Subst.close_binders tps)
in (let k = (FStar_Syntax_Subst.close tps k)
in (let _196_1140 = (FStar_TypeChecker_Env.push_let_binding env_tps (FStar_Util.Inr (tc)) ([], t_tc))
in (_196_1140, FStar_Syntax_Syntax.Sig_inductive_typ ((tc, [], tps, k, mutuals, data, quals, r)), u)))))))
end)))
end))
end))
end))
end))
end))))
end
| _94_2478 -> begin
(FStar_All.failwith "impossible")
end))
in (let positive_if_pure = (fun _94_2480 l -> ())
in (let tc_data = (fun env tcs _94_6 -> (match (_94_6) with
| FStar_Syntax_Syntax.Sig_datacon (c, _uvs, t, tc_lid, ntps, quals, _mutual_tcs, r) -> begin
(let _94_2497 = ()
in (let _94_2528 = (let _196_1155 = (FStar_Util.find_map tcs (fun _94_2501 -> (match (_94_2501) with
| (se, u_tc) -> begin
if (let _196_1153 = (let _196_1152 = (FStar_Syntax_Util.lid_of_sigelt se)
in (FStar_Util.must _196_1152))
in (FStar_Ident.lid_equals tc_lid _196_1153)) then begin
(let tps = (match (se) with
| FStar_Syntax_Syntax.Sig_inductive_typ (_94_2503, _94_2505, tps, _94_2508, _94_2510, _94_2512, _94_2514, _94_2516) -> begin
(FStar_All.pipe_right tps (FStar_List.map (fun _94_2522 -> (match (_94_2522) with
| (x, _94_2521) -> begin
(x, Some (FStar_Syntax_Syntax.Implicit))
end))))
end
| _94_2524 -> begin
(FStar_All.failwith "Impossible")
end)
in Some ((tps, u_tc)))
end else begin
None
end
end)))
in (FStar_All.pipe_right _196_1155 FStar_Util.must))
in (match (_94_2528) with
| (tps, u_tc) -> begin
(let _94_2548 = (match ((let _196_1156 = (FStar_Syntax_Subst.compress t)
in _196_1156.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (bs, res) -> begin
(let _94_2536 = (FStar_Util.first_N ntps bs)
in (match (_94_2536) with
| (_94_2534, bs') -> begin
(let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow ((bs', res))) None t.FStar_Syntax_Syntax.pos)
in (let subst = (FStar_All.pipe_right tps (FStar_List.mapi (fun i _94_2542 -> (match (_94_2542) with
| (x, _94_2541) -> begin
(let _196_1160 = (let _196_1159 = (FStar_Syntax_Syntax.bv_to_name x)
in ((ntps - (1 + i)), _196_1159))
in FStar_Syntax_Syntax.DB (_196_1160))
end))))
in (let _196_1161 = (FStar_Syntax_Subst.subst subst t)
in (FStar_Syntax_Util.arrow_formals _196_1161))))
end))
end
| _94_2545 -> begin
([], t)
end)
in (match (_94_2548) with
| (arguments, result) -> begin
(let _94_2549 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_1164 = (FStar_Syntax_Print.lid_to_string c)
in (let _196_1163 = (FStar_Syntax_Print.binders_to_string "->" arguments)
in (let _196_1162 = (FStar_Syntax_Print.term_to_string result)
in (FStar_Util.print3 "Checking datacon  %s : %s -> %s \n" _196_1164 _196_1163 _196_1162))))
end else begin
()
end
in (let _94_2554 = (tc_tparams env arguments)
in (match (_94_2554) with
| (arguments, env', us) -> begin
(let _94_2558 = (tc_trivial_guard env' result)
in (match (_94_2558) with
| (result, _94_2557) -> begin
(let _94_2562 = (FStar_Syntax_Util.head_and_args result)
in (match (_94_2562) with
| (head, _94_2561) -> begin
(let _94_2570 = (match ((let _196_1165 = (FStar_Syntax_Subst.compress head)
in _196_1165.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_fvar (fv, _94_2565) when (FStar_Ident.lid_equals fv.FStar_Syntax_Syntax.v tc_lid) -> begin
()
end
| _94_2569 -> begin
(let _196_1169 = (let _196_1168 = (let _196_1167 = (let _196_1166 = (FStar_Syntax_Print.lid_to_string tc_lid)
in (FStar_Util.format1 "Expected a constructor of type %s" _196_1166))
in (_196_1167, r))
in FStar_Syntax_Syntax.Error (_196_1168))
in (Prims.raise _196_1169))
end)
in (let g = (FStar_List.fold_left2 (fun g _94_2576 u_x -> (match (_94_2576) with
| (x, _94_2575) -> begin
(let _94_2578 = ()
in (let _196_1173 = (FStar_TypeChecker_Rel.universe_inequality u_x u_tc)
in (FStar_TypeChecker_Rel.conj_guard g _196_1173)))
end)) FStar_TypeChecker_Rel.trivial_guard arguments us)
in (let t = (let _196_1174 = (FStar_Syntax_Syntax.mk_Total result)
in (FStar_Syntax_Util.arrow (FStar_List.append tps arguments) _196_1174))
in (FStar_Syntax_Syntax.Sig_datacon ((c, [], t, tc_lid, ntps, quals, [], r)), g))))
end))
end))
end)))
end))
end)))
end
| _94_2583 -> begin
(FStar_All.failwith "impossible")
end))
in (let generalize_and_recheck = (fun env g tcs datas -> (let _94_2589 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in (let binders = (FStar_All.pipe_right tcs (FStar_List.map (fun _94_7 -> (match (_94_7) with
| FStar_Syntax_Syntax.Sig_inductive_typ (_94_2593, _94_2595, tps, k, _94_2599, _94_2601, _94_2603, _94_2605) -> begin
(let _196_1185 = (let _196_1184 = (FStar_Syntax_Syntax.mk_Total k)
in (FStar_All.pipe_left (FStar_Syntax_Util.arrow tps) _196_1184))
in (FStar_Syntax_Syntax.null_binder _196_1185))
end
| _94_2609 -> begin
(FStar_All.failwith "Impossible")
end))))
in (let binders' = (FStar_All.pipe_right datas (FStar_List.map (fun _94_8 -> (match (_94_8) with
| FStar_Syntax_Syntax.Sig_datacon (_94_2613, _94_2615, t, _94_2618, _94_2620, _94_2622, _94_2624, _94_2626) -> begin
(FStar_Syntax_Syntax.null_binder t)
end
| _94_2630 -> begin
(FStar_All.failwith "Impossible")
end))))
in (let t = (let _196_1187 = (FStar_Syntax_Syntax.mk_Total FStar_TypeChecker_Recheck.t_unit)
in (FStar_Syntax_Util.arrow (FStar_List.append binders binders') _196_1187))
in (let _94_2633 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_1188 = (FStar_TypeChecker_Normalize.term_to_string env t)
in (FStar_Util.print1 "@@@@@@Trying to generalize universes in %s\n" _196_1188))
end else begin
()
end
in (let _94_2637 = (FStar_TypeChecker_Util.generalize_universes env t)
in (match (_94_2637) with
| (uvs, t) -> begin
(let _94_2639 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_1192 = (let _196_1190 = (FStar_All.pipe_right uvs (FStar_List.map (fun u -> u.FStar_Ident.idText)))
in (FStar_All.pipe_right _196_1190 (FStar_String.concat ", ")))
in (let _196_1191 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "@@@@@@Generalized to (%s, %s)\n" _196_1192 _196_1191)))
end else begin
()
end
in (let _94_2643 = (FStar_Syntax_Subst.open_univ_vars uvs t)
in (match (_94_2643) with
| (uvs, t) -> begin
(let _94_2647 = (FStar_Syntax_Util.arrow_formals t)
in (match (_94_2647) with
| (args, _94_2646) -> begin
(let _94_2650 = (FStar_Util.first_N (FStar_List.length binders) args)
in (match (_94_2650) with
| (tc_types, data_types) -> begin
(let tcs = (FStar_List.map2 (fun _94_2654 se -> (match (_94_2654) with
| (x, _94_2653) -> begin
(match (se) with
| FStar_Syntax_Syntax.Sig_inductive_typ (tc, _94_2658, tps, _94_2661, mutuals, datas, quals, r) -> begin
(let ty = (FStar_Syntax_Subst.close_univ_vars uvs x.FStar_Syntax_Syntax.sort)
in (let _94_2684 = (match ((let _196_1195 = (FStar_Syntax_Subst.compress ty)
in _196_1195.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (binders, c) -> begin
(let _94_2675 = (FStar_Util.first_N (FStar_List.length tps) binders)
in (match (_94_2675) with
| (tps, rest) -> begin
(let t = (match (rest) with
| [] -> begin
(FStar_Syntax_Util.comp_result c)
end
| _94_2678 -> begin
(let _196_1196 = (FStar_ST.read x.FStar_Syntax_Syntax.sort.FStar_Syntax_Syntax.tk)
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow ((rest, c))) _196_1196 x.FStar_Syntax_Syntax.sort.FStar_Syntax_Syntax.pos))
end)
in (tps, t))
end))
end
| _94_2681 -> begin
([], ty)
end)
in (match (_94_2684) with
| (tps, t) -> begin
FStar_Syntax_Syntax.Sig_inductive_typ ((tc, uvs, tps, t, mutuals, datas, quals, r))
end)))
end
| _94_2686 -> begin
(FStar_All.failwith "Impossible")
end)
end)) tc_types tcs)
in (let env_data = (FStar_TypeChecker_Env.push_univ_vars env uvs)
in (let uvs_universes = (FStar_All.pipe_right uvs (FStar_List.map (fun _196_1197 -> FStar_Syntax_Syntax.U_name (_196_1197))))
in (let env_data = (FStar_List.fold_left (fun env tc -> (FStar_TypeChecker_Env.push_sigelt_inst env tc uvs_universes)) env_data tcs)
in (let datas = (FStar_List.map2 (fun _94_2696 -> (match (_94_2696) with
| (t, _94_2695) -> begin
(fun _94_9 -> (match (_94_9) with
| FStar_Syntax_Syntax.Sig_datacon (l, _94_2700, _94_2702, tc, ntps, quals, mutuals, r) -> begin
(let ty = (match (uvs) with
| [] -> begin
t.FStar_Syntax_Syntax.sort
end
| _94_2712 -> begin
(let _94_2713 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_1205 = (FStar_Syntax_Print.lid_to_string l)
in (let _196_1204 = (FStar_Syntax_Print.term_to_string t.FStar_Syntax_Syntax.sort)
in (FStar_Util.print2 "Rechecking datacon %s : %s\n" _196_1205 _196_1204)))
end else begin
()
end
in (let _94_2719 = (tc_tot_or_gtot_term env_data t.FStar_Syntax_Syntax.sort)
in (match (_94_2719) with
| (ty, _94_2717, g) -> begin
(let g = (let _94_2720 = g
in {FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial; FStar_TypeChecker_Env.deferred = _94_2720.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = _94_2720.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = _94_2720.FStar_TypeChecker_Env.implicits})
in (let _94_2723 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in (FStar_Syntax_Subst.close_univ_vars uvs ty)))
end)))
end)
in FStar_Syntax_Syntax.Sig_datacon ((l, uvs, ty, tc, ntps, quals, mutuals, r)))
end
| _94_2727 -> begin
(FStar_All.failwith "Impossible")
end))
end)) data_types datas)
in (tcs, datas))))))
end))
end))
end)))
end))))))))
in (let _94_2737 = (FStar_All.pipe_right ses (FStar_List.partition (fun _94_10 -> (match (_94_10) with
| FStar_Syntax_Syntax.Sig_inductive_typ (_94_2731) -> begin
true
end
| _94_2734 -> begin
false
end))))
in (match (_94_2737) with
| (tys, datas) -> begin
(let env0 = env
in (let _94_2754 = (FStar_List.fold_right (fun tc _94_2743 -> (match (_94_2743) with
| (env, all_tcs, g) -> begin
(let _94_2747 = (tc_tycon env tc)
in (match (_94_2747) with
| (env, tc, tc_u) -> begin
(let g' = (FStar_TypeChecker_Rel.universe_inequality FStar_Syntax_Syntax.U_zero tc_u)
in (let _94_2749 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_1209 = (FStar_Syntax_Print.sigelt_to_string tc)
in (FStar_Util.print1 "Checked inductive: %s\n" _196_1209))
end else begin
()
end
in (let _196_1210 = (FStar_TypeChecker_Rel.conj_guard g g')
in (env, ((tc, tc_u))::all_tcs, _196_1210))))
end))
end)) tys (env, [], FStar_TypeChecker_Rel.trivial_guard))
in (match (_94_2754) with
| (env, tcs, g) -> begin
(let _94_2764 = (FStar_List.fold_right (fun se _94_2758 -> (match (_94_2758) with
| (datas, g) -> begin
(let _94_2761 = (tc_data env tcs se)
in (match (_94_2761) with
| (data, g') -> begin
(let _196_1213 = (FStar_TypeChecker_Rel.conj_guard g g')
in ((data)::datas, _196_1213))
end))
end)) datas ([], g))
in (match (_94_2764) with
| (datas, g) -> begin
(let _94_2767 = (let _196_1214 = (FStar_List.map Prims.fst tcs)
in (generalize_and_recheck env0 g _196_1214 datas))
in (match (_94_2767) with
| (tcs, datas) -> begin
(let _196_1216 = (let _196_1215 = (FStar_TypeChecker_Env.get_range env0)
in ((FStar_List.append tcs datas), quals, lids, _196_1215))
in FStar_Syntax_Syntax.Sig_bundle (_196_1216))
end))
end))
end)))
end)))))))))

let rec tc_decl : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.sigelt  ->  (FStar_Syntax_Syntax.sigelt * FStar_TypeChecker_Env.env) = (fun env se -> (match (se) with
| (FStar_Syntax_Syntax.Sig_inductive_typ (_)) | (FStar_Syntax_Syntax.Sig_datacon (_)) -> begin
(FStar_All.failwith "Impossible bare data-constructor")
end
| FStar_Syntax_Syntax.Sig_bundle (ses, quals, lids, r) when (FStar_All.pipe_right lids (FStar_Util.for_some (FStar_Ident.lid_equals FStar_Syntax_Const.lex_t_lid))) -> begin
(let env = (FStar_TypeChecker_Env.set_range env r)
in (let se = (tc_lex_t env ses quals lids)
in (let _196_1221 = (FStar_TypeChecker_Env.push_sigelt env se)
in (se, _196_1221))))
end
| FStar_Syntax_Syntax.Sig_bundle (ses, quals, lids, r) -> begin
(let env = (FStar_TypeChecker_Env.set_range env r)
in (let se = (tc_inductive env ses quals lids)
in (let _196_1222 = (FStar_TypeChecker_Env.push_sigelt env se)
in (se, _196_1222))))
end
| FStar_Syntax_Syntax.Sig_pragma (p, r) -> begin
(match (p) with
| FStar_Syntax_Syntax.SetOptions (o) -> begin
(match ((FStar_Options.set_options o)) with
| FStar_Getopt.GoOn -> begin
(se, env)
end
| FStar_Getopt.Help -> begin
(Prims.raise (FStar_Syntax_Syntax.Error (("Failed to process pragma: use \'fstar --help\' to see which options are available", r))))
end
| FStar_Getopt.Die (s) -> begin
(Prims.raise (FStar_Syntax_Syntax.Error (((Prims.strcat "Failed to process pragma: " s), r))))
end)
end
| FStar_Syntax_Syntax.ResetOptions -> begin
(let _94_2803 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.refresh ())
in (let _94_2805 = (let _196_1223 = (FStar_Options.reset_options ())
in (FStar_All.pipe_right _196_1223 Prims.ignore))
in (se, env)))
end)
end
| FStar_Syntax_Syntax.Sig_new_effect (ne, r) -> begin
(let ne = (tc_eff_decl env ne)
in (let se = FStar_Syntax_Syntax.Sig_new_effect ((ne, r))
in (let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (se, env))))
end
| FStar_Syntax_Syntax.Sig_sub_effect (sub, r) -> begin
(let _94_2820 = (let _196_1224 = (FStar_TypeChecker_Env.lookup_effect_lid env sub.FStar_Syntax_Syntax.source)
in (monad_signature env sub.FStar_Syntax_Syntax.source _196_1224))
in (match (_94_2820) with
| (a, wp_a_src) -> begin
(let _94_2823 = (let _196_1225 = (FStar_TypeChecker_Env.lookup_effect_lid env sub.FStar_Syntax_Syntax.target)
in (monad_signature env sub.FStar_Syntax_Syntax.target _196_1225))
in (match (_94_2823) with
| (b, wp_b_tgt) -> begin
(let wp_a_tgt = (let _196_1229 = (let _196_1228 = (let _196_1227 = (let _196_1226 = (FStar_Syntax_Syntax.bv_to_name a)
in (b, _196_1226))
in FStar_Syntax_Syntax.NT (_196_1227))
in (_196_1228)::[])
in (FStar_Syntax_Subst.subst _196_1229 wp_b_tgt))
in (let expected_k = (let _196_1234 = (let _196_1232 = (FStar_Syntax_Syntax.mk_binder a)
in (let _196_1231 = (let _196_1230 = (FStar_Syntax_Syntax.null_binder wp_a_src)
in (_196_1230)::[])
in (_196_1232)::_196_1231))
in (let _196_1233 = (FStar_Syntax_Syntax.mk_Total wp_a_tgt)
in (FStar_Syntax_Util.arrow _196_1234 _196_1233)))
in (let lift = (check_and_gen env (Prims.snd sub.FStar_Syntax_Syntax.lift) expected_k)
in (let sub = (let _94_2827 = sub
in {FStar_Syntax_Syntax.source = _94_2827.FStar_Syntax_Syntax.source; FStar_Syntax_Syntax.target = _94_2827.FStar_Syntax_Syntax.target; FStar_Syntax_Syntax.lift = lift})
in (let se = FStar_Syntax_Syntax.Sig_sub_effect ((sub, r))
in (let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (se, env)))))))
end))
end))
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (lid, uvs, tps, c, tags, r) -> begin
(let _94_2840 = ()
in (let env0 = env
in (let env = (FStar_TypeChecker_Env.set_range env r)
in (let _94_2846 = (FStar_Syntax_Subst.open_comp tps c)
in (match (_94_2846) with
| (tps, c) -> begin
(let _94_2850 = (tc_tparams env tps)
in (match (_94_2850) with
| (tps, env, us) -> begin
(let _94_2854 = (tc_comp env c)
in (match (_94_2854) with
| (c, g, u) -> begin
(let tags = (FStar_All.pipe_right tags (FStar_List.map (fun _94_11 -> (match (_94_11) with
| FStar_Syntax_Syntax.DefaultEffect (None) -> begin
(let c' = (FStar_TypeChecker_Normalize.unfold_effect_abbrev env c)
in (let _196_1237 = (FStar_All.pipe_right c'.FStar_Syntax_Syntax.effect_name (fun _196_1236 -> Some (_196_1236)))
in FStar_Syntax_Syntax.DefaultEffect (_196_1237)))
end
| t -> begin
t
end))))
in (let tps = (FStar_Syntax_Subst.close_binders tps)
in (let c = (FStar_Syntax_Subst.close_comp tps c)
in (let _94_2865 = (let _196_1238 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow ((tps, c))) None r)
in (FStar_TypeChecker_Util.generalize_universes env0 _196_1238))
in (match (_94_2865) with
| (uvs, t) -> begin
(let _94_2884 = (match ((let _196_1240 = (let _196_1239 = (FStar_Syntax_Subst.compress t)
in _196_1239.FStar_Syntax_Syntax.n)
in (tps, _196_1240))) with
| ([], FStar_Syntax_Syntax.Tm_arrow (_94_2868, c)) -> begin
([], c)
end
| (_94_2874, FStar_Syntax_Syntax.Tm_arrow (tps, c)) -> begin
(tps, c)
end
| _94_2881 -> begin
(FStar_All.failwith "Impossible")
end)
in (match (_94_2884) with
| (tps, c) -> begin
(let se = FStar_Syntax_Syntax.Sig_effect_abbrev ((lid, uvs, tps, c, tags, r))
in (let env = (FStar_TypeChecker_Env.push_sigelt env0 se)
in (se, env)))
end))
end)))))
end))
end))
end)))))
end
| FStar_Syntax_Syntax.Sig_declare_typ (lid, uvs, t, quals, r) -> begin
(let env = (FStar_TypeChecker_Env.set_range env r)
in (let _94_2895 = ()
in (let k = (let _196_1241 = (FStar_Syntax_Util.type_u ())
in (Prims.fst _196_1241))
in (let _94_2900 = (check_and_gen env t k)
in (match (_94_2900) with
| (uvs, t) -> begin
(let se = FStar_Syntax_Syntax.Sig_declare_typ ((lid, uvs, t, quals, r))
in (let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (se, env)))
end)))))
end
| FStar_Syntax_Syntax.Sig_assume (lid, phi, quals, r) -> begin
(let env = (FStar_TypeChecker_Env.set_range env r)
in (let _94_2913 = (FStar_Syntax_Util.type_u ())
in (match (_94_2913) with
| (k, _94_2912) -> begin
(let phi = (let _196_1242 = (tc_check_trivial_guard env phi k)
in (FStar_All.pipe_right _196_1242 (norm env)))
in (let _94_2915 = (FStar_TypeChecker_Util.check_uvars r phi)
in (let se = FStar_Syntax_Syntax.Sig_assume ((lid, phi, quals, r))
in (let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (se, env)))))
end)))
end
| FStar_Syntax_Syntax.Sig_main (e, r) -> begin
(let env = (FStar_TypeChecker_Env.set_range env r)
in (let env = (FStar_TypeChecker_Env.set_expected_typ env FStar_TypeChecker_Recheck.t_unit)
in (let _94_2928 = (tc_term env e)
in (match (_94_2928) with
| (e, c, g1) -> begin
(let _94_2933 = (let _196_1246 = (let _196_1243 = (FStar_Syntax_Util.ml_comp FStar_TypeChecker_Recheck.t_unit r)
in Some (_196_1243))
in (let _196_1245 = (let _196_1244 = (c.FStar_Syntax_Syntax.comp ())
in (e, _196_1244))
in (check_expected_effect env _196_1246 _196_1245)))
in (match (_94_2933) with
| (e, _94_2931, g) -> begin
(let _94_2934 = (let _196_1247 = (FStar_TypeChecker_Rel.conj_guard g1 g)
in (FStar_TypeChecker_Rel.force_trivial_guard env _196_1247))
in (let se = FStar_Syntax_Syntax.Sig_main ((e, r))
in (let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (se, env))))
end))
end))))
end
| FStar_Syntax_Syntax.Sig_let (lbs, r, lids, quals) -> begin
(let env = (FStar_TypeChecker_Env.set_range env r)
in (let check_quals_eq = (fun l qopt q -> (match (qopt) with
| None -> begin
Some (q)
end
| Some (q') -> begin
if (((FStar_List.length q) = (FStar_List.length q')) && (FStar_List.forall2 FStar_Syntax_Util.qualifier_equal q q')) then begin
Some (q)
end else begin
(let _196_1257 = (let _196_1256 = (let _196_1255 = (let _196_1254 = (FStar_Syntax_Print.lid_to_string l)
in (FStar_Util.format1 "Inconsistent qualifier annotations on %s" _196_1254))
in (_196_1255, r))
in FStar_Syntax_Syntax.Error (_196_1256))
in (Prims.raise _196_1257))
end
end))
in (let _94_2978 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.fold_left (fun _94_2955 lb -> (match (_94_2955) with
| (gen, lbs, quals_opt) -> begin
(let lbname = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (let _94_2974 = (match ((FStar_TypeChecker_Env.try_lookup_val_decl env lbname)) with
| None -> begin
(gen, lb, quals_opt)
end
| Some ((uvs, tval), quals) -> begin
(let quals_opt = (check_quals_eq lbname quals_opt quals)
in (let _94_2969 = (match (lb.FStar_Syntax_Syntax.lbtyp.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
()
end
| _94_2968 -> begin
(FStar_TypeChecker_Errors.warn r "Annotation from val declaration overrides inline type annotation")
end)
in (let _196_1260 = (FStar_Syntax_Syntax.mk_lb (FStar_Util.Inr (lbname), uvs, FStar_Syntax_Const.effect_ALL_lid, tval, lb.FStar_Syntax_Syntax.lbdef))
in (false, _196_1260, quals_opt))))
end)
in (match (_94_2974) with
| (gen, lb, quals_opt) -> begin
(gen, (lb)::lbs, quals_opt)
end)))
end)) (true, [], if (quals = []) then begin
None
end else begin
Some (quals)
end)))
in (match (_94_2978) with
| (should_generalize, lbs', quals_opt) -> begin
(let quals = (match (quals_opt) with
| None -> begin
(FStar_Syntax_Syntax.Unfoldable)::[]
end
| Some (q) -> begin
if (FStar_All.pipe_right q (FStar_Util.for_some (fun _94_12 -> (match (_94_12) with
| (FStar_Syntax_Syntax.Irreducible) | (FStar_Syntax_Syntax.Unfoldable) | (FStar_Syntax_Syntax.Inline) -> begin
true
end
| _94_2987 -> begin
false
end)))) then begin
q
end else begin
(FStar_Syntax_Syntax.Unfoldable)::q
end
end)
in (let lbs' = (FStar_List.rev lbs')
in (let e = (let _196_1264 = (let _196_1263 = (let _196_1262 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_unit)) None r)
in (((Prims.fst lbs), lbs'), _196_1262))
in FStar_Syntax_Syntax.Tm_let (_196_1263))
in (FStar_Syntax_Syntax.mk _196_1264 None r))
in (let _94_3021 = (match ((tc_maybe_toplevel_term (let _94_2991 = env
in {FStar_TypeChecker_Env.solver = _94_2991.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_2991.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_2991.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_2991.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_2991.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_2991.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_2991.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_2991.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_2991.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_2991.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_2991.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = should_generalize; FStar_TypeChecker_Env.letrecs = _94_2991.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = true; FStar_TypeChecker_Env.check_uvars = _94_2991.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_2991.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_2991.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_2991.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_2991.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_2991.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_2991.FStar_TypeChecker_Env.use_bv_sorts}) e)) with
| ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_let (lbs, e); FStar_Syntax_Syntax.tk = _94_2998; FStar_Syntax_Syntax.pos = _94_2996; FStar_Syntax_Syntax.vars = _94_2994}, _94_3005, g) when (FStar_TypeChecker_Rel.is_trivial g) -> begin
(let quals = (match (e.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (_94_3009, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Masked_effect)) -> begin
(FStar_Syntax_Syntax.HasMaskedEffect)::quals
end
| _94_3015 -> begin
quals
end)
in (FStar_Syntax_Syntax.Sig_let ((lbs, r, lids, quals)), lbs))
end
| _94_3018 -> begin
(FStar_All.failwith "impossible")
end)
in (match (_94_3021) with
| (se, lbs) -> begin
(let _94_3027 = if (log env) then begin
(let _196_1270 = (let _196_1269 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.map (fun lb -> (let should_log = (match ((let _196_1266 = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (FStar_TypeChecker_Env.try_lookup_val_decl env _196_1266))) with
| None -> begin
true
end
| _94_3025 -> begin
false
end)
in if should_log then begin
(let _196_1268 = (FStar_Syntax_Print.lbname_to_string lb.FStar_Syntax_Syntax.lbname)
in (let _196_1267 = (FStar_Syntax_Print.term_to_string lb.FStar_Syntax_Syntax.lbtyp)
in (FStar_Util.format2 "let %s : %s" _196_1268 _196_1267)))
end else begin
""
end))))
in (FStar_All.pipe_right _196_1269 (FStar_String.concat "\n")))
in (FStar_Util.print1 "%s\n" _196_1270))
end else begin
()
end
in (let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (se, env)))
end)))))
end))))
end))

let for_export : FStar_Ident.lident Prims.list  ->  FStar_Syntax_Syntax.sigelt  ->  (FStar_Syntax_Syntax.sigelt Prims.list * FStar_Ident.lident Prims.list) = (fun hidden se -> (let private_or_abstract = (fun quals -> (FStar_All.pipe_right quals (FStar_Util.for_some (fun x -> ((x = FStar_Syntax_Syntax.Private) || (x = FStar_Syntax_Syntax.Abstract))))))
in (let is_hidden_proj_or_disc = (fun q -> (match (q) with
| (FStar_Syntax_Syntax.Projector (l, _)) | (FStar_Syntax_Syntax.Discriminator (l)) -> begin
(FStar_All.pipe_right hidden (FStar_Util.for_some (FStar_Ident.lid_equals l)))
end
| _94_3044 -> begin
false
end))
in (match (se) with
| FStar_Syntax_Syntax.Sig_pragma (_94_3046) -> begin
([], hidden)
end
| (FStar_Syntax_Syntax.Sig_inductive_typ (_)) | (FStar_Syntax_Syntax.Sig_datacon (_)) -> begin
(FStar_All.failwith "Impossible")
end
| FStar_Syntax_Syntax.Sig_bundle (ses, quals, _94_3057, _94_3059) -> begin
if (private_or_abstract quals) then begin
(FStar_List.fold_right (fun se _94_3065 -> (match (_94_3065) with
| (out, hidden) -> begin
(match (se) with
| FStar_Syntax_Syntax.Sig_inductive_typ (l, us, bs, t, _94_3071, _94_3073, quals, r) -> begin
(let dec = (let _196_1286 = (let _196_1285 = (let _196_1284 = (let _196_1283 = (let _196_1282 = (FStar_Syntax_Syntax.mk_Total t)
in (bs, _196_1282))
in FStar_Syntax_Syntax.Tm_arrow (_196_1283))
in (FStar_Syntax_Syntax.mk _196_1284 None r))
in (l, us, _196_1285, (FStar_Syntax_Syntax.Assumption)::quals, r))
in FStar_Syntax_Syntax.Sig_declare_typ (_196_1286))
in ((dec)::out, hidden))
end
| FStar_Syntax_Syntax.Sig_datacon (l, us, t, _94_3083, _94_3085, _94_3087, _94_3089, r) -> begin
(let dec = FStar_Syntax_Syntax.Sig_declare_typ ((l, us, t, (FStar_Syntax_Syntax.Assumption)::[], r))
in ((dec)::out, (l)::hidden))
end
| _94_3095 -> begin
(out, hidden)
end)
end)) ses ([], hidden))
end else begin
((se)::[], hidden)
end
end
| FStar_Syntax_Syntax.Sig_assume (_94_3097, _94_3099, quals, _94_3102) -> begin
if (private_or_abstract quals) then begin
([], hidden)
end else begin
((se)::[], hidden)
end
end
| FStar_Syntax_Syntax.Sig_declare_typ (l, us, t, quals, r) -> begin
if (FStar_All.pipe_right quals (FStar_Util.for_some is_hidden_proj_or_disc)) then begin
((FStar_Syntax_Syntax.Sig_declare_typ ((l, us, t, (FStar_Syntax_Syntax.Assumption)::[], r)))::[], (l)::hidden)
end else begin
if (FStar_All.pipe_right quals (FStar_Util.for_some (fun _94_13 -> (match (_94_13) with
| (FStar_Syntax_Syntax.Assumption) | (FStar_Syntax_Syntax.Projector (_)) | (FStar_Syntax_Syntax.Discriminator (_)) -> begin
true
end
| _94_3121 -> begin
false
end)))) then begin
((se)::[], hidden)
end else begin
([], hidden)
end
end
end
| FStar_Syntax_Syntax.Sig_main (_94_3123) -> begin
([], hidden)
end
| (FStar_Syntax_Syntax.Sig_new_effect (_)) | (FStar_Syntax_Syntax.Sig_sub_effect (_)) | (FStar_Syntax_Syntax.Sig_effect_abbrev (_)) -> begin
((se)::[], hidden)
end
| FStar_Syntax_Syntax.Sig_let ((false, lb::[]), _94_3139, _94_3141, quals) when (FStar_All.pipe_right quals (FStar_Util.for_some is_hidden_proj_or_disc)) -> begin
(let lid = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in if (FStar_All.pipe_right hidden (FStar_Util.for_some (FStar_Ident.lid_equals lid))) then begin
([], hidden)
end else begin
(let dec = FStar_Syntax_Syntax.Sig_declare_typ ((lid, lb.FStar_Syntax_Syntax.lbunivs, lb.FStar_Syntax_Syntax.lbtyp, (FStar_Syntax_Syntax.Assumption)::[], (FStar_Ident.range_of_lid lid)))
in ((dec)::[], (lid)::hidden))
end)
end
| FStar_Syntax_Syntax.Sig_let (lbs, r, l, quals) -> begin
if (private_or_abstract quals) then begin
(let _196_1291 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.map (fun lb -> (let _196_1290 = (let _196_1289 = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (_196_1289, lb.FStar_Syntax_Syntax.lbunivs, lb.FStar_Syntax_Syntax.lbtyp, (FStar_Syntax_Syntax.Assumption)::quals, r))
in FStar_Syntax_Syntax.Sig_declare_typ (_196_1290)))))
in (_196_1291, hidden))
end else begin
((se)::[], hidden)
end
end))))

let tc_decls : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  (FStar_Syntax_Syntax.sigelt Prims.list * FStar_Syntax_Syntax.sigelt Prims.list * FStar_TypeChecker_Env.env) = (fun env ses -> (let _94_3179 = (FStar_All.pipe_right ses (FStar_List.fold_left (fun _94_3160 se -> (match (_94_3160) with
| (ses, exports, env, hidden) -> begin
(let _94_3162 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _196_1298 = (FStar_Syntax_Print.sigelt_to_string se)
in (FStar_Util.print1 ">>>>>>>>>>>>>>Checking top-level decl %s\n" _196_1298))
end else begin
()
end
in (let _94_3166 = (tc_decl env se)
in (match (_94_3166) with
| (se, env) -> begin
(let _94_3167 = if ((FStar_ST.read FStar_Options.log_types) || (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("LogTypes")))) then begin
(let _196_1299 = (FStar_Syntax_Print.sigelt_to_string se)
in (FStar_Util.print1 "Checked: %s\n" _196_1299))
end else begin
()
end
in (let _94_3169 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.encode_sig env se)
in (let _94_3173 = (for_export hidden se)
in (match (_94_3173) with
| (exported, hidden) -> begin
((se)::ses, (exported)::exports, env, hidden)
end))))
end)))
end)) ([], [], env, [])))
in (match (_94_3179) with
| (ses, exports, env, _94_3178) -> begin
(let _196_1300 = (FStar_All.pipe_right (FStar_List.rev exports) FStar_List.flatten)
in ((FStar_List.rev ses), _196_1300, env))
end)))

let tc_partial_modul : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  (FStar_Syntax_Syntax.modul * FStar_Syntax_Syntax.sigelt Prims.list * FStar_TypeChecker_Env.env) = (fun env modul -> (let name = (FStar_Util.format2 "%s %s" (if modul.FStar_Syntax_Syntax.is_interface then begin
"interface"
end else begin
"module"
end) modul.FStar_Syntax_Syntax.name.FStar_Ident.str)
in (let msg = (Prims.strcat "Internals for " name)
in (let env = (let _94_3184 = env
in (let _196_1305 = (not ((FStar_Options.should_verify modul.FStar_Syntax_Syntax.name.FStar_Ident.str)))
in {FStar_TypeChecker_Env.solver = _94_3184.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_3184.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_3184.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_3184.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_3184.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_3184.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_3184.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_3184.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_3184.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_3184.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_3184.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_3184.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_3184.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _94_3184.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _94_3184.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_3184.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = modul.FStar_Syntax_Syntax.is_interface; FStar_TypeChecker_Env.admit = _196_1305; FStar_TypeChecker_Env.default_effects = _94_3184.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_3184.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_3184.FStar_TypeChecker_Env.use_bv_sorts}))
in (let _94_3187 = if (not ((FStar_Ident.lid_equals modul.FStar_Syntax_Syntax.name FStar_Syntax_Const.prims_lid))) then begin
(env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.push msg)
end else begin
()
end
in (let env = (FStar_TypeChecker_Env.set_current_module env modul.FStar_Syntax_Syntax.name)
in (let _94_3193 = (tc_decls env modul.FStar_Syntax_Syntax.declarations)
in (match (_94_3193) with
| (ses, exports, env) -> begin
((let _94_3194 = modul
in {FStar_Syntax_Syntax.name = _94_3194.FStar_Syntax_Syntax.name; FStar_Syntax_Syntax.declarations = ses; FStar_Syntax_Syntax.exports = _94_3194.FStar_Syntax_Syntax.exports; FStar_Syntax_Syntax.is_interface = _94_3194.FStar_Syntax_Syntax.is_interface}), exports, env)
end))))))))

let tc_more_partial_modul : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  (FStar_Syntax_Syntax.modul * FStar_Syntax_Syntax.sigelt Prims.list * FStar_TypeChecker_Env.env) = (fun env modul decls -> (let _94_3202 = (tc_decls env decls)
in (match (_94_3202) with
| (ses, exports, env) -> begin
(let modul = (let _94_3203 = modul
in {FStar_Syntax_Syntax.name = _94_3203.FStar_Syntax_Syntax.name; FStar_Syntax_Syntax.declarations = (FStar_List.append modul.FStar_Syntax_Syntax.declarations ses); FStar_Syntax_Syntax.exports = _94_3203.FStar_Syntax_Syntax.exports; FStar_Syntax_Syntax.is_interface = _94_3203.FStar_Syntax_Syntax.is_interface})
in (modul, exports, env))
end)))

let finish_partial_modul : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  FStar_Syntax_Syntax.sigelts  ->  (FStar_Syntax_Syntax.modul * FStar_TypeChecker_Env.env) = (fun env modul exports -> (let modul = (let _94_3209 = modul
in {FStar_Syntax_Syntax.name = _94_3209.FStar_Syntax_Syntax.name; FStar_Syntax_Syntax.declarations = _94_3209.FStar_Syntax_Syntax.declarations; FStar_Syntax_Syntax.exports = exports; FStar_Syntax_Syntax.is_interface = modul.FStar_Syntax_Syntax.is_interface})
in (let env = (FStar_TypeChecker_Env.finish_module env modul)
in (let _94_3219 = if (not ((FStar_Ident.lid_equals modul.FStar_Syntax_Syntax.name FStar_Syntax_Const.prims_lid))) then begin
(let _94_3213 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.pop (Prims.strcat "Ending modul " modul.FStar_Syntax_Syntax.name.FStar_Ident.str))
in (let _94_3215 = if ((not (modul.FStar_Syntax_Syntax.is_interface)) || (let _196_1318 = (FStar_ST.read FStar_Options.admit_fsi)
in (FStar_List.contains modul.FStar_Syntax_Syntax.name.FStar_Ident.str _196_1318))) then begin
(env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.encode_modul env modul)
end else begin
()
end
in (let _94_3217 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.refresh ())
in (let _196_1319 = (FStar_Options.reset_options ())
in (FStar_All.pipe_right _196_1319 Prims.ignore)))))
end else begin
()
end
in (modul, env)))))

let tc_modul : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  (FStar_Syntax_Syntax.modul * FStar_TypeChecker_Env.env) = (fun env modul -> (let _94_3226 = (tc_partial_modul env modul)
in (match (_94_3226) with
| (modul, non_private_decls, env) -> begin
(finish_partial_modul env modul non_private_decls)
end)))

let add_modul_to_tcenv : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  FStar_TypeChecker_Env.env = (fun en m -> (let do_sigelt = (fun en elt -> (let env = (FStar_TypeChecker_Env.push_sigelt en elt)
in (let _94_3233 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.encode_sig env elt)
in env)))
in (let en = (FStar_TypeChecker_Env.set_current_module en m.FStar_Syntax_Syntax.name)
in (let _196_1332 = (FStar_List.fold_left do_sigelt en m.FStar_Syntax_Syntax.exports)
in (FStar_TypeChecker_Env.finish_module _196_1332 m)))))

let type_of : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.typ * FStar_TypeChecker_Env.guard_t) = (fun env e -> (let _94_3238 = if (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("RelCheck"))) then begin
(let _196_1337 = (FStar_Syntax_Print.term_to_string e)
in (FStar_Util.print1 "Checking term %s\n" _196_1337))
end else begin
()
end
in (let env = (let _94_3240 = env
in {FStar_TypeChecker_Env.solver = _94_3240.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _94_3240.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _94_3240.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _94_3240.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _94_3240.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _94_3240.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _94_3240.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _94_3240.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _94_3240.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _94_3240.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _94_3240.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _94_3240.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _94_3240.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = _94_3240.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _94_3240.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _94_3240.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _94_3240.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.default_effects = _94_3240.FStar_TypeChecker_Env.default_effects; FStar_TypeChecker_Env.type_of = _94_3240.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.use_bv_sorts = _94_3240.FStar_TypeChecker_Env.use_bv_sorts})
in (let _94_3246 = (tc_tot_or_gtot_term env e)
in (match (_94_3246) with
| (t, c, g) -> begin
if (FStar_Syntax_Util.is_total_lcomp c) then begin
(c.FStar_Syntax_Syntax.res_typ, g)
end else begin
(Prims.raise (FStar_Syntax_Syntax.Error (("Expected a total term; got a ghost term", e.FStar_Syntax_Syntax.pos))))
end
end)))))

let check_module : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  (FStar_Syntax_Syntax.modul * FStar_TypeChecker_Env.env) = (fun env m -> (let _94_3249 = if ((let _196_1342 = (FStar_ST.read FStar_Options.debug)
in (FStar_List.length _196_1342)) <> 0) then begin
(let _196_1343 = (FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name)
in (FStar_Util.print2 "Checking %s: %s\n" (if m.FStar_Syntax_Syntax.is_interface then begin
"i\'face"
end else begin
"module"
end) _196_1343))
end else begin
()
end
in (let _94_3253 = (tc_modul env m)
in (match (_94_3253) with
| (m, env) -> begin
(let _94_3254 = if (FStar_Options.should_dump m.FStar_Syntax_Syntax.name.FStar_Ident.str) then begin
(let _196_1344 = (FStar_Syntax_Print.modul_to_string m)
in (FStar_Util.print1 "%s\n" _196_1344))
end else begin
()
end
in (m, env))
end))))



