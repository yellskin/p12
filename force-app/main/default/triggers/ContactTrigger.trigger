/**
* @author:		 Frédéric VO
* @date:		 01/11/2020
* @description:	 Trigger trigger ContactHandler's methods.
*
*
*/
trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {
    switch on Trigger.operationType {
        when BEFORE_UPDATE {
            ContactHandler.checkDuplicateEmail(Trigger.new, true);
        }
        when BEFORE_INSERT {
            ContactHandler.checkDuplicateEmail(Trigger.new, false);
        }
    }
}