/**
* @author:		 Frédéric VO
* @date:		 01/11/2020
* @description:	 Handler trigger by ContactTrigger on Contact Object.
*
*
*/
public class ContactHandler {
	public static void checkDuplicateEmail(List<Contact> newContacts, Boolean IsUpdate){
        for(Contact newContact:newContacts){
            String newContactEmail = newContact.Email;
            if(newContactEmail == null){
                continue;
            } else {
                String queryContacts = 'SELECT Id, Email FROM Contact WHERE Email =\''+newContactEmail+'\'';
                if(IsUpdate){
                    queryContacts += ' AND Id != \''+newContact.Id+'\'';
                }
                List<Contact> contactList = Database.query(queryContacts);
                if(contactList.size() > 0) {
                    for(Contact contact : contactList) {
                        newContact.addError('Impossible de sauvegarder le contact. Un contact possédant cet Email ('+newContactEmail+') existe déjà.', false);
                    }
                }
            }
        }
    }
}