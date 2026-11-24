Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34560606A691
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z3irH+cf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CNxO132C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kg8eWBI9m2iDNmFaG/WS++U63jvSnwVF4E3kBOsrLfI=; b=z3irH+cfKk/g0V
	u7tB4LXXXCJwf4FXX2MEo/EuOcB9kLAJCVoMEVhNhqxvbk4hKPi/37Y/omBZ1uUkow6nd2W6qmNXn
	s1GjvjZb/OTOArKCFi1c0bnS5Ew3aQRGmOl5lvtiMP0MsGPZLEU1z0QQJxH8Wzfbl8242B/pyaCU7
	HJuRygrWhL2Ae3rZdf7pvppJn4gqar6xMBN+0/eCwA4d+7s3g8yI9UrK8beYJedV1KCFm7YglphSg
	PWfip0xNJsmP/etfUaeck0fcakprbbfXt31d8qRJze+fzQTo8jUXy1sLlhbRgRbMvXqH009YPozRa
	ssjKIAHzly33Q2kv3BXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwYn-00000007eIQ-3pCT;
	Tue, 24 Nov 2026 19:52:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwXg-00000007dVI-1ika
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:51:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE3CC497;
	Tue, 24 Nov 2026 11:51:00 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 220D13F763;
	Tue, 24 Nov 2026 11:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549863; bh=tQEYU1qUXpELBGFDmQO86exYN1aZaSo/r5Mey0JUx1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNxO132CJB7C/m1VGMjolu8EW5fZ+tn1OT0uIlIg5IUa3+r6OFqUNU4T5QhnE7KaX
	 6k9PoYt26G5vTigLrZajdEbLHaTpMqWm0REON42lxeZqWlBhD9B1SRU0GPrNyjZeN1
	 Zk8abraz7ovlnB9aEo4vBB0e61ijjDmDlai0isXc=
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
Subject: [PATCH v17 16/34] firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
Date: Tue, 24 Nov 2026 19:48:22 +0000
Message-ID: <20261124194841.1147072-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115105_053873_3B0FFEE8 
X-CRM114-Status: GOOD (  27.01  )
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
v16 --> v17
 - check TDE TS type, update from last_rate
v15 --> v16
 - WARN_ON(BLK_TS_INVALID) but keep active_bts valid
 - invalidate TDE cache on blkts_unlin
 - cleanup stale lines on shmti cleanup
v14 --> v15
 - use proper cast on tlm_collect
 - use snapshots to track and collect BLK_TS during full scan bulk reads
 - fix too early invocation xa_destroy(xa_lines)
v13 --> v14
 - split out of previous single patch implementing parse SHMTI routines
---
 drivers/firmware/arm_scmi/telemetry.c | 352 +++++++++++++++++++++++++-
 1 file changed, 344 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index ba4ba1d2c00c..414765f46c77 100644
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
@@ -159,6 +160,11 @@ struct line {
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
@@ -263,6 +269,7 @@ struct payload {
 	union {
 		struct line l;
 		struct tsline tsl;
+		struct blk_tsline blk_tsl;
 	};
 };
 
@@ -470,6 +477,10 @@ struct telemetry_info {
 	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
 };
 
+static void __scmi_telemetry_line_put(struct telemetry_line *line);
+
+static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de);
+
 static struct scmi_telemetry_res_info *
 __scmi_telemetry_resources_get(struct telemetry_info *ti);
 
@@ -478,6 +489,12 @@ static inline struct tdcf *snap_tdcf(struct shmti_snap *s);
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
@@ -613,6 +630,14 @@ static int scmi_telemetry_tde_register(struct telemetry_info *ti,
 	return ret;
 }
 
+static inline void scmi_telemetry_tde_cache_invalidate(struct telemetry_de *tde)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	/* Invalidate cache */
+	tde->last_magic = TDCF_BAD_END_SEQ;
+}
+
 static inline bool
 scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, const u32 magic)
 {
@@ -960,16 +985,24 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
-static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
+static void scmi_telemetry_tdes_cleanup(void *arg)
 {
+	struct telemetry_info *ti = arg;
 	struct scmi_telemetry_de *de;
 	unsigned long idx;
 
+	/*
+	 * Unlinking all the BLK_TS/UUID lines related to a DE triggers also
+	 * the deallocation of such lines when the embedded refcount hits zero.
+	 * Note that the UUID lines are also referenced and refcounted by the
+	 * global UUID RCU array, so they won't be deallocated here.
+	 */
 	xa_for_each(&ti->xa_des, idx, de) {
 		struct telemetry_de *tde = to_tde(de);
 
 		guard(mutex)(&tde->mtx);
 
+		scmi_telemetry_de_unlink(&tde->de);
 		scmi_telemetry_free_tde_put(ti, tde);
 	}
 }
@@ -1280,16 +1313,29 @@ static int scmi_telemetry_shmti_list(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static void scmi_telemetry_shmti_lines_cleanup(struct telemetry_shmti *shmti)
+{
+	struct telemetry_line *line;
+	unsigned long idx;
+
+	guard(mutex)(&shmti->lines_mtx);
+	/* Drop all remaining currently unbound lines and their containers */
+	xa_for_each(&shmti->xa_lines, idx, line)
+		__scmi_telemetry_line_put(line);
+
+	xa_destroy(&shmti->xa_lines);
+}
+
 static void scmi_telemetry_shmti_cleanup(void *arg)
 {
 	struct telemetry_shmti *shmti = arg;
 
+	scmi_telemetry_shmti_lines_cleanup(shmti);
+
 	cleanup_srcu_struct(&shmti->srcu);
 
 	kvfree(shmti->snaps[0]);
 	kvfree(shmti->snaps[1]);
-
-	xa_destroy(&shmti->xa_lines);
 }
 
 static int scmi_telemetry_shmti_init(struct device *dev,
@@ -1351,7 +1397,7 @@ static int scmi_telemetry_enumerate_shmti(struct telemetry_info *ti)
 	/* Expose the fully initialized SHMTI infos */
 	smp_store_release(&ti->info.base.num_shmtis, ti->num_shmti);
 
-	return 0;
+	return devm_add_action_or_reset(ph->dev, scmi_telemetry_tdes_cleanup, ti);
 }
 
 static const struct scmi_telemetry_info *
@@ -1413,11 +1459,242 @@ scmi_telemetry_payld_offset_safe_calc(struct telemetry_shmti *shmti, u32 offs)
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
+
+	scmi_telemetry_tde_cache_invalidate(tde);
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
+ *
+ * Note that the current BLK_TS line could be malformed due to garbage in
+ * the TDCF: in such a case we warn/log and bailout BUT we don't throw away
+ * the currently active_bts (if any) since the current malformed line could
+ * be bogus and never intended to be a BLK_TS line.
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
+	/* Check for spec compliance. */
+	if (WARN_ON(BLK_TS_INVALID_RAW(meta))) {
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
 
 static inline int
@@ -1436,7 +1713,8 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
 		*tstamp = 0;
 		if (USE_BLK_TS_RAW(meta)) {
 			/* Read out the actual BLK_TS */
-			*tstamp = scmi_telemetry_blkts_read(magic, tde);
+			*tstamp = scmi_telemetry_blkts_read(magic, tde,
+							    bts_payld, snap);
 		} else if (LINE_TS_VALID_RAW(meta)) {
 			/*
 			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
@@ -1464,6 +1742,26 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
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
@@ -1508,11 +1806,19 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 {
 	struct telemetry_shmti *shmti = snap->shmti;
 	struct device *dev = ti->ph->dev;
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
@@ -1522,6 +1828,11 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 
 	guard(mutex)(&tde->mtx);
 
+	if (use_blk_ts && !IS_TDE_TS_BLK(tde)) {
+		trace_scmi_tlm_access(de_id, "BAD_BLK_TS_TYPE", 0, 0);
+		return;
+	}
+
 	if (tde->de.fc_support) {
 		dev_err(dev, "Found FastChannel DE while parsing a SHMTI.\n");
 		trace_scmi_tlm_access(de_id, "DE_INVALID_FC_ON_SHMTI", 0, 0);
@@ -1571,6 +1882,19 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	if (!scmi_telemetry_tde_cache_stale(tde, snap->magic))
 		return;
 
+	/*
+	 * Link the related BTS when needed, it's unlinked on disable.
+	 * Note that each DEs timestamp types is statically defined and
+	 * enumerated once for all at init: a Data line cannot suddenly
+	 * 'migrate' to a different timestamp type.
+	 */
+	if (use_blk_ts) {
+		if (BLK_TS_CHANGED(tde, shmti, active_bts->line.offset))
+			scmi_telemetry_blkts_link(tde, active_bts);
+		else if (tde->bts->last_rate != tde->de.info->ts_rate)
+			tde->de.info->ts_rate = tde->bts->last_rate;
+	}
+
 	/*
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged but ignored.
@@ -1634,6 +1958,9 @@ static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
 		scmi_telemetry_tdcf_data_parse(ti, payld, snap, mode,
 					       *active_bts, *active_uuid);
 		break;
+	case TDCF_BLK_TS_LINE:
+		scmi_telemetry_tdcf_blkts_parse(ti, payld, snap, active_bts);
+		break;
 	default:
 		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "TDCF_LINE_UNKNOWN", 0, 0);
 		break;
@@ -1777,6 +2104,15 @@ scmi_telemetry_shmti_refresh(struct telemetry_shmti *shmti, int *idx)
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
@@ -1844,6 +2180,7 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 		qwords -= used_qwords;
 	}
 
+	scmi_telemetry_reset_active_lines(&active_bts);
 	srcu_read_unlock(&shmti->srcu, idx);
 
 	if (ret)
@@ -1953,7 +2290,6 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	/* Ensure rinfo is no more accessible upfront */
 	smp_store_release(&ti->rinfo, NULL);
 
-	scmi_telemetry_tdes_cleanup(ti);
 	xa_destroy(&ti->xa_des);
 
 	kfree(ti->info.shmtis);
-- 
2.54.0


