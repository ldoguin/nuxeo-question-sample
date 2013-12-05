/**
 *
 */

package org.nuxeo.question;

import org.nuxeo.ecm.automation.core.Constants;
import org.nuxeo.ecm.automation.core.annotations.Operation;
import org.nuxeo.ecm.automation.core.annotations.OperationMethod;
import org.nuxeo.ecm.automation.core.collectors.DocumentModelCollector;
import org.nuxeo.ecm.core.api.DocumentModel;

/**
 * @author ldoguin
 */
@Operation(id=VoteDown.ID, category=Constants.CAT_DOCUMENT, label="VoteDown", description="")
public class VoteDown {

    public static final String ID = "Question.VoteDown";

    @OperationMethod(collector=DocumentModelCollector.class)
    public DocumentModel run(DocumentModel input) {
      return null;
    }

}
