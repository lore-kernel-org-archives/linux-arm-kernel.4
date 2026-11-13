Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 03:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jz6HaN9F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjAyOT0L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LKh2ZwYpeTM0ZCGUcNGyfm8IHaa5myXk/G20L7iFsfI=; b=Jz6HaN9FDXhj5Y
	faWHgIBl/6nkGUrfHm7lq9XpsjtRKkBb6iKIiZHlzGj5XQHhHr/VE60p/VhN0RsDiripHlopYe7As
	2NGNVnH09oDNnMwQ/ONimE55KxfLsXydrS7J53/RJwgnKPKhGRwhmCjBY7GqKkAN2NNutfGirMtcq
	Y0o8DaO0z2alnFkIeWdo88Um1TJ9pdXbJiXDQGzWeUggDO4e36tEV9J8kNBiHm+9pQLyn2kxBhD6P
	Qbmeqfa5IFHKxGqHZAFIfskdhFbyNksTqCnOt7ve+mmjvJJBpYwXamhlro49vnGu5ukJURFYNiZnK
	gi3caC0kLo1FPrs2DYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRiBl-0000000Bb4i-3qi5;
	Fri, 13 Nov 2026 03:42:57 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRiBj-0000000Bb41-2hhL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 03:42:57 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso690422eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 19:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541375; x=1795146175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKh2ZwYpeTM0ZCGUcNGyfm8IHaa5myXk/G20L7iFsfI=;
        b=cjAyOT0LwWNBajY1n/hS3PcInUw7N9Aieqzr2JfmOfe3aWXc8eRBcibO4Um0hmOFdf
         6C3B7oNU17B27v9v+iYNzHYJTONhkChZgR4qEcuSRiLanBitk/nkGTzudYWrz95J1Hze
         mutrPf9ahBimWlAvECd+7R6/DCieltifq0w5HmvS5bM/LQSxTJnvghBgs7Ply+23oF/U
         7GE0kHiA3Fgo/CP83BTvrQYxtI8FPqS8QgMaMhiPdu99d5VPyini0jWrNFHRiMj+Gni7
         95Q5TwUfr3Fxw04ulPIkE60IqwlL2rBtf7U8PJqm0Ne6d+CM8Zmr2/cCfMHHEJ7MMw/P
         pNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541375; x=1795146175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKh2ZwYpeTM0ZCGUcNGyfm8IHaa5myXk/G20L7iFsfI=;
        b=g1rhjREl9RPVssZvtoG9zqVSw3n7ej5lx04g2tmTSlD4pISY8YoW9jm58GD0Y3kZec
         1dPaftVgBBi40h4JBXtE/sNqmsUCcr522/syi2Bre30kv7JhWbbTPRUBiOBEem8NofIR
         GBFjm77ieZLSWsRrUoNytV0N0bT6Wo5gt7aFKB3lff9sx2NcmYzUpXK1kDgTg2oW9DUk
         6/ANmJiP+9/iAKYjWKd8baLS04h0q745ohzKiHT3J3Hy+JWbN44hryY3Z4P7JBG5kBDK
         YTW2eJi1cRdT6sO7WnuPE4HP0nvTeCRd6WepXftBQ7ljFZvn4ksh+wPxBzfpz5wTRCBM
         7IeA==
X-Forwarded-Encrypted: i=1; AL+hErHHAal8quZRxSzLVbf5Y3T+Yl9THRMVZca4Zy4BnNdH5eYrgxTWl9g6wFg1816KkYCqdwVJsQek/G1KkJLexPxl@lists.infradead.org
X-Gm-Message-State: APuU4Z/LLhpFqiAIvjXuelzOmugCh7XUDs8BSc4I0QkAZs1SkigN7lNt
	1Y8ITrjLslj9mbPRYe5Oc6n8FEees6HUPUeXpRDcxb4Ogj70G1Q2iauA
X-Gm-Gg: AYBFou3PQsbT4EgT8P8OowHOUcNstCKwbiuThIHyWHCe512d3ZjGFa0IZkKzm3/gFux
	/k21BZhlMNh3N5zkVzpZGJF0c5Nqen0r91PanCV/P6n1VQRSZE3mWr35vMHFi+kVHf0fqTpfYpS
	dqWciumLYjeo73xjgEEze144/ZKjzshhtIsVlUDdNDqXyarzMYoSL0k8MqprZEfJjZbZCz3QqEw
	LQWtgz8Cn2n/61ch/CA+QtDnsbrfqycy77qKVMyoKe5pm8PBo2ekUVg58lFkjkFmBrkbPotJZcG
	MkQ6050qRPvvlHsUAu0ujxl/Bo/SZyZ6SUNnOQPuI4tv0G04Cja6XY1O2uqsmse2+nGo2/Rj2JU
	2UxN/OQzH3SDQ1yPLhi3UQgqp7vVZrEzx1Xs/kGc7Jn1b68Mmt6pyIF1JsxpUI1WelzDrROxee/
	ah2ePsql1L/PWNeowSrKwgVhnFmdIP0CVcUz4xDkOZw6GJ2z4RtkFSUl9TkxN3VN1ICpVZUZ8Uu
	ts69VC98x5qTwdzxepxuOokMDEesY/pjEMRGQm2rR2lU3c9/ghwZ0Ilya7M5l4EeZHAasSoNdgS
	0lCkvOOKUAKYBDUaBU6KknBkNZKFgygihAhEnS/ay/vr
X-Received: by 2002:a05:693c:2a06:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37967600833mr856686eec.25.1794541374349;
        Thu, 12 Nov 2026 19:42:54 -0800 (PST)
Received: from debian.prasanth ([114.79.136.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2999565eec.15.2026.11.12.19.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:42:53 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v1 1/1] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 13 Nov 2026 09:12:13 +0530
Message-ID: <20261113034213.158390-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_194255_703539_29D4FF76 
X-CRM114-Status: GOOD (  28.87  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose permitted AST2600 OTP data through NVMEM using the existing SBC
node. Serialize controller transactions, bound completion polling and
reject reads into the configured secure prefix.

Adapt the read sequence from ASPEED's downstream driver, preserving its
attribution. Register the driver for ASPEED review and restrict raw OTP
access to root.

Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c
---
Tested on ASRock Rack B650D4U, AST2600 A3, OpenBMC Linux 6.18.24:
- Repeated, paired and cross-pair reads matched.
- Four concurrent readers completed 40 matching reads.
- Bytes 8172..8183 matched a separate vendor-derived reader.
- Synthetic pre-MMIO timeout, failure latching and rebind recovery passed.
Host fault-injection tests passed all 42 polling-timeout cases.

 MAINTAINERS                 |   1 +
 drivers/nvmem/Kconfig       |  12 ++
 drivers/nvmem/Makefile      |   1 +
 drivers/nvmem/ast2600-otp.c | 259 ++++++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 drivers/nvmem/ast2600-otp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb3..c92ea8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2813,6 +2813,7 @@ F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 F:	arch/arm64/boot/dts/aspeed/
+F:	drivers/nvmem/ast2600-otp.c
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb2..cdcd071 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -164,6 +164,18 @@ config NVMEM_APPLE_SPMI
 	  This driver can also be built as a module. If so, the module
 	  will be called apple-nvmem-spmi.
 
+config NVMEM_ASPEED_AST2600_OTP
+	tristate "ASPEED AST2600 OTP support"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  Read-only access to the AST2600 OTP data region. The configured
+	  secure prefix is not exposed. Fuse programming is not supported.
+	  The controller reads paired 32-bit words through command registers.
+	  Access to raw OTP data is restricted to root.
+
+	  If built as a module, the module will be called ast2600-otp.
+
 config NVMEM_BCM_OCOTP
 	tristate "Broadcom On-Chip OTP Controller support"
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad..9fac69d 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
 apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
+obj-$(CONFIG_NVMEM_ASPEED_AST2600_OTP)	+= ast2600-otp.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
diff --git a/drivers/nvmem/ast2600-otp.c b/drivers/nvmem/ast2600-otp.c
new file mode 100644
index 0000000..94b1225
--- /dev/null
+++ b/drivers/nvmem/ast2600-otp.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ *
+ * ASPEED AST2600 OTP Controller driver
+ * Read sequencing adapted from ASPEED's downstream ast2600-otp driver.
+ */
+
+#include <linux/align.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#define AST2600_OTP_PROTECT_KEY		0x00
+#define AST2600_OTP_CMD			0x04
+#define AST2600_OTP_ADDR		0x10
+#define AST2600_OTP_STATUS		0x14
+#define AST2600_OTP_COMPARE_1		0x20
+#define AST2600_OTP_COMPARE_2		0x24
+
+#define AST2600_OTP_CMD_READ		0x23b1e361
+#define AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
+#define AST2600_OTP_UNLOCK_KEY		0x349fe38a
+#define AST2600_OTP_STATUS_DONE		0x6
+#define AST2600_OTP_TIMEOUT_US		100000
+
+#define AST2600_OTP_DATA_WORDS		0x800
+#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
+#define AST2600_OTP_CONF0_ADDR		0x800
+#define AST2600_OTP_CONF0_SEC_SIZE		GENMASK(21, 16)
+#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))
+
+struct ast2600_otp {
+	void __iomem *base;
+	/* Serialize the complete unlock, read and relock sequence. */
+	struct mutex lock;
+	bool failed;
+};
+
+static int ast2600_otp_wait_complete(struct ast2600_otp *otp)
+{
+	u32 status;
+	int i, ret;
+
+	/* Allow the command to start before sampling the idle flags. */
+	udelay(1);
+
+	/* Match the downstream sequence: observe both idle flags twice. */
+	for (i = 0; i < 2; i++) {
+		ret = readl_poll_timeout(otp->base + AST2600_OTP_STATUS,
+					 status,
+					 (status & AST2600_OTP_STATUS_DONE) ==
+					 AST2600_OTP_STATUS_DONE,
+					 1, AST2600_OTP_TIMEOUT_US);
+		if (ret) {
+			/* Do not reuse a controller with an outstanding command. */
+			otp->failed = true;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ast2600_otp_prepare_read(struct ast2600_otp *otp)
+{
+	static const u32 mode_addresses[] = { 0x3000, 0x5000, 0x1000 };
+	int i, ret;
+
+	ret = ast2600_otp_wait_complete(otp);
+	if (ret)
+		return ret;
+
+	/*
+	 * Restore the macro's default read mode, as in otp_soak(ctx, 0).
+	 * These writes target volatile mode registers, not OTP fuse cells.
+	 * No fuse programming command or programming timing is used.
+	 */
+	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
+		writel(mode_addresses[i], otp->base + AST2600_OTP_ADDR);
+		writel(0, otp->base + AST2600_OTP_COMPARE_1);
+		writel(AST2600_OTP_CMD_WRITE_MODE, otp->base + AST2600_OTP_CMD);
+		ret = ast2600_otp_wait_complete(otp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ast2600_otp_read_pair(struct ast2600_otp *otp,
+				 unsigned int aligned_word,
+				 u32 *word0, u32 *word1)
+{
+	int ret;
+
+	/* The hardware reads two words starting at an even word index. */
+	if ((aligned_word & 1) || aligned_word >= AST2600_OTP_DATA_WORDS)
+		return -EINVAL;
+
+	writel(aligned_word, otp->base + AST2600_OTP_ADDR);
+
+	writel(AST2600_OTP_CMD_READ,
+	       otp->base + AST2600_OTP_CMD);
+
+	ret = ast2600_otp_wait_complete(otp);
+	if (ret)
+		return ret;
+
+	*word0 = readl(otp->base + AST2600_OTP_COMPARE_1);
+	*word1 = readl(otp->base + AST2600_OTP_COMPARE_2);
+
+	return 0;
+}
+
+static int ast2600_otp_read(void *context, unsigned int offset,
+			    void *val, size_t bytes)
+{
+	struct ast2600_otp *otp = context;
+	u8 *buf = val;
+	unsigned int word_index;
+	unsigned int aligned_word;
+	unsigned int secure_size;
+	__le32 pair[2];
+	u32 conf0;
+	u32 word0, word1;
+	size_t chunk, skip;
+	int ret;
+
+	if (!bytes)
+		return -EINVAL;
+
+	if (offset % sizeof(u32) || bytes % sizeof(u32))
+		return -EINVAL;
+
+	if (offset >= AST2600_OTP_SIZE ||
+	    bytes > AST2600_OTP_SIZE - offset)
+		return -EINVAL;
+
+	mutex_lock(&otp->lock);
+
+	if (otp->failed) {
+		ret = -EIO;
+		goto out_unlock;
+	}
+
+	writel(AST2600_OTP_UNLOCK_KEY, otp->base + AST2600_OTP_PROTECT_KEY);
+
+	ret = ast2600_otp_prepare_read(otp);
+	if (ret)
+		goto out_lock;
+
+	/* Configuration word 0 describes the unreadable secure data prefix. */
+	writel(AST2600_OTP_CONF0_ADDR, otp->base + AST2600_OTP_ADDR);
+	writel(AST2600_OTP_CMD_READ, otp->base + AST2600_OTP_CMD);
+	ret = ast2600_otp_wait_complete(otp);
+	if (ret)
+		goto out_lock;
+
+	conf0 = readl(otp->base + AST2600_OTP_COMPARE_1);
+	secure_size = FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
+		      AST2600_OTP_SEC_SIZE_UNIT;
+	/* Conservatively deny the entire secure prefix, including its header. */
+	if (offset < secure_size) {
+		ret = -EACCES;
+		goto out_lock;
+	}
+
+	while (bytes) {
+		word_index = offset / sizeof(u32);
+		aligned_word = ALIGN_DOWN(word_index, 2);
+
+		ret = ast2600_otp_read_pair(otp, aligned_word,
+					    &word0, &word1);
+		if (ret)
+			goto out_lock;
+
+		pair[0] = cpu_to_le32(word0);
+		pair[1] = cpu_to_le32(word1);
+		skip = (word_index - aligned_word) * sizeof(u32);
+		chunk = min(bytes, sizeof(pair) - skip);
+
+		memcpy(buf, (u8 *)pair + skip, chunk);
+		buf += chunk;
+		offset += chunk;
+		bytes -= chunk;
+	}
+
+	ret = 0;
+
+out_lock:
+	writel(0, otp->base + AST2600_OTP_PROTECT_KEY);
+	/* Flush the protection write before another reader takes the mutex. */
+	readl(otp->base + AST2600_OTP_PROTECT_KEY);
+out_unlock:
+	mutex_unlock(&otp->lock);
+	return ret;
+}
+
+static int ast2600_otp_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {};
+	struct nvmem_device *nvmem;
+	struct ast2600_otp *otp;
+
+	otp = devm_kzalloc(&pdev->dev, sizeof(*otp), GFP_KERNEL);
+	if (!otp)
+		return -ENOMEM;
+
+	otp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(otp->base))
+		return PTR_ERR(otp->base);
+
+	mutex_init(&otp->lock);
+
+	config.dev = &pdev->dev;
+	config.name = "ast2600-otp";
+	config.id = NVMEM_DEVID_AUTO;
+	config.owner = THIS_MODULE;
+	config.type = NVMEM_TYPE_OTP;
+	config.read_only = true;
+	config.root_only = true;
+	config.word_size = sizeof(u32);
+	config.stride = sizeof(u32);
+	config.size = AST2600_OTP_SIZE;
+	config.reg_read = ast2600_otp_read;
+	config.priv = otp;
+
+	nvmem = devm_nvmem_register(&pdev->dev, &config);
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
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


