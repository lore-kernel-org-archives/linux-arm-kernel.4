Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE3606A339
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3vG3JdSV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VqRlz+lA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h/z+X7iEkKV49oF6OxaGD6WKtFLpZqWt61lF6Ja+o6Q=; b=3vG3JdSVD0Ygi9
	+cyPXs1dnUt9+cmckU8rY7+xDp3bj/LHrUO/dWfEuiPx8tyhytXhBwc6DRwGB5RMB76KpxKp8oOVR
	cJpOvgEtCLYGowzvLNUrTaqT2gsLfNlfQmRWNjxU2RBAKV0WFN2nCnpOPcmKJm4ih29sf4mzbvqLy
	6vfswClmjjMd2DCdeGrIMlr8qgzbBxoelmZAx1X8ymLJlDhGO7frSYH7Z21wGPUdYywEMWDoGmn68
	SXAU/7WFPGKKNFnUN/M2tTyI1EZfAB45Ib3LiL/MQ1dzneyLhXrtrsURW7morrTiHFSryfUdBxK1r
	UM/9GqbmlJ2TwWF/sAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLT8-00000000BJ4-48Th;
	Mon, 09 Nov 2026 09:15:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLT3-00000000BFP-45nb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:15:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD5FF14BF;
	Mon,  9 Nov 2026 01:15:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05EBF3F85F;
	Mon,  9 Nov 2026 01:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215708; bh=h7QGUUz5MSwC7hcc9IF0u/AdaY1xHifslTurPKhU3wE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VqRlz+lA/3GES/nPPFBj9cLsfnLf+Tjc+ADdXHyKprOzoiAM4K0e3gy77artmOhMa
	 A82OW/8z+V2b51q5tApJXTifcifA2Jf4J4fcmihAAEUi1ptB6dQAWfzgH/ij5tDapF
	 fOopE0NUhxUnu0aRZGIaudKqHFPSWgK/n3Ycpwxo=
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
Subject: [PATCH v15 04/35] firmware: arm_scmi: Allow registration of unknown-size events/reports
Date: Mon,  9 Nov 2026 09:11:50 +0000
Message-ID: <20261109091221.2532706-5-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011510_425014_114B1B7D 
X-CRM114-Status: GOOD (  18.52  )
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

Allow protocols to register events with build-time unknown sizes: such
events can be declared zero-sized and let the core SCMI stack perform the
needed safe-net boundary checks based on the configured transport size.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - better commenting
v12 --> v13
 - improve variable naming
v10 --> v11
 - account for ktime_t field when checking boundary
v2 --> v3
 - split out of previous patch on protocol notifier
 - use max() instead of max_t()
---
 drivers/firmware/arm_scmi/notify.c | 28 +++++++++++++++++++++++-----
 drivers/firmware/arm_scmi/notify.h |  8 ++++++--
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index bc046f2f83a6..a30589c9b377 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -595,7 +595,16 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
 	if (!r_evt)
 		return -EINVAL;
 
-	if (len > r_evt->evt->max_payld_sz) {
+	/*
+	 * Events with a zero max_payld_sz are sized to be of the maximum
+	 * size allowed by the transport: no need to be size-checked here
+	 * since the transport layer would have already dropped such
+	 * over-sized messages.
+	 * Note that, though, while this protects from buffer overruns, it is
+	 * no more possible at this layer of the stack to detect zero-sized
+	 * events corrupted by truncation.
+	 */
+	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
 		dev_err(handle->dev, "discard badly sized message\n");
 		return -EINVAL;
 	}
@@ -751,7 +760,7 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 				  const struct scmi_protocol_handle *ph,
 				  const struct scmi_protocol_events *ee)
 {
-	int i;
+	int i, max_msg_sz, default_report_sz;
 	unsigned int num_sources;
 	size_t payld_sz = 0;
 	struct scmi_registered_events_desc *pd;
@@ -766,6 +775,9 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	if (!ni)
 		return -ENOMEM;
 
+	max_msg_sz = ph->hops->get_max_msg_size(ph);
+	default_report_sz = max_msg_sz + sizeof(ktime_t);
+
 	/* num_sources cannot be <= 0 */
 	if (ee->num_sources) {
 		num_sources = ee->num_sources;
@@ -778,8 +790,13 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	}
 
 	evt = ee->evts;
-	for (i = 0; i < ee->num_events; i++)
-		payld_sz = max_t(size_t, payld_sz, evt[i].max_payld_sz);
+	for (i = 0; i < ee->num_events; i++) {
+		if (evt[i].max_payld_sz == 0) {
+			payld_sz = max_msg_sz;
+			break;
+		}
+		payld_sz = max(payld_sz, evt[i].max_payld_sz);
+	}
 	payld_sz += sizeof(struct scmi_event_header);
 
 	pd = scmi_allocate_registered_events_desc(ni, proto_id, ee->queue_sz,
@@ -805,7 +822,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 		mutex_init(&r_evt->sources_mtx);
 
 		r_evt->report = devm_kzalloc(ni->handle->dev,
-					     evt->max_report_sz, GFP_KERNEL);
+					     evt->max_report_sz ?: default_report_sz,
+					     GFP_KERNEL);
 		if (!r_evt->report)
 			return -ENOMEM;
 
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
index f18f98c5ab3b..ff4044fd7448 100644
--- a/drivers/firmware/arm_scmi/notify.h
+++ b/drivers/firmware/arm_scmi/notify.h
@@ -18,8 +18,12 @@
 /**
  * struct scmi_event  - Describes an event to be supported
  * @id: Event ID
- * @max_payld_sz: Max possible size for the payload of a notification message
- * @max_report_sz: Max possible size for the report of a notification message
+ * @max_payld_sz: Max possible size for the payload of a notification message.
+ *		  Set to zero to use the maximum message size allowed by the
+ *		  transport.
+ * @max_report_sz: Max possible size for the report of a notification message.
+ *		   Set to zero to use the maximum message size allowed by the
+ *		   transport plus the additional ktime_t timestamp.
  *
  * Each SCMI protocol, during its initialization phase, can describe the events
  * it wishes to support in a few struct scmi_event and pass them to the core
-- 
2.54.0


