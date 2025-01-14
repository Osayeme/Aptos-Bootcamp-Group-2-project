#[test_only]

module 0x7e074fb2793130b69a03bb6c551a8e69495744017618a6463c09da721a9d2d38::counter_test {
    use std::signer;
    use std::unit_test;
    use std::vector;
    use 0x7e074fb2793130b69a03bb6c551a8e69495744017618a6463c09da721a9d2d38::counter;

    fun get_account(): signer{
        vector::pop_back(&mut unit_test::create_signers_for_testing(1))
    }

    #[test]
    public entry fun test_if_it_init(){
        let account = get_account();
        let addr = signer::address_of(&account);
        aptos_framework::account::create_account_for_test(addr);
        counter::bump(account);
        assert!(
            counter:: get_count(addr) == 0 , 0
        );

        let account = get_account();
        counter::bump(account);
        assert!(
            counter:: get_count(addr) == 1 , 0
        );
    }
  
}