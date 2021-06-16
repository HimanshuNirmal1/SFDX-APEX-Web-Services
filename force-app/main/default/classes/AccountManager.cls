@RestResource(urlMapping = '/Accounts/*/contacts')

global with sharing class AccountManager {

    @HttpGet

    global static Account getAccount(){

        RestRequest request = RestContext.request;

        //grab accountId from end of the URL

        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');

        //get the needed info via a soql query

        Account result = [SELECT Id, Name, (SELECT Id, Name from Contacts)
                          FROM  Account
                          WHERE Id = :accountId];

        return result;
    }


}