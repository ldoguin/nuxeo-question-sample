/**
 *
 */

package org.nuxeo.question;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;

import net.sf.json.JSONObject;

import org.nuxeo.ecm.automation.core.Constants;
import org.nuxeo.ecm.automation.core.annotations.Context;
import org.nuxeo.ecm.automation.core.annotations.Operation;
import org.nuxeo.ecm.automation.core.annotations.OperationMethod;
import org.nuxeo.ecm.core.api.Blob;
import org.nuxeo.ecm.core.api.CoreSession;
import org.nuxeo.ecm.core.api.DocumentModel;
import org.nuxeo.ecm.core.api.impl.blob.InputStreamBlob;
import org.nuxeo.ecm.rating.api.LikeService;
import org.nuxeo.ecm.rating.api.LikeStatus;

/**
 * @author ldoguin
 */
@Operation(id = VoteStatus.ID, category = Constants.CAT_DOCUMENT, label = "VoteStatus", description = "")
public class VoteStatus {

    public static final String ID = "VoteStatus";

    @Context
    CoreSession session;

    @Context
    LikeService likeService;

    @OperationMethod()
    public Blob run(DocumentModel doc) throws UnsupportedEncodingException {
        String username = session.getPrincipal().getName();
        LikeStatus status = likeService.getLikeStatus(username, doc);
        JSONObject json = JSONObject.fromObject(status.toMap());
        return new InputStreamBlob(new ByteArrayInputStream(
                json.toString().getBytes("UTF-8")), "application/json");
    }

}
