Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E4606D828
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ATHF+1Ts;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rBSLJB1Y;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aRiIrpPw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JKolxPfs2a8bSX2DqJvUQa+PCSHGIcIstBSv6gvdo2s=; b=ATHF+1TsIERtAl
	ZiDRbICMNS2lXhIObbPxbKT0iaf9EBhLNaW5CiBED2LWVPgKYSS+ah9V88pZHBAp8ctG4B7v+BRjy
	LqfJIPGI6+9w7Oi54IgS8WB64MEXlRuf3vHwj0wuRM+bNFwc2DCiKf9AzumDYQsHk3kATKvs+5cks
	IGBC2M4NVzuj4AjcjJy1FIub7R/HXSVOZBtVVSzsAy945KAzluPhTFmQbfqR+KADfjo4lvcgpOL4P
	EZpPogMSlUXB9sfUN8i3Xw85aVfZMSBBrkHEHq71vOplwUeZRaN87fVjO0Y2wHclVCpqchckbdgw6
	1a/cCUxv1Tg4EVPltVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUF-00000000Cho-0Gnb;
	Mon, 09 Nov 2026 09:16:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLU8-00000000CXk-0UME
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 09:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JKolxPfs2a8bSX2DqJvUQa+PCSHGIcIstBSv6gvdo2s=; b=rBSLJB1YxDax4CBq0/mIULbVsO
	r7bKI3O21qL4m3gcXkdmI7Ux8Qv4yngQUuMH27seOBSh2P66AoAfzHMjcWOwyiDDB4iHYgcm/GMwG
	HiJbPgH3vUP+bZdohmJpxAW6Z2dyh0fsoa9foEgRW/84Yl0MpvIb8PWt1fOyIHEDEfdWCTOTesSNZ
	lNPI1+wpJ8xQaX6hsrny9IkY3SyjFhU+GrUUFfSrgq5GIvQXP3HBRuxh+hKrU8WKCk1pp7zvS/Daj
	vtzIgh4QoT6FR8DguazbXzAaH/KDQ4GRs5Xghymu1iw6tjhYpuVcDt9KiLsvxz40NXkdB4kZM0mkC
	QrjZ1hjg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTz-00000006VhB-21Nm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:16:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C51B15A1;
	Mon,  9 Nov 2026 01:16:03 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FF683F85F;
	Mon,  9 Nov 2026 01:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215766; bh=c18+QO+Wt2W0DVI5Po1rC7cH21ysnrIJfbvFcyIEI3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aRiIrpPw/sioVjKouN9nfeQxpuEESmiN8hW6wPtBuWG8he6ZnBL035cymfysPbHvR
	 g462cDENhUWVX1mCAPmeSvhcidYHNSE451JNUwUZfTUC/e9izCMrIJVN1vQDBygY0z
	 ywntJyIcp9yzxabvy38aAoQk+lof5rNRMpUfb9zw=
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
Subject: [PATCH v15 22/35] firmware: arm-scmi: Add Telemetry generic event support
Date: Mon,  9 Nov 2026 09:12:08 +0000
Message-ID: <20261109091221.2532706-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_091608_858431_BD27CE1E 
X-CRM114-Status: GOOD (  19.02  )
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

Add support to allow SCMI driver users to subscribe/unsubscribe to specific
Telemetry  abstract (non protocol) events.

This enables SCMI drivers to subscribe to available events by registering
an eventfd context that the core SCMI stack will use as a signalling
mechanisms. Still no real subscribable events introduced at this point.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - refacto resources cleanup
v11 --> v12
 - dropped eventfd_ctx_put on external ref
v10 --> v11
 - move events cleanup into resource_free
v8 --> v9
 - add a TLM_EVT_DUMMY placeholder (waiting for more events later on..)
---
 drivers/firmware/arm_scmi/telemetry.c | 96 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         | 16 +++++
 2 files changed, 112 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 2322348f98c9..ba17204bbfc4 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/eventfd.h>
 #include <linux/hash.h>
 #include <linux/hashtable.h>
 #include <linux/jhash.h>
@@ -565,6 +566,11 @@ enum de_state {
 	ENA_MAX
 };
 
+struct telemetry_event {
+	struct eventfd_ctx *ctx;
+	struct list_head item;
+};
+
 struct telemetry_info {
 	bool streaming_mode;
 	unsigned int num_shmti;
@@ -591,6 +597,9 @@ struct telemetry_info {
 	/* Protect global and per-group configuration data */
 	struct mutex config_mtx;
 	struct scmi_telemetry_info info;
+	/* Mutex to protect access to @events */
+	struct mutex events_mtx;
+	struct list_head events[SCMI_TLM_EVT_MAX];
 	struct notifier_block telemetry_nb;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
@@ -618,6 +627,21 @@ struct mutex *lock_for_payld(struct mutex *locks, unsigned long offset)
 	return &locks[hash_long(offset, PAYLD_HASH_BITS)];
 }
 
+static int scmi_telemetry_event_signal(struct telemetry_info *ti,
+				       enum scmi_telemetry_event type)
+{
+	struct telemetry_event *evt;
+
+	if (type >= SCMI_TLM_EVT_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&ti->events_mtx);
+	list_for_each_entry(evt, &ti->events[type], item)
+		eventfd_signal(evt->ctx);
+
+	return 0;
+}
+
 static inline void
 scmi_telemetry_de_state_update(struct telemetry_info *ti, enum de_state state,
 			       bool *current_state, const bool next_state)
@@ -4331,6 +4355,54 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 	return ret;
 }
 
+static int scmi_telemetry_event_subscribe(const struct scmi_protocol_handle *ph,
+					  enum scmi_telemetry_event type,
+					  struct eventfd_ctx *ctx)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct telemetry_event *evt;
+
+	if (type >= SCMI_TLM_EVT_MAX)
+		return -EINVAL;
+
+	evt = kzalloc_obj(*evt);
+	if (!evt)
+		return -ENOMEM;
+
+	evt->ctx = ctx;
+	guard(mutex)(&ti->events_mtx);
+	list_add(&evt->item, &ti->events[type]);
+
+	trace_scmi_tlm_access(0, "TLM_EVT_SUBS", 0, 0);
+
+	return 0;
+}
+
+static int scmi_telemetry_event_unsubscribe(const struct scmi_protocol_handle *ph,
+					    enum scmi_telemetry_event type,
+					    struct eventfd_ctx *ctx)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct telemetry_event *evt, *n;
+
+	if (type >= SCMI_TLM_EVT_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&ti->events_mtx);
+	list_for_each_entry_safe(evt, n, &ti->events[type], item) {
+		if (evt->ctx == ctx) {
+			list_del(&evt->item);
+			kfree(evt);
+
+			trace_scmi_tlm_access(0, "TLM_EVT_UNSUBS", 0, 0);
+
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -4342,6 +4414,8 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
 	.reset = scmi_telemetry_reset,
+	.event_subscribe = scmi_telemetry_event_subscribe,
+	.event_unsubscribe = scmi_telemetry_event_unsubscribe,
 };
 
 static bool
@@ -4702,10 +4776,28 @@ static void scmi_telemetry_groups_free(struct scmi_telemetry_res_info *rinfo)
 	}
 }
 
+static void scmi_telemetry_event_cleanup(struct telemetry_info *ti)
+{
+	guard(mutex)(&ti->events_mtx);
+	/* Clear any residual events */
+	for (int type = 0; type < SCMI_TLM_EVT_MAX; type++) {
+		struct telemetry_event *evt, *n;
+
+		list_for_each_entry_safe(evt, n, &ti->events[type], item) {
+			dev_warn(ti->ph->dev,
+				 "Found UN-SUBSCRIBED event type %d!\n", type);
+			list_del(&evt->item);
+			kfree(evt);
+		}
+	}
+}
+
 static void scmi_telemetry_instance_cleanup(void *arg)
 {
 	struct telemetry_info *ti = arg;
 
+	/* Cleanup any still registered event */
+	scmi_telemetry_event_cleanup(ti);
 	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
 	scmi_telemetry_uuids_cleanup(ti);
@@ -4858,6 +4950,10 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 		return ret;
 	}
 
+	for (int i = 0; i < SCMI_TLM_EVT_MAX; i++)
+		INIT_LIST_HEAD(&ti->events[i]);
+	mutex_init(&ti->events_mtx);
+
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 0b21c89d18f4..af882c1e4ea4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -12,6 +12,7 @@
 #include <linux/bitops.h>
 #include <linux/device-id/scmi.h>
 #include <linux/device.h>
+#include <linux/eventfd.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
@@ -1001,6 +1002,11 @@ struct scmi_telemetry_de_sample {
 	unsigned long long val;
 };
 
+enum scmi_telemetry_event {
+	SCMI_TLM_EVT_DUMMY,
+	SCMI_TLM_EVT_MAX,
+};
+
 /**
  * struct scmi_telemetry_proto_ops - represents the various operations provided
  *	by SCMI Telemetry Protocol
@@ -1025,6 +1031,10 @@ struct scmi_telemetry_de_sample {
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
  * @reset: reset configuration and telemetry data.
+ * @event_subscribe: subscribe to the specified event @type using the provided
+ *		     @eventfd_ctx.
+ * @event_unsubscribe: unsubscribe to the specified event @type the previously
+ *		       registered @eventfd_ctx.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
@@ -1052,6 +1062,12 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
 					   int grp_id, unsigned int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
+	int (*event_subscribe)(const struct scmi_protocol_handle *ph,
+			       enum scmi_telemetry_event type,
+			       struct eventfd_ctx *ctx);
+	int (*event_unsubscribe)(const struct scmi_protocol_handle *ph,
+				 enum scmi_telemetry_event type,
+				 struct eventfd_ctx *ctx);
 	int (*reset)(const struct scmi_protocol_handle *ph);
 };
 
-- 
2.54.0


