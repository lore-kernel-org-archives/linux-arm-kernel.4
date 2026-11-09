Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E4C60A2623
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dj0Lssf5;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gdRPZfcg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mHuAjT3zm+DQ++gNUO9AyRzkqCJS0PZIMs8rnQwF0N4=; b=Dj0Lssf5GBmcJq
	nYdy75ubmSduZtkNbvWTZKtMc4GJWc56+KAaOp6Wdddj3AnS0+f86+0mC52Ema49esWd5T8YAQnmo
	JSwZLXMUyMi3cHkf/m3/UCYKHvGStWVn3c76tcX5avjWntI9O8wXiv6MgBtmJngsXgeAQQfhw7pQn
	Lqx7RTJ+qnRzR54D35eTlbh5E07hYus+5N9p2uIlYDmdbw+gp1ZM7qCUCxz/1+hm/UCVF09VacneV
	v7mBycPv3NhaqcS3tget+415PTXVvDqMe+Dq0X7QmRDNVdW3By3qMCY3bySotnVQtlZwFqudHLqTV
	mlO6a/UfeWSMNZTWD/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTs-00000000CAl-09nH;
	Mon, 09 Nov 2026 09:16:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTf-00000000BpA-3TA3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:15:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 567D215A1;
	Mon,  9 Nov 2026 01:15:44 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7186F3F85F;
	Mon,  9 Nov 2026 01:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215747; bh=rR0GUxgaH5DK6FsxLKPwmM1ahaboaFbctJ2EjxIglr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gdRPZfcgOx0xi/w6CWu5yh1X2jxFLZSN3wci8BHh59Ai26xcdqxLaIF9hdFt3f3Hq
	 +TnI+DTCjaBzhwi9WyBM8EkIC4eBQ8aA2R29fKsiNJ6PLceRhwyp7RO4XXT/clFAoV
	 3Y6MzZ654Sy2fT4lrC+Qsv9qQHLLyRVJAKEYifZU=
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
Subject: [PATCH v15 16/35] firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
Date: Mon,  9 Nov 2026 09:12:02 +0000
Message-ID: <20261109091221.2532706-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011547_989232_485D8976 
X-CRM114-Status: GOOD (  24.77  )
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

Add support to parse, track and link TDCF UUID lines to the related
discovered DataEvents.

Maintain also a central list of discovered UUID lines.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - use proper casting in tlm_collect
 - use snapshots to collect UUIDs during full scans
 - stop tracking UUIDs lines singularly..it's useless
 - use UUIDs line hashing for lookup
 - clarified UUID/DE binding are permanent
 - fixed WARN_ON invocation on missing active_uuid
v13 --> v14
 - split out of previous single patch implementing parse SHMTI routines
---
 drivers/firmware/arm_scmi/telemetry.c | 277 +++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |   2 +
 2 files changed, 277 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index e3fbcb1e6ea7..38a94d66116f 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -13,11 +13,14 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hash.h>
+#include <linux/hashtable.h>
+#include <linux/jhash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -173,6 +176,10 @@ struct tsline {
 	__le32 ts_high;
 };
 
+struct uuid_line {
+	__be32 dwords[SCMI_TLM_DE_IMPL_NUM_DWORDS];
+};
+
 #define LINE_DATA_GET_RAW(f)				\
 ({							\
 	typeof(f) _f = (f);				\
@@ -271,6 +278,7 @@ struct payload {
 		struct line l;
 		struct tsline tsl;
 		struct blk_tsline blk_tsl;
+		struct uuid_line uuid_l;
 	};
 };
 
@@ -399,7 +407,6 @@ struct telemetry_block_ts {
 #define to_blkts(l)	container_of(l, struct telemetry_block_ts, line)
 
 struct telemetry_uuid {
-	u32 key;
 	struct hlist_node node_ht;
 	struct hlist_node node_lst;
 	uuid_t uuid;
@@ -470,6 +477,12 @@ struct telemetry_info {
 	bool streaming_mode;
 	unsigned int num_shmti;
 	unsigned int num_des_tstamp;
+#define SCMI_UUID_DB_THRESH	3
+	/* Protect uuids_len */
+	struct mutex uuids_mtx;
+	unsigned int uuids_len;
+#define SCMI_UUID_HASH_SZ	5
+	DECLARE_HASHTABLE(uuids_ht, SCMI_UUID_HASH_SZ);
 	/* Mutex to protect des_enabled_mtx */
 	struct mutex des_enabled_mtx;
 	atomic_t des_enabled[ENA_MAX];
@@ -478,6 +491,7 @@ struct telemetry_info {
 	struct telemetry_shmti *shmti;
 	struct telemetry_de *tdes;
 	struct xarray xa_des;
+	struct telemetry_uuid *primary_uuid;
 	/* Mutex to protect access to @free_des */
 	struct mutex free_mtx;
 	struct list_head free_des;
@@ -497,6 +511,9 @@ static inline struct tdcf *snap_tdcf(struct shmti_snap *s);
 static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 				     unsigned int shmti_id, enum scan_mode mode);
 
+static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
+					    struct telemetry_uuid *uuid);
+
 static inline
 struct mutex *lock_for_payld(struct mutex *locks, unsigned long offset)
 {
@@ -953,8 +970,10 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	ti->num_des_tstamp += !!tde->de.tstamp_support;
 
 	/* Add to FastChannels list */
-	if (tde->de.fc_support)
+	if (tde->de.fc_support) {
+		scmi_telemetry_uuid_link(tde, ti->primary_uuid);
 		list_add(&tde->item, &ti->fcs_des);
+	}
 
 	/* Account for this DE in group num_de counter */
 	if (tde->de.grp)
@@ -1623,6 +1642,17 @@ static void scmi_telemetry_blkts_unlink(struct telemetry_de *tde)
 	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_UNLINK", 0, 0);
 }
 
+static void scmi_telemetry_uuid_unlink(struct telemetry_de *tde)
+{
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+	if (!tde->uuid)
+		return;
+
+	tde->uuid = NULL;
+	trace_scmi_tlm_access(tde->de.info->id, "UUID_UNLINK", 0, 0);
+}
+
 static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
 {
 	struct telemetry_de *tde = to_tde(de);
@@ -1631,6 +1661,7 @@ static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
 
 	/* Unlink all related lines triggering their deallocation */
 	scmi_telemetry_blkts_unlink(tde);
+	scmi_telemetry_uuid_unlink(tde);
 }
 
 static struct telemetry_line *
@@ -1701,6 +1732,149 @@ scmi_telemetry_blkts_get_or_create(struct telemetry_shmti *shmti,
 	return scmi_telemetry_blkts_create(shmti, offset);
 }
 
+static int scmi_telemetry_uuids_update(struct telemetry_info *ti,
+				       struct telemetry_uuid *uuid)
+{
+	uuid_t **cur_uuids;
+
+	/* Resize array if needed ... */
+	if (ti->info.num_uuids + SCMI_UUID_DB_THRESH >= ti->uuids_len) {
+		uuid_t **new_uuids, **old_uuids;
+		unsigned int new_len = ti->uuids_len * 2;
+
+		new_uuids = kzalloc_objs(*new_uuids, new_len);
+		if (!new_uuids)
+			return -ENOMEM;
+
+		old_uuids = rcu_dereference_protected(ti->info.uuids,
+						      lockdep_is_held(&ti->uuids_mtx));
+		/* Copy/move old allocated UUIDs */
+		for (int i = 0; i < ti->info.num_uuids; i++)
+			new_uuids[i] = old_uuids[i];
+
+		/* Expose new UUID pointer */
+		rcu_assign_pointer(ti->info.uuids, new_uuids);
+		ti->uuids_len = new_len;
+
+		kfree_rcu_mightsleep(old_uuids);
+	}
+
+	/* Store new UUID reference into the globally accessible UUIDS */
+	cur_uuids = rcu_dereference_protected(ti->info.uuids,
+					      lockdep_is_held(&ti->uuids_mtx));
+	cur_uuids[ti->info.num_uuids] = &uuid->uuid;
+	rcu_assign_pointer(ti->info.uuids, cur_uuids);
+	/* Update UUIDs count */
+	smp_store_release(&ti->info.num_uuids, ti->info.num_uuids + 1);
+
+	return 0;
+}
+
+static int scmi_telemetry_uuid_register(struct telemetry_info *ti, u32 key,
+					struct telemetry_uuid *uuid)
+{
+	int ret;
+
+	lockdep_assert_held(&ti->uuids_mtx);
+
+	ret = scmi_telemetry_uuids_update(ti, uuid);
+	if (ret)
+		return ret;
+
+	/* Register by key for easy lookup */
+	hash_add(ti->uuids_ht, &uuid->node_ht, key);
+
+	trace_scmi_tlm_collect(0, key, 0, "SHMTI_NEW_UUID");
+
+	return 0;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_create(struct telemetry_info *ti, __be32 *dwords)
+{
+	u32 key;
+	int ret;
+
+	lockdep_assert_held(&ti->uuids_mtx);
+
+	struct telemetry_uuid *uuid __free(kfree) = kzalloc_obj(*uuid);
+	if (!uuid)
+		return NULL;
+
+	/*
+	 * Fetch BigEndian in-memory UUID fields as per SCMIv4.0
+	 * specification 3.12.2.2
+	 */
+	import_uuid(&uuid->uuid, (__force const __u8 *)dwords);
+	key = jhash2((__force const u32 *)dwords, SCMI_TLM_DE_IMPL_NUM_DWORDS, 1);
+	ret = scmi_telemetry_uuid_register(ti, key, uuid);
+	if (ret)
+		return NULL;
+
+	return no_free_ptr(uuid);
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_lookup(struct telemetry_info *ti, __be32 *dwords)
+{
+	struct telemetry_uuid *uuid;
+	u32 key;
+
+	lockdep_assert_held(&ti->uuids_mtx);
+
+	key = jhash2((__force const u32 *)dwords, SCMI_TLM_DE_IMPL_NUM_DWORDS, 1);
+	hash_for_each_possible(ti->uuids_ht, uuid, node_ht, key)
+		if (!memcmp(&uuid->uuid, dwords, sizeof(uuid->uuid)))
+			return uuid;
+
+	return NULL;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_get_or_create(struct telemetry_info *ti, __be32 *dwords)
+{
+	struct telemetry_uuid *uuid;
+
+	guard(mutex)(&ti->uuids_mtx);
+
+	uuid = scmi_telemetry_uuid_lookup(ti, dwords);
+	if (uuid)
+		return uuid;
+
+	return scmi_telemetry_uuid_create(ti, dwords);
+}
+
+/**
+ * scmi_telemetry_tdcf_uuid_parse  - A UUID line parser
+ *
+ * @ti: A reference to the telemetry_info descriptor
+ * @uuid_payld: UUID payld line to process
+ * @snap: A reference to the working SHMTI snapshot that will be processed
+ * @active_uuid: Input/output reference to keep track of the last uuid found
+ *
+ * Note that by the SCMI v4.0 Telemetry specification the associations between
+ * DEs and UUIDs, both primary and secondary, are permanent across the same
+ * session (boot): once discovered they cannot change.
+ */
+static void scmi_telemetry_tdcf_uuid_parse(struct telemetry_info *ti,
+					   struct payload *uuid_payld,
+					   struct shmti_snap *snap,
+					   struct telemetry_uuid **active_uuid)
+{
+	__be32 *dwords = uuid_payld->uuid_l.dwords;
+	u32 meta = PAYLD_META_RAW(uuid_payld);
+
+	if (UUID_INVALID_RAW(meta)) {
+		trace_scmi_tlm_access(0, "UUID_INVALID",
+				      snap->magic, snap->magic);
+		return;
+	}
+
+	*active_uuid = scmi_telemetry_uuid_get_or_create(ti, dwords);
+
+	WARN_ON(!*active_uuid);
+}
+
 /**
  * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
  *
@@ -1850,6 +2024,18 @@ static inline void scmi_telemetry_blkts_link(struct telemetry_de *tde,
 	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_LINK", 0, 0);
 }
 
+static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
+					    struct telemetry_uuid *uuid)
+{
+	lockdep_assert_held(&tde->mtx);
+	if (tde->uuid)
+		return;
+
+	/* Update UUID association */
+	tde->uuid = uuid;
+	trace_scmi_tlm_access(tde->de.info->id, "UUID_LINK", 0, 0);
+}
+
 /**
  * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
  * @ti: A reference to the telemetry info descriptor
@@ -1988,6 +2174,9 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	if (use_blk_ts && BLK_TS_CHANGED(tde, shmti, active_bts->line.offset))
 		scmi_telemetry_blkts_link(tde, active_bts);
 
+	/* Link the active UUID or the primary, it's unlinked on disable */
+	scmi_telemetry_uuid_link(tde, active_uuid ?: ti->primary_uuid);
+
 	/*
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged by ignored.
@@ -2047,6 +2236,9 @@ static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
 	case TDCF_BLK_TS_LINE:
 		scmi_telemetry_tdcf_blkts_parse(ti, payld, snap, active_bts);
 		break;
+	case TDCF_UUID_LINE:
+		scmi_telemetry_tdcf_uuid_parse(ti, payld, snap, active_uuid);
+		break;
 	default:
 		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "TDCF_LINE_UNKNOWN", 0, 0);
 		break;
@@ -2362,6 +2554,7 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 	}
 
 	INIT_LIST_HEAD(&ti->fcs_des);
+	hash_init(ti->uuids_ht);
 
 	ti->shmti = no_free_ptr(shmtis);
 	ti->info.shmtis = no_free_ptr(shmtis_info);
@@ -2427,6 +2620,37 @@ static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
 	}
 }
 
+static void scmi_telemetry_uuids_cleanup(struct telemetry_info *ti)
+{
+	uuid_t **cur_uuids;
+
+	/* Drop reference to UUID lines kept in the growable array */
+	scoped_guard(mutex, &ti->uuids_mtx) {
+		int num_uuids;
+
+		/* Ensure looking up an updated counter */
+		num_uuids = smp_load_acquire(&ti->info.num_uuids);
+		/* Ensure zeroing is visible */
+		smp_store_release(&ti->info.num_uuids, 0);
+		/* Inhibit further accesses to cur_uuids */
+		cur_uuids = rcu_replace_pointer(ti->info.uuids, NULL,
+						lockdep_is_held(&ti->uuids_mtx));
+		synchronize_rcu();
+
+		for (int i = 0; i < num_uuids; i++) {
+			struct telemetry_uuid *uuid;
+
+			uuid = to_uuid_from_uuid_t(cur_uuids[i]);
+			hash_del(&uuid->node_ht);
+			kfree(uuid);
+
+			trace_scmi_tlm_access(0, "DROP_LINE", TDCF_UUID_LINE, 0);
+		}
+	}
+
+	kfree_rcu_mightsleep(cur_uuids);
+}
+
 static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 {
 	struct scmi_telemetry_de *de;
@@ -2471,6 +2695,7 @@ static void scmi_telemetry_instance_cleanup(void *arg)
 
 	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
+	scmi_telemetry_uuids_cleanup(ti);
 	scmi_telemetry_lines_cleanup(ti);
 	scmi_telemetry_resources_free(ti);
 }
@@ -2548,6 +2773,23 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
 	return ti->rinfo;
 }
 
+static int scmi_telemetry_primary_uuid_init(struct telemetry_info *ti)
+{
+	__be32 *dwords = (__be32 *)&ti->info.base.primary_revision.b;
+	struct telemetry_uuid *uuid;
+
+	uuid = scmi_telemetry_uuid_get_or_create(ti, dwords);
+	if (!uuid) {
+		dev_err(ti->ph->dev, "Failed to register Primary UUID\n");
+		return -ENOMEM;
+	}
+
+	/* Ensure Primary UUID association is visible */
+	smp_store_release(&ti->primary_uuid, uuid);
+
+	return 0;
+}
+
 /**
  * scmi_telemetry_instance_init  - Instance initializer
  * @ti: A reference to the telemetry info descriptor for this instance
@@ -2563,6 +2805,8 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
  */
 static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 {
+	unsigned int uuids_len;
+	uuid_t **cur_uuids;
 	int ret;
 
 	ret = scmi_telemetry_resources_alloc(ti);
@@ -2571,6 +2815,35 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 
 	xa_init(&ti->xa_des);
 
+	/*
+	 * Always allocate at least one slot for the primary and anyway at
+	 * least enough to avoid immediate resizing, assuring uuids_len
+	 * always greater or equal to one.
+	 */
+	uuids_len = max(ti->num_shmti * 2, SCMI_UUID_DB_THRESH + 1);
+	cur_uuids = kzalloc_objs(*cur_uuids, uuids_len);
+	if (!cur_uuids) {
+		xa_destroy(&ti->xa_des);
+		scmi_telemetry_resources_free(ti);
+		return -ENOMEM;
+	}
+
+	mutex_init(&ti->uuids_mtx);
+	/* Expose new UUID pointer */
+	scoped_guard(mutex, &ti->uuids_mtx) {
+		rcu_assign_pointer(ti->info.uuids, cur_uuids);
+		ti->uuids_len = uuids_len;
+	}
+
+	/* Initialize the first UUIDs in the global list with the primary */
+	ret = scmi_telemetry_primary_uuid_init(ti);
+	if (ret) {
+		scmi_telemetry_uuids_cleanup(ti);
+		xa_destroy(&ti->xa_des);
+		scmi_telemetry_resources_free(ti);
+		return ret;
+	}
+
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index b7b8bd77b37d..3973779c0aba 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -981,6 +981,8 @@ struct scmi_telemetry_info {
 	unsigned int active_update_interval;
 	struct scmi_telemetry_intervals *intervals;
 	struct scmi_telemetry_shmti_info **shmtis;
+	unsigned int num_uuids;
+	uuid_t * __rcu *uuids __counted_by_ptr(num_uuids);
 };
 
 /**
-- 
2.54.0


