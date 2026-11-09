Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5BC606EE85
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fJDSjcf7;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Kxp2gYUG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tjLoocJtgZp3d7VE01qKIf/b0AUZVceK9RAY/Ki1zEE=; b=fJDSjcf76x1l5J
	xfK6VcszQe06MXAs+FhrVs7GIhkIZoHyIK6weNNNRFzV9pxQOHpoJ6Ztbws6vIcvGAHETFLRHnJVJ
	H6u24+WR+P2SC0akWKLGbA/+OSOvq8xwhM15H7Zw6fZ+3tUVThhH1ZNjwsts9hu7r2+O3Xzl/QfOy
	m+c4KXKfAd8MJm94boAeG292anOhB7KZbUI7PtTRpjSBeOfYkYvijuod85lFAzXJp/oTCGo0YF0dK
	BRjnKZK7ZHJZI3wN4eaknCAVid4nwbH/t9juSj9AHVVCgCx7XnlHNN5SRQ8wqwHspNE6hvQiygP6B
	zIqSYn5s+VXUNFAOWlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTC-00000000BM2-0VkP;
	Mon, 09 Nov 2026 09:15:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLT6-00000000BHN-48oc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:15:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12E6C1691;
	Mon,  9 Nov 2026 01:15:09 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CCA63F85F;
	Mon,  9 Nov 2026 01:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215712; bh=8kDoZMhfijALz2xCyOhL8rkJdGvulmKZNLN3A2dJI+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kxp2gYUG/1Sxy7XyUzhXpoa6VLGpBtKp0tBACwsqSsB29AkHERNGY4c5nj1/jAryX
	 2Vkcm2lgKsgIIahcUHkXU4K/G02cofar8HiXU0MSf5PuRCzg2Ply3lF+n2FD5u170x
	 BZDQ7jQlhSp3gjFHa2h2m7r3ZylY4wucbprOMDUQ=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v15 05/35] firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
Date: Mon,  9 Nov 2026 09:11:51 +0000
Message-ID: <20261109091221.2532706-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011513_116342_5C269743 
X-CRM114-Status: GOOD (  17.55  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Refactor the __scmi_event_handler_get_ops notification helper to simplify
its logic and make use of guards for locking.

Event handler allocation is split out of registration in a dedicated helper
so as to allow for future reuse.

Mostly no functional change, in the sense that while the functionality
remained the same, a richer set of errors is returned where before was
always a -EINVAL.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - reworked error path in scmi_allocate_pending_event_handler
 - improve commit message
---
 drivers/firmware/arm_scmi/notify.c | 74 +++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index a30589c9b377..fa2339209a69 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -891,7 +891,6 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
 
 /**
  * scmi_allocate_event_handler()  - Allocate Event handler
- * @ni: A reference to the notification instance to use
  * @evt_key: 32bit key uniquely bind to the event identified by the tuple
  *	     (proto_id, evt_id, src_id)
  *
@@ -901,21 +900,33 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
  * associated to this handler descriptor (hndl->r_evt == NULL), so the handler
  * is initialized as pending.
  *
- * Context: Assumes to be called with @pending_mtx already acquired.
  * Return: the freshly allocated structure on Success
  */
-static struct scmi_event_handler *
-scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
+static struct scmi_event_handler *scmi_allocate_event_handler(u32 evt_key)
 {
 	struct scmi_event_handler *hndl;
 
 	hndl = kzalloc_obj(*hndl);
 	if (!hndl)
 		return NULL;
+
 	hndl->key = evt_key;
 	BLOCKING_INIT_NOTIFIER_HEAD(&hndl->chain);
 	refcount_set(&hndl->users, 1);
-	/* New handlers are created pending */
+
+	return hndl;
+}
+
+static struct scmi_event_handler *
+scmi_allocate_pending_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
+{
+	struct scmi_event_handler *hndl;
+
+	lockdep_assert_held(&ni->pending_mtx);
+	hndl =  scmi_allocate_event_handler(evt_key);
+	if (!hndl)
+		return NULL;
+
 	hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
 
 	return hndl;
@@ -1085,7 +1096,8 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 			     u32 evt_key, bool create)
 {
 	struct scmi_registered_event *r_evt;
-	struct scmi_event_handler *hndl = NULL;
+	struct scmi_event_handler *hndl;
+	int ret;
 
 	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
 			      KEY_XTRACT_EVT_ID(evt_key));
@@ -1093,39 +1105,47 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 	if (r_evt && r_evt->not_supported_by_platform)
 		return ERR_PTR(-EOPNOTSUPP);
 
-	mutex_lock(&ni->pending_mtx);
+	guard(mutex)(&ni->pending_mtx);
 	/* Search registered events at first ... if possible at all */
 	if (r_evt) {
-		mutex_lock(&r_evt->proto->registered_mtx);
+		guard(mutex)(&r_evt->proto->registered_mtx);
 		hndl = KEY_FIND(r_evt->proto->registered_events_handlers,
 				hndl, evt_key);
-		if (hndl)
+		if (hndl) {
 			refcount_inc(&hndl->users);
-		mutex_unlock(&r_evt->proto->registered_mtx);
+			return hndl;
+		}
 	}
 
 	/* ...then amongst pending. */
-	if (!hndl) {
-		hndl = KEY_FIND(ni->pending_events_handlers, hndl, evt_key);
-		if (hndl)
-			refcount_inc(&hndl->users);
+	hndl = KEY_FIND(ni->pending_events_handlers, hndl, evt_key);
+	if (hndl) {
+		refcount_inc(&hndl->users);
+		return hndl;
 	}
 
-	/* Create if still not found and required */
-	if (!hndl && create) {
-		hndl = scmi_allocate_event_handler(ni, evt_key);
-		if (hndl && scmi_register_event_handler(ni, hndl)) {
-			dev_dbg(ni->handle->dev,
-				"purging UNKNOWN handler - key:%X\n",
-				hndl->key);
-			/* this hndl can be only a pending one */
-			scmi_put_handler_unlocked(ni, hndl);
-			hndl = ERR_PTR(-EINVAL);
-		}
+	if (!create)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * Create if still not found and required, new handlers are
+	 * created pending and transitioned to registered when bound to
+	 * an event.
+	 */
+	hndl = scmi_allocate_pending_event_handler(ni, evt_key);
+	if (!hndl)
+		return ERR_PTR(-ENOMEM);
+
+	ret = scmi_register_event_handler(ni, hndl);
+	if (ret) {
+		dev_dbg(ni->handle->dev,
+			"purging UNKNOWN handler - key:%X\n", hndl->key);
+		/* this hndl can be only a pending one */
+		scmi_put_handler_unlocked(ni, hndl);
+		return ERR_PTR(ret);
 	}
-	mutex_unlock(&ni->pending_mtx);
 
-	return hndl ?: ERR_PTR(-ENODEV);
+	return hndl;
 }
 
 static struct scmi_event_handler *
-- 
2.54.0


