/**
 *
 */

package org.nuxeo.question;

import org.nuxeo.ecm.core.api.DocumentModel;
import org.nuxeo.ecm.core.api.adapter.DocumentAdapterFactory;

/**
 * @author ldoguin
 */
public class AnswerFactory implements DocumentAdapterFactory {

    @Override
    public Object getAdapter(DocumentModel doc, Class<?> itf) {
        if (doc.getType().equals("answer")) {
            return new Answer(doc);
        } else {
            return null;
        }
    }
}
