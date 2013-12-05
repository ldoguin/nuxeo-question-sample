/**
 *
 */

package org.nuxeo.question;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nuxeo.ecm.core.api.DocumentModel;

/**
 * @author ldoguin
 */
public class Answer extends AbstractElement {

    private static final Log log = LogFactory.getLog(Answer.class);

    public Answer(DocumentModel doc) {
        this.doc = doc;
    }

}