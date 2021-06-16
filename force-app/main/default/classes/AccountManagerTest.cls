@isTest

private class AccountManagerTest{
    @isTest static void getContactsFromAccountId(){
        Id recordId = createTestRecord();
        
        //set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://yourInstance.salesforce.com/services/apexrest/Accounts/'+ recordId + '/contacts';

        request.httpMethod = 'GET';
        RestContext.request = request;

        //test origin class method
        Account thisAccount = AccountManager.getAccount();

        //verify results
        System.assert(thisAccount!=NULL);
        System.assertEquals('Test Record', thisAccount.Name);
    }

    //Helper method

    static Id createTestRecord(){
        //create the test record used in the above class for testing

        Account accountTest = new Account(
            Name = 'Test Record',
        	AccountNumber = '23062018'
        	);
        insert accountTest;

        Contact contactTest = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            AccountId = accountTest.Id
        );

        insert contactTest;

        return accountTest.Id;
        
    }
}