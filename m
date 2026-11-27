Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE89F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XyCaBPMY;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Msb9lNiF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P/Gn6LexJGFfmRp3yECeaCAngq/sc7I/NcNd1TWxKVw=; b=XyCaBPMYogmwMr
	AXl0mIO6W3jW+9VPBxE428FfuBBfKehtT06rAvpH4Ilv30bIZWr3oLEBHWWMLK7Xa2ocHizW55ltG
	TCkt9rcv/4Rvg1aePa9cX5SqLSYPh/aGO8uYuOZfs0Cyihcj6b5n6cx79huqdEpiA6g+nJCp9V6iP
	+zYeCiNTDctNIUXXQzmdKV7m6UFNAP2NC6UHSwRx/K5Z3P8v5G8vQ7mwFASEAdEpXTnGe8sbZrAr7
	lrP0BCT37EGHeaHKmgEKaeFRRnsrdoXIRDpmflkIMxIr7wpS/xMYlKyMENhef41hvI3XfETfUjUZ7
	uCUyQh0ZvNjttnHqDNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxtU-0000000GnTA-2XcC;
	Fri, 27 Nov 2026 15:29:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsW-0000000Gmh2-1ekQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:28:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0B3D1D70;
	Fri, 27 Nov 2026 07:28:44 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 925263F632;
	Fri, 27 Nov 2026 07:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793327; bh=A2eBfilJqyM2cuVS5EveN3X+4rgWM8x25ULIxhfqikc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Msb9lNiFY/aj92G1pw7hDr8rYcaXVoBraHzkd3XuVZetfJqfL+N97JeVbNHX3giuw
	 f2GfKHQO8GAuIH2mMpTM+T8UogxnFxMywJeKVMBYniot5igMCFbUpryt9po+fuz5hm
	 up/3jTbe5XZ2VD7sTIAhUHvJ4xm1Y/m31A4GfI8Y=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:28:32 +0000
Subject: [PATCH RFC v2 2/6] firmware: arm_firme: introduce arm_firme
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-firme_interface-v2-2-ab88b2d0b4e0@arm.com>
References: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
In-Reply-To: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Mark Brown <broonie@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19601; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=A2eBfilJqyM2cuVS5EveN3X+4rgWM8x25ULIxhfqikc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaGncevsReyY8erD6rZymWJeG29z3woq3BNm6
 MrOXxsTX+SJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmhpwAKCRBt1cPRWsUx
 M8v6C/439504IYE0GVTzOBm8/p+fRA4eBhcNB26fqfO2kekbZiyyrQ6XzCTInKKwnbj++yI3gaP
 OyqCgjIdOprbW8HtflzDTtVRkhJHS7h5WOUQxaOULQDrY5qw5Lgy5xHTb9knM1mnUUn670bssRn
 Vx1zK31Gn8MR+LWsdcjXljqp9abAjB8/X7wzgF7ak4t5O5tj066X8vZArj1zWNlQiZLSa7jwC9G
 VIiynsm/QhM+BrOjQ1+3vp4/Q6dIbuZ7P+gmh8mkWQM0aLfs3gmGnWp7eWvgwy/0BZAxMZiBfa9
 v6bCXtumQpZt4mJxD0LimsUvMa3pEeRY97k3tXS6VTR5pXW+vKh+Te6LKwCpubWr3qS67RIJVMi
 v5Hwed5CiTXMH3GWgmi81ymoiFTk/JAIBBC85os1SR35zm+Fskm29UuQN4LM68ouvJTEyiwtzPz
 /LQgF1J3Gu0E4W3YvGUUs1wJPio+OOeAHQuwhRlsj+0IPR6YBvoEeZ9UiBOCqmAO+Oyts=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072848_536277_0C2A3BA2 
X-CRM114-Status: GOOD (  22.19  )
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

The Realm Management Extension (FEAT_RME) is part of Arm Confidential
Compute Architecture (CCA) and enables support for dynamic, attestable
trusted execution environments ("Realms") on Arm systems.

Realm management flows depend on EL3 firmware for operations such as
Realm construction, resource allocation and isolation, and attestation
of initial Realm state.

The FIRME defines standard interfaces provided by EL3 firmware to
satisfy these dependencies. These interfaces include:

  - Granule Protection Table management
  - IDE key management for PCIe and CXL Root Ports
  - Memory Encryption Context management
  - Attestation token management
  - Integrated device management

Each group of interfaces forms a FIRME service. A base FIRME service
is also defined to provide common concepts, service discovery, and
feature discovery across services.

FIRME interfaces are implemented at the EL3 boundary between the
Non-secure, Realm, and Secure states. They may also be used on systems
without FEAT_RME, for example to provide firmware-based attestation or
security services.

arm_firme.c provides the common APIs to be used for FIRME device/driver
to support for FIRME services

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/Kconfig     |  36 ++++++
 drivers/firmware/Makefile    |   1 +
 drivers/firmware/arm_firme.c | 275 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h    |   1 +
 include/linux/arm_firme.h    | 261 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 574 insertions(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 43e2e2a645945..d031c36c44dcc 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -60,6 +60,42 @@ config ARM_SDEI_NMI
 
 	  If unsure, say N.
 
+config ARM_FIRME
+	bool "Arm Firmware Interfaces for Realm Management Extension (FIRME)"
+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+	default n
+	help
+	  The Realm Management Extension (FEAT_RME) is part of Arm Confidential
+	  Compute Architecture (CCA) and enables support for dynamic, attestable
+	  trusted execution environments ("Realms") on Arm systems.
+
+	  Realm management flows depend on EL3 firmware for operations such as
+	  Realm construction, resource allocation and isolation, and attestation
+	  of initial Realm state.
+
+	  The FIRME defines standard interfaces provided by EL3 firmware to
+	  satisfy these dependencies. These interfaces include:
+
+	    - Granule Protection Table management
+	    - IDE key management for PCIe and CXL Root Ports
+	    - Memory Encryption Context management
+	    - Attestation token management
+	    - Integrated device management
+
+	  Each group of interfaces forms a FIRME service. A base FIRME service
+	  is also defined to provide common concepts, service discovery, and
+	  feature discovery across services.
+
+	  FIRME interfaces are implemented at the EL3 boundary between the
+	  Non-secure, Realm, and Secure states. They may also be used on
+	  systems without FEAT_RME, for example to provide firmware-based
+	  attestation or security services.
+
+	  This opions provides the common APIs used for FIRME service
+	  implementation driver.
+
+	  If unsure, say N.
+
 config EDD
 	tristate "BIOS Enhanced Disk Drive calls determine boot disk"
 	depends on X86
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 50b3383131522..2e217c6b80f26 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -2,6 +2,7 @@
 #
 # Makefile for the linux kernel.
 #
+obj-$(CONFIG_ARM_FIRME)		+= arm_firme.o
 obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= arm_scpi.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)	+= arm_sdei.o
 obj-$(CONFIG_ARM_SDEI_NMI)	+= arm_sdei_nmi.o
diff --git a/drivers/firmware/arm_firme.c b/drivers/firmware/arm_firme.c
new file mode 100644
index 0000000000000..fafed19121141
--- /dev/null
+++ b/drivers/firmware/arm_firme.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Arm Ltd.
+ */
+
+#define DRIVER_NAME "ARM FIRME"
+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
+
+#include <linux/arm_firme.h>
+#include <linux/arm-smccc-bus.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/static_key.h>
+
+struct firme_base_service_info {
+	u32 version;
+	struct firme_shared_buf_info shbuf_info;
+} base_service_info;
+
+static DEFINE_STATIC_KEY_TRUE(firme_disabled);
+
+static __always_inline int __firme_get_version(enum firme_service_id service_id,
+					       u32 *version)
+{
+	firme_value_t ret;
+
+	invoke_firme_service((firme_value_t) {
+			     .a0 = FIRME_SERVICE_VERSION,
+			     .a1 = service_id,
+			     }, &ret);
+	if (ret.a0 == FIRME_RET_NOT_SUPPORTED)
+		goto err_out;
+
+	*version = (u32)ret.a0;
+	return 0;
+
+err_out:
+	return firme_status_to_errno(ret.a0);
+}
+
+static __always_inline int __firme_get_feature(enum firme_service_id service_id,
+					       uint8_t feat_idx, unsigned long *feature)
+{
+	firme_value_t ret;
+
+	invoke_firme_service((firme_value_t) {
+			     .a0 = FIRME_SERVICE_FEATURES,
+			     .a1 = service_id,
+			     .a2 = feat_idx,
+			     }, &ret);
+	if (ret.a0 == FIRME_RET_NOT_SUPPORTED)
+		goto err_out;
+
+	*feature = ret.a1;
+
+err_out:
+	return firme_status_to_errno(ret.a0);
+}
+
+int firme_get_version(enum firme_service_id service_id, u32 *version)
+{
+	if (static_branch_unlikely(&firme_disabled))
+		return -EOPNOTSUPP;
+
+	if (!version || service_id >= FIRME_SERVICE_ID_MAX)
+		return -EINVAL;
+
+	return __firme_get_version(service_id, version);
+}
+EXPORT_SYMBOL_GPL(firme_get_version);
+
+int firme_get_feature(enum firme_service_id service_id,
+		      uint8_t feat_idx, unsigned long *feature)
+{
+	if (static_branch_unlikely(&firme_disabled))
+		return -EOPNOTSUPP;
+
+	if (!feature)
+		return -EINVAL;
+
+	return __firme_get_feature(service_id, feat_idx, feature);
+}
+EXPORT_SYMBOL_GPL(firme_get_feature);
+
+int firme_get_shared_buffer_info(struct firme_shared_buf_info *info)
+{
+	if (static_branch_unlikely(&firme_disabled))
+		return -EOPNOTSUPP;
+
+	if (!info)
+		return -EINVAL;
+
+	memcpy(info, &base_service_info.shbuf_info,
+	       sizeof(struct firme_shared_buf_info));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(firme_get_shared_buffer_info);
+
+void *firme_alloc_shared_buffer(size_t *size, gfp_t gfp_flags)
+{
+	struct firme_shared_buf_info *info;
+	int order, min_order, max_order;
+	size_t alloc_size;
+	struct page *page;
+
+	if (static_branch_unlikely(&firme_disabled))
+		return NULL;
+
+	if (!size || (*size == 0))
+		return NULL;
+
+	info = &base_service_info.shbuf_info;
+
+	alloc_size = clamp(*size, info->min_size, info->max_size);
+	min_order = get_order(info->min_size);
+	max_order = min(get_order(alloc_size), MAX_PAGE_ORDER);
+
+	for (order = max_order; order >= min_order; order--) {
+		page = alloc_pages(gfp_flags, order);
+		if (page) {
+			alloc_size = PAGE_SIZE << order;
+			break;
+		}
+	}
+
+	if (!page)
+		return NULL;
+
+	*size = alloc_size;
+
+	return page_address(page);
+}
+EXPORT_SYMBOL_GPL(firme_alloc_shared_buffer);
+
+void firme_free_shared_buffer(void *buf, size_t size)
+{
+	struct firme_shared_buf_info *info;
+	int order, min_order, max_order;
+
+	if (static_branch_unlikely(&firme_disabled))
+		return;
+
+	info = &base_service_info.shbuf_info;
+	min_order = get_order(info->min_size);
+	max_order = min(get_order(info->max_size), MAX_PAGE_ORDER);
+	order = get_order(size);
+
+	WARN_ON_ONCE((order < min_order) || (order > max_order));
+
+	free_pages((unsigned long)buf, order);
+}
+EXPORT_SYMBOL_GPL(firme_free_shared_buffer);
+
+static int firme_base_service_init(void)
+{
+	int ret;
+	u32 version;
+	unsigned long feature;
+	u8 shbuf_min_pgs;
+	u16 max_pgcnt;
+	size_t min_size;
+
+	ret = __firme_get_version(FIRME_BASE_SERVICE_ID, &version);
+	if (ret)
+		return ret;
+
+	ret = __firme_get_feature(FIRME_BASE_SERVICE_ID, 0x01, &feature);
+	if (ret)
+		return ret;
+
+	shbuf_min_pgs = FIELD_GET(FIRME_BASE_FEAT1_SH_BUF_MIN_SZ_MASK, feature);
+	max_pgcnt = FIELD_GET(FIRME_BASE_FEAT1_SH_BUF_MAX_PG_CNT_MASK, feature);
+
+	switch (shbuf_min_pgs) {
+	case FIRME_PGS_4K:
+		min_size = 1UL << 12;
+		break;
+	case FIRME_PGS_16K:
+		min_size = 1UL << 14;
+		break;
+	case FIRME_PGS_64K:
+		min_size = 1UL << 16;
+		break;
+	default:
+		pr_err("Invalid minimum shared buffer size: 0x%x\n", shbuf_min_pgs);
+		return -EINVAL;
+	}
+
+	base_service_info.shbuf_info.min_size = min_size;
+	base_service_info.shbuf_info.max_size = min_size * (max_pgcnt + 1);
+
+	WARN_ON_ONCE(min_size > base_service_info.shbuf_info.max_size);
+
+	pr_info("FIRME version %d.%d\n", FIRME_MAJOR_VERSION(version),
+		FIRME_MINOR_VERSION(version));
+	pr_info("shared buffer size: min: 0x%lx, max: 0x%lx\n",
+		base_service_info.shbuf_info.min_size,
+		base_service_info.shbuf_info.max_size);
+
+	return 0;
+}
+
+static int firme_smccc_dev_create(void)
+{
+	int ret;
+	unsigned long feature, service_list;
+	int i, j;
+
+	struct firme_dev_info {
+		const char *dev_name;
+		struct arm_smccc_device *sdev;
+	} sdev_info[] = {
+		{ .dev_name = NULL, },
+		{ .dev_name = NULL, },
+		{ .dev_name = "arm-firme-ide-keyset", },
+		{ .dev_name = NULL, },
+		{ .dev_name = "arm-firme-attest", },
+		{ .dev_name = NULL, },
+		/* ID_MAX */
+	};
+
+	ret = __firme_get_feature(FIRME_BASE_SERVICE_ID, 0x01, &feature);
+	if (ret)
+		return ret;
+
+	service_list = FIELD_GET(FIRME_BASE_FEAT1_SERVICE_LIST_MASK, feature);
+	service_list = (service_list << 1) | 0x01;
+
+	for (i = FIRME_BASE_SERVICE_ID; i < FIRME_SERVICE_ID_MAX; i++) {
+		if (!sdev_info[i].dev_name || !test_bit(i, &service_list))
+			continue;
+		sdev_info[i].sdev = arm_smccc_device_register(sdev_info[i].dev_name,
+							      FIRME_SERVICE_VERSION,
+							      (void *)i);
+		if (IS_ERR(sdev_info[i].sdev)) {
+			ret = PTR_ERR(sdev_info[i].sdev);
+			break;
+		}
+	}
+
+	if (!ret)
+		return 0;
+
+	for (j = i - 1; j >= FIRME_BASE_SERVICE_ID; j--) {
+		arm_smccc_device_unregister(sdev_info[j].sdev);
+	}
+
+	return ret;
+}
+
+static int __init firme_init(void)
+{
+	int ret;
+	u32 smccc_version = arm_smccc_get_version();
+
+	if ((smccc_version < ARM_SMCCC_VERSION_1_2) ||
+	    (cpus_have_final_cap(ARM64_SVE) && (smccc_version < ARM_SMCCC_VERSION_1_3)) ||
+	    (cpus_have_final_cap(ARM64_SME) && (smccc_version < ARM_SMCCC_VERSION_1_4)))
+		return -EOPNOTSUPP;
+
+	ret = firme_base_service_init();
+	if (ret)
+		return ret;
+
+	ret = firme_smccc_dev_create();
+	if (ret)
+		return ret;
+
+	static_branch_disable(&firme_disabled);
+
+	return 0;
+}
+device_initcall(firme_init);
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2ee..ad6efb6d223a9 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -70,6 +70,7 @@
 #define ARM_SMCCC_VERSION_1_1		0x10001
 #define ARM_SMCCC_VERSION_1_2		0x10002
 #define ARM_SMCCC_VERSION_1_3		0x10003
+#define ARM_SMCCC_VERSION_1_4		0x10004
 
 #define ARM_SMCCC_1_3_SVE_HINT		0x10000
 #define ARM_SMCCC_CALL_HINTS		ARM_SMCCC_1_3_SVE_HINT
diff --git a/include/linux/arm_firme.h b/include/linux/arm_firme.h
new file mode 100644
index 0000000000000..c070eb6a4bb08
--- /dev/null
+++ b/include/linux/arm_firme.h
@@ -0,0 +1,261 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Arm Ltd.
+ */
+
+#ifndef _LINUX_ARM_FIRME_H
+#define _LINUX_ARM_FIRME_H
+
+#include <linux/arm-smccc.h>
+#include <linux/bitfield.h>
+#include <linux/cpuhplock.h>
+#include <linux/device.h>
+#include <linux/types.h>
+
+/*
+ * This file provides common defines for Fimware Interface for Realm
+ * Management Extension (FIRME) as specified in
+ * https://developer.arm.com/documentation/den0149/latest
+ */
+
+#define FIRME_SMC(func_num)						\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,	\
+			   ARM_SMCCC_OWNER_STANDARD, (func_num))
+
+/*
+ * FIRME base service function ids.
+ */
+#define FIRME_SERVICE_VERSION		FIRME_SMC(0x400)
+#define FIRME_SERVICE_FEATURES		FIRME_SMC(0x401)
+
+/*
+ * FIRME granule management service function ids.
+ */
+#define FIRME_GM_GPI_SET		FIRME_SMC(0x402)
+#define FIRME_GM_GPI_OP_CONTINUE	FIRME_SMC(0x412)
+
+/*
+ * FIRME IDE key mangement service function ids.
+ */
+#define FIRME_IDE_KEYSET_PROG		FIRME_SMC(0x403)
+#define FIRME_IDE_KEYSET_GO		FIRME_SMC(0x404)
+#define FIRME_IDE_KEYSET_STOP		FIRME_SMC(0x405)
+#define FIRME_IDE_KEYSET_POLL		FIRME_SMC(0x406)
+
+/*
+ * FIRME IDE key mangement service function ids.
+ *
+ * NOTE:
+ *   Other functions except FIRME_ATTEST_PAT_GET are not supported 
+ *   by normal world instance.
+ */
+#define FIRME_ATTEST_PAT_GET		FIRME_SMC(0x408)
+
+/*
+ * FIRME error codes.
+ */
+#define FIRME_RET_SUCCESS		(0)
+#define FIRME_RET_NOT_SUPPORTED		(-1)
+#define FIRME_RET_INVALID_PARAMETER	(-2)
+#define FIRME_RET_ABORTED		(-3)
+#define FIRME_RET_INCOMPLETE		(-4)
+#define FIRME_RET_DENIED		(-5)
+#define FIRME_RET_BUSY			(-6)
+#define FIRME_RET_OP_CONFLICT		(-7)
+#define FIRME_RET_ALREADY_EXISTS	(-8)
+#define FIRME_RET_NOT_FOUND		(-9)
+#define FIRME_RET_NO_MEMORY		(-10)
+#define FIRME_RET_BAD_DATA		(-11)
+
+/*
+ * GPI attributes in GPT for FIRME granule management service.
+ */
+#define GPT_GPI_NO_ACCESS		(0x0)
+#define GPT_GPI_SA			(0x4)
+#define GPT_GPI_NSP			(0x5)
+#define GPT_GPI_SECURE			(0x8)
+#define GPT_GPI_NS			(0x9)
+#define GPT_GPI_ROOT			(0xa)
+#define GPT_GPI_REALM			(0xb)
+#define GPT_GPI_NS_BY_NS_OR_ROOT	(0xd)
+#define GPT_GPI_ANY			(0xf)
+#define GPT_GPI_MASK			GENMASK(3, 0)
+
+/*
+ * FIRME version encoding
+ */
+#define FIRME_MAJOR_VERSION_MASK	GENMASK(30, 16)
+#define FIRME_MINOR_VERSION_MASK	GENMASK(15, 0)
+#define FIRME_MAJOR_VERSION(x)		((u16)(FIELD_GET(FIRME_MAJOR_VERSION_MASK, (x))))
+#define FIRME_MINOR_VERSION(x)		((u16)(FIELD_GET(FIRME_MINOR_VERSION_MASK, (x))))
+#define FIRME_PACK_VERSION_INFO(major, minor)			\
+	(FIELD_PREP(FIRME_MAJOR_VERSION_MASK, (major)) |	\
+	 FIELD_PREP(FIRME_MINOR_VERSION_MASK, (minor)))
+
+#define FIRME_VERSION_1_0		FIRME_PACK_VERSION_INFO(1, 0)
+
+#define FIRME_KEYSET_ID_KEYSET_MASK	BIT(0)
+#define FIRME_KEYSET_ID_DIRECTION_MASK	BIT(1)
+#define FIRME_KEYSET_ID_SUBSTREAM_MASK	GENMASK(5, 2)
+#define FIRME_KEYSET_ID_STREAM_MASK	GENMASK(13, 6)
+#define FIRME_KEYSET_ID_ROOT_PORT_MASK	GENMASK(29, 14)
+#define FIRME_KEYSET_ID_SEGMENT_MASK	GENMASK(37, 30)
+#define FIRME_PACK_KEYSET_ID(ks, d, ss_id, s_id, rp_id, sg_id)	\
+	(FIELD_PREP(FIRME_KEYSET_ID_KEYSET_MASK, ks) |		\
+	 FIELD_PREP(FIRME_KEYSET_ID_DIRECTION_MASK, d) |	\
+	 FIELD_PREP(FIRME_KEYSET_ID_SUBSTREAM_MASK, ss_id) |	\
+	 FIELD_PREP(FIRME_KEYSET_ID_STREAM_MASK, s_id) |	\
+	 FIELD_PREP(FIRME_KEYSET_ID_ROOT_PORT_MASK, rp_id) |	\
+	 FIELD_PREP(FIRME_KEYSET_ID_SEGMENT_MASK, sg_id))
+
+#define FIRME_PGS_4K			(0)
+#define FIRME_PGS_64K			(1)
+#define FIRME_PGS_16K			(2)
+
+#define FIRME_L0GPTSZ_1GB		(0)
+#define FIRME_L0GPTSZ_16GB		(4)
+#define FIRME_L0GPTSZ_64GB		(6)
+#define FIRME_L0GPTSZ_512GB		(9)
+
+#define FIRME_PPS_4GB			(0)
+#define FIRME_PPS_64GB			(1)
+#define FIRME_PPS_1TB			(2)
+#define FIRME_PPS_4TB			(3)
+#define FIRME_PPS_16TB			(4)
+#define FIRME_PPS_256TB			(5)
+#define FIRME_PPS_4PB			(6)
+#define FIRME_PPS_64PB			(7)
+
+/*
+ * FIRME Base service features.
+ */
+#define FIRME_BASE_FEAT0_FUNC_VERSION		BIT(0)
+#define FIRME_BASE_FEAT0_FUNC_FEATURE		BIT(1)
+#define FIRME_BASE_FEAT0_FUNC_MASK		GENMASK(2, 0)
+
+#define FIRME_BASE_FEAT1_SH_BUF_MIN_SZ_MASK	GENMASK(1, 0)
+#define FIRME_BASE_FEAT1_SH_BUF_MAX_PG_CNT_MASK	GENMASK(15, 2)
+#define FIRME_BASE_FEAT1_SERVICE_LIST_MASK	GENMASK(31, 16)
+
+/*
+ * FIRME Granule management service features.
+ */
+#define FIRME_GM_FEAT0_FUNC_GPI_SET		BIT(0)
+#define FIRME_GM_FEAT0_FUNC_GPI_OP_COUTINUME	BIT(1)
+#define FIRME_GM_FEAT0_FUNC_MASK		GENMASK(3, 0)
+
+#define FIRME_GM_FEAT1_PGS_MASK			GENMASK(1, 0)
+#define FIRME_GM_FEAT1_L0GPTSZ_MASK		GENMASK(5, 2)
+#define FIRME_GM_FEAT1_PPS_MASK			GENMASK(8, 6)
+
+/*
+ * FIRME IDE key management service features.
+ */
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_PROG	BIT(0)
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_GO		BIT(1)
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_STOP	BIT(2)
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_POLL	BIT(3)
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_MASK	GENMASK(3, 0)
+
+/*
+ * FIRME IDE key management service features.
+ */
+#define FIRME_ATTEST_FEAT0_FUNC_PAT_GET		BIT(0)
+#define FIRME_ATTEST_FEAT0_FUNC_MASK		GENMASK(5, 0)
+
+#define FIRME_ATTEST_FEAT1_MAX_PAT_PG_CNT_MASK	GENMASK(7, 0)
+
+typedef struct arm_smccc_1_2_regs firme_value_t;
+typedef long firme_status_t;
+
+/*
+ * FIRME Service ID
+ */
+enum firme_service_id {
+	FIRME_BASE_SERVICE_ID = 0,
+	FIRME_GM_SERVICE_ID,
+	FIRME_IDE_KEYSET_SERVICE_ID,
+	FIRME_MEC_SERVICE_ID,
+	FIRME_ATTEST_SERVICE_ID,
+	FIRME_IDEV_SERVICE_ID,
+	FIRME_SERVICE_ID_MAX,
+};
+
+enum firme_ide_type {
+	FIRME_IDE_TYPE_SELECTIVE,
+	FIRME_IDE_TYPE_PCIE_LINK,
+	FIRME_IDE_TYPE_CXL_CACHEMEM,
+};
+
+struct firme_shared_buf_info {
+	size_t min_size;
+	size_t max_size;
+};
+
+static __always_inline int firme_status_to_errno(firme_status_t status)
+{
+	static int firme_status_errno_map[] = {
+		0,		/* FIRME_RET_SUCCESS */
+		-EOPNOTSUPP,	/* FIRME_RET_NOT_SUPPORTED */
+		-EINVAL,	/* FIRME_RET_INVALID_PARAMETER */
+		-ECANCELED,	/* FIRME_RET_ABORTED */
+		-EAGAIN,	/* FIRME_RET_INCOMPLETE */
+		-EACCES,	/* FIRME_RET_DENIED */
+		-EBUSY,		/* FIRME_RET_BUSY */
+		-EALREADY,	/* FIRME_RET_OP_CONFLICT */
+		-EEXIST,	/* FIRME_RET_ALREDAY_EXISTS */
+		-ENOENT,	/* FIRME_RET_NOT_FOUND */
+		-ENOMEM,	/* FIRME_RET_NO_MEMORY */
+		-EBADMSG,	/* FIRME_RET_BAD_DATA */
+	};
+
+	status = -status;
+
+	if (status >= 0 && status < ARRAY_SIZE(firme_status_errno_map))
+		return firme_status_errno_map[status];
+
+	return -EINVAL;
+};
+
+static __always_inline void invoke_firme_service(firme_value_t args,
+						 firme_value_t *res)
+{
+	arm_smccc_1_2_smc(&args, res);
+}
+
+#if IS_ENABLED(CONFIG_ARM_FIRME)
+extern int firme_get_version(enum firme_service_id service_id, u32 *version);
+extern int firme_get_feature(enum firme_service_id service_id,
+			     uint8_t feat_idx, unsigned long *feature);
+extern int firme_get_shared_buffer_info(struct firme_shared_buf_info *info);
+extern void *firme_alloc_shared_buffer(size_t *size, gfp_t gfp_flags);
+extern void firme_free_shared_buffer(void *buf, size_t size);
+#else
+static __always_inline int firme_get_version(enum firme_service_id service_id,
+					     u32 *version)
+{
+	return -EOPNOTSUPP;
+}
+
+static __always_inline int firme_get_feature(enum firme_service_id service_id,
+					     uint8_t feat_idx, unsigned long *feature)
+{
+	return -EOPNOTSUPP;
+}
+
+static __always_inline int firme_get_shared_buffer_info(struct firme_shared_buf_info *info)
+{
+	return -EOPNOTSUPP;
+}
+
+static __always_inline void *firme_alloc_shared_buffer(size_t *size, gfp_t gfp_flags)
+{
+	return NULL;
+}
+
+static __always_inline void firme_free_shared_buffer(void *buf, size_t size)
+{
+}
+#endif
+
+#endif /* _LINUX_ARM_FIRME_H */

-- 
2.43.0


