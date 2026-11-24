Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AEA606A682
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iH77KBgF;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aR5LjR9Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o2e17lgClUL6FnN4PkSNyg+0+A+ZWeJi0pzpu2mZ/90=; b=iH77KBgF0iiGvf
	F9C9NHamizoQcggIi/ZRk65nNFAyHl3j+qRUrrCIEQZ1wMb1N9HnP6phsW3yM+WQicA0LrJJ6+/R3
	5jn9to4WoyK/oK+q32PI+0CPRlua6PF7+TVSlqXqanqma2T9bNwkUNi/Lyg7lzqTVOu14+EyJm47Q
	rLeCxDV583Xsrfie1sjS+i5iz3cLN+8qeJcztCQPpFQXlNsRh7BHUy6KiR5JkvD2rBw0pGC+VSy8S
	ydQF+yitMkCqrEppI4jTcWYiruAM6bLMrBIgD1HJWJLR1m56NE26lO4nUeD/zKRcRJ/M7hW2nJ3OS
	GlwreOLzQxyF9Cf+IBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwYo-00000007eIl-0XUA;
	Tue, 24 Nov 2026 19:52:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwXt-00000007dkp-20TY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:51:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9A8316F3;
	Tue, 24 Nov 2026 11:51:13 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9AC33F763;
	Tue, 24 Nov 2026 11:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549876; bh=BryguWDhx6sj/MVWpMUomWhwh0S4a+pxPzh6d2NC51o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aR5LjR9QEkODftp+RK+jYZAPajQIb4Gbr2IxXz7AoZpdA2uwISrYwa/WFC6X2JW20
	 lIKn5Gu9jzHSYvgN0sDJTfpa+PzFxZ57UpjJbpeBYQ1ZNae0BA1eaCoY7Que0FViiC
	 sYGBsRtWDWR6guKtWPKYpKttBzW5HD59RhphflO4=
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
Subject: [PATCH v17 19/34] firmware: arm_scmi: Add Telemetry global configuration support
Date: Tue, 24 Nov 2026 19:48:25 +0000
Message-ID: <20261124194841.1147072-20-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115117_592334_47899F73 
X-CRM114-Status: GOOD (  13.14  )
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

Add support to configure Telemetry globally by setting its enabled state
and the requested update interval.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v16 --> v17
 - avoid collection name clashes
 - rename update_interval_ms to ename update_interval
v15 --> v16
 - fix mode check logic
---
 drivers/firmware/arm_scmi/telemetry.c | 69 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         | 15 ++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 140ff1072b99..6e5564c36a2d 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -3087,12 +3087,81 @@ static int scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 					    de, sid, offset, uuid);
 }
 
+static int
+scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval,
+				    const enum scmi_telemetry_collection *mode)
+{
+	enum scmi_telemetry_collection *current_mode, next_mode;
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_msg_telemetry_config_set *msg;
+	bool tlm_enable, *current_state, is_group;
+	unsigned int *active_update_interval;
+	struct scmi_xfer *t;
+	__le32 interval;
+	u32 control;
+	int ret;
+
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	if (mode && (*mode != SCMI_TLM_COLLECTION_ONDEMAND))
+		return -EOPNOTSUPP;
+
+	is_group = res_id != SCMI_TLM_GRP_INVALID;
+	if (is_group)
+		return -EOPNOTSUPP;
+
+	active_update_interval = &ti->info.active_update_interval;
+	current_mode = &ti->info.current_mode;
+	current_state = &ti->info.enabled;
+
+	if (!enable && !update_interval && (!mode || *mode == *current_mode))
+		return 0;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
+				      sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	if (!update_interval)
+		interval = cpu_to_le32(*active_update_interval);
+	else
+		interval = cpu_to_le32(*update_interval);
+
+	tlm_enable = enable ? *enable : *current_state;
+	next_mode = mode ? *mode : *current_mode;
+
+	msg = t->tx.buf;
+	msg->group_identifier = cpu_to_le32(res_id);
+	control = tlm_enable ? TELEMETRY_ENABLE : 0;
+	control |= !is_group ? TELEMETRY_SET_SELECTOR_ALL : TELEMETRY_SET_SELECTOR_GROUP;
+	control |= TELEMETRY_MODE_SET(next_mode);
+	msg->control = cpu_to_le32(control);
+	msg->sampling_rate = interval;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		*current_mode = next_mode;
+		*current_state = tlm_enable;
+		ti->streaming_mode =
+			*current_mode == SCMI_TLM_COLLECTION_NOTIFICATION;
+		if (update_interval)
+			*active_update_interval = le32_to_cpu(interval);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
 	.res_get = scmi_telemetry_resources_get,
 	.state_get = scmi_telemetry_state_get,
 	.state_set = scmi_telemetry_state_set,
+	.collection_configure = scmi_telemetry_collection_configure,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index ad116978ed47..ba240c8595a8 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -888,6 +888,12 @@ enum scmi_telemetry_compo_type {
 #define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
 	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e) & GENMASK(4, 0)))
 
+enum scmi_telemetry_collection {
+	SCMI_TLM_COLLECTION_ONDEMAND,
+	SCMI_TLM_COLLECTION_NOTIFICATION,
+	SCMI_TLM_COLLECTION_SINGLE_READ,
+};
+
 #define SCMI_TLM_GRP_INVALID	0xFFFFFFFF
 
 struct scmi_telemetry_intervals {
@@ -959,6 +965,8 @@ struct scmi_telemetry_info {
 	struct scmi_telemetry_shmti_info **shmtis;
 	unsigned int num_uuids;
 	uuid_t * __rcu *uuids;
+	bool enabled;
+	enum scmi_telemetry_collection current_mode;
 };
 
 /**
@@ -972,6 +980,9 @@ struct scmi_telemetry_info {
  *	       cumulative state of all DEs. Global group state can be looked-up
  *	       directly from @scmi_telemetry_info via @info_get.
  * @state_set: enable/disable the specific DE or GROUP with or without timestamps.
+ * @collection_configure: choose a sampling rate and enable SHMTI/FC sampling
+ *			  for on demand collection via @de_data_read or async
+ *			  notificatioins for all the enabled DEs.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
@@ -987,6 +998,10 @@ struct scmi_telemetry_proto_ops {
 			 bool is_group, u32 id, const bool *enable,
 			 const bool *tstamp, u32 *sid, u32 *offset,
 			 uuid_t *uuid);
+	int (*collection_configure)(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval,
+				    const enum scmi_telemetry_collection *mode);
 };
 
 /**
-- 
2.54.0


