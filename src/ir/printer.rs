use super::inst::*;

pub fn print_program(program: &IrProgram) -> String {
    let mut out = String::new();

    if !program.constants.is_empty() {
        out.push_str("; constants\n");
        for (name, val) in &program.constants {
            out.push_str(&format!("  const {} = {}\n", name, val));
        }
        out.push('\n');
    }

    for func in &program.functions {
        print_function(func, &mut out);
        out.push('\n');
    }

    out
}

fn print_function(func: &IrFunction, out: &mut String) {
    let params = if func.params.is_empty() {
        String::new()
    } else {
        func.params.join(", ")
    };

    out.push_str(&format!("fn {}({}):\n", func.name, params));

    for block in &func.blocks {
        print_block(block, out);
    }
}

fn print_block(block: &BasicBlock, out: &mut String) {
    out.push_str(&format!("  {}:\n", block.id));

    for inst in &block.insts {
        out.push_str("    ");
        print_inst(inst, out);
        out.push('\n');
    }
}

fn print_inst(inst: &Inst, out: &mut String) {
    match inst {
        Inst::Const(dst, val) => {
            out.push_str(&format!("{} = const {}", dst, val));
        }
        Inst::Copy(dst, src) => {
            out.push_str(&format!("{} = copy {}", dst, src));
        }
        Inst::BinOp(dst, op, lhs, rhs) => {
            out.push_str(&format!("{} = {} {}, {}", dst, op, lhs, rhs));
        }
        Inst::UnaryOp(dst, op, operand) => {
            out.push_str(&format!("{} = {} {}", dst, op, operand));
        }
        Inst::Load(dst, name) => {
            out.push_str(&format!("{} = load {}", dst, name));
        }
        Inst::Store(name, val) => {
            out.push_str(&format!("store {}, {}", name, val));
        }
        Inst::Call(dst, name, args) => {
            let arg_str: Vec<String> = args.iter().map(|a| a.to_string()).collect();
            out.push_str(&format!("{} = call {}({})", dst, name, arg_str.join(", ")));
        }
        Inst::CallMethod(dst, obj, method, args) => {
            let arg_str: Vec<String> = args.iter().map(|a| a.to_string()).collect();
            out.push_str(&format!("{} = call_method {}.{}({})", dst, obj, method, arg_str.join(", ")));
        }
        Inst::Show(val) => {
            out.push_str(&format!("show {}", val));
        }
        Inst::GetField(dst, obj, field) => {
            out.push_str(&format!("{} = get_field {}.{}", dst, obj, field));
        }
        Inst::SetField(obj, field, val) => {
            out.push_str(&format!("set_field {}.{}, {}", obj, field, val));
        }
        Inst::GetIndex(dst, obj, idx) => {
            out.push_str(&format!("{} = get_index {}[{}]", dst, obj, idx));
        }
        Inst::SetIndex(obj, idx, val) => {
            out.push_str(&format!("set_index {}[{}], {}", obj, idx, val));
        }
        Inst::MakeList(dst, elems) => {
            let parts: Vec<String> = elems.iter().map(|e| e.to_string()).collect();
            out.push_str(&format!("{} = make_list [{}]", dst, parts.join(", ")));
        }
        Inst::MakeMap(dst, pairs) => {
            let parts: Vec<String> = pairs.iter().map(|(k, v)| format!("{}: {}", k, v)).collect();
            out.push_str(&format!("{} = make_map [{}]", dst, parts.join(", ")));
        }
        Inst::MakeEntity(dst, name, fields) => {
            let parts: Vec<String> = fields.iter().map(|(n, v)| format!("{} = {}", n, v)).collect();
            out.push_str(&format!("{} = make_entity {} {{ {} }}", dst, name, parts.join(", ")));
        }
        Inst::MakePackedEntity(dst, name, fields) => {
            let parts: Vec<String> = fields.iter().map(|(n, v)| format!("{} = {}", n, v)).collect();
            out.push_str(&format!("{} = make_packed_entity {} {{ {} }}", dst, name, parts.join(", ")));
        }
        Inst::Jump(target) => {
            out.push_str(&format!("jump {}", target));
        }
        Inst::Branch(cond, then_b, else_b) => {
            out.push_str(&format!("branch {}, {}, {}", cond, then_b, else_b));
        }
        Inst::Return(vals) => {
            if vals.is_empty() {
                out.push_str("ret void");
            } else {
                let parts: Vec<String> = vals.iter().map(|v| v.to_string()).collect();
                out.push_str(&format!("ret {}", parts.join(", ")));
            }
        }
        Inst::Phi(dst, entries) => {
            let parts: Vec<String> = entries.iter()
                .map(|(val, block)| format!("[{}, {}]", val, block))
                .collect();
            out.push_str(&format!("{} = phi {}", dst, parts.join(", ")));
        }
        Inst::MakeClosure(dst, name, captures) => {
            let parts: Vec<String> = captures.iter().map(|c| c.to_string()).collect();
            out.push_str(&format!("{} = make_closure {}({})", dst, name, parts.join(", ")));
        }
        Inst::CallClosure(dst, closure, args) => {
            let parts: Vec<String> = args.iter().map(|a| a.to_string()).collect();
            out.push_str(&format!("{} = call_closure {}({})", dst, closure, parts.join(", ")));
        }
        Inst::RunTask(dst, closure) => {
            out.push_str(&format!("{} = run_task {}", dst, closure));
        }
        Inst::WaitTask(task) => {
            out.push_str(&format!("wait_task {}", task));
        }
        Inst::WaitAll => {
            out.push_str("wait_all");
        }
        Inst::Nop => {
            out.push_str("nop");
        }
        Inst::InlineAsm(dst, template, constraints, inputs) => {
            out.push_str(&format!("r{} = asm \"{}\" \"{}\"", dst.0, template, constraints));
            for (i, op) in inputs.iter().enumerate() {
                out.push_str(if i == 0 { " " } else { ", " });
                out.push_str(&op.to_string());
            }
        }
    }
}
