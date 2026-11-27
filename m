Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p5mCbVvi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqoyA4Fc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vk8QAimfppOVA6mWM6XoEd6S6tNQdHOsmJkxKjoB4U4=; b=p5mCbVviCLMI5Z
	Qs3cPxvu7l4uKuoRRwWOE8sOGNIDLrahX/fq3Av9TK4MLDCzk5dTwovmgr1CKi5go5FEuW5vRN44Y
	UQkuVbfs4WVjpDzAm+ZXw4iHwkl3TOEBGkbT9CzCqOa3STIwPHcGAjoCA8N3AMdT0Ol0qsCikjr6Y
	XvXRH3PDHb47eA8V7L4C331CgIQne2Zj3W+hLAI/TPRyL/otWsltQb/k12JgYWoQKd1e4b/ZL1czs
	LNcucQFPTDuqlDv44kUTNNMvvjpI+kSLJegTfJRN0vq2oFwMTE/VxduyPzVHki2QB6FRSkdG70a16
	i2FfpcJqb0KSFv69x6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmBS-0000000EooS-3l6y;
	Fri, 27 Nov 2026 02:59:34 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmBK-0000000EolO-32YZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:59:28 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso5488122eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748366; x=1796353166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vk8QAimfppOVA6mWM6XoEd6S6tNQdHOsmJkxKjoB4U4=;
        b=EqoyA4FcJgHP/5VXCcXYuq0xSKgGGqtnJTw3qCUTw50zN06ue2xybBG5N6Go8b24p3
         ErQXXQwp8b6XSsT2kUsjSRNUrORzK+n3TqDqi0ADoCqh4/FYyHZOPUBcttj75ab01Ayj
         hJA7rsJtx69qF4PhR/IF7cyHT6VSvtKgdDe5VBJERsX9Fg4UNKzElpf13ivZn6dC0j6O
         g7Zsv6RwqcEhJwqKRrjQfaSM86lU+rWEXu0iMvt/cQCgM8XH8MWFicsGgZDVZBoE3riN
         9GFqBRlBG813utqB7JvrRL1gfowimAWIVHeinfSEZ1fas/FUrs5Z1f/VdSNip4N/Rl63
         BkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748366; x=1796353166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vk8QAimfppOVA6mWM6XoEd6S6tNQdHOsmJkxKjoB4U4=;
        b=u/WWV0rdheUM7DDlizCWJ2CfWr2ibVsYvkskPYo+3SIhqlx6pv4tEbUP0vqFIf/jpF
         g8mx9KrWEJipBQhzCuxXnnj2tmVYuojBZKiAw2wCZAYWGgQzaIhg9FlwAdpKUz4/YiUf
         tiqRBq0UD3PsBGSWYU4OX6gm5fogeEK4f0Y6ckdqSLYxeMn0bkysEWk8mpzNgRS060Q/
         k2/cbVZYXf+vjGMimkr3G+rDYGwRFOrw/W4VmkrbZPEGuamGyE2wnmGbiMolLbmr6iQb
         bETkNdeBPsAAFGRR1ul0x4C+MwOl8YZsfhdSP8VMwdkc9nqqZH+jQIw2rOFlYOiX6Tzf
         IiVw==
X-Forwarded-Encrypted: i=1; AL+hErETEb9+aWBDh+OSe8uh8GgDnBCuPbMGB8CM72Hvsxe83iApowGmnkP4EbAQDZG/8b3qYoTHfHqg87z4Ntz4Sngt@lists.infradead.org
X-Gm-Message-State: APuU4Z9SEUdH/uRrOavRIj2s0u7c9u40kt0heNO39+3+Pn/37eMpcDCD
	pVddxG8TJuSXS4QxFdXThDnB0VvBjO7hu+pWISVcmmz2O40WFN6cn1kp
X-Gm-Gg: AZFdTZcEpMVYo6RGRfLpZPGIzd0TyGflACF+tWK4PcQ2o4CLB2G/U+WnDlQ6uOy7VOC
	ZDcY5c1tgPjSmVlp7twNkiSH5cS7hf20DOqdWbLUQ6SzPYKLQfzwyNaVKH+h9QxyCQ9fFvAt1j8
	G0WzIZ38r2zsTasfp+zzl30GwGNBztztbNzriutTbWjPrHswH0vZK66Z3xJ1curKS9rwrIm6JgC
	XJd5+sbFYpZwGP54NPAxN4/80VtNJGHUQpujk8/49jklgIobhrLslIVuG2VZdSdLRIz0y1AEwOx
	iNAcVzKZKNlmhPRIC4jQ5g8LoHqSOHb+dQ6hlVVbnneImRFPGNjbSo51Fh+xJ6zlSZ2AJaEqkog
	JONT5W5T7vPrAR9FfEn0pb5Zd4XviT9A5nQgG3NCwTyljs7GD2kIkAFHd8M/gPHMHJLvJs84hfg
	C4X2YnRzsuq4m/sy6MSRPKloUY1YGIbzBsjIFkkvWPUsEx3ya2CJWB2je2NME1GC6rqn9Bofh8z
	obpLT+mujYuJ6FZ0yZrXMuAhVi2U62L5/OtXar8jLNhmOIuXGDrUS8E85NgJqELBpXrgrilrZQq
	+4Bgg7KW0NCb1tvkZ5wZOGhBwLQiRPhT8Cu1m21cSwcEXn4=
X-Received: by 2002:a05:7300:e9cf:10b0:386:e571:4bb4 with SMTP id 5a478bee46e88-386e5715040mr2828954eec.13.1795748365932;
        Thu, 26 Nov 2026 18:59:25 -0800 (PST)
Received: from debian.prasanth ([103.183.205.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm72013313eec.14.2026.11.26.18.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:59:25 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Tan Siewert <tan.siewert@9elements.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 27 Nov 2026 08:28:17 +0530
Message-ID: <20261127025817.20090-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
References: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_185926_796526_010DFADD 
X-CRM114-Status: GOOD (  29.14  )
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

AST2600's secure boot controller provides an 8-KiB OTP data region through
paired-word commands rather than memory-mapped storage. Expose permitted
words through NVMEM for privileged userspace bring-up diagnostics, which
compare raw OTP offsets with reference reads; no named cells are required
by this consumer.

Earlier firmware may leave the OTP macro in programming mode, so Linux
must establish read mode before using it. Programming protection does not
prevent reads, but the configured secure prefix and SEC54 restrict the
readable region. SEC54 can increase until ARM reset, so a probe-time
snapshot alone cannot describe every later read restriction.

SEC00 relocking does not cancel a running command. Since there is no
documented safe retry after a timeout, stop issuing commands rather than
risk overlapping an outstanding operation. Normal reads take less than
1 us; the 100-ms bound is deliberately generous, not a specified maximum.

The read sequence is adapted from ASPEED's downstream driver.

Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c
Link: https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

Co-developed-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Changes since v3:
- Drop linux/mod_devicetable.h as requested by Uwe; platform_device.h
  already provides the required declaration.

v4 validation:
- ARM driver-object compilation with W=1 passed.
- Strict patch checkpatch: zero errors, zero checks, one new-file/
  MAINTAINERS warning. The existing ASPEED matcher covers the driver.

Earlier v3 validation, before this include-only change:
Tested on ASRock Rack B650D4U (AST2600 A3), Linux 7.4-rc1:
- ARM zImage build with W=1 completed.
- Repeated 12-byte reads and cross-pair/final-pair comparisons passed.
- Four concurrent readers completed 40 matching reads.
- Bytes 8172..8183 matched the saved ASPEED-derived reference fingerprint.
The kernel was RAM-booted with the working OpenBMC DTB and initramfs.

Host-model checks passed 4096 protection combinations, 200 copying cases
and 24 timeout cases, including unlock-failure cleanup. Strict source
checkpatch passed. The existing ASPEED MAINTAINERS matcher covers the file.

 drivers/nvmem/Kconfig            |  13 ++
 drivers/nvmem/Makefile           |   1 +
 drivers/nvmem/nvmem-aspeed-otp.c | 298 +++++++++++++++++++++++++++++++
 3 files changed, 312 insertions(+)
 create mode 100644 drivers/nvmem/nvmem-aspeed-otp.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb2..65f6a88 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -164,6 +164,19 @@ config NVMEM_APPLE_SPMI
 	  This driver can also be built as a module. If so, the module
 	  will be called apple-nvmem-spmi.
 
+config NVMEM_ASPEED_OTP
+	tristate "ASPEED OTP support"
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
index 5e70bad..ca62940 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
 apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
+obj-$(CONFIG_NVMEM_ASPEED_OTP)	+= nvmem-aspeed-otp.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
diff --git a/drivers/nvmem/nvmem-aspeed-otp.c b/drivers/nvmem/nvmem-aspeed-otp.c
new file mode 100644
index 0000000..cbe05fc
--- /dev/null
+++ b/drivers/nvmem/nvmem-aspeed-otp.c
@@ -0,0 +1,298 @@
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
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/unaligned.h>
+
+#define AST2600_OTP_PROTECT_KEY		0x00
+#define  AST2600_OTP_UNLOCK_KEY		0x349fe38a
+#define AST2600_OTP_CMD			0x04
+#define  AST2600_OTP_CMD_READ		0x23b1e361
+#define  AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
+#define AST2600_OTP_ADDR			0x10
+#define AST2600_OTP_STATUS		0x14
+#define  AST2600_OTP_STATUS_DONE		GENMASK(2, 1)
+#define AST2600_OTP_COMPARE_1		0x20
+#define AST2600_OTP_COMPARE_2		0x24
+#define AST2600_OTP_EXTRA_READ_PROTECT	0x54
+#define  AST2600_OTP_EXTRA_READ_RANGE	GENMASK(5, 0)
+
+/* OTP macro addresses selected through AST2600_OTP_ADDR, not MMIO offsets. */
+#define AST2600_OTP_CONF0_ADDR		0x800
+#define  AST2600_OTP_CONF0_SEC_SIZE	GENMASK(21, 16)
+#define AST2600_OTP_MR			0x1000
+#define AST2600_OTP_MRA			0x3000
+#define AST2600_OTP_MRB			0x5000
+
+/* Normal reads take less than 1 us; allow a generous bounded wait. */
+#define AST2600_OTP_TIMEOUT_US		100000
+#define AST2600_OTP_DATA_WORDS		0x800
+#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
+#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))
+
+struct aspeed_otp {
+	struct device *dev;
+	void __iomem *base;
+	/* Serialize the complete unlock, read and relock sequence. */
+	struct mutex lock;
+	struct nvmem_keepout secure_keepout;
+	bool failed;
+};
+
+static int aspeed_otp_unlock(struct aspeed_otp *priv)
+{
+	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
+	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) != 1)
+		return -EIO;
+
+	return 0;
+}
+
+static void aspeed_otp_lock(struct aspeed_otp *priv)
+{
+	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
+}
+
+static int aspeed_otp_wait_complete(struct aspeed_otp *priv)
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
+static int aspeed_otp_init_read_mode(struct aspeed_otp *priv)
+{
+	static const u32 mode_addresses[] = {
+		AST2600_OTP_MRA, AST2600_OTP_MRB, AST2600_OTP_MR,
+	};
+	int i, ret;
+
+	ret = aspeed_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	/* Earlier firmware may leave the macro in program mode; restore read mode. */
+	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
+		writel(mode_addresses[i], priv->base + AST2600_OTP_ADDR);
+		writel(0, priv->base + AST2600_OTP_COMPARE_1);
+		writel(AST2600_OTP_CMD_WRITE_MODE, priv->base + AST2600_OTP_CMD);
+		ret = aspeed_otp_wait_complete(priv);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int aspeed_otp_read_pair(struct aspeed_otp *priv,
+				unsigned int aligned_word, u32 data[2])
+{
+	int ret;
+
+	/* The hardware reads two words starting at an even word index. */
+	writel(aligned_word, priv->base + AST2600_OTP_ADDR);
+	writel(AST2600_OTP_CMD_READ, priv->base + AST2600_OTP_CMD);
+
+	ret = aspeed_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	data[0] = readl(priv->base + AST2600_OTP_COMPARE_1);
+	data[1] = readl(priv->base + AST2600_OTP_COMPARE_2);
+
+	return 0;
+}
+
+static int aspeed_otp_init_unlocked(struct aspeed_otp *priv)
+{
+	u32 data[2];
+	int ret;
+
+	ret = aspeed_otp_init_read_mode(priv);
+	if (ret)
+		return ret;
+
+	ret = aspeed_otp_read_pair(priv, AST2600_OTP_CONF0_ADDR, data);
+	if (ret)
+		return ret;
+
+	priv->secure_keepout.end =
+		FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, data[0]) *
+		AST2600_OTP_SEC_SIZE_UNIT;
+
+	return 0;
+}
+
+static int aspeed_otp_init(struct aspeed_otp *priv)
+{
+	int ret;
+
+	/* The provider is not registered yet; there are no concurrent readers. */
+	ret = aspeed_otp_unlock(priv);
+	if (!ret)
+		ret = aspeed_otp_init_unlocked(priv);
+	aspeed_otp_lock(priv);
+
+	return ret;
+}
+
+static int aspeed_otp_read_data(struct aspeed_otp *priv, unsigned int offset,
+				void *val, size_t bytes)
+{
+	unsigned int word_index = offset / sizeof(u32);
+	u8 *buf = val;
+	u32 data[2];
+	int i, ret;
+
+	ret = aspeed_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	while (bytes) {
+		ret = aspeed_otp_read_pair(priv, word_index & ~1U, data);
+		if (ret)
+			return ret;
+
+		for (i = word_index & 1; i < ARRAY_SIZE(data) && bytes; i++) {
+			put_unaligned_le32(data[i], buf);
+			buf += sizeof(u32);
+			bytes -= sizeof(u32);
+			word_index++;
+		}
+	}
+
+	return 0;
+}
+
+static int aspeed_otp_read(void *context, unsigned int offset,
+			   void *val, size_t bytes)
+{
+	struct aspeed_otp *priv = context;
+	unsigned int secure_size;
+	u32 extra_read;
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
+	/* SEC54[5:0] can only grow until the ARM cores reset. */
+	extra_read = readl(priv->base + AST2600_OTP_EXTRA_READ_PROTECT);
+	secure_size = FIELD_GET(AST2600_OTP_EXTRA_READ_RANGE, extra_read) *
+		      AST2600_OTP_SEC_SIZE_UNIT;
+	secure_size = max(priv->secure_keepout.end, secure_size);
+	if (offset < secure_size)
+		return -EACCES;
+
+	ret = aspeed_otp_unlock(priv);
+	if (!ret)
+		ret = aspeed_otp_read_data(priv, offset, val, bytes);
+	aspeed_otp_lock(priv);
+	/* Complete the lock write before handing the mutex to another reader. */
+	readl(priv->base + AST2600_OTP_PROTECT_KEY);
+
+	return ret;
+}
+
+static int aspeed_otp_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.name = "aspeed-otp",
+		.id = NVMEM_DEVID_AUTO,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.word_size = sizeof(u32),
+		.stride = sizeof(u32),
+		.size = AST2600_OTP_SIZE,
+		.reg_read = aspeed_otp_read,
+	};
+	struct aspeed_otp *priv;
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
+	ret = aspeed_otp_init(priv);
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
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
+}
+
+static const struct of_device_id aspeed_otp_of_match[] = {
+	{ .compatible = "aspeed,ast2600-sbc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_otp_of_match);
+
+static struct platform_driver aspeed_otp_driver = {
+	.probe = aspeed_otp_probe,
+	.driver = {
+		.name = "aspeed-otp",
+		.of_match_table = aspeed_otp_of_match,
+	},
+};
+module_platform_driver(aspeed_otp_driver);
+
+MODULE_AUTHOR("Neal Liu <neal_liu@aspeedtech.com>");
+MODULE_AUTHOR("Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>");
+MODULE_DESCRIPTION("ASPEED AST2600 read-only OTP NVMEM driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


