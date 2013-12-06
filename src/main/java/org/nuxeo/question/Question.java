/**
 *
 */

package org.nuxeo.question;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nuxeo.ecm.core.api.ClientException;
import org.nuxeo.ecm.core.api.DocumentModel;

/**
 * @author ldoguin
 */
public class Question extends AbstractElement {

    private static final Log log = LogFactory.getLog(Question.class);

    public Question(DocumentModel doc) {
        this.doc = doc;
    }

    public Object getCommunities() throws ClientException {
        return doc.getProperty("qs:community").getValue();
    }

//    public void getSubscribtion() {
//        NotificationManager notificationManager = Framework.getLocalService(NotificationManager.class);
//        NuxeoPrincipal principal = (NuxeoPrincipal) FacesContext.getCurrentInstance().getExternalContext().getUserPrincipal();
//        if (currentSubscription.isSelected()) {
//            notificationManager.removeSubscription(
//                    "user:" + principal.getName(),
//                    currentSubscription.getNotification().getName(),
//                    doc.getId());
//        } else {
//            notificationManager.addSubscription(
//                    NotificationConstants.USER_PREFIX + principal.getName(),
//                    currentSubscription.getNotification().getName(),
//                    doc, false, principal, "");
//        }
//    }

}