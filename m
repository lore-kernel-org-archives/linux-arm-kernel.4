Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875586082BF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mz0+BPH4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qewhcLt0;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HVA0vzZh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LN53KxwJcp+e0iigBabTk4OJFa7VUh+i1rnifoUJnh0=; b=mz0+BPH4KRGhD0
	sacWShO7kUCTDC7K0KhzI2EeEsJiE3UW4atTfasiT0S7pO6pXBm50/lJt6c2kKmrHx/QqZVH9T6JA
	94mDmWhHfzO3DpOMhHuyTp2okztsC/EjmK9JHV+KO3rZBihi+veiKl/ZoZeFR0REhGqBkNbamfyjB
	fLm/uacy17LbTssXI8RYHhB7su/B69O/SiDEdPAyHoSUb6PL4Yggs888Aj7Hb9M9+H/jPSqUrlPs0
	qgXQKyMlO3tsI+8g+aCyp4EwVuJIz4ldUmZrxkRNqiuCVsj3p0Tq72Vv9PtvuVHikg7eag7HcNq+p
	8eFNmHb6lP0+FccvnZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUF-00000000Ci6-1Gv5;
	Mon, 09 Nov 2026 09:16:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUA-00000000CbI-24Ti
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 09:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LN53KxwJcp+e0iigBabTk4OJFa7VUh+i1rnifoUJnh0=; b=qewhcLt027i1GE+qkFf5TCfmPt
	uUtAcXVpMkfGXRi4r9riqvJObQPdr7qnrxBTkzwXrNyASOeRmh01doI6404YQms4VN60ace5wzM8k
	2qXZDgSK9wJKXjIOa4bucPGo4BTJGLPW24C3TL6rDfOApNXN9NTrzcMpQOXXh2JM/J+HsZiH/WJ92
	7iRjYxZf8schiEORF5WwZFnpl3gwcVRrVTm+zJewuSYfdboHky5vhMuNlRRYnN6aV8h0boZOvZlmi
	DKKm6z/qAlBuNkUsNDjY3E8B91BQHkpSkag0TacGJXXktjGtg/6rQPPY4E/bjY5PfqrKqyZTJ0GJj
	L/0Gy4rw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLU5-00000006ViR-1akh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:16:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58E391691;
	Mon,  9 Nov 2026 01:16:07 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8299B3F85F;
	Mon,  9 Nov 2026 01:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215770; bh=qyjnB/W+RKokaSHcG6NDIctBtmeExEzZht95c6wSg4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVA0vzZhTpeEADwwEmms6QVL0C40g4/i9UcDCsM9TyIDASS1q3k7yxF5rRnW7ur7z
	 kJwIEQ9ArNxQIdFVzme0IeGJgkU4cYPbt8D5OjRN3kTaqQn8zNd4D2DBgtZsy70sRT
	 ZPbwQXZJ/GzCrLO7NEL1rfV048OaQoM0zJxVOZuA=
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
Subject: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation counter event
Date: Mon,  9 Nov 2026 09:12:09 +0000
Message-ID: <20261109091221.2532706-24-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_091615_648316_D6F0A890 
X-CRM114-Status: GOOD (  17.95  )
X-Spam-Score: -2.5 (--)
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

Add a per-instance generation counter to track configuration changes which
uses the common telemetry events framework.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - do NOT reset generation on RESET
v12 --> v13
 - update generation counter on do_xfer succcess even if failing to process
   response since the change hass been applied: this avoids state misalignment
v11 -->v12
 - reviewed generation counter update logic
v6 --> v7
 - use new Generic event mechanism based on EventFD instead of WaitQ
v5 --> v6
 - add relese semantic to the atomic set of the generation counter
 - use new eventfd_ctx common event logic
---
 drivers/firmware/arm_scmi/telemetry.c | 46 ++++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |  6 ++--
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index ba17204bbfc4..c21700bd1b43 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -18,6 +18,7 @@
 #include <linux/jhash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
+#include <linux/lockdep.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -30,6 +31,7 @@
 #include <linux/time.h>
 #include <linux/uuid.h>
 #include <linux/xarray.h>
+#include <linux/wait.h>
 
 #include "errors.h"
 #include "protocols.h"
@@ -40,6 +42,7 @@
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
+#define SCMI_TLM_GENERATION_ONE		(SCMI_TLM_GENERATION_INVALID + 1U)
 #define SCMI_TLM_TDCF_MAX_RETRIES	15
 #define SCMI_TLM_TDCF_RETRY_GAP_US	1234
 
@@ -821,6 +824,32 @@ scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
 	return 0;
 }
 
+static inline void __scmi_telemetry_generation_set(struct telemetry_info *ti,
+						   unsigned int new)
+{
+	int ret;
+
+	atomic_set_release(&ti->info.generation, new);
+
+	ret = scmi_telemetry_event_signal(ti, SCMI_TLM_EVT_GENERATION);
+	if (ret)
+		dev_warn_once(ti->ph->dev,
+			      "Could NOT signal telemetry event %d\n",
+			      SCMI_TLM_EVT_GENERATION);
+}
+
+static inline void scmi_telemetry_generation_update(struct telemetry_info *ti)
+{
+	unsigned int next;
+
+	lockdep_assert_held(&ti->config_mtx);
+
+	/* Wrap around skipping invalid generation 0 */
+	next = (atomic_read(&ti->info.generation) + 1) ?: SCMI_TLM_GENERATION_ONE;
+
+	__scmi_telemetry_generation_set(ti, next);
+}
+
 struct scmi_tlm_de_priv {
 	struct telemetry_info *ti;
 	void *next;
@@ -3386,6 +3415,9 @@ scmi_telemetry_remote_state_update_needed(struct telemetry_info *ti,
 						  is_group ? obj : NULL,
 						  !is_group ? obj : NULL);
 
+		/* A local change can have an impact anyway */
+		scmi_telemetry_generation_update(ti);
+
 		return false;
 	}
 
@@ -3495,6 +3527,8 @@ static int scmi_telemetry_tde_state_set(const struct scmi_protocol_handle *ph,
 			dev_err(ph->dev,
 				"Could NOT process DE ID 0x%08X state response - ret:%d\n",
 				tde->de.info->id, ret);
+
+		scmi_telemetry_generation_update(ti);
 	}
 
 	ph->xops->xfer_put(ph, t);
@@ -3545,6 +3579,8 @@ static int scmi_telemetry_group_state_set(const struct scmi_protocol_handle *ph,
 			dev_err(ph->dev,
 				"Could NOT process GROUP %u state response - ret:%d\n",
 				grp->info->grp_id, ret);
+
+		scmi_telemetry_generation_update(ti);
 	}
 
 	ph->xops->xfer_put(ph, t);
@@ -3705,6 +3741,9 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 
 	ph->xops->xfer_put(ph, t);
 
+	if (!ret)
+		scmi_telemetry_generation_update(ti);
+
 	return ret;
 }
 
@@ -4347,8 +4386,11 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 
 	put_unaligned_le32(0, t->tx.buf);
 	ret = ph->xops->do_xfer(ph, t);
-	if (!ret)
+	if (!ret) {
 		scmi_telemetry_local_resources_reset(ti);
+		/* Cumulative generation tick */
+		scmi_telemetry_generation_update(ti);
+	}
 
 	ph->xops->xfer_put(ph, t);
 
@@ -4954,6 +4996,8 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 		INIT_LIST_HEAD(&ti->events[i]);
 	mutex_init(&ti->events_mtx);
 
+	/* Generation counter init */
+	atomic_set(&ti->info.generation, SCMI_TLM_GENERATION_ONE);
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index af882c1e4ea4..585eb3a4684e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -895,6 +895,7 @@ enum scmi_telemetry_collection {
 	SCMI_TLM_SINGLE_READ,
 };
 
+#define SCMI_TLM_GENERATION_INVALID	0U
 #define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
 
 struct scmi_telemetry_intervals {
@@ -993,6 +994,7 @@ struct scmi_telemetry_info {
 	uuid_t * __rcu *uuids __counted_by_ptr(num_uuids);
 	bool enabled;
 	enum scmi_telemetry_collection current_mode;
+	atomic_t generation;
 };
 
 struct scmi_telemetry_de_sample {
@@ -1003,7 +1005,7 @@ struct scmi_telemetry_de_sample {
 };
 
 enum scmi_telemetry_event {
-	SCMI_TLM_EVT_DUMMY,
+	SCMI_TLM_EVT_GENERATION,
 	SCMI_TLM_EVT_MAX,
 };
 
@@ -1030,11 +1032,11 @@ enum scmi_telemetry_event {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
- * @reset: reset configuration and telemetry data.
  * @event_subscribe: subscribe to the specified event @type using the provided
  *		     @eventfd_ctx.
  * @event_unsubscribe: unsubscribe to the specified event @type the previously
  *		       registered @eventfd_ctx.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
-- 
2.54.0


