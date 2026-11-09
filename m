Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3485606D835
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oa2ugjHM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=goKfGLPl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=82eZb7t1z4kOPyvrZdssu1fzfdK50ylIaZ70lT5yRG4=; b=oa2ugjHMMJVejb
	8GltnoZhxq81fZWdEfy+L1kXLhDUmxwdrOtndOsh1vTP9HMudOCMpX3Jdoh16rolE6tuDgtUjIaW/
	2AdM31vmfHJGKc7j5twU5ASSJXfYvLLV5tKG3H5905GSEYrJRzGKfQrUYMdwnEHIHPWHYJJUGtkNU
	FOQtaohB5SmZS44ss8r7g7P5I3to4ZSecp/3RjxGDh9V3inS4EBx4i1lhYQO20mUxprGdv+N8+Tsf
	2CoDHIl0CoxeEHpsSlhvxSUFOJIbDNJunbLOLs5V7fHQIfvXs6eQ9IUbHEW9BOR2gVD2N5NdSCBiz
	Q0FaKsMGoTnFPGtXCTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTh-00000000BwO-1YAY;
	Mon, 09 Nov 2026 09:15:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTc-00000000BpA-3EcN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:15:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E08D15A1;
	Mon,  9 Nov 2026 01:15:41 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EEA93F85F;
	Mon,  9 Nov 2026 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215744; bh=O6+IhekNmichOL3Q4sTntsokq1LZ500mwbyMGezGZkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=goKfGLPlR1DjvycXCxxCOdwS39FYeTt3U7lOiFTwBOGes7vWwwaGNyu8pHdQlzwHW
	 eul7+KOTuV4/9LAtMu4nKQtM5E/ejpWJuB4hoL+E7szzihDsUPEKqvFip5QuBhKRcF
	 sM6oFE3sGrrkg7aUUQAj12vs2uefbXnDGGQedCb8=
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
Subject: [PATCH v15 15/35] firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
Date: Mon,  9 Nov 2026 09:12:01 +0000
Message-ID: <20261109091221.2532706-16-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011544_927806_C0A15D94 
X-CRM114-Status: GOOD (  27.27  )
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

Add support to parse, track and link TDCF BLK_TS lines to the related
discovered DataEvents.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - use proper cast on tlm_collect
 - use snapshots to track and collect BLK_TS during full scan bulk reads
 - fix too early invocation xa_destroy(xa_lines)
v13 --> v14
 - split out of previous single patch implementing parse SHMTI routines
---
 drivers/firmware/arm_scmi/telemetry.c | 317 +++++++++++++++++++++++++-
 1 file changed, 313 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 810195889484..e3fbcb1e6ea7 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/hash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/minmax.h>
@@ -160,6 +161,11 @@ struct line {
 	__le32 data_high;
 };
 
+struct blk_tsline {
+	__le32 ts_low;
+	__le32 ts_high;
+};
+
 struct tsline {
 	__le32 data_low;
 	__le32 data_high;
@@ -264,6 +270,7 @@ struct payload {
 	union {
 		struct line l;
 		struct tsline tsl;
+		struct blk_tsline blk_tsl;
 	};
 };
 
@@ -490,6 +497,12 @@ static inline struct tdcf *snap_tdcf(struct shmti_snap *s);
 static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 				     unsigned int shmti_id, enum scan_mode mode);
 
+static inline
+struct mutex *lock_for_payld(struct mutex *locks, unsigned long offset)
+{
+	return &locks[hash_long(offset, PAYLD_HASH_BITS)];
+}
+
 static inline void
 scmi_telemetry_de_state_update(struct telemetry_info *ti, enum de_state state,
 			       bool *current_state, const bool next_state)
@@ -1381,7 +1394,10 @@ static void scmi_telemetry_shmti_cleanup(void *arg)
 	kvfree(shmti->snaps[0]);
 	kvfree(shmti->snaps[1]);
 
-	xa_destroy(&shmti->xa_lines);
+	/*
+	 * Note that xa_lines will be destroyed later on instance cleanup
+	 * since it has to be scanned to free any remaining unbound line.
+	 */
 }
 
 static int scmi_telemetry_shmti_init(struct device *dev,
@@ -1505,11 +1521,235 @@ scmi_telemetry_payld_offset_safe_calc(struct telemetry_shmti *shmti, u32 offs)
 }
 
 static u64
-scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde)
+scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde,
+			  struct payload *bts_payld, struct shmti_snap *snap)
 {
+	struct telemetry_block_ts *bts;
+
+	/* Acquiring order is: tde -> line */
 	lockdep_assert_held(&tde->mtx);
+	if (WARN_ON(!tde->bts || (!bts_payld && !snap)))
+		return 0;
 
-	return 0;
+	bts = tde->bts;
+	guard(mutex)(&bts->line.mtx);
+
+	if (bts->line.last_magic == magic)
+		return bts->last_ts;
+
+	/* Unless specified otherwise, use the snapshot BLK_TS paylod */
+	if (!bts_payld) {
+		void *base = snap_tdcf(snap);
+
+		bts_payld = base + bts->line.offset;
+	}
+
+	/* Note that the bts->last_rate can change ONLY on creation */
+	bts->last_ts = BLK_TS_STAMP_RAW(&bts_payld->blk_tsl);
+	bts->line.last_magic = magic;
+
+	return bts->last_ts;
+}
+
+static void
+scmi_telemetry_blkts_update_snap(struct telemetry_info *ti,
+				 struct telemetry_block_ts *bts,
+				 struct payload *bts_payld, u32 magic)
+{
+	guard(mutex)(&bts->line.mtx);
+	if (bts->line.last_magic != magic) {
+		bts->last_ts = BLK_TS_STAMP_RAW(&bts_payld->blk_tsl);
+		bts->last_rate = BLK_TS_RATE_RAW(bts_payld);
+		/* BLK_TS clock rate value can change ONLY here on creation */
+		if (!bts->last_rate)
+			bts->last_rate = ti->default_blk_ts_rate;
+		bts->line.last_magic = magic;
+
+		trace_scmi_tlm_access(0, "BLK_TS_UPDATE", magic, 0);
+	}
+}
+
+static inline void scmi_telemetry_line_free(struct telemetry_line *line)
+{
+	void *blob;
+
+	switch (line->type) {
+	case TDCF_BLK_TS_LINE:
+		blob = to_blkts(line);
+		kfree(blob);
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+}
+
+static void __scmi_telemetry_line_put(struct telemetry_line *line)
+{
+	lockdep_assert_held(&line->shmti->lines_mtx);
+
+	mutex_lock(&line->mtx);
+	if (refcount_dec_and_test(&line->users)) {
+		xa_erase(&line->shmti->xa_lines, line->offset);
+
+		/* Unlock and free the containing structure: blkts or uuid */
+		mutex_unlock(&line->mtx);
+
+		trace_scmi_tlm_access(0, "DROP_LINE", line->type, line->last_magic);
+		scmi_telemetry_line_free(line);
+
+		return;
+	}
+	mutex_unlock(&line->mtx);
+}
+
+static void scmi_telemetry_line_put(struct telemetry_line *line)
+{
+	/* Acquiring coarse grain first ... */
+	guard(mutex)(&line->shmti->lines_mtx);
+	__scmi_telemetry_line_put(line);
+}
+
+static void scmi_telemetry_blkts_unlink(struct telemetry_de *tde)
+{
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+	if (!tde->bts)
+		return;
+
+	scmi_telemetry_line_put(&tde->bts->line);
+	tde->bts = NULL;
+
+	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_UNLINK", 0, 0);
+}
+
+static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
+{
+	struct telemetry_de *tde = to_tde(de);
+
+	lockdep_assert_held(&tde->mtx);
+
+	/* Unlink all related lines triggering their deallocation */
+	scmi_telemetry_blkts_unlink(tde);
+}
+
+static struct telemetry_line *
+scmi_telemetry_line_get(struct telemetry_shmti *shmti, unsigned long offset)
+{
+	struct telemetry_line *line;
+
+	/* Acquiring coarse grain first ... */
+	guard(mutex)(&shmti->lines_mtx);
+	line = xa_load(&shmti->xa_lines, offset);
+	if (!line)
+		return NULL;
+
+	guard(mutex)(&line->mtx);
+	refcount_inc(&line->users);
+
+	return line;
+}
+
+static int
+scmi_telemetry_line_init(struct telemetry_shmti *shmti, struct telemetry_line *line,
+			 unsigned long offset, enum tdcf_line_types type)
+{
+	line->type = type;
+	refcount_set(&line->users, 1);
+	line->offset = offset;
+	line->shmti = shmti;
+	mutex_init(&line->mtx);
+
+	guard(mutex)(&shmti->lines_mtx);
+	return xa_insert(&shmti->xa_lines, offset, line, GFP_KERNEL);
+}
+
+static struct telemetry_block_ts *
+scmi_telemetry_blkts_create(struct telemetry_shmti *shmti, unsigned long offset)
+{
+	struct telemetry_block_ts *bts;
+	int ret;
+
+	bts = kzalloc_obj(*bts);
+	if (!bts)
+		return NULL;
+
+	ret = scmi_telemetry_line_init(shmti, &bts->line, offset, TDCF_BLK_TS_LINE);
+	if (ret) {
+		kfree(bts);
+		return NULL;
+	}
+
+	trace_scmi_tlm_collect(0, shmti->info.sid, offset, "SHMTI_NEW_BLKTS");
+
+	return bts;
+}
+
+static struct telemetry_block_ts *
+scmi_telemetry_blkts_get_or_create(struct telemetry_shmti *shmti,
+				   unsigned long offset)
+{
+	struct telemetry_line *line;
+
+	/* Avoid races on line creation for this payld */
+	guard(mutex)(lock_for_payld(shmti->payld_locks, offset));
+
+	line = scmi_telemetry_line_get(shmti, offset);
+	if (line)
+		return to_blkts(line);
+
+	return scmi_telemetry_blkts_create(shmti, offset);
+}
+
+/**
+ * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
+ *
+ * @ti: A reference to the telemetry_info descriptor
+ * @bts_payld: TDCF payld line to process
+ * @snap: A reference to the working SHMTI snapshot that will be processed
+ * @active_bts: Input/output reference to keep track of the last blk_ts found
+ *
+ * Process a valid TDCF BLK_TS line and, after having looked up or created a
+ * blk_ts descriptor, update the related data and return it as the currently
+ * active blk_ts, given that it is effectively the last found during this
+ * scan.
+ */
+static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
+					    struct payload *bts_payld,
+					    struct shmti_snap *snap,
+					    struct telemetry_block_ts **active_bts)
+{
+	struct telemetry_block_ts *bts, *previous = *active_bts;
+	struct telemetry_shmti *shmti = snap->shmti;
+	u32 meta = PAYLD_META_RAW(bts_payld);
+	unsigned long offset;
+
+	/* Check for spec compliance */
+	if (BLK_TS_INVALID_RAW(meta)) {
+		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, meta);
+		return;
+	}
+
+	offset = TDCF_OFFS(snap->base, bts_payld);
+	/* A BLK_TS descriptor MUST be returned: it is found or it is created */
+	bts = scmi_telemetry_blkts_get_or_create(shmti, offset);
+	/*
+	 * On error processing the new BLK_TS bailout taking care to clear
+	 * the previous last active BLK_TS to avoid mistakenly binding to the
+	 * next data lines.
+	 */
+	if (WARN_ON(!bts))
+		goto out;
+
+	/* Update the descriptor with the lastest TS */
+	scmi_telemetry_blkts_update_snap(ti, bts, bts_payld, snap->magic);
+
+out:
+	/* Drop one refcount on the previous active since we found a new one */
+	if (previous)
+		scmi_telemetry_line_put(&previous->line);
+
+	*active_bts = bts;
 }
 
 static inline struct telemetry_de *
@@ -1561,7 +1801,8 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
 		*tstamp = 0;
 		if (USE_BLK_TS_RAW(meta)) {
 			/* Read out the actual BLK_TS */
-			*tstamp = scmi_telemetry_blkts_read(magic, tde);
+			*tstamp = scmi_telemetry_blkts_read(magic, tde,
+							    bts_payld, snap);
 		} else if (LINE_TS_VALID_RAW(meta)) {
 			/*
 			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
@@ -1589,6 +1830,26 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
 	return 0;
 }
 
+static inline void scmi_telemetry_blkts_link(struct telemetry_de *tde,
+					     struct telemetry_block_ts *bts)
+{
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+
+	/* Unlink old stale BTS if existent */
+	scmi_telemetry_blkts_unlink(tde);
+
+	guard(mutex)(&bts->line.mtx);
+	refcount_inc(&bts->line.users);
+
+	/* Update TS clock rate if provided by the BLK_TS */
+	if (bts->last_rate)
+		tde->de.info->ts_rate = bts->last_rate;
+
+	tde->bts = bts;
+	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_LINK", 0, 0);
+}
+
 /**
  * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
  * @ti: A reference to the telemetry info descriptor
@@ -1643,11 +1904,19 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 					   struct telemetry_uuid *active_uuid)
 {
 	struct telemetry_shmti *shmti = snap->shmti;
+	u32 meta = PAYLD_META_RAW(payld);
+	bool use_blk_ts = USE_BLK_TS_RAW(meta);
 	struct telemetry_de *tde;
 	u64 val, tstamp = 0;
 	u32 de_id;
 
 	de_id = PAYLD_ID_RAW(payld);
+	/* Discard malformed lines...a preceding BLK_TS must exist */
+	if (use_blk_ts && !active_bts) {
+		trace_scmi_tlm_access(de_id, "BAD_USE_BLK_TS", 0, 0);
+		return;
+	}
+
 	/* Is this DE ID known ? */
 	tde = scmi_telemetry_tde_lookup(ti, de_id);
 	if (!tde) {
@@ -1710,6 +1979,15 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	if (!scmi_telemetry_tde_cache_stale(tde, snap->magic))
 		return;
 
+	/*
+	 * Link the related BTS when needed, it's unlinked on disable.
+	 * Note that each DEs timestamp types is statically defined and
+	 * enumerated once for all at init: a Data line cannot suddenly
+	 * 'migrate' to a different timestamp type.
+	 */
+	if (use_blk_ts && BLK_TS_CHANGED(tde, shmti, active_bts->line.offset))
+		scmi_telemetry_blkts_link(tde, active_bts);
+
 	/*
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged by ignored.
@@ -1766,6 +2044,9 @@ static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
 		scmi_telemetry_tdcf_data_parse(ti, payld, snap, mode,
 					       *active_bts, *active_uuid);
 		break;
+	case TDCF_BLK_TS_LINE:
+		scmi_telemetry_tdcf_blkts_parse(ti, payld, snap, active_bts);
+		break;
 	default:
 		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "TDCF_LINE_UNKNOWN", 0, 0);
 		break;
@@ -1906,6 +2187,15 @@ scmi_telemetry_shmti_refresh(struct telemetry_shmti *shmti, int *idx)
 	return work;
 }
 
+static inline void
+scmi_telemetry_reset_active_lines(struct telemetry_block_ts **active_bts)
+{
+	if (*active_bts) {
+		scmi_telemetry_line_put(&(*active_bts)->line);
+		*active_bts = NULL;
+	}
+}
+
 /**
  * scmi_telemetry_shmti_scan  - Full SHMTI scan
  * @ti: A reference to the telemetry info descriptor
@@ -1976,6 +2266,7 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 		qwords -= used_qwords;
 	}
 
+	scmi_telemetry_reset_active_lines(&active_bts);
 	srcu_read_unlock(&shmti->srcu, idx);
 
 	if (ret)
@@ -2120,6 +2411,22 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
 }
 
+static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
+{
+	for (int id = 0; id < ti->num_shmti; id++) {
+		struct telemetry_shmti *shmti = &ti->shmti[id];
+		struct telemetry_line *line;
+		unsigned long idx;
+
+		guard(mutex)(&shmti->lines_mtx);
+		/* Drop all remaining currently unbound lines and their containers */
+		xa_for_each(&shmti->xa_lines, idx, line)
+			__scmi_telemetry_line_put(line);
+
+		xa_destroy(&shmti->xa_lines);
+	}
+}
+
 static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 {
 	struct scmi_telemetry_de *de;
@@ -2136,6 +2443,7 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 
 		guard(mutex)(&tde->mtx);
 
+		scmi_telemetry_de_unlink(&tde->de);
 		scmi_telemetry_free_tde_put(ti, tde);
 	}
 
@@ -2163,6 +2471,7 @@ static void scmi_telemetry_instance_cleanup(void *arg)
 
 	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
+	scmi_telemetry_lines_cleanup(ti);
 	scmi_telemetry_resources_free(ti);
 }
 
-- 
2.54.0


