Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E64D60A263A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=weYPG7AT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qrfInGrV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZSYfrYFiyiWUa6vglkKUJH8L/QpY4IKzTr3jG0NxsxI=; b=weYPG7ATkMnJBE
	diqdy6XZ6gtcrntYTnGUts4OXW4yig1zdIm8Ap0xBGkw7JuFLy7Zd2LBYH23/5RncvEzZfegghM3C
	pZcxRa4ivmQx9WWV7Xdmgf6UWxjsOQABjJcTxOvVRMQNMSQ0Glj/PLxrcCZz5gqk2seOvBs1VDteu
	1Zrk/JJbbuzcFTPYRICmXWqMQOlruy/bfHUhU4Png0jAVqWsPzLgL8Kt+7NF8hcBhp7C5BBgbaBXx
	kCtnCqZJCBjLkW4dZ1T+y5De/IWUx6OT4TZdwuv7xUh4rl8Nz9Mkj0U31HE79eB4jx1UxnehmmiGY
	Pzyt9gCiYXM/v/jvQtoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUShL-0000000FlvE-2YNq;
	Fri, 20 Nov 2026 17:46:55 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSgY-0000000FlnD-2DQf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:46:12 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so576201a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196765; x=1795801565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSYfrYFiyiWUa6vglkKUJH8L/QpY4IKzTr3jG0NxsxI=;
        b=qrfInGrVRam5nDXWsyEv4+ArcCSPPXpRGdTX/JTJGRehphU9PWnEF40PaLqK4LR4k/
         26PyQlm6yn9oRm+fUU0Dir8nUGo2Z35GeKwaTBcqm7z28qYKy4APWBx9KaUv9xAf92lf
         PlFgrb54fRf/3uBbmGlYtE2xxtM0gkczFI9p0DszxP5pHNVOE9d0RkvKkUpCc6+CN3Vr
         mIST+yuzRycwOJXq1MS/AM+7cmA7QYOesgmon8XISJM7fg4bD9p4d18CT5MxPhQjPXdl
         BzDQCWYuqM0SbffailAMW4rCeChxgRYmNpfvvqdQw2OdgxlUw+tfpXEExjaxKenGwDiZ
         h7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196765; x=1795801565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSYfrYFiyiWUa6vglkKUJH8L/QpY4IKzTr3jG0NxsxI=;
        b=rWSHeTfV8ge5AEJG9JW37PMoBUNtUYF3HEOWLhv8RjXUrVqONGeBZ9HXM9FcmbxdDQ
         aJQ1zkwMKQM38m8Ajg05TpP2l6rLa3CO+EDVXhjDd75iXcV4zDhwnxCD0G24F6tW1tPl
         ZvscTaHOrcQ8qbnsR4ArGJn04qp5oMDMpZVvDVVDGEqwio7LNsai8aJhXlK7EjXhzRxe
         fJu/xLFhWvSvrlaFFC+qdCLUDWrN2fqQ9VyxzeZB9v/8GW+CRdSq5fPrlK5qDjDRZxGQ
         UHL+6+t3rQEsodZtgZRXKstAoh0p1mR8iA0u083RS7BlDBE65IVuJATzTcywJT9mtkU8
         kovQ==
X-Forwarded-Encrypted: i=1; AL+hErGNljdF2/OC9hXBGUyn53nOnm0+WM2PI9UXPDUtGZau7FQwaHS2/YBOt2yOWEdFo4eGze4pkiyKXUURH4mSYIhA@lists.infradead.org
X-Gm-Message-State: APuU4Z8oOF2WIvh2bcz1zXRYfMGq3EjBkuiwr2fh6hakTQRyCJSi8sKM
	JAIM+Ta8YLxLhjTJvEacqYjpWNDSJFu3fp9kSTfKnVdbCNl8aKYvhEc1
X-Gm-Gg: AZFdTZcKtRTchaqryj+mjo5L6A6Wroacvs8n2+dDF51TMMpaA2nhGnjbT5clRX3onsV
	y8Ox8hkALOY730V8cEBruS1q6McGE1gK/zmDcNQ3e0cSCKir/jsFUX4i9S816IkT2tJ5PAx5xxp
	R96qHSp9fJT73z60CgNJu4HAP5PS8Lv/hC/vzr1XsfL7uIWoohfmuAP5lj768eHpY6AWeolyclI
	wyhnafhLDippC+D2IyLuUXjOeS/+9u/ewPNyJs1YQthMKfZKY+8BcpFU/iwuehK6mjN2+KOoabr
	6jMCk2xYshVzMhsbvawCWzLEPSBbLnH/Dcy9FbLvEYb72fJdR2u4JG7yaTbqttUSi52DWF5dORk
	abzXPCrrA1DkzYakOX1X7fU6PIeBpQdcubem+9kBsqJzmFslXnA50fpU+RwA07Pr8iYqkkNF6BV
	IkJlxbUsX7W/gSwJ8WVXdKQfdViTRR/o1usxlXeNBqt052KG9Jofy2hoXE2W/zyI2SmxUseov+Q
	rpQa0XPP3qEhbUSXBz1zkQ2420zQ7nip44tHRmgevxzs5r2EHubK8MmtVQ/mjsDlr9qTgrMbmN8
	nbMpstwaYhZBpNohgrINlsWAXocLDzfoy8xis9OsFezTHw==
X-Received: by 2002:a17:90b:3810:b0:3b4:ac3:8af2 with SMTP id 98e67ed59e1d1-3b41c9cf6famr3366186a91.27.1795196765314;
        Fri, 20 Nov 2026 09:46:05 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm58052a91.1.2026.11.20.09.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:46:04 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 20 Nov 2026 23:14:40 +0530
Message-ID: <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_094606_646568_6A016EFD 
X-CRM114-Status: GOOD (  28.87  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Provide root-only NVMEM access for userspace diagnostics comparing OTP
ranges with vendor-derived reference data during BMC bring-up. The
consumer uses raw offsets rather than named cells or a private ioctl.

Initialize read mode once at probe and mask the fixed secure prefix using
an NVMEM keepout. Recheck SEC54 on each controller read and reject requests
into an extended protected prefix. Programming protection does not block
reads. Serialize transactions and stop issuing commands after a timeout.
Use a 1-us initial polling delay and a generous 100-ms timeout.

Adapt the read sequence from ASPEED's downstream driver, preserving its
attribution, and add the driver to the ASPEED MAINTAINERS entry.

Tested on ASRock Rack B650D4U (AST2600 A3) with Linux 7.4-rc1 and
OpenBMC Linux 6.18.24. Repeated reads, cross-pair reads and four concurrent
readers (40 reads) passed. The selected 12-byte range matched a saved
ASPEED-derived reference. The 7.4-rc1 run used a RAM-booted kernel with
the working OpenBMC board DTB and initramfs; its final-pair check also
passed.

Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c
Link: https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/
Co-developed-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

---
 MAINTAINERS                      |    1 
 drivers/nvmem/Kconfig            |   13 ++
 drivers/nvmem/Makefile           |    1 
 drivers/nvmem/nvmem-aspeed-otp.c |  297 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 312 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315..5415e2be4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2813,6 +2813,7 @@ F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 F:	arch/arm64/boot/dts/aspeed/
+F:	drivers/nvmem/nvmem-aspeed-otp.c
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236..e6445262b 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -164,6 +164,19 @@ config NVMEM_APPLE_SPMI
 	  This driver can also be built as a module. If so, the module
 	  will be called apple-nvmem-spmi.
 
+config NVMEM_ASPEED_AST2600_OTP
+	tristate "ASPEED AST2600 OTP support"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  Say Y here to enable read-only access to the OTP data region
+	  on ASPEED AST2600 BMCs through the NVMEM interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-aspeed-otp.
+
+	  If unsure, say N.
+
 config NVMEM_BCM_OCOTP
 	tristate "Broadcom On-Chip OTP Controller support"
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f..f09b7a8a5 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
 apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
+obj-$(CONFIG_NVMEM_ASPEED_AST2600_OTP)	+= nvmem-aspeed-otp.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
diff --git a/drivers/nvmem/nvmem-aspeed-otp.c b/drivers/nvmem/nvmem-aspeed-otp.c
new file mode 100644
--- /dev/null
+++ b/drivers/nvmem/nvmem-aspeed-otp.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ *
+ * ASPEED AST2600 OTP Controller driver
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/unaligned.h>
+
+#define AST2600_OTP_PROTECT_KEY		0x00
+#define AST2600_OTP_CMD			0x04
+#define AST2600_OTP_ADDR		0x10
+#define AST2600_OTP_STATUS		0x14
+#define AST2600_OTP_COMPARE_1		0x20
+#define AST2600_OTP_COMPARE_2		0x24
+#define AST2600_OTP_EXTRA_READ_PROTECT	0x54
+#define AST2600_OTP_EXTRA_READ_RANGE	GENMASK(5, 0)
+
+#define AST2600_OTP_CMD_READ		0x23b1e361
+#define AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
+#define AST2600_OTP_UNLOCK_KEY		0x349fe38a
+#define AST2600_OTP_STATUS_DONE		GENMASK(2, 1)
+/* Normal reads take less than 1 us; allow a generous bounded wait. */
+#define AST2600_OTP_TIMEOUT_US		100000
+
+#define AST2600_OTP_DATA_WORDS		0x800
+#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
+#define AST2600_OTP_CONF0_ADDR		0x800
+#define AST2600_OTP_CONF0_SEC_SIZE		GENMASK(21, 16)
+#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))
+
+struct ast2600_otp {
+	struct device *dev;
+	void __iomem *base;
+	/* Serialize the complete unlock, read and relock sequence. */
+	struct mutex lock;
+	struct nvmem_keepout secure_keepout;
+	bool failed;
+};
+
+static int ast2600_otp_wait_complete(struct ast2600_otp *priv)
+{
+	u32 status;
+	int ret;
+
+	/* Wait at least 1 us before the first sample of both idle flags. */
+	ret = read_poll_timeout(readl, status,
+				(status & AST2600_OTP_STATUS_DONE) ==
+				AST2600_OTP_STATUS_DONE,
+				1, AST2600_OTP_TIMEOUT_US, true,
+				priv->base + AST2600_OTP_STATUS);
+	if (ret) {
+		/* Relocking SEC00 does not abort an outstanding command. */
+		priv->failed = true;
+		dev_err(priv->dev,
+			"OTP completion timed out (status=%#x); further reads blocked\n",
+			status);
+	}
+
+	return ret;
+}
+
+static int ast2600_otp_init_read_mode(struct ast2600_otp *priv)
+{
+	static const u32 mode_addresses[] = { 0x3000, 0x5000, 0x1000 };
+	int i, ret;
+
+	ret = ast2600_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * Restore read mode once at probe; this driver never programs fuses.
+	 * These writes target volatile mode registers, not OTP fuse cells.
+	 * No fuse programming command or programming timing is used.
+	 */
+	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
+		writel(mode_addresses[i], priv->base + AST2600_OTP_ADDR);
+		writel(0, priv->base + AST2600_OTP_COMPARE_1);
+		writel(AST2600_OTP_CMD_WRITE_MODE, priv->base + AST2600_OTP_CMD);
+		ret = ast2600_otp_wait_complete(priv);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ast2600_otp_read_pair(struct ast2600_otp *priv,
+				 unsigned int aligned_word,
+				 u32 *word0, u32 *word1)
+{
+	int ret;
+
+	/* The hardware reads two words starting at an even word index. */
+	writel(aligned_word, priv->base + AST2600_OTP_ADDR);
+
+	writel(AST2600_OTP_CMD_READ,
+	       priv->base + AST2600_OTP_CMD);
+
+	ret = ast2600_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	*word0 = readl(priv->base + AST2600_OTP_COMPARE_1);
+	*word1 = readl(priv->base + AST2600_OTP_COMPARE_2);
+
+	return 0;
+}
+
+static int ast2600_otp_init_keepout(struct ast2600_otp *priv)
+{
+	u32 conf0, unused;
+	int ret;
+
+	guard(mutex)(&priv->lock);
+
+	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
+	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) != 1) {
+		ret = -EACCES;
+		goto out_lock;
+	}
+
+	ret = ast2600_otp_init_read_mode(priv);
+	if (ret)
+		goto out_lock;
+
+	ret = ast2600_otp_read_pair(priv, AST2600_OTP_CONF0_ADDR,
+				    &conf0, &unused);
+	if (ret)
+		goto out_lock;
+
+	priv->secure_keepout.start = 0;
+	priv->secure_keepout.end =
+		FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
+		AST2600_OTP_SEC_SIZE_UNIT;
+	priv->secure_keepout.value = 0;
+
+out_lock:
+	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
+	/* Complete the lock write before returning and releasing the mutex. */
+	readl(priv->base + AST2600_OTP_PROTECT_KEY);
+	return ret;
+}
+
+static int ast2600_otp_read(void *context, unsigned int offset,
+			    void *val, size_t bytes)
+{
+	struct ast2600_otp *priv = context;
+	u8 *buf = val;
+	unsigned int word_index;
+	unsigned int aligned_word;
+	unsigned int secure_size;
+	u32 extra_read;
+	u32 word0, word1;
+	int ret;
+
+	if (!bytes)
+		return 0;
+
+	if (offset % sizeof(u32) || bytes % sizeof(u32))
+		return -EINVAL;
+
+	if (offset >= AST2600_OTP_SIZE ||
+	    bytes > AST2600_OTP_SIZE - offset)
+		return -EINVAL;
+
+	guard(mutex)(&priv->lock);
+
+	if (priv->failed)
+		return -EIO;
+
+	/* SEC54 can grow after probe; keep the registered keepout immutable. */
+	extra_read = readl(priv->base + AST2600_OTP_EXTRA_READ_PROTECT);
+	secure_size = FIELD_GET(AST2600_OTP_EXTRA_READ_RANGE, extra_read) *
+		      AST2600_OTP_SEC_SIZE_UNIT;
+	secure_size = max(priv->secure_keepout.end, secure_size);
+	if (offset < secure_size)
+		return -EACCES;
+
+	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
+	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) != 1) {
+		ret = -EACCES;
+		goto out_lock;
+	}
+
+	ret = ast2600_otp_wait_complete(priv);
+	if (ret)
+		goto out_lock;
+
+	word_index = offset / sizeof(u32);
+	while (bytes) {
+		aligned_word = word_index & ~1U;
+
+		ret = ast2600_otp_read_pair(priv, aligned_word,
+					    &word0, &word1);
+		if (ret)
+			goto out_lock;
+
+		if (!(word_index & 1)) {
+			put_unaligned_le32(word0, buf);
+			buf += sizeof(u32);
+			bytes -= sizeof(u32);
+			word_index++;
+		}
+		if (bytes) {
+			put_unaligned_le32(word1, buf);
+			buf += sizeof(u32);
+			bytes -= sizeof(u32);
+			word_index++;
+		}
+	}
+
+	ret = 0;
+
+out_lock:
+	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
+	/* Complete the lock write before returning and releasing the mutex. */
+	readl(priv->base + AST2600_OTP_PROTECT_KEY);
+	return ret;
+}
+
+static int ast2600_otp_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.name = "ast2600-otp",
+		.id = NVMEM_DEVID_AUTO,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.word_size = sizeof(u32),
+		.stride = sizeof(u32),
+		.size = AST2600_OTP_SIZE,
+		.reg_read = ast2600_otp_read,
+	};
+	struct nvmem_device *nvmem;
+	struct ast2600_otp *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	ret = devm_mutex_init(dev, &priv->lock);
+	if (ret)
+		return ret;
+
+	ret = ast2600_otp_init_keepout(priv);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize OTP read mode and secure prefix\n");
+
+	config.dev = dev;
+	config.priv = priv;
+	if (priv->secure_keepout.end) {
+		config.keepout = &priv->secure_keepout;
+		config.nkeepout = 1;
+	}
+	nvmem = devm_nvmem_register(dev, &config);
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id ast2600_otp_of_match[] = {
+	{ .compatible = "aspeed,ast2600-sbc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ast2600_otp_of_match);
+
+static struct platform_driver ast2600_otp_driver = {
+	.probe = ast2600_otp_probe,
+	.driver = {
+		.name = "ast2600-otp",
+		.of_match_table = ast2600_otp_of_match,
+	},
+};
+module_platform_driver(ast2600_otp_driver);
+
+MODULE_AUTHOR("Neal Liu <neal_liu@aspeedtech.com>");
+MODULE_AUTHOR("Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>");
+MODULE_DESCRIPTION("ASPEED AST2600 read-only OTP NVMEM driver");
+MODULE_LICENSE("GPL");

