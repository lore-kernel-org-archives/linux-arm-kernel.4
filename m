Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HwVPLnzI;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iHFMiSAy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5aHo1OGeOfOj5EfMcl+mo+WPC3cWBElxO5fk9EmyHrE=; b=HwVPLnzIvAGgn+
	7MshABB5AS9bD34wxhNrNpfOXKLZf2GHyonGjWqsn8NSKZkQ1HBI0Fkv3zHP2vgFU0eTaDzCmfJ3l
	8MskMMtpV3Wj5lPv/zT6MZX8RdsANOp7sa2i4RW1hoUxy11xHJ0QorLythlBgVi8y67JWnbuoGxK8
	hWCJWnYmWyHHqzBZXRxnM3Dek1nnkW1rSzRR1XdGqCF/midrby7WXcXwRLy9az0MJM7/j68WvZtJ8
	h7kzD+qMcfI88GP+baDf4s9Fu/NxgaZFgPbmO/KUUxQ8df7cb9OEptA7Ykm6dPZKcZagSyOJK1IeC
	u7Kf4MObkg2JJYw8KU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwX4-00000007d3M-1p0b;
	Tue, 24 Nov 2026 19:50:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwWv-00000007cz7-208X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:50:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFECF16F3;
	Tue, 24 Nov 2026 11:50:13 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA1F73F763;
	Tue, 24 Nov 2026 11:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549816; bh=wPGFAz4GR+cJOiQT8ezN/i8t+DmkptVFngiVrZEgm7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iHFMiSAyKDWsGcyswkKUgL/4eJOQlgfv7hVV8B8uowAer51C7VY2VEoV5LibHQGqi
	 xa9pVquB6+WizRNZvC9g5ChL5zVgFGtV3GUWsZhXIPt0KcwMV808xrDap6gEQd+DP9
	 yvWOH2hB82QARS5y88zh9Z4Ei9FKAX7LJOzU4G7A=
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
Subject: [PATCH v17 05/34] firmware: arm_scmi: Introduce a dedicated SCMI Errors header
Date: Tue, 24 Nov 2026 19:48:11 +0000
Message-ID: <20261124194841.1147072-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115017_604106_60FA4372 
X-CRM114-Status: GOOD (  15.78  )
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

Add a new dedicated header and move all of the errors definitions and
mapping helpers into it and out of common.h so that SCMI errors definitions
alone can be easily included in protocol files without all of the unrelated
additional stuff contained in common.h

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 39 +---------------------
 drivers/firmware/arm_scmi/errors.h | 52 ++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 38 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/errors.h

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index af5b025ee072..cdd6f887fae7 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -26,6 +26,7 @@
 
 #include <linux/unaligned.h>
 
+#include "errors.h"
 #include "protocols.h"
 #include "notify.h"
 
@@ -37,44 +38,6 @@
 
 #define SCMI_TRANSPORT_DEVNAME_PREFIX	"__scmi_transport_device"
 
-enum scmi_error_codes {
-	SCMI_SUCCESS = 0,	/* Success */
-	SCMI_ERR_SUPPORT = -1,	/* Not supported */
-	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
-	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
-	SCMI_ERR_ENTRY = -4,	/* Not found */
-	SCMI_ERR_RANGE = -5,	/* Value out of range */
-	SCMI_ERR_BUSY = -6,	/* Device busy */
-	SCMI_ERR_COMMS = -7,	/* Communication Error */
-	SCMI_ERR_GENERIC = -8,	/* Generic Error */
-	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
-	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
-};
-
-static const int scmi_linux_errmap[] = {
-	/* better than switch case as long as return value is continuous */
-	0,			/* SCMI_SUCCESS */
-	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
-	-EINVAL,		/* SCMI_ERR_PARAM */
-	-EACCES,		/* SCMI_ERR_ACCESS */
-	-ENOENT,		/* SCMI_ERR_ENTRY */
-	-ERANGE,		/* SCMI_ERR_RANGE */
-	-EBUSY,			/* SCMI_ERR_BUSY */
-	-ECOMM,			/* SCMI_ERR_COMMS */
-	-EIO,			/* SCMI_ERR_GENERIC */
-	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
-	-EPROTO,		/* SCMI_ERR_PROTOCOL */
-};
-
-static inline int scmi_to_linux_errno(int errno)
-{
-	int err_idx = -errno;
-
-	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
-		return scmi_linux_errmap[err_idx];
-	return -EIO;
-}
-
 #define MSG_ID_MASK		GENMASK(7, 0)
 #define MSG_XTRACT_ID(hdr)	FIELD_GET(MSG_ID_MASK, (hdr))
 #define MSG_TYPE_MASK		GENMASK(9, 8)
diff --git a/drivers/firmware/arm_scmi/errors.h b/drivers/firmware/arm_scmi/errors.h
new file mode 100644
index 000000000000..e1b265d5c148
--- /dev/null
+++ b/drivers/firmware/arm_scmi/errors.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * System Control and Management Interface (SCMI) Message Protocol
+ * header containing SCMI errors definitions and Linux mapping.
+ *
+ * Copyright (C) 2018-2026 ARM Ltd.
+ */
+#ifndef _SCMI_ERRORS_H
+#define _SCMI_ERRORS_H
+
+#include <linux/errno.h>
+#include <linux/array_size.h>
+
+enum scmi_error_codes {
+	SCMI_SUCCESS = 0,	/* Success */
+	SCMI_ERR_SUPPORT = -1,	/* Not supported */
+	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
+	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
+	SCMI_ERR_ENTRY = -4,	/* Not found */
+	SCMI_ERR_RANGE = -5,	/* Value out of range */
+	SCMI_ERR_BUSY = -6,	/* Device busy */
+	SCMI_ERR_COMMS = -7,	/* Communication Error */
+	SCMI_ERR_GENERIC = -8,	/* Generic Error */
+	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
+	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
+};
+
+static const int scmi_linux_errmap[] = {
+	/* better than switch case as long as return value is continuous */
+	0,			/* SCMI_SUCCESS */
+	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
+	-EINVAL,		/* SCMI_ERR_PARAM */
+	-EACCES,		/* SCMI_ERR_ACCESS */
+	-ENOENT,		/* SCMI_ERR_ENTRY */
+	-ERANGE,		/* SCMI_ERR_RANGE */
+	-EBUSY,			/* SCMI_ERR_BUSY */
+	-ECOMM,			/* SCMI_ERR_COMMS */
+	-EIO,			/* SCMI_ERR_GENERIC */
+	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
+	-EPROTO,		/* SCMI_ERR_PROTOCOL */
+};
+
+static inline int scmi_to_linux_errno(int errno)
+{
+	int err_idx = -errno;
+
+	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
+		return scmi_linux_errmap[err_idx];
+	return -EIO;
+}
+
+#endif /* _SCMI_ERRORS_H */
-- 
2.54.0


