Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50535606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 23:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RPhBvnB1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ci+YK6wm;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ts21B2lR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1ks1qtON9t7AUvsQWNFxu5MU0gY/VQveKsMo3JPBMgg=; b=RPhBvnB1i1jfUZ
	ImDW//Xy9L6gTU1C2T32q+AKPrxNUWZToGVMrMkul2DjD8pWXgwUWF67JSRzFqCQHItmNp8hgTDal
	PWaOif/o4zehNtzjbToai/KGDFb7qUDcFnZrnUoXTF5EaCMQyYtshU0JwmU6KYtM+0q50adja6py8
	PDBt3Rqi+13KFS4DWjUYf2pdaEWln6bfonyGzKUGxyxu9BTS9XwJ9xVuVw2vtEs5k9tkXIwrEah+U
	YC1weghOUChiE/rmiCNYX3ThJmQFWEHGNcDT/4QKKmq+lNROqSaryY4RouG+daZO1NuK7NpXIIG1u
	5Eq2/uinXiT9KH2vMYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUulW-00000000WHy-11WH;
	Sat, 21 Nov 2026 23:45:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuks-00000000VtF-2NoZ
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 21 Nov 2026 23:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1ks1qtON9t7AUvsQWNFxu5MU0gY/VQveKsMo3JPBMgg=; b=ci+YK6wmPCelk/dT5oFmnyEpee
	yvwsmeIszOgUjDmIlMLCmmWDiKDZzWTBm4ePwlOpbQHaZWAOfCp9w0dX9zqGdjHkPorzEI8eP/KjZ
	XB7Gjph6tqXzpZLNgwUFX2ozvllVbRoAi1/F+qFKGSE79LuO2YxBu03mHAc1st+gDrCffoLPjoTaq
	8RRE/++vwxCeJuHahKgSb/dK4b2T8c2qJWHnhXsiO4FrTXoaA4ny7heZ67jUrHgIwsUembEGDAPE6
	mf7wOh6u0Zd+0QL7T0F3YF4hl8R47Iw/AX3ntb7U64QGrqSrpS4wp4vQI1wkyfGm3t+FNEXe3Vuhr
	TosxkYgg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUukp-00000001tJY-3R3S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 23:44:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9573516F2;
	Sat, 21 Nov 2026 15:44:19 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A81603F632;
	Sat, 21 Nov 2026 15:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304662; bh=7ASed0irKhbquWxwateY6WQZIArl0OMm5dYsGNK5iXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ts21B2lRNxp91M7iItVxv+6S68+hgws6nU5xhSaKtBgp33J+BG8I3M+vdnj/hRLJ8
	 W1YYNSC/tcae94V33I/bjpLIhjKdHrcTw77XK5OK44NSouB4RkqSwYZHcz7di3Uvy0
	 nfvk+P8opgya5EbYFYb12zWFCmrICRs7Bj0zAlFs=
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
Subject: [PATCH v16 18/31] firmware: arm_scmi: Add Telemetry global configuration support
Date: Sat, 21 Nov 2026 23:39:52 +0000
Message-ID: <20261121234005.1525419-19-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_234424_017560_602EDD17 
X-CRM114-Status: GOOD (  13.46  )
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

Add support to configure Telemetry globally by setting its enabled state
and the requested update interval.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v15 --> v16
 - fix mode check logic
---
 drivers/firmware/arm_scmi/telemetry.c | 68 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         | 15 ++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 1453adee393c..2c71c090588d 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -3046,12 +3046,80 @@ static int scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int
+scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval_ms,
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
+	if (mode && (*mode != SCMI_TLM_ONDEMAND))
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
+	if (!enable && !update_interval_ms && (!mode || *mode == *current_mode))
+		return 0;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
+				      sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	if (!update_interval_ms)
+		interval = cpu_to_le32(*active_update_interval);
+	else
+		interval = cpu_to_le32(*update_interval_ms);
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
+		ti->streaming_mode = *current_mode == SCMI_TLM_NOTIFICATION;
+		if (update_interval_ms)
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
index c111b8ff87db..9a1257185309 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -888,6 +888,12 @@ enum scmi_telemetry_compo_type {
 #define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
 	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
 
+enum scmi_telemetry_collection {
+	SCMI_TLM_ONDEMAND,
+	SCMI_TLM_NOTIFICATION,
+	SCMI_TLM_SINGLE_READ,
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
+				    const unsigned int *update_interval_ms,
+				    const enum scmi_telemetry_collection *mode);
 };
 
 /**
-- 
2.54.0


