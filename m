Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F3606A339
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 23:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gVQIBHO+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SsGg4OLb;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XvaHRC4A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3IZ5qzRbl6w3s65pSH0LQA9SGE19s4V6UTDNQpB1bak=; b=gVQIBHO+VcAXSA
	1iQcrgFUqVpS1uJl5LMLHHq/9iMZN9QW1zWYM8BWuhPyRQWCRRvJ0YjrN82hYV8l/1d+CAyyvQlG2
	ShbVOqBtIycYoWcNeEeMKg3m0P2eKS76oeuoNYPeli8FUpu7n2PmhtUG8FKpZOJw5XV10eKAOhctr
	N2uSPLDBuQqS1C/4uz7kDNC8wf29QyRH4NV47PzQfk/PPFXhdAZQmNwNm2toWw/6y3LFob6z/gOE0
	Ja/oTltiWXdatwcjfzkjZ736L8Qp+9zQ1n57fyepfnNvI3enYzCGG65JK30CG9bzY+V+ghKjUZ3q8
	Jfm72Y4LICbkosg2UG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUulW-00000000WJV-488q;
	Sat, 21 Nov 2026 23:45:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUukw-00000000Vwi-0g9L
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 21 Nov 2026 23:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3IZ5qzRbl6w3s65pSH0LQA9SGE19s4V6UTDNQpB1bak=; b=SsGg4OLb4eV+INNqgiFybAKjuh
	ble6sa58Lno2FhUg2vnYVNgkZcnl6Qh+lklTcH4AXclkOcONXbM0RLXY2q3IJXQIVg5DpCy68RAL4
	VZ6ssQqBuNOWxopLn+PLRKviZuRzVvVMXC+KkGB4UV5luPFU0/0wxbzf0j1F5cazddL1NzetEsehS
	umz61s0X5LgUCC7unLoPz7+q5narHUxh1TAE/4dtURZar+p++PnnbxM1ieXiZ3MXbVura75FxVzWb
	AfChdyHBPc9wNODJ8iz0+iSM6/VzFMXH5oePNPqgXLlFu0LeZppNE8aiEqA/taGOlxq9GGSXGTGU1
	1spRexqA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuks-00000001tJY-4AcJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 23:44:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF2771758;
	Sat, 21 Nov 2026 15:44:22 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C948B3F632;
	Sat, 21 Nov 2026 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304665; bh=MX3fXyOyMVKF7IyP4JAm7nbCpFnreV3P/0dR623E7Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XvaHRC4AnmEZebl6QWyMYqUWLcQBOzBOE/SBlNDDtV9tvCPHgkKWXcl6jFlfjJvWo
	 bfGIH8VfMux4TqptY7BmFkpKejQ50Wy2E+6Q3d/IEXMUjpWP6mGwZW6C9hFL3jNNtX
	 4WvR05cESpPn7OmAa8EiEM7TOZhcyane5GK4wd8c=
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
Subject: [PATCH v16 19/31] firmware: arm_scmi: Add Telemetry Single/Bulk DEs reads
Date: Sat, 21 Nov 2026 23:39:53 +0000
Message-ID: <20261121234005.1525419-20-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_234427_231562_4B7D3A0B 
X-CRM114-Status: GOOD (  35.17  )
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

Add support for Telemetry operations needed to read DataEvent values and
timestamps as single entities or all together in a single bulk buffer.
The returned values are effectiely retrieved from the platform only
when strictly needed, i.e. when no fresh recent cached value was already
available.
The DataEvent values are fetched transparently from the platform origins
using the proper synchronization and consistency primitives, directly from
the SHMTIs areas or the FastChannels memory depending on the configuration.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v15 --> v16
 - removed SINGLE SAMPLE delayed response reads capabilities
 - removed groups references
 - check liveness in de_snapshot
 - add shmti_overflow check on snap
v14 --> v15
 - use IS_TDE_TS_LINE macro
 - use NOT IS_DATA_LINE in tdcf_de_payld_get
 - use better startm/endm initial markers in tdcf_de_payld_get
 - retry scmi_telemetry_tdcf_de_parse on error too
 - trigger resource enumeration also on de_data_read
 - skip unitialized FCs on reads and return -EPROTO
 - introduce localized single DE snapshot on single DE data read
 - widen tde->mtx locking in msg_payld_process
 - use unsigned int samples
 - better des_sample_get sanity checks
 - refactor msg_payld_process
v13 --> v14
 - report scmi_telemetry_line_data_parse errors
 - add traces for CACHED_DE_UPDATED
 - moved some definitions from earlier patches
 - using a less regular time interval for TDCF scan retries
 - renamed some fields to more strictly adhere to spec nomenclature
v12 --> v13
 - use new RAW macros in line_data_parse and check for line validity
 - handle PARTIAL_ERROR by logging and carrying on
 - relocate tde->mtx guards higher up and add lockdep assertions
 - better tdcf/eplg init within tde->mtx
 - do not cache tde->base between DE read retries
 - retry scan on payld sanity errors
v11 --> v12
 - using new TDCF_INVALID_MATCH_SEQ macro
 - reporting transient DATA_INVALID lines as -EINVAL
 - added cacheable param to msg_payld_process
v10 --> v11
 - split out and relocate unrelated code to previous patches
 - add TDE mutex_lock when getting payload address
 - check LINE_TYPE while parsing payloads
 - check overflows and boundary on single sample replies
v8 -->v9
 - Fix Sashiko reports for v8
   - check if TS supported on FC line before using it
   - check for unexpected shorter reply on sample_get
   - use non-LE accessors in msg_payld where appropriate
v7 --> v8
 - Fixes for some Sashiko issues on v7
  - added CACHED_DE_READ trace
  - reworked locking around line handling: blkts/uuid
v6 -->v7
 - usse proper le32 accesors, fix sparse warns
v5 --> v6
 - fixed some Sashiko review
 - add new macros parse TDCF-like content on regular ram (non IO)
 https://sashiko.dev/#/patchset/20260703123601.381275-1-cristian.marussi%40arm.com?part=10
   - fix retry loop in DE parse to avoid exiting on transient errors
   - use proper non-IO accessors for msg payld parsing
   - add msg payld boundary check
v4 --> v5
 - removed UAPI structures dependency
 - cleaned up sample_get logic around groups
 - fixes sparse warnings
v3 --> v4
 - fix typos in comments
 - extend TDE cache helpers with cache lookup routine and use cumulative
   scmi_telemetry_de_sample param
v2 --> v3
 - split from monolithic Telemetry patch
 - simplity using a few assignement using ternary ops
 - remove useless ts param from scanning function
 - use a compound literal to simplify samples init
 - add a missing __must_check on telemetry_ops
 - changed errno on DE read troubles:
   - ENODEV/ENOENT: DE is UNKNOWN
   - EINVAL: DE is marked as DATA_INVALID
   - ENODATA: TLM susbsystem or the specific DE is OFF
---
 drivers/firmware/arm_scmi/telemetry.c | 531 ++++++++++++++++++++++++--
 include/linux/scmi_protocol.h         |  24 ++
 2 files changed, 519 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 2c71c090588d..21fbd6a4578d 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -176,6 +176,11 @@ struct scmi_msg_telemetry_config_set {
 	__le32 sampling_rate;
 };
 
+struct scmi_msg_resp_telemetry_reading_complete {
+	__le32 num_dwords;
+	__le32 array[] __counted_by_le(num_dwords);
+};
+
 /* TDCF */
 
 #define _I(__a)		(ioread32((void __iomem *)(__a)))
@@ -383,6 +388,12 @@ struct tdcf {
 #define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))
 #define	TDCF_BAD_END_SEQ	GENMASK(31, 0)
 
+struct telemetry_de_snapshot {
+	u32 magic;
+	struct payload payld;
+	struct payload bts_payld;
+};
+
 struct telemetry_shmti;
 
 struct shmti_snap {
@@ -471,6 +482,7 @@ struct telemetry_de {
 	enum timestamps ts_type;
 	u32 ts_rate;
 	bool enumerated;
+	bool cached_msg;
 	void __iomem *base;
 	struct eplg __iomem *eplg;
 	u32 sid;
@@ -706,8 +718,9 @@ scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, const u32 magic)
 }
 
 static void
-scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
-				u64 *tstamp, const u32 *magic)
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				const u32 *magic)
 {
 	lockdep_assert_held(&tde->mtx);
 
@@ -719,10 +732,37 @@ scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
 		return;
 
 	tde->last_magic = magic ? *magic : TDCF_BAD_END_SEQ;
-	tde->last_val = val;
-	tde->last_ts = tstamp && scmi_tde_has_tstamp(tde) ? *tstamp : 0;
-	if (tstamp)
-		*tstamp = tde->last_ts;
+	tde->last_val = sample->val;
+	tde->last_ts = scmi_tde_has_tstamp(tde) ? sample->tstamp : 0;
+	/* Update returned value too */
+	sample->tstamp = tde->last_ts;
+
+	trace_scmi_tlm_collect(tde->last_ts, tde->de.info->id,
+			       tde->last_val, "CACHED_DE_UPDATED");
+}
+
+static int
+scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				u32 *magic)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	/*
+	 * Bailout without providing any sample when the cache is
+	 * stale, i.e. last_magic < *magic
+	 */
+	if (magic && scmi_telemetry_tde_cache_stale(tde, *magic))
+		return -EAGAIN;
+
+	sample->id = tde->de.info->id;
+	sample->val = tde->last_val;
+	sample->tstamp = tde->last_ts;
+
+	trace_scmi_tlm_collect(sample->tstamp, sample->id,
+			       sample->val, "CACHED_DE_READ");
+
+	return 0;
 }
 
 struct scmi_tlm_de_priv {
@@ -1977,45 +2017,45 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
 
 static inline int
 scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap,
-			       u64 *val, u64 *tstamp, struct payload *payld,
-			       struct payload *bts_payld, u32 magic)
+			       struct scmi_telemetry_de_sample *sample,
+			       struct payload *payld, struct payload *bts_payld,
+			       u32 magic)
 {
 	u32 meta = PAYLD_META_RAW(payld);
 
 	lockdep_assert_held(&tde->mtx);
 
 	/* Clear returned values in case of errors */
-	*val = 0;
-
-	if (tstamp) {
-		*tstamp = 0;
-		if (USE_BLK_TS_RAW(meta)) {
-			/* Read out the actual BLK_TS */
-			*tstamp = scmi_telemetry_blkts_read(magic, tde,
-							    bts_payld, snap);
-		} else if (LINE_TS_VALID_RAW(meta)) {
-			/*
-			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
-			 * the per DE line_ts_rate is advertised in the DE
-			 * descriptor, BUT we check anyway against buggy FW.
-			 */
-			if (!HAS_LINE_EXT_RAW(meta)) {
-				trace_scmi_tlm_access(tde->de.info->id,
-						      "SHMTI_BAD_TS_LINE", 0, 0);
-				return -EPROTO;
-			}
-
-			*tstamp = LINE_TSTAMP_GET_RAW(&payld->tsl);
+	sample->tstamp = 0;
+	sample->val = 0;
+
+	if (USE_BLK_TS_RAW(meta)) {
+		/* Read out the actual BLK_TS */
+		sample->tstamp = scmi_telemetry_blkts_read(magic, tde,
+							   bts_payld, snap);
+	} else if (LINE_TS_VALID_RAW(meta)) {
+		/*
+		 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
+		 * the per DE line_ts_rate is advertised in the DE
+		 * descriptor, BUT we check anyway against buggy FW.
+		 */
+		if (!HAS_LINE_EXT_RAW(meta)) {
+			trace_scmi_tlm_access(tde->de.info->id,
+					      "SHMTI_BAD_TS_LINE", 0, 0);
+			return -EPROTO;
 		}
+
+		sample->tstamp = LINE_TSTAMP_GET_RAW(&payld->tsl);
 	}
 
 	/* Data is always valid since we are NOT handling BLK TS lines here */
-	*val = LINE_DATA_GET_RAW(&payld->l);
+	sample->val = LINE_DATA_GET_RAW(&payld->l);
 
-	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
-			       *val, "SHMTI_DE_READ");
+	/* Trace originally read tstamp */
+	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id,
+			       sample->val, "SHMTI_DE_READ");
 
-	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
+	scmi_telemetry_tde_cache_update(tde, sample, &magic);
 
 	return 0;
 }
@@ -2121,10 +2161,10 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 					   struct telemetry_uuid *active_uuid)
 {
 	struct telemetry_shmti *shmti = snap->shmti;
+	struct scmi_telemetry_de_sample sample = {};
 	u32 meta = PAYLD_META_RAW(payld);
 	bool use_blk_ts = USE_BLK_TS_RAW(meta);
 	struct telemetry_de *tde;
-	u64 val, tstamp = 0;
 	u32 de_id;
 
 	de_id = PAYLD_ID_RAW(payld);
@@ -2208,8 +2248,7 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged by ignored.
 	 */
-	scmi_telemetry_line_data_parse(tde, snap, &val, &tstamp, payld, NULL,
-				       snap->magic);
+	scmi_telemetry_line_data_parse(tde, snap, &sample, payld, NULL, snap->magic);
 }
 
 /**
@@ -3113,6 +3152,424 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static inline int
+scmi_telemetry_de_data_fc_read(struct telemetry_de *tde,
+			       struct scmi_telemetry_de_sample *sample)
+{
+	struct fc_tsline __iomem *fc;
+
+	lockdep_assert_held(&tde->mtx);
+
+	/*
+	 * A FastChannel DE that was discovered as enabled at boot but later
+	 * failed to be enumerated cannot be accessed.
+	 */
+	if (!tde->base)
+		return -EPROTO;
+
+	fc = tde->base + tde->offset;
+	sample->val = LINE_DATA_GET(fc);
+	sample->tstamp = IS_TDE_TS_LINE(tde) ? LINE_TSTAMP_GET(fc) : 0;
+
+	/* Trace originally read tstamp */
+	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id, sample->val,
+			       "FC_READ");
+
+	/* Cache anyway since TDE caches are on the read path anyway */
+	scmi_telemetry_tde_cache_update(tde, sample, NULL);
+
+	return 0;
+}
+
+static void scmi_telemetry_scan_update(struct telemetry_info *ti)
+{
+	struct telemetry_de *tde;
+
+	/* Scan all SHMTIs ... */
+	for (int id = 0; id < ti->num_shmti; id++) {
+		int ret;
+
+		ret = scmi_telemetry_shmti_scan(ti, id, SCAN_LOOKUP);
+		if (ret)
+			dev_warn(ti->ph->dev,
+				 "Failed update-scan of SHMTI ID:%d - ret:%d\n",
+				 id, ret);
+	}
+
+	if (!ti->info.fc_support)
+		return;
+
+	/* Need to enumerate resources to access fastchannels */
+	ti->res_get(ti);
+	list_for_each_entry(tde, &ti->fcs_des, item) {
+		struct scmi_telemetry_de_sample sample = {};
+
+		guard(mutex)(&tde->mtx);
+		if (!tde->de.enabled)
+			continue;
+
+		/*
+		 * Only for the sake of updating TDE cache.
+		 * Ignoring errors deriving from malformed FCs.
+		 */
+		scmi_telemetry_de_data_fc_read(tde, &sample);
+	}
+}
+
+/*
+ * TDCF and TS Line Management Notes
+ * ---------------------------------
+ *
+ * TDCF Payload Metadata notable bits:
+ *  - Bit[3]: USE BLK Tstamp
+ *  - Bit[2]: Line-Extension Field present (LineTstamp)
+ *  - Bit[1]: Tstamp VALID
+ *  - Bit[0]: Data INVALID
+ *
+ * CASE_1:
+ * -------
+ *	+ A DE is enabled with timestamp disabled, so the TS fields are
+ *	  NOT present
+ *	  -> BIT[3:0] = 0000b
+ *
+ *	  - 1/A LINE_TSTAMP
+ *	  ------------------
+ *	     + that DE is then 're-enabled' with TS: so it was ON, it remains
+ *	       ON but using DE_CONFIGURE I now enabled also TS, so the
+ *	       platform relocates it at the end of the SHMTI and return the
+ *	       new offset
+ *	       -> BIT[3:0] = 0110b
+ *
+ *	  - 1/B BLK_TSTAMP
+ *	  ------------------
+ *	     + that DE is then 're-enabled' with BLK TS: so it was ON, it
+ *	       remains ON but using DE_CONFIGURE, we now also enabled the TS,
+ *	       so the platform will:
+ *	       - IF a preceding BLK_TS line exist (with same clk rate)
+ *	         it relocates the DE at the end of the SHMTI and return the
+ *	         new offset (if there is enough room, if not in another SHMTI)
+ *	       - IF a preceding BLK_TS line DOES NOT exist (with same clk rate)
+ *	         it creates a new BLK_TS line at the end of the SHMTI and then
+ *	         relocates the DE after the new BLK_TS and return the
+ *	         new offset (if there is enough room, if not in another SHMTI)
+ *	       -> BIT[3:1] = 1010b
+ *
+ *	+ the hole left from the relocated DE can be reused by the platform
+ *	to fit another equally sized DE. (i.e. without shuffling around any
+ *	other enabled DE, since that would cause a change of the known offset)
+ *	anyway it will be marked as:
+ *	-> BIT[3:0] = 0101b iff it was a LINE_TSTAMP
+ *	-> BIT[3:0] = 0001b iff it was a BLK_TSTAMP
+ *
+ * CASE_2:
+ * -------
+ *	+ A DE is enabled with LINE timestamp enabled, so the TS_Line is there
+ *	  -> BIT[3:0] = 0110b
+ *	+ that DE has its timestamp disabled: again, you can do this without
+ *	  disabling it fully but just disabling the TS, so now that TS_line
+ *	  fields are still physically there but NOT valid
+ *	  -> BIT[3:0] = 0100b
+ *	+ the hole from the timestamp remain there unused until
+ *		- you enable again the TS so the hole is used again
+ *		  -> BIT[3:0] = 0110b
+ *			OR
+ *		- you disable fully the DE and then re-enable it with the TS
+ *		  -> potentially CASE_1 the DE is relocated on enable
+ *	+ same kind of dynamic applies if the DE had a BLK_TS line
+ */
+static int scmi_telemetry_tdcf_de_payld_check(struct telemetry_de *tde,
+					      struct payload *payld)
+{
+	u32 meta = PAYLD_META_RAW(payld);
+
+	lockdep_assert_held(&tde->mtx);
+
+	if (DATA_INVALID_RAW(meta)) {
+		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "DE_DATA_INVALID", 0, 0);
+		return -EINVAL;
+	}
+
+	if (!IS_DATA_LINE_RAW(meta)) {
+		trace_scmi_tlm_access(tde->de.info->id, "BAD_DE_LINE_TYPE", 0, 0);
+		return -EPROTO;
+	}
+
+	if (PAYLD_ID_RAW(payld) != tde->de.info->id) {
+		trace_scmi_tlm_access(tde->de.info->id, "DE_ID_MISMATCH", 0, 0);
+		return -ENODEV;
+	}
+
+	/*
+	 * A valid line using BLK_TS should have been initialized with the
+	 * related BLK_TS when enabled, unless is a torn read.
+	 */
+	if ((USE_BLK_TS_RAW(meta) && !tde->bts)) {
+		trace_scmi_tlm_access(tde->de.info->id, "BAD_USE_BLK_TS", 0, 0);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int scmi_telemetry_de_snapshot(struct tdcf __iomem *tdcf,
+				      struct telemetry_de *tde,
+				      struct telemetry_de_snapshot *snap)
+{
+	int retries = SCMI_TLM_TDCF_MAX_RETRIES;
+	u32 startm, endm, live;
+	int err = 0;
+
+	lockdep_assert_held(&tde->mtx);
+
+	do {
+		struct payload __iomem *payld, *bts_payld;
+
+		/* A bit of exponential backoff between retries */
+		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * SCMI_TLM_TDCF_RETRY_GAP_US);
+
+		startm = TDCF_START_SEQ_GET(tdcf);
+		/* Build a default endm certainly different from startm */
+		endm = startm + 1;
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_BADSTART",
+					      startm, 0);
+			continue;
+		}
+
+		/*
+		 * In this context any anomaly detected on the payload could
+		 * due to a torn read, and it is worth retrying a snapshot.
+		 *
+		 * Note that TDE base/offset have been sanitized when
+		 * initialized and cannot have changed: accessing them here
+		 * is safe.
+		 */
+		payld = tde->base + tde->offset;
+		/* Sanitize length before snapshot */
+		if (scmi_telemetry_shmti_overflow(tde->eplg, payld))
+			continue;
+		memcpy_fromio(&snap->payld, payld, LINE_LENGTH_BYTES(payld));
+		err = scmi_telemetry_tdcf_de_payld_check(tde, &snap->payld);
+		if (err)
+			continue;
+
+		/*
+		 * Here the associated BLK_TS line, if any, has been verified
+		 * as sane when linked/bound: no need of further validation.
+		 */
+		if (tde->bts) {
+			bts_payld = tde->base + tde->bts->line.offset;
+			/* Sanitize length before snapshot */
+			if (scmi_telemetry_shmti_overflow(tde->eplg, bts_payld))
+				continue;
+			memcpy_fromio(&snap->bts_payld, bts_payld,
+				      LINE_LENGTH_BYTES(bts_payld));
+		}
+
+		/* Assure the snapshot has been fully taken before checking seqnum */
+		rmb();
+
+		/* Used to detect changes while copying */
+		live = TDCF_START_SEQ_GET(tdcf);
+
+		endm = TDCF_END_SEQ_GET(tde->eplg);
+		if (startm != endm || startm != live)
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_MISMATCH",
+					      startm, endm);
+	} while ((startm != endm || err) && --retries);
+
+	if (startm != endm || err) {
+		trace_scmi_tlm_access(tde->de.info->id,
+				      "TDCF_SNAPSHOT_DE_FAIL", startm, endm);
+		return err ?: -EPROTO;
+	}
+
+	/* Ensure any snapshot is visible before updating magic */
+	smp_store_release(&snap->magic, startm);
+
+	trace_scmi_tlm_access(tde->de.info->id, "TDCF_SNAPSHOT_DE_OK",
+			      startm, endm);
+
+	return 0;
+}
+
+static int
+scmi_telemetry_tdcf_de_sample_cached(struct tdcf __iomem *tdcf,
+				     struct telemetry_de *tde,
+				     struct scmi_telemetry_de_sample *sample)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	u32 startm;
+
+	/* If updating cannot be cached */
+	startm = TDCF_START_SEQ_GET(tdcf);
+	if (IS_BAD_START_SEQ(startm))
+		return -EAGAIN;
+
+	return scmi_telemetry_tde_cache_lookup(tde, sample, &startm);
+}
+
+/**
+ * scmi_telemetry_tdcf_de_parse  - Helper to read one SHMTI/DE
+ * @tde: A reference to the DE descriptor to read
+ * @sample: A reference to the sample used as a container for output
+ *
+ * This helper can be used to retrieve the data value of a SHMTI based DE
+ * and any related BLK_TS line: unless the values are found already available
+ * and up to date in the TDE cache, a limited snapshot of the involved lines
+ * is taken at first so that all the subsequent DE parsing and processing can
+ * happen on a stable in RAM copy.
+ *
+ * Taking a limited snapshot does not carry relevant overhead and has the
+ * benefit of allowing the reuse of the same RAM-baased data accessors used
+ * during a full scan and related full snapshot, instead of a set of dedicated
+ * __iomem helpers.
+ *
+ * NOTE that since each TDE has its own cache, which is accessed and updated
+ * both during a single DE read and while performing a bulk read, while
+ * caching consistency assures to provide always the 'freshest' value
+ * retrieved, mixing single and bulk reads can lead to the values produced by
+ * the bulk reads to contain 'fresher' late values derived from concurrent
+ * single DE reads: IOW mixing single and bulk reads can produce a set of bulk
+ * DEs values that are NOT all from the same moment in time.
+ *
+ * Moreover in general, since no assumption can be made about the TDCF sequence
+ * numbers across different SHMTIs and related optional DE timestamps, it is NOT
+ * possible to guarantee anyway that data values retrieved from DEs located in
+ * distinct SHMTIs areas comes from the same platform update cycle at all.
+ */
+static int
+scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
+			     struct scmi_telemetry_de_sample *sample)
+{
+	struct telemetry_de_snapshot snap = {};
+	struct tdcf __iomem *tdcf;
+	int ret;
+
+	lockdep_assert_held(&tde->mtx);
+
+	/*
+	 * TDEs can be relocated by platform only during enable phase,
+	 * thing that cannot happen until tde->mtx is released.
+	 */
+	tdcf = tde->base;
+	if (!tdcf)
+		return -ENODEV;
+
+	if (!scmi_telemetry_tdcf_de_sample_cached(tdcf, tde, sample))
+		return 0;
+
+	/* Attempt a localized DE snapshot: DATA_LINE + optionally BLK_TS */
+	ret = scmi_telemetry_de_snapshot(tdcf, tde, &snap);
+	if (ret)
+		return ret;
+
+	/* Now parse the stable line snapshot */
+	return scmi_telemetry_line_data_parse(tde, NULL, sample, &snap.payld,
+					      &snap.bts_payld, snap.magic);
+}
+
+static int scmi_telemetry_de_access(struct telemetry_de *tde,
+				    struct scmi_telemetry_de_sample *sample)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	if (!tde->de.fc_support)
+		return scmi_telemetry_tdcf_de_parse(tde, sample);
+
+	return scmi_telemetry_de_data_fc_read(tde, sample);
+}
+
+static int scmi_telemetry_de_collect(struct telemetry_info *ti,
+				     struct scmi_telemetry_de *de,
+				     struct scmi_telemetry_de_sample *sample)
+{
+	struct telemetry_de *tde = to_tde(de);
+
+	guard(mutex)(&tde->mtx);
+
+	if (!de->enabled)
+		return -ENODATA;
+
+	/*
+	 * DE readings returns cached values when:
+	 *  - DE data value was retrieved via notification/delayed_response
+	 */
+	if (tde->cached_msg)
+		return scmi_telemetry_tde_cache_lookup(tde, sample, NULL);
+
+	return scmi_telemetry_de_access(tde, sample);
+}
+
+static int scmi_telemetry_de_data_read(const struct scmi_protocol_handle *ph,
+				       struct scmi_telemetry_de_sample *sample)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_telemetry_de *de;
+
+	if (!ti->info.enabled || !sample)
+		return -ENODATA;
+
+	ti->res_get(ti);
+	de = xa_load(&ti->xa_des, sample->id);
+	if (!de)
+		return -ENOENT;
+
+	return scmi_telemetry_de_collect(ti, de, sample);
+}
+
+static int
+scmi_telemetry_samples_collect(struct telemetry_info *ti, int grp_id,
+			       unsigned int *num_samples,
+			       struct scmi_telemetry_de_sample *samples)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int max_samples;
+
+	if (grp_id != SCMI_TLM_GRP_INVALID)
+		return -EOPNOTSUPP;
+
+	max_samples = *num_samples;
+	*num_samples = 0;
+
+	rinfo = ti->res_get(ti);
+	for (int i = 0; i < rinfo->num_des; i++) {
+		struct telemetry_de *tde = to_tde(rinfo->des[i]);
+
+		guard(mutex)(&tde->mtx);
+
+		/* Skip disabled DEs */
+		if (!tde->de.enabled)
+			continue;
+
+		/* Must be checked here to skip disabled and non selected */
+		if (*num_samples == max_samples)
+			return -ENOSPC;
+
+		/* Note that this cannot fail when passing a NULL magic */
+		scmi_telemetry_tde_cache_lookup(tde, &samples[(*num_samples)++], NULL);
+	}
+
+	return 0;
+}
+
+static int scmi_telemetry_des_bulk_read(const struct scmi_protocol_handle *ph,
+					int grp_id, unsigned int *num_samples,
+					struct scmi_telemetry_de_sample *samples)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	if (!ti->info.enabled || !num_samples || !samples)
+		return -EINVAL;
+
+	/* Trigger a full SHMTIs & FCs scan */
+	scmi_telemetry_scan_update(ti);
+
+	/* Collect all last cached values */
+	return scmi_telemetry_samples_collect(ti, grp_id, num_samples, samples);
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -3120,6 +3577,8 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.state_get = scmi_telemetry_state_get,
 	.state_set = scmi_telemetry_state_set,
 	.collection_configure = scmi_telemetry_collection_configure,
+	.de_data_read = scmi_telemetry_de_data_read,
+	.des_bulk_read = scmi_telemetry_des_bulk_read,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 9a1257185309..a2f46167883d 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -969,6 +969,13 @@ struct scmi_telemetry_info {
 	enum scmi_telemetry_collection current_mode;
 };
 
+struct scmi_telemetry_de_sample {
+	unsigned int id;
+	unsigned int pad;
+	unsigned long long tstamp;
+	unsigned long long val;
+};
+
 /**
  * struct scmi_telemetry_proto_ops - represents the various operations provided
  *	by SCMI Telemetry Protocol
@@ -983,6 +990,15 @@ struct scmi_telemetry_info {
  * @collection_configure: choose a sampling rate and enable SHMTI/FC sampling
  *			  for on demand collection via @de_data_read or async
  *			  notificatioins for all the enabled DEs.
+ * @de_data_read: on-demand read of a single DE and related optional timestamp:
+ *		  the value will be retrieved at the proper SHMTI offset OR
+ *		  from the dedicated FC area (if supported by that DE).
+ * @des_bulk_read: on-demand read of all the currently enabled DEs, or just
+ *		   the ones belonging to a specific group when provided.
+ * @des_sample_get: on-demand read of all the currently enabled DEs, or just
+ *		    the ones belonging to a specific group when provided.
+ *		    This causes an immediate update platform-side of all the
+ *		    enabled DEs.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
@@ -1002,6 +1018,14 @@ struct scmi_telemetry_proto_ops {
 				    unsigned int res_id, const bool *enable,
 				    const unsigned int *update_interval_ms,
 				    const enum scmi_telemetry_collection *mode);
+	int __must_check (*de_data_read)(const struct scmi_protocol_handle *ph,
+					 struct scmi_telemetry_de_sample *sample);
+	int __must_check (*des_bulk_read)(const struct scmi_protocol_handle *ph,
+					  int grp_id, unsigned int *num_samples,
+					  struct scmi_telemetry_de_sample *samples);
+	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
+					   int grp_id, unsigned int *num_samples,
+					   struct scmi_telemetry_de_sample *samples);
 };
 
 /**
-- 
2.54.0


