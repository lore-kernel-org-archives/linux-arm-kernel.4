Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E6860A3834
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WyvBr9or;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fIEYH2rm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wJRe2cqZC0a6+43xV+e3R595ivFdBrA2s/VsVQZcsiU=; b=WyvBr9orkfK3lg
	CLUNUZm1+E+Tb1KkSraM5ZMfgziOCstkrR6B+Lx/Ogki+tju4ViPHzKWz9+dYD2z/831+YIFD07El
	NUlieOFwu0q/5jFs/QoP9nGW+HkT7DvX6qUHAdTfVlaXd1bqlgMePGeR4mq1KsACaOvQVUlxgM5IP
	wjbT1eVvoXnrEPA215gVvm7ghv3FDWpRMvv7N36O4P7XnIf3Y/WSfj7eykqyX3wCGKzdl1bd8ewOv
	GYhOpQcQR37bX1KpAKVE+HVJ75SgTak9T5Q+v1Q/EdoUv069mqogxGbTbd5xlP+ZDonPh1JKnWnpj
	wty7zIzuaffbsT0fi4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUF-00000000CjB-2OTs;
	Mon, 09 Nov 2026 09:16:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLU6-00000000CVG-277F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:16:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D283314BF;
	Mon,  9 Nov 2026 01:16:10 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B75773F85F;
	Mon,  9 Nov 2026 01:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215773; bh=9oTrkO7uTef4ynTyCzJvu/yBAWhfWXZuSAfIFLBLKQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fIEYH2rmEu/+5k2PzHmj5pd8ywcWhioS5oR/0ZILNqyzkJN7arq3zEakmpz5aI1ra
	 KHYhwtQ4tfIYT8h5mW8z0yGNCyXlNqQTt2JpUvm0sLc6C0C/ke8mKZ56Co2zL8byiy
	 veYiADlTMKQJysBXes/HYnwb3Ta4rvwRIjqF8N9E=
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
Subject: [PATCH v15 24/35] firmware: arm_scmi: Add common per-protocol debugfs support
Date: Mon,  9 Nov 2026 09:12:10 +0000
Message-ID: <20261109091221.2532706-25-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011614_729882_8EC7A745 
X-CRM114-Status: GOOD (  21.95  )
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

Allow interested SCMI protocols to register their own specific debugfs
entries under a common per-instance and per-protocol subtree rooted
at /sys/kernel/debug/scmi/<N>/protocols/<PROTO_ID>/

Expose a helper to enable protocol initialization code to get access to
such per-protocol/per-instance dentries in order to be able to install
their own dedicated debugfs entries.

Per-protocol debugfs support is configurable and default off.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - fix debugfs_remove_recursive call-site...was too early
v8 --> v9
 - avoid NULL deref on DBG cleanup path
v5 --> v6
 - bail out of dentry_get helper when SCMI debug susbsytem failed to init
 - remove stale SCMI protocol operations
 - add a preoper clean up of debugfs when protocol init fails
---
 drivers/firmware/arm_scmi/Kconfig     | 14 +++++++++
 drivers/firmware/arm_scmi/common.h    |  2 ++
 drivers/firmware/arm_scmi/driver.c    | 42 +++++++++++++++++++++++++--
 drivers/firmware/arm_scmi/protocols.h |  6 ++++
 include/linux/scmi_protocol.h         |  1 -
 5 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 783c24a20e29..f506c4d1d96a 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -69,6 +69,20 @@ config ARM_SCMI_DEBUG_COUNTERS
 	  such useful debug counters. This can be helpful for debugging and
 	  SCMI monitoring.
 
+config ARM_SCMI_DEBUG_PROTOCOLS
+	bool "Enable SCMI protocols debug"
+	select ARM_SCMI_NEED_DEBUGFS
+	depends on DEBUG_FS
+	default n
+	help
+	  Enables per-protocol specific debug features, where available.
+	  When provided, such per-protocol debugfs entries are grouped
+	  inside a common a subtree named by the protocol number and rooted
+	  under a per-instance 'protocols' directory.
+
+	  Such per-protocol entries subtree structure is freely defined
+	  within the related protocol code.
+
 config ARM_SCMI_QUIRKS
 	bool "Enable SCMI Quirks framework"
 	depends on JUMP_LABEL || COMPILE_TEST
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index e9f3051e8016..ff50aaff65ce 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -310,6 +310,7 @@ enum debug_counters {
 /**
  * struct scmi_debug_info  - Debug common info
  * @top_dentry: A reference to the top debugfs dentry
+ * @protos: A reference to the top debugfs protocols subdirectory
  * @name: Name of this SCMI instance
  * @type: Type of this SCMI instance
  * @is_atomic: Flag to state if the transport of this instance is atomic
@@ -317,6 +318,7 @@ enum debug_counters {
  */
 struct scmi_debug_info {
 	struct dentry *top_dentry;
+	struct dentry *protos;
 	const char *name;
 	const char *type;
 	bool is_atomic;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index c1f503c6e72c..8a4664165a64 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -19,6 +19,7 @@
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
+#include <linux/dcache.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/export.h>
@@ -103,6 +104,8 @@ struct scmi_xfers_info {
  *			has completed.
  * @ph: An embedded protocol handle that will be passed down to protocol
  *	initialization code to identify this instance.
+ * @dbg: An optional reference to this protocol top debugfs directory; it will
+ *	 be automatically recursively removed on protocol de-initialization.
  *
  * Each protocol is initialized independently once for each SCMI platform in
  * which is defined by fwnode and implemented by the SCMI server fw.
@@ -117,6 +120,7 @@ struct scmi_protocol_instance {
 	unsigned int			version;
 	unsigned int			negotiated_version;
 	struct scmi_protocol_handle	ph;
+	struct dentry			*dbg;
 };
 
 #define ph_to_pi(h)	container_of(h, struct scmi_protocol_instance, ph)
@@ -2135,6 +2139,25 @@ static void scmi_common_fastchannel_db_ring(struct scmi_fc_db_info *db)
 		SCMI_PROTO_FC_RING_DB(64);
 }
 
+static struct dentry *
+scmi_debugfs_proto_dentry_get(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	struct scmi_info *info = handle_to_scmi_info(pi->handle);
+
+	if (!IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS) || !info->dbg)
+		return ERR_PTR(-ENODEV);
+
+	if (!pi->dbg) {
+		char proto_dir[8];
+
+		snprintf(proto_dir, 8, "0x%02X", pi->proto->id);
+		pi->dbg = debugfs_create_dir(proto_dir, info->dbg->protos);
+	}
+
+	return pi->dbg;
+}
+
 static const struct scmi_proto_helpers_ops helpers_ops = {
 	.extended_name_get = scmi_common_extended_name_get,
 	.get_max_msg_size = scmi_common_get_max_msg_size,
@@ -2145,6 +2168,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
+	.debugfs_proto_dentry_get = scmi_debugfs_proto_dentry_get,
 };
 
 /**
@@ -2330,12 +2354,12 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	/* proto->init is assured NON NULL by scmi_protocol_register */
 	ret = pi->proto->instance_init(&pi->ph);
 	if (ret)
-		goto clean;
+		goto clean_dbg;
 
 	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
 			GFP_KERNEL);
 	if (ret != proto->id)
-		goto clean;
+		goto clean_dbg;
 
 	/*
 	 * Warn but ignore events registration errors since we do not want
@@ -2356,6 +2380,8 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 
 	return pi;
 
+clean_dbg:
+	debugfs_remove_recursive(pi->dbg);
 clean:
 	/* Take care to put the protocol module's owner before releasing all */
 	scmi_protocol_put(proto);
@@ -2474,6 +2500,7 @@ void scmi_protocol_release_unlocked(const struct scmi_handle *handle,
 			protocol_id);
 
 	if (refcount_dec_and_test(&pi->users)) {
+		struct dentry *dbg = pi->dbg;
 		void *gid = pi->gid;
 
 		if (pi->proto->events)
@@ -2487,6 +2514,14 @@ void scmi_protocol_release_unlocked(const struct scmi_handle *handle,
 		scmi_protocol_put(pi->proto);
 
 		devres_release_group(handle->dev, gid);
+
+		/*
+		 * Remove per-protocol top dir only after protocol release in
+		 * order to allow any protocol specific cleanup on the pi->dbg
+		 * subtree.
+		 */
+		debugfs_remove_recursive(dbg);
+
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
 	}
@@ -3257,6 +3292,9 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
 		scmi_debugfs_counters_setup(dbg, trans);
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		dbg->protos = debugfs_create_dir("protocols", top_dentry);
+
 	dbg->top_dentry = top_dentry;
 
 	if (devm_add_action_or_reset(info->dev,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 77daedddaab7..239318ee8f56 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -11,6 +11,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -293,6 +294,9 @@ struct scmi_fc_info {
  *		      gathering FC descriptions from the SCMI platform server.
  * @fastchannel_db_ring: A common helper to ring a FC doorbell.
  * @get_max_msg_size: A common helper to get the maximum message size.
+ * @debugfs_proto_dentry_get: A common helper to get a per-protocol debugfs top
+ *			      directory to use as a root. It will be
+ *			      recursively removed on protocol de-initialization.
  */
 struct scmi_proto_helpers_ops {
 	int (*extended_name_get)(const struct scmi_protocol_handle *ph,
@@ -316,6 +320,8 @@ struct scmi_proto_helpers_ops {
 				 u32 *rate_limit);
 	void (*fastchannel_db_ring)(struct scmi_fc_db_info *db);
 	int (*get_max_msg_size)(const struct scmi_protocol_handle *ph);
+	struct dentry *(*debugfs_proto_dentry_get)
+		(const struct scmi_protocol_handle *ph);
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 585eb3a4684e..ed3eaa1482a3 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1164,7 +1164,6 @@ struct scmi_handle {
 	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
 	bool (*is_transport_atomic)(const struct scmi_handle *handle,
 				    unsigned int *atomic_threshold);
-
 	const struct scmi_notify_ops *notify_ops;
 };
 
-- 
2.54.0


