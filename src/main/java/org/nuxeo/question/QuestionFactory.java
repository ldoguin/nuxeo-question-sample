/**
 * 
 */

package org.nuxeo.question;

import org.nuxeo.ecm.core.api.DocumentModel;
import org.nuxeo.ecm.core.api.adapter.DocumentAdapterFactory;

/**
 * @author ldoguin
 */
public class QuestionFactory implements DocumentAdapterFactory {

    @Override
    public Object getAdapter(DocumentModel doc, Class<?> itf) {
        if (doc.getType().equals("question")) {
            return new Question(doc);
        } else {
            return null;
        }
    }
}
