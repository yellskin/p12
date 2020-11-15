/**
* @author:		 Frédéric VO
* @date:		 01/11/2020
* @description:	 Create data for test class
*
*/
public with sharing class TestDataFactory {
    public static Contact generateContact(String lastname){
        Contact contact = new Contact();
        contact.LastName = lastname;
        contact.FirstName = 'FirstName';
        return contact;
    }
}