
use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use cardano/transaction.{OutputReference, Transaction}

validator hello(owner: VerificationKeyHash) {
  spend(
    _datum: Option<Data>,
    _redeemer: Data,
    _own_ref: OutputReference,
    self: Transaction,
  ) {
    list.has(self.extra_signatories, owner)
  }

  else(_ctx) {
    False
  }
}

