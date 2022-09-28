use rustler::Atom;
use openbsd::pledge::Error::{EFAULT, EINVAL, EPERM};

mod atoms {
  rustler::atoms! {
    ok,
    error,
    efault,
    einval,
    eperm
  }
}

fn to_nif_result(result: Result<(), openbsd::pledge::Error>) -> Result<Atom, Atom> {
 
  return match result {
    Err(EFAULT) => Err(atoms::efault()),
    Err(EINVAL) => Err(atoms::einval()),
    Err(EPERM) => Err(atoms::eperm()),
    Err(_) => Err(atoms::error()),
    Ok(()) => Ok(atoms::ok())
  };
   
}

#[rustler::nif]
fn pledge_promises(s: String) -> Result<Atom, Atom> {
  return to_nif_result( openbsd::pledge::pledge_promises(s) );
}

#[rustler::nif]
fn pledge_execpromises(s: String) -> Result<Atom, Atom> {
  return to_nif_result( openbsd::pledge::pledge_execpromises(s) );
}

#[rustler::nif]
fn pledge(promises: String, exec_promises: String) -> Result<Atom, Atom> {
  return to_nif_result( openbsd::pledge::pledge(promises, exec_promises) );
}


rustler::init!("Elixir.Pledge.NIF", [pledge_promises, pledge_execpromises, pledge]);
