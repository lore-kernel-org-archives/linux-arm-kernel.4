Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3497B6082BE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2SBiY2Eq;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hs8WdZJK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rh56qmDTlqnEYnUi3qocKND0LBrItI1JwRwaRlQzxGA=; b=2SBiY2EqRNzIaW
	8QmX6ktWuUYOO7pMsfJFZnKPGjUBNeaL4p9ngZKiTpdmYiO+LJ2L+FWC21QRTa9BHaVqMnz4z5OsM
	LLBbZ0agxLmaC5MlJBst+yf5hfxnLv8ssmbVckiEcMgjFVyM4JPclVlga4ejJo5s2OLDzx72LwMtx
	B5QHr9V8JgsuaMQIXS29wJMyxxgk7KBEvfKCOnlSsRbBJnKKbFPW4mrNan/MKPpVW66r0MA0T65/t
	mj1TCD2D8gB9Z4ysv5yiPDVDuhkgzvqTP8Ne4Eu/z6h46CzGEYNlpJBj/OYB3ntwWo3ALzLKo82sw
	ynPFfw/p4FuP0w3CWi9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTQ-00000000Bbg-3MkK;
	Mon, 09 Nov 2026 09:15:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTK-00000000BVR-3Inj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:15:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 204C815A1;
	Mon,  9 Nov 2026 01:15:22 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B64C3F85F;
	Mon,  9 Nov 2026 01:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215725; bh=ns7SteWb+jPIElxo+WR38Pwbo3bcVk22t8vflyvo78E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hs8WdZJKlYDlCvtrCEEWuBQ5tYMdU7c147/MbdrbViMCsZDT1FJd7FLYoKNIfX7OZ
	 4EFCpEesxNOS29Z9xGztPD6Yk8VDnKPHep9S37BGex9XmZFONWq1Sdz43uk28b5yBz
	 q/iW27vHrzBMhJ6objYLvwqgMeoAATAXuMBF5uLU=
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
Subject: [PATCH v15 09/35] firmware: arm_scmi: Add Telemetry basic attributes enumeration
Date: Mon,  9 Nov 2026 09:11:55 +0000
Message-ID: <20261109091221.2532706-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011527_425751_245ACBE5 
X-CRM114-Status: GOOD (  26.26  )
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

Add SCMIv4.0 Telemetry basic support for minimal initialization and
protocol attributes enumeration: expose telemetry instance descriptor
via a simple information retrieval protocol operation.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - add include uuid.h into scmi_protocol.h
 - dropped needless __must_check
v13 --> v14
 - split original basic Telemetry patch, reducing this patch to the
   basics of protocol attributes enumeration only
 - fix group unroll loop on groups_init failure
 - remove goto from de_desc_parse
 - renamed some fields to more strictly adhere to spec nomenclature
v12 --> v13
 - headers includes re-order
 - rework cleanup path for instance allocations
 - relocate tde->mtx guards higher up and add lockdep assertions
 - add more _RAW macros
 - rename DE_CONFIGURE defines
 - use *alloc_objs
 - remove TO_CPU64 and useless READ_ONCEs
v11 --> v12
 - dropped counted-by in smhtis
 - reworked barriers around res_get
 - added smp_store_release on TDE registration
v10 -->v11
 - relocated a few parsing macros from another patch
 - cleanup exit path on resource enumeration
 - remove 'naked' ti->rinfo accesses
 - walk xa_des to free DEs on removal
v8 --> v9
 - Fixes for some Sashiko issues on v8
   - use counted_by_lle where appropriate
   - consider header in boudanry check in DE_DESCRIPTION iterators
   - bail out if SHMTI areas are NOT 32bit aligned
   - warn if SHMTI areas are NOT 64bit aligned
 - convert SCMI_TDE_VAR_SZ macro to an inline function
 - make some enum definition explicit
v7 --> v8
 - Fixes for some Sashiko issues on v7
   - add proper msg boundary parsing checks on DE_DESCRIPTION multipart
   - add proper cleanup/rollback on groups_init err_path
   - update num_des_tstamp ONLY after a DE is successfully initialized
   - proper cleanup tde during tde_put (preserving info/mutex bits)
   - add membarriers in enumerate resources
   - add a check and a warn on SHMTI phys_addr alignment
   - reword a few dev_errs
   - use tde_free_put on resoucers_free
v6 --> v7
 - use uuid_t for proper Telemetry UUID DE_IMPL_VERSION endianity
v5 --> v6
 - define uuid_line dwords as BE
 - fixed Sashiko reviews where applicable:
   https://sashiko.dev/#/message/20260703123601.381275-8-cristian.marussi%40arm.com
   - fix missing le32 and bound check in variable payload parsing
   - fix TDE duplicatin logic
   - fix intervals cleanup - fixes also KMEMLEAK report
   - implement proper freeinfg for group resources
   - proper SHMTI iterations
   - removed useless/stale static in scmi_telemetry_tde_get()
v4 --> v5
 - fix de->grp_id initialization for DEs not belonging to a group
 - removed UAPI structures dependency
 - expose discovered SHMTIs areas in scmi_protocol.h
 - fixes sparse warnings
v3 -->v4
 - bail-out on FW_BUG errors
 - count timestamp capable DE to track enables
v2 --> v3
 - split from monolithic Telemetry patch
 - fix checkpatch macros complaints
 - fix ACCESS_PRIVATE usage
 - add a few comments on allocation/enumeration lifetime
 - use interval.num_intervals
 - removed needless cleanup handler usage
 - simply return from scmi_telemetry_de_lookup()
 - fixed composing_des name length to 08X
---
 drivers/firmware/arm_scmi/Makefile    |   2 +-
 drivers/firmware/arm_scmi/driver.c    |   2 +
 drivers/firmware/arm_scmi/protocols.h |   1 +
 drivers/firmware/arm_scmi/telemetry.c | 149 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  33 +++++-
 5 files changed, 185 insertions(+), 2 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/telemetry.c

diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index 780cd62b2f78..fe55b7aa0707 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -8,7 +8,7 @@ scmi-driver-$(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) += raw_mode.o
 scmi-transport-$(CONFIG_ARM_SCMI_HAVE_SHMEM) = shmem.o
 scmi-transport-$(CONFIG_ARM_SCMI_HAVE_MSG) += msg.o
 scmi-protocols-y := base.o clock.o perf.o power.o reset.o sensors.o system.o voltage.o powercap.o
-scmi-protocols-y += pinctrl.o
+scmi-protocols-y += pinctrl.o telemetry.o
 scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index dfb4749bf69c..c1f503c6e72c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3716,6 +3716,7 @@ static int __init scmi_driver_init(void)
 	scmi_system_register();
 	scmi_powercap_register();
 	scmi_pinctrl_register();
+	scmi_telemetry_register();
 
 	return platform_driver_register(&scmi_driver);
 }
@@ -3734,6 +3735,7 @@ static void __exit scmi_driver_exit(void)
 	scmi_system_unregister();
 	scmi_powercap_unregister();
 	scmi_pinctrl_unregister();
+	scmi_telemetry_unregister();
 
 	platform_driver_unregister(&scmi_driver);
 
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index d1f1bde8a7cc..77daedddaab7 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -410,5 +410,6 @@ DECLARE_SCMI_REGISTER_UNREGISTER(sensors);
 DECLARE_SCMI_REGISTER_UNREGISTER(voltage);
 DECLARE_SCMI_REGISTER_UNREGISTER(system);
 DECLARE_SCMI_REGISTER_UNREGISTER(powercap);
+DECLARE_SCMI_REGISTER_UNREGISTER(telemetry);
 
 #endif /* _SCMI_PROTOCOLS_H */
diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
new file mode 100644
index 000000000000..23eaac485691
--- /dev/null
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) Telemetry Protocol
+ *
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/compiler_types.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/sprintf.h>
+#include <linux/string.h>
+#include <linux/uuid.h>
+
+#include "protocols.h"
+#include "notify.h"
+
+/* Updated only after ALL the mandatory features for that version are merged */
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+#define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
+
+/* An enum listing the protocol specific commands definitions */
+enum scmi_telemetry_protocol_cmd {
+	TELEMETRY_LIST_SHMTI = 0x3,
+	TELEMETRY_DE_DESCRIPTION = 0x4,
+	TELEMETRY_LIST_UPDATE_INTERVALS = 0x5,
+	TELEMETRY_DE_CONFIGURE = 0x6,
+	TELEMETRY_DE_ENABLED_LIST = 0x7,
+	TELEMETRY_CONFIG_SET = 0x8,
+	TELEMETRY_READING_COMPLETE = TELEMETRY_CONFIG_SET,
+	TELEMETRY_CONFIG_GET = 0x9,
+	TELEMETRY_RESET = 0xA,
+};
+
+struct scmi_msg_resp_telemetry_protocol_attributes {
+	__le32 de_num;
+	__le32 groups_num;
+	__le32 de_implem_rev_dword[SCMI_TLM_DE_IMPL_NUM_DWORDS];
+	__le32 attributes_1;
+#define SUPPORTS_SINGLE_READ(x)		(le32_get_bits((x), BIT(31)))
+#define SUPPORTS_CONTINUOS_UPDATE(x)	(le32_get_bits((x), BIT(30)))
+#define SUPPORTS_PER_GROUP_CONFIG(x)	(le32_get_bits((x), BIT(18)))
+#define SUPPORTS_RESET(x)		(le32_get_bits((x), BIT(17)))
+#define SUPPORTS_FC(x)			(le32_get_bits((x), BIT(16)))
+	__le32 default_blk_ts_rate;
+};
+
+struct telemetry_info {
+	bool streaming_mode;
+	unsigned int num_shmti;
+	unsigned int num_des_tstamp;
+	unsigned int default_blk_ts_rate;
+	const struct scmi_protocol_handle *ph;
+	struct scmi_telemetry_info info;
+};
+
+static int
+scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
+{
+	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
+				      sizeof(*resp), &t);
+	if (ret)
+		return ret;
+
+	resp = t->rx.buf;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		__le32 attr = resp->attributes_1;
+		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
+
+		ti->info.base.num_des = le32_to_cpu(resp->de_num);
+		ti->info.base.num_groups = le32_to_cpu(resp->groups_num);
+		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
+			de_impl_version[i] =
+				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));
+		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
+		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
+		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
+		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
+		ti->info.reset_support = SUPPORTS_RESET(attr);
+		ti->info.fc_support = SUPPORTS_FC(attr);
+		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
+		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_telemetry_info *
+scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	return &ti->info;
+}
+
+static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
+	.info_get = scmi_telemetry_info_get,
+};
+
+static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct device *dev = ph->dev;
+	struct telemetry_info *ti;
+	int ret;
+
+	dev_dbg(dev, "Telemetry Version %d.%d\n",
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
+
+	ti = devm_kzalloc(dev, sizeof(*ti), GFP_KERNEL);
+	if (!ti)
+		return -ENOMEM;
+
+	ti->ph = ph;
+
+	ret = scmi_telemetry_protocol_attributes_get(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot retrieve protocol attributes. Abort.\n");
+		return ret;
+	}
+
+	ti->info.base.version = ph->version;
+
+	return ph->set_priv(ph, ti);
+}
+
+static const struct scmi_protocol scmi_telemetry = {
+	.id = SCMI_PROTOCOL_TELEMETRY,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_telemetry_protocol_init,
+	.ops = &tlm_proto_ops,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+};
+
+DEFINE_SCMI_PROTOCOL_REGISTER_UNREGISTER(telemetry, scmi_telemetry)
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3f7cc35eb861..f076ce5601cf 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -2,17 +2,19 @@
 /*
  * SCMI Message Protocol driver header
  *
- * Copyright (C) 2018-2021 ARM Ltd.
+ * Copyright (C) 2018-2026 ARM Ltd.
  */
 
 #ifndef _LINUX_SCMI_PROTOCOL_H
 #define _LINUX_SCMI_PROTOCOL_H
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/device-id/scmi.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
+#include <linux/uuid.h>
 
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
@@ -828,6 +830,35 @@ struct scmi_pinctrl_proto_ops {
 	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
 };
 
+struct scmi_telemetry_base_info {
+	unsigned int version;
+	uuid_t primary_revision;
+	unsigned int num_des;
+	unsigned int num_groups;
+	unsigned int num_intervals;
+	unsigned int num_shmtis;
+};
+
+struct scmi_telemetry_info {
+	bool single_read_support;
+	bool continuous_update_support;
+	bool per_group_config_support;
+	bool reset_support;
+	bool fc_support;
+	struct scmi_telemetry_base_info base;
+};
+
+/**
+ * struct scmi_telemetry_proto_ops - represents the various operations provided
+ *	by SCMI Telemetry Protocol
+ *
+ * @info_get: get the general Telemetry information.
+ */
+struct scmi_telemetry_proto_ops {
+	const struct scmi_telemetry_info *(*info_get)
+		(const struct scmi_protocol_handle *ph);
+};
+
 /**
  * struct scmi_notify_ops  - represents notifications' operations provided by
  * SCMI core
-- 
2.54.0


