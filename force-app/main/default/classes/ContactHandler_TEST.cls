/**
* @author:		 Frédéric VO
* @date:		 01/11/2020
* @description:	 Test ContactHandler class
*
*
*/
@isTest
private class ContactHandler_TEST {

   @testSetup static void setup() {
      Contact contact1 = TestDataFactory.generateContact('contact1');
      contact1.Email = 'contact1@gmail.com';
      insert contact1;
   }

   /*
   Test for insert and update contact with the same email as contact1 then throwing error message
   */
   @isTest static void testCheckDuplicateEmail(){
      Boolean isExceptionThrow_insert = false;
      Boolean isExceptionThrow_update = false;

      Contact contact2 = TestDataFactory.generateContact('contact2');
      contact2.Email = 'contact2@gmail.com';
      insert contact2;
      contact2.Email = 'contact1@gmail.com';

      Contact contact3 = TestDataFactory.generateContact('contact3');
      contact3.Email = 'contact1@gmail.com';

      Test.startTest();
      try {
         insert contact3;
      }catch (DmlException e) {
         if(e.getMessage().contains('Impossible de sauvegarder le contact')){
            isExceptionThrow_insert = true;
         }
      }
      try {
         update contact2;
      }catch (DmlException e) {
         if(e.getMessage().contains('Impossible de sauvegarder le contact')){
            isExceptionThrow_update = true;
         }
      }
      Test.stopTest();

      System.assertEquals(true, isExceptionThrow_insert);
      System.assertEquals(true, isExceptionThrow_update);
   }

   /*
   Test for insert contact with email null value
   */
   @isTest static void testNewEmailNull(){
      Boolean isExceptionThrow_insert = false;

      Contact contact3 = TestDataFactory.generateContact('contact3');

      Test.startTest();
         try {
            insert contact3;
         }catch (DmlException e) {
               isExceptionThrow_insert = true;
         }
         Test.stopTest();

         System.assertEquals(false, isExceptionThrow_insert);
   }

}