Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D5A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 23:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gXcK/KMZ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zfrhk0pu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FQsmtXBpj9g7Vc2MnK1s/XKa2XQ1wGnZHAswBU4OXjc=; b=gXcK/KMZ3GKVCY
	ENPy3wym6EAVef8At+hqQexmXSiBscr+F57IwNlU2fN2vWeNGEvgEopAxdPDlhI84Iv12p6EwfrWT
	DasG/LMtQSK7XSSioFffXz3TiBzgNtSuEUVqz72dG727LMV0hBSfzI0Z+q1GhvUkPwO59df+zKcnV
	Mh42pYQxOnkdBp77d6yZWM13KpBGJKjl1j3igvsLL/V2wwzWKTISOYoxBtpo49211DDlSZBkPHwvl
	ewhqBomK/AGG3UOGtKgqPumIfN22GuUHcY7Kb98L8CC4jK0Dc6lFHeJEoL0xrXEVdHtvfgbJ5cBMY
	Q43HI/jkCijMbESYQYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUulX-00000000WKY-2lCt;
	Sat, 21 Nov 2026 23:45:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUukv-00000000Vmw-2Kqm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 23:44:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA2EB16F2;
	Sat, 21 Nov 2026 15:44:25 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E228F3FA21;
	Sat, 21 Nov 2026 15:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304668; bh=6NA3IHW0zaPrOvgsZWpIC6A/H3nptBWjkmO2buyDTig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zfrhk0pu+AFEzqdKfXWiEcyAkAqlSitR35SyWsNIGGSd+X7mozDWyFKwyxEO8nsgr
	 cYvjuJ0cI64LYolBOp+v5gO4P/DUh8VVJoy4DRM+FRrNKLE3bFHbFosCFqw+RsJUgz
	 S6NRqPhPY6NwitB9Wba6PoH9bit6Eby+3xbmV+0E=
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
Subject: [PATCH v16 20/31] firmware: arm_scmi: Add Telemetry boot-on support
Date: Sat, 21 Nov 2026 23:39:54 +0000
Message-ID: <20261121234005.1525419-21-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_154430_257864_E6E11ED1 
X-CRM114-Status: GOOD (  28.18  )
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

Add the initialization and discovery logic needed to detect when the
platform SCMI server is configured with telemetry enabled at boot and
perform all the needed resource enumerations to keep the kernel telemetry
subsystem state aligned with the platform boot-on configurations.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v15 --> 16
 - removed group support at boot-on
 - discard DE/FC at enumeration time that were found in SHMTI at boot
 -  align DE local/global TS state after enumeration
v14 --> v15
 - use IS_TDE_TS_ macro
 - retrieve collection_mode at boot-on and force ignore groups
 - count only successfully initialized groups at boot-on
v13 --> v14
 - moved some definitions from earlier split patch
 - renamed some fields to more strictly adhere to spec nomenclature
v12 --> v13
 - greb tde->mtx on DE_ENABLED_LIST
v11 --> v12
 - fixed TS_RATE determination at boot-on
v10 --> v11
 - fix non-conformancy on CONFIG_GET when groups NON configurable
 - use SCAN_UPDATE also on BOOT-ON initial scan (NO discovery)
 - avoid 'naked' ti->rinfo accesses
v8 -- > v9
 - remove useless initial state lookup after RESET
 - properly set de->tstamp_support on DE_ENABLED_LIST
v5 --> v6
 - reporte properly an error on scmi_telemetry_config_lookup() failure
   (Sashiko)
v4 --> v5
 - use renamed grp_id instead of old id in group descriptors
 - fixes sparse warnings
v3 --> v4
 - bail-out FW_BUG errors
 - fix typos in comments
 - track boot-on Telemetry DE states
v2 --> v3
 - split from monolithic telemetry protocol patch
 - swap logic in scmi_telemetry_initial_state_lookup
---
 drivers/firmware/arm_scmi/telemetry.c | 283 +++++++++++++++++++++++++-
 1 file changed, 277 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 21fbd6a4578d..b74371bc41d5 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -133,6 +133,21 @@ struct scmi_msg_resp_telemetry_update_intervals {
 	__le32 intervals[];
 };
 
+struct scmi_msg_telemetry_de_enabled_list {
+	__le32 index;
+	__le32 flags;
+};
+
+struct scmi_enabled_de_desc {
+	__le32 id;
+	__le32 mode;
+};
+
+struct scmi_msg_resp_telemetry_de_enabled_list {
+	__le32 flags;
+	struct scmi_enabled_de_desc array[];
+};
+
 struct scmi_msg_telemetry_de_configure {
 	__le32 identifier;
 	__le32 flags;
@@ -181,6 +196,20 @@ struct scmi_msg_resp_telemetry_reading_complete {
 	__le32 array[] __counted_by_le(num_dwords);
 };
 
+struct scmi_msg_telemetry_config_get {
+	__le32 group_identifier;
+	__le32 flags;
+#define TELEMETRY_GET_SELECTOR(x)	(FIELD_PREP(GENMASK(3, 0), (x)))
+#define	TELEMETRY_GET_SELECTOR_ORPHANS	TELEMETRY_GET_SELECTOR(TLM_ORPHANS)
+#define	TELEMETRY_GET_SELECTOR_GROUP	TELEMETRY_GET_SELECTOR(TLM_GROUP)
+#define	TELEMETRY_GET_SELECTOR_ALL	TELEMETRY_GET_SELECTOR(TLM_ALL)
+};
+
+struct scmi_msg_resp_telemetry_config_get {
+	__le32 control;
+	__le32 sampling_rate;
+};
+
 /* TDCF */
 
 #define _I(__a)		(ioread32((void __iomem *)(__a)))
@@ -509,6 +538,8 @@ static inline bool scmi_tde_has_tstamp(struct telemetry_de *t)
 	return t->de.tstamp_support && t->de.tstamp_enabled;
 }
 
+#define DE_ENABLED_WITH_TSTAMP	2
+
 enum de_state {
 	ENA_STATE,
 	ENA_TSTAMP,
@@ -911,6 +942,7 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 {
 	const struct scmi_de_desc *desc = *next;
 	size_t payld_sz = sizeof(*desc);
+	bool fc_support;
 
 	lockdep_assert_held(&tde->mtx);
 
@@ -929,7 +961,7 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 	tde->de.info->persistent = IS_PERSISTENT(desc);
 	tde->ts_type = TSTAMP_SUPPORT(desc);
 	tde->de.tstamp_support = !!tde->ts_type;
-	tde->de.fc_support = IS_FC_SUPPORTED(desc);
+	fc_support = IS_FC_SUPPORTED(desc);
 	tde->de.name_support = IS_NAME_SUPPORTED(desc);
 	/* Update DE_DESCRIPTOR size for the next iteration */
 	*next += sizeof(*desc);
@@ -938,6 +970,10 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 	if (*rx_len < payld_sz)
 		return -ENOSPC;
 
+	/* Was already discovered as a SHMTI-based DE ? */
+	if (fc_support && tde->base)
+		return -EPROTO;
+
 	if (IS_TDE_TS_LINE(tde)) {
 		__le32 *line_ts_rate = *next;
 
@@ -946,15 +982,20 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 		/* Variably sized depending on TS support */
 		*next += sizeof(*line_ts_rate);
 	} else if (IS_TDE_TS_BLK(tde)) {
-		/* Setup default BLK TS value at first */
-		tde->de.info->ts_rate = ti->default_blk_ts_rate;
+		/*
+		 * Setup default BLK TS rate value at first, if it has NOT
+		 * already been picked from the BLK_TS line by the boot-on
+		 * SCAN_UPDATE.
+		 */
+		if (!tde->de.info->ts_rate)
+			tde->de.info->ts_rate = ti->default_blk_ts_rate;
 	} else if (!IS_TDE_TS_NONE(tde)) {
 		dev_warn(ti->ph->dev,
 			 "Unknown TDE timestamp type %u\n", tde->ts_type);
 		return -EPROTO;
 	}
 
-	if (tde->de.fc_support) {
+	if (fc_support) {
 		struct de_desc_fastchannel *dfc;
 		phys_addr_t phys_addr;
 		void __iomem *addr;
@@ -985,6 +1026,7 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 		tde->base = addr;
 		tde->offset = 0;
 		tde->fc_size = size;
+		tde->de.fc_support = fc_support;
 
 		/* Variably sized depending on FC support */
 		*next += sizeof(*dfc);
@@ -1067,6 +1109,11 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 		}
 	}
 
+	/* TS is NOT supported clear any enabled state possibly at boot-on */
+	if (!tde->de.tstamp_support)
+		scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+					       &tde->de.tstamp_enabled, false);
+
 	/* Count timestamped DEs */
 	ti->num_des_tstamp += !!tde->de.tstamp_support;
 
@@ -1079,6 +1126,216 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int scmi_telemetry_config_lookup(struct telemetry_info *ti,
+					unsigned int grp_id, bool *enabled,
+					unsigned int *active_update_interval,
+					enum scmi_telemetry_collection *mode,
+					bool ignore_groups)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_msg_telemetry_config_get *msg;
+	struct scmi_msg_resp_telemetry_config_get *resp;
+	bool is_group = grp_id != SCMI_TLM_GRP_INVALID;
+	struct scmi_xfer *t;
+	u32 flags;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_GET,
+				      sizeof(*msg), sizeof(*resp), &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->group_identifier = cpu_to_le32(grp_id);
+
+	/* Spec mandates the ALL selector when per-group config not available */
+	if (!ti->info.per_group_config_support || ignore_groups)
+		flags = TELEMETRY_GET_SELECTOR_ALL;
+	else
+		flags = !is_group ? TELEMETRY_GET_SELECTOR_ORPHANS :
+			TELEMETRY_GET_SELECTOR_GROUP;
+
+	msg->flags = cpu_to_le32(flags);
+
+	resp = t->rx.buf;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		*enabled = le32_get_bits(resp->control, TELEMETRY_ENABLE);
+		*mode = le32_get_bits(resp->control, TELEMETRY_MODE);
+		if (!is_group)
+			ti->streaming_mode = *mode == SCMI_TLM_NOTIFICATION;
+		*active_update_interval =
+			SCMI_TLM_GET_UPDATE_INTERVAL(le32_to_cpu(resp->sampling_rate));
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static void iter_enabled_list_prepare_message(void *message,
+					      unsigned int desc_index,
+					      const void *priv)
+{
+	struct scmi_msg_telemetry_de_enabled_list *msg = message;
+
+	msg->index = cpu_to_le32(desc_index);
+	msg->flags = 0;
+}
+
+static int iter_enabled_list_update_state(struct scmi_iterator_state *st,
+					  const void *response, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_de_enabled_list *r = response;
+
+	st->num_returned = le32_get_bits(r->flags, GENMASK(15, 0));
+	st->num_remaining = le32_get_bits(r->flags, GENMASK(31, 16));
+
+	if (st->rx_len < (sizeof(*r) + sizeof(r->array[0]) * st->num_returned))
+		return -EINVAL;
+
+	/*
+	 * total enabled is not declared previously anywhere so we
+	 * assume it's returned+remaining on first call.
+	 */
+	if (!st->max_resources)
+		st->max_resources = st->num_returned + st->num_remaining;
+
+	return 0;
+}
+
+static int
+iter_enabled_list_process_response(const struct scmi_protocol_handle *ph,
+				   const void *response,
+				   struct scmi_iterator_state *st, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_de_enabled_list *r = response;
+	const struct scmi_enabled_de_desc *desc;
+	struct telemetry_info *ti = priv;
+	struct telemetry_de *tde;
+	u32 de_id;
+	int ret;
+
+	desc = &r->array[st->loop_idx];
+	de_id = le32_to_cpu(desc->id);
+	if (scmi_telemetry_tde_lookup(ti, de_id)) {
+		dev_err(ph->dev,
+			"Found INVALID DE with DUPLICATED ID:0x%08X\n", de_id);
+		return -EINVAL;
+	}
+
+	tde = scmi_telemetry_tde_get(ti, de_id);
+	if (IS_ERR(tde))
+		return PTR_ERR(tde);
+
+	guard(mutex)(&tde->mtx);
+	tde->de.info->id = de_id;
+	tde->de.enabled = true;
+	tde->de.tstamp_enabled = le32_to_cpu(desc->mode) == DE_ENABLED_WITH_TSTAMP;
+	/*
+	 * Guessing that, if a DE is reported as enabled with timestamp, it has
+	 * to support timestamp: NOTE THAT the timestamp type (tde->ts_type) can
+	 * ONLY be discovered later by  DE_DESCRIPTION.
+	 */
+	tde->de.tstamp_support = tde->de.tstamp_enabled;
+
+	ret = scmi_telemetry_tde_register(ti, tde);
+	if (ret) {
+		scmi_telemetry_free_tde_put(ti, tde);
+		return ret;
+	}
+
+	scmi_telemetry_de_state_update(ti, ENA_STATE, NULL, true);
+	if (tde->de.tstamp_enabled)
+		scmi_telemetry_de_state_update(ti, ENA_TSTAMP, NULL, true);
+
+	dev_dbg(ph->dev, "Registered new ENABLED DE with ID:0x%08X\n",
+		tde->de.info->id);
+
+	return 0;
+}
+
+static int scmi_telemetry_enumerate_des_enabled_list(struct telemetry_info *ti)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_telemetry_res_info *rinfo;
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_enabled_list_prepare_message,
+		.update_state = iter_enabled_list_update_state,
+		.process_response = iter_enabled_list_process_response,
+	};
+	void *iter;
+	int ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, 0,
+					    TELEMETRY_DE_ENABLED_LIST,
+					    sizeof(u32) * 2, ti);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	ret = ph->hops->iter_response_run(iter);
+	if (ret)
+		return ret;
+
+	/* Get rinfo as it is...without triggering an enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+
+	dev_info(ti->ph->dev, "Found %u enabled DEs.\n", rinfo->num_des);
+
+	return 0;
+}
+
+static int scmi_telemetry_initial_state_lookup(struct telemetry_info *ti)
+{
+	struct device *dev = ti->ph->dev;
+	int ret;
+
+	/* Discover the initial state ONLY for DEs, ignoring groups */
+	ret = scmi_telemetry_config_lookup(ti, SCMI_TLM_GRP_INVALID,
+					   &ti->info.enabled,
+					   &ti->info.active_update_interval,
+					   &ti->info.current_mode, true);
+	if (ret)
+		return ret;
+
+	if (!ti->info.enabled)
+		return 0;
+
+	/*
+	 * When Telemetry is found already enabled on the platform, proceed with
+	 * passive discovery using DE_ENABLED_LIST and TDCF scanning: note that
+	 * this CAN only discover DEs exposed via SHMTIs.
+	 * FastChannel DEs need a proper DE_DESCRIPTION enumeration, while, even
+	 * though incoming Notifications could be used for passive discovery too,
+	 * it would carry a considerable risk of assimilating trash as DEs.
+	 */
+	dev_info(dev,
+		 "Telemetry found enabled with update interval %lux10^%d mode:%u\n",
+		 SCMI_TLM_GET_UPDATE_INTERVAL_SECS(ti->info.active_update_interval),
+		 SCMI_TLM_GET_UPDATE_INTERVAL_EXP(ti->info.active_update_interval),
+		 ti->info.current_mode);
+	/*
+	 * Query enabled DEs list: collect states. It will include DEs from any
+	 * interface. Enabled groups still NOT enumerated.
+	 */
+	ret = scmi_telemetry_enumerate_des_enabled_list(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot query enabled DE list. Abort.\n");
+		return ret;
+	}
+
+	/* Discover DEs on SHMTis: collect states/offsets/values */
+	for (int id = 0; id < ti->num_shmti; id++) {
+		ret = scmi_telemetry_shmti_scan(ti, id, SCAN_UPDATE);
+		if (ret)
+			dev_warn(dev,
+				 "Failed discovery-scan of SHMTI ID:%d - ret:%d\n",
+				 id, ret);
+	}
+
+	return 0;
+}
+
 static void scmi_telemetry_tdes_cleanup(void *arg)
 {
 	struct telemetry_info *ti = arg;
@@ -2217,9 +2474,17 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 
 		trace_scmi_tlm_access(de_id, "DE_LOCATION_UPDATED", 0, 0);
 
+		/* Just in case it was passively discovered boot-on */
+		if (IS_TDE_TS_NONE(tde)) {
+			if (use_blk_ts)
+				tde->ts_type = TSTAMP_BLK;
+			else if (LINE_TS_VALID_RAW(meta))
+				tde->ts_type = TSTAMP_LINE;
+		}
+
 		dev_dbg(ti->ph->dev,
-			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u\n",
-			tde->de.info->id, tde->base, tde->offset);
+			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u  ts_type:%d\n",
+			tde->de.info->id, tde->base, tde->offset, tde->ts_type);
 	}
 
 	/*
@@ -3918,6 +4183,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		return ret;
 	}
 
+	ret = scmi_telemetry_initial_state_lookup(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot retrieve initial state. Abort.\n");
+		return ret;
+	}
+
 	ti->info.base.version = ph->version;
 
 	return ph->set_priv(ph, ti);
-- 
2.54.0


