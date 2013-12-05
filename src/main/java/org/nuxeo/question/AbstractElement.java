/**
 *
 */

package org.nuxeo.question;

import java.util.Calendar;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nuxeo.ecm.automation.core.operations.business.adapter.BusinessAdapter;
import org.nuxeo.ecm.core.api.ClientException;
import org.nuxeo.ecm.core.api.DocumentModel;

/**
 * @author ldoguin
 */
public class AbstractElement extends BusinessAdapter {

    private static final Log log = LogFactory.getLog(AbstractElement.class);

    protected DocumentModel doc;

    @Override
    public String getId() {
        return doc.getId();
    }

    @Override
    public String getType() {
        return doc.getType();
    }

    public String getTitle() throws ClientException {
        return doc.getTitle();
    }

    public String getDescription() throws ClientException {
        return doc.getProperty("dc:description").getValue(String.class);
    }

    public String getCreator() throws ClientException {
        return doc.getProperty("dc:creator").getValue(String.class);
    }

    public Calendar getModified() throws ClientException {
        return doc.getProperty("dc:modified").getValue(Calendar.class);
    }

    public String getVotes() throws ClientException {
        return doc.getProperty("dc:creator").getValue(String.class);
    }

}