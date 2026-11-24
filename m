Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D25606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QuhGDnt7;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fsFxGhqF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WbMalliMMc03VHzWLBITU00Ot6YpvYATLzypowQsz/w=; b=QuhGDnt7hjWqkQ
	/L8iXNH/eStxPRM1oMsRMiIiUbEBHAFc79IxMsyih16nxvcDmyTrVjGXsS4cXO+Y1cDkO9qq3fBQp
	4isBILpeLZsPVCUunt6bidUvE7etjD6AZwgIZ/zp1M8KUnYRVuBRKNk32E3sVgNH1+BWovPD9kDQW
	U+lFGPVf/T6ESI041QH3O2ogC88EYOv2JQ46eS7yLju1a6C7FCgw9Q4n8ti/EQ1JnBLIvrYNHvLPO
	6BaBGeQy0U9JjmxaT6+0TVjsWmNkQPb05MDWBLpNfrTL2nS9vZWpYdeN0cgma7eq89EeuZLmhVWWv
	jvhvEZHGyvJWBh1AOCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu0w-00000007Gp8-3ajX;
	Tue, 24 Nov 2026 17:09:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu0B-00000007GI8-0Hkf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:08:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B8F16F8;
	Tue, 24 Nov 2026 09:08:15 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39E4A3F763;
	Tue, 24 Nov 2026 09:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540097; bh=F0Ui/9CIJgHyYbeTgendvQd9UsMu45h3f9tGv/4wGZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fsFxGhqFuO8EvUwE49p/zHx64iOTXj+v7bB5nxDoMdAEUzRi93K/nn0SKBiOmAgoc
	 mTaXCCAPZdLMJJxXXPsIeVY/yIK8iUnxBoLQqeW2QJzoGUrWnZXctFUTu9eBDMdX8f
	 qma+UNvz9acMraPmuGYkHfZwoTl2/wXu43soaSVU=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:33 +0000
Subject: [PATCH 05/24] media: mali-c720: Add hardware identification
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-5-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=10501;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=MrP09vzI2+KeyeyoX9tQc9xh7vluGDweeyIb00uoKhk=;
 b=9UzIwe+m5H07p4vtQ7UUFBtp853hIzLKIEtWzNe3i2IIVCThEuNNaF9j+ZU6HZgqRHY1Ch/ZX
 268ZO+u/iOoAP1wjixqUWwRnpzZkr/o/DbD7JDJlAAiNW9oa9jlxZL2
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090819_359890_3E5407C1 
X-CRM114-Status: GOOD (  22.38  )
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

From: Anthony McGivern <Anthony.McGivern@arm.com>

Read the ISP identification registers and match the device against
the currently supported hardware revisions, rejecting unsupported
hardware.

Add register-map selection based on the identified hardware revision.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../platform/arm/mali-c720/mali-c720-common.h      |   3 +
 .../media/platform/arm/mali-c720/mali-c720-id.c    | 165 +++++++++++++++++++++
 .../media/platform/arm/mali-c720/mali-c720-id.h    |  34 +++++
 .../platform/arm/mali-c720/mali-c720-registers.c   |  27 ++--
 .../platform/arm/mali-c720/mali-c720-registers.h   |   5 +-
 5 files changed, 223 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 7cf7380202a4587b844b66b45bfe76f6bac61635..0685bb7e0f5545091a022bf4ed19b3f2b249c2de 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -13,6 +13,7 @@
 #include <linux/refcount.h>
 #include <linux/spinlock.h>
 
+#include "mali-c720-id.h"
 #include "mali-c720-register-access.h"
 #include "mali-c720-registers.h"
 #include "mali-c720-registers-top.h"
@@ -40,6 +41,8 @@ struct mali_c720 {
 	resource_size_t mmio_size;
 
 	struct mali_c720_registers registers;
+
+	const struct mali_c720_hw_version *hw_version;
 };
 
 #endif /* MALI_C720_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-id.c b/drivers/media/platform/arm/mali-c720/mali-c720-id.c
new file mode 100644
index 0000000000000000000000000000000000000000..5d8dc9319e74a6e8bc96673e317a880f1fcf2b61
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-id.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+
+#include "mali-c720-common.h"
+
+#define MALI_C720_ID_PART 0x560
+#define MALI_C720_ID_DESIGNER_ARM 0x43b
+#define MALI_C720_ID_PREAMBLE 0xb105000d
+#define MALI_C720_ID_CLASS 0xe
+
+struct mali_c720_id_registers {
+	u32 pid0;
+	u32 pid1;
+	u32 pid2;
+	u32 pid3;
+	u32 pid4;
+	u32 preamble;
+	u32 class;
+};
+
+static const struct mali_c720_hw_version
+mali_c720_supported_hw_versions[MALI_C720_VERSION_ID_MAX] = {
+	[MALI_C720_VERSION_ID_R0_P0] = {
+		.name = "Mali-C720 r0p0",
+		.id = MALI_C720_VERSION_ID_R0_P0,
+		.part = MALI_C720_ID_PART,
+		.revision = 0x0,
+		.revand = 0x0,
+		.cmod = 0x0,
+	},
+	[MALI_C720_VERSION_ID_R0_P1] = {
+		.name = "Mali-C720 r0p1",
+		.id = MALI_C720_VERSION_ID_R0_P1,
+		.part = MALI_C720_ID_PART,
+		.revision = 0x1,
+		.revand = 0x0,
+		.cmod = 0x0,
+	},
+};
+
+static void mali_c720_read_id_registers(struct mali_c720 *mali_c720,
+					struct mali_c720_id_registers *id)
+{
+	const struct mali_c720_id_regs *id_regs = mali_c720->registers.id;
+
+	id->pid0 = mali_c720_read(mali_c720, &id_regs->pid0);
+	id->pid1 = mali_c720_read(mali_c720, &id_regs->pid1);
+	id->pid2 = mali_c720_read(mali_c720, &id_regs->pid2);
+	id->pid3 = mali_c720_read(mali_c720, &id_regs->pid3);
+	id->pid4 = mali_c720_read(mali_c720, &id_regs->pid4);
+
+	/* Assemble the component preamble, keeping the class separate. */
+	id->preamble = mali_c720_read(mali_c720, &id_regs->cid0_prmbl_0);
+	id->preamble |= mali_c720_read(mali_c720, &id_regs->cid1_prmbl_1) << 8;
+	id->preamble |= mali_c720_read(mali_c720, &id_regs->cid2_prmbl_2) << 16;
+	id->preamble |= mali_c720_read(mali_c720, &id_regs->cid3_prmbl_3) << 24;
+	id->class = mali_c720_read(mali_c720, &id_regs->cid1_class);
+}
+
+static u16 mali_c720_id_designer(const struct mali_c720_id_regs *id_regs,
+				 const struct mali_c720_id_registers *id)
+{
+	return (u16)(field_get(mali_c720_reg_mask(&id_regs->pid1_des_0), id->pid1) |
+		     (field_get(mali_c720_reg_mask(&id_regs->pid2_des_1), id->pid2) << 4) |
+		     (field_get(mali_c720_reg_mask(&id_regs->pid4_des_2), id->pid4) << 8));
+}
+
+static u16 mali_c720_id_part(const struct mali_c720_id_regs *id_regs,
+			     const struct mali_c720_id_registers *id)
+{
+	return (u16)(field_get(mali_c720_reg_mask(&id_regs->pid0_part_0), id->pid0) |
+		     (field_get(mali_c720_reg_mask(&id_regs->pid1_part_1), id->pid1) << 8));
+}
+
+static u8 mali_c720_id_revision(const struct mali_c720_id_regs *id_regs,
+				const struct mali_c720_id_registers *id)
+{
+	return (u8)field_get(mali_c720_reg_mask(&id_regs->pid2_revision), id->pid2);
+}
+
+static u8 mali_c720_id_revand(const struct mali_c720_id_regs *id_regs,
+			      const struct mali_c720_id_registers *id)
+{
+	return (u8)field_get(mali_c720_reg_mask(&id_regs->pid3_revand), id->pid3);
+}
+
+static u8 mali_c720_id_cmod(const struct mali_c720_id_regs *id_regs,
+			    const struct mali_c720_id_registers *id)
+{
+	return (u8)field_get(mali_c720_reg_mask(&id_regs->pid3_cmod), id->pid3);
+}
+
+static const struct mali_c720_hw_version *
+mali_c720_find_hw_version(const struct mali_c720_id_regs *id_regs,
+			  const struct mali_c720_id_registers *id)
+{
+	u16 part = mali_c720_id_part(id_regs, id);
+	u8 revision = mali_c720_id_revision(id_regs, id);
+	u8 revand = mali_c720_id_revand(id_regs, id);
+	u8 cmod = mali_c720_id_cmod(id_regs, id);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c720_supported_hw_versions); i++) {
+		const struct mali_c720_hw_version *version =
+			&mali_c720_supported_hw_versions[i];
+
+		if (version->part == part &&
+		    version->revision == revision &&
+		    version->revand == revand &&
+		    version->cmod == cmod)
+			return version;
+	}
+
+	return NULL;
+}
+
+int mali_c720_identify_hw(struct mali_c720 *mali_c720)
+{
+	const struct mali_c720_id_regs *id_regs = mali_c720->registers.id;
+	struct mali_c720_id_registers id;
+	const struct mali_c720_hw_version *version;
+	u16 part, designer;
+	u8 revision, revand, cmod;
+
+	mali_c720_read_id_registers(mali_c720, &id);
+
+	designer = mali_c720_id_designer(id_regs, &id);
+	if (designer != MALI_C720_ID_DESIGNER_ARM)
+		return dev_err_probe(mali_c720->dev, -ENODEV,
+				     "unsupported ISP designer ID: %#x\n", designer);
+
+	if (id.preamble != MALI_C720_ID_PREAMBLE)
+		return dev_err_probe(mali_c720->dev, -ENODEV,
+				     "unsupported ISP component preamble: %#x\n", id.preamble);
+
+	if (id.class != MALI_C720_ID_CLASS)
+		return dev_err_probe(mali_c720->dev, -ENODEV,
+				     "unsupported ISP component class: %#x\n", id.class);
+
+	version = mali_c720_find_hw_version(id_regs, &id);
+	if (!version) {
+		part = mali_c720_id_part(id_regs, &id);
+		revision = mali_c720_id_revision(id_regs, &id);
+		revand = mali_c720_id_revand(id_regs, &id);
+		cmod = mali_c720_id_cmod(id_regs, &id);
+
+		return dev_err_probe(mali_c720->dev, -ENODEV,
+				     "unsupported ISP version: part=%#x revision=%u revand=%u cmod=%u\n",
+				     part, revision, revand, cmod);
+	}
+
+	mali_c720->hw_version = version;
+
+	dev_info(mali_c720->dev, "detected %s\n", version->name);
+
+	return 0;
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-id.h b/drivers/media/platform/arm/mali-c720/mali-c720-id.h
new file mode 100644
index 0000000000000000000000000000000000000000..2253672a9a46ee65045a1a0c3bc08662b5309b02
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-id.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Hardware identification
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_ID_H
+#define MALI_C720_ID_H
+
+#include <linux/types.h>
+
+#define MALI_C720_ID_SIZE 0x1000
+
+struct mali_c720;
+
+enum mali_c720_version_id {
+	MALI_C720_VERSION_ID_R0_P0,
+	MALI_C720_VERSION_ID_R0_P1,
+	MALI_C720_VERSION_ID_MAX,
+};
+
+struct mali_c720_hw_version {
+	const char *name;
+	enum mali_c720_version_id id;
+	u16 part;
+	u8 revision;
+	u8 revand;
+	u8 cmod;
+};
+
+int mali_c720_identify_hw(struct mali_c720 *mali_c720);
+
+#endif /* MALI_C720_ID_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers.c b/drivers/media/platform/arm/mali-c720/mali-c720-registers.c
index d6a731e9c1fa6e9b1579fd53a14c2eb45894f070..1c2d0ad7948d41ebc7d9666effb881f72ce0ed43 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-registers.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers.c
@@ -36,15 +36,22 @@ const struct mali_c720_id_regs *mali_c720_get_id_regs(void)
 	return &id_regs;
 }
 
-int mali_c720_get_registers(struct mali_c720_registers *regs)
+int mali_c720_get_registers(enum mali_c720_version_id version,
+			    struct mali_c720_registers *regs)
 {
-	*regs = (struct mali_c720_registers) {
-		.id = &id_regs,
-		.top = mali_c720_get_top_regs(),
-		.cm = mali_c720_get_ctx_mgr_regs(),
-		.modules = mali_c720_get_modules_regs(),
-		.context_offset = 0x80000,
-		.context_size = 0x100000,
-	};
-	return 0;
+	switch (version) {
+	case MALI_C720_VERSION_ID_R0_P0:
+	case MALI_C720_VERSION_ID_R0_P1:
+		*regs = (struct mali_c720_registers) {
+			.id = &id_regs,
+			.top = mali_c720_get_top_regs(),
+			.cm = mali_c720_get_ctx_mgr_regs(),
+			.modules = mali_c720_get_modules_regs(),
+			.context_offset = 0x80000,
+			.context_size = 0x100000,
+		};
+		return 0;
+	default:
+		return -ENODEV;
+	}
 }
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers.h b/drivers/media/platform/arm/mali-c720/mali-c720-registers.h
index 288bd168be41c8569f79ff147c919c7daceaa039..c1697d19b22907a24396b6f295287919c528c72b 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-registers.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers.h
@@ -10,6 +10,8 @@
 
 #include <linux/types.h>
 
+enum mali_c720_version_id;
+
 struct mali_c720_top_regs;
 struct mali_c720_ctx_mgr_regs;
 struct mali_c720_modules_regs;
@@ -56,7 +58,8 @@ struct mali_c720_registers {
 };
 
 const struct mali_c720_id_regs *mali_c720_get_id_regs(void);
-int mali_c720_get_registers(struct mali_c720_registers *regs);
+int mali_c720_get_registers(enum mali_c720_version_id version,
+			    struct mali_c720_registers *regs);
 
 static inline u32 mali_c720_reg_addr(u32 base, const struct mali_c720_reg_field *field)
 {

-- 
2.55.0


