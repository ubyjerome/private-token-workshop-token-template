# Ubongabasi Jerome Compliant Private Token (Aleo Workshop Project)

The **Ubongabasi Jerome Compliant Private Token** is a privacy-preserving smart contract built on the **Aleo blockchain** as part of the **Aleo Workshop**.
It demonstrates how to build a **regulatory-compliant token** that integrates **OFAC (Office of Foreign Assets Control)** address verification for compliant minting and transferring of tokens, both publicly and privately.

---

## 1. Deployment Information

* **Program Name:** `project_zero.aleo`
* **Registry Module:** `workshop_ofac.aleo` (for compliance verification)
* **Blockchain:** Aleo Testnet
* **Technology Stack:** Leo Language + Aleo zkVM
* **Author:** Ubongabasi Jerome
* **Deployment ID:** `at1kzng7808uutuj2grczpj8ju0ahrsxrn78vp8vhdj75qeh3l0eu8s4wqy7g`
* **Deployment URL:** [View on Aleo Testnet](https://testnet.aleoscan.io/program?id=project_zero.aleo)
* **Transaction ID:** `at1klry6c4xqkvst4tfdwwv40sp60adjqdedr5ec8cpgfx6rnxz9uzsqmz3ax`

---

## 2. Functional Overview

The contract demonstrates a compliant token model enforcing regulatory screening before any mint or transfer action. It defines a mapping-based ledger for public balances and record-based storage for private ownership. The OFAC module (`workshop_ofac.aleo`) ensures that no sanctioned address can participate in minting or transfer operations.

**Key Operations**

**Public Mint**

```leo
async transition mint_public(public recipient: address, public amount: u64) -> Future {
    let address_check: Future = workshop_ofac.aleo/address_check(recipient);
    return mint_public_onchain(recipient, amount, address_check);
}
```

**Private Mint**

```leo
async transition mint_private(private recipient: address, private amount: u64) -> (Token, Future) {
    let address_check: Future = workshop_ofac.aleo/address_check(recipient);
    let token: Token = Token { owner: recipient, amount: amount };
    return (token, mint_private_onchain(address_check));
}
```

**Public Transfer**

```leo
async transition transfer_public(public recipient: address, public amount: u64) -> Future {
    let address_check: Future = workshop_ofac.aleo/address_check(recipient);
    return transfer_public_onchain(self.signer, recipient, amount, address_check);
}
```

The contract leverages asynchronous address validation (`Future` and `await()`) to ensure compliance before transaction completion.

---

## 3. Author

**Ubongabasi Jerome**
Software Engineer
Aleo Workshop Participant

Developed as part of the **Aleo Workshop Compliant Token Challenge**, demonstrating secure, regulatory-compliant tokenization using **Leo** and **Aleo zk technology**.
