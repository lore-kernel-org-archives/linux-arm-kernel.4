Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94B5606A896
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a0WYcnnD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASKSXPfA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=; b=a0WYcnnDCHM72Z
	EcvrOAjNcXQjPFQLrUSIMe6ETL5iU/97LPRA/kWW1Fxq0pJRvxotfiHNsmxtrUnqt/Ey7n3wgu0oM
	10IWclj4VhcdQ5WMz8n3UIz0mw6Q15X19rzijRf8SkMWysuLlR/HgNZHQHZ8C5vTJjXtr2o7k8btm
	S0qUJyVIYvIxCBaje20AzCUbyKsLBl7HkJk2QtDT1/guec16B3kTCBS27Q2kEa5p0OV9hSA5dr8Xx
	yCfJGcRRR670EIS0wVytqYJrWoBZwWCR/vYc1Bi8ahnzIBX5zu1NQ3g/GXAdXxRnPiY5fgcnts6xf
	0xU2iDN2DnTGE4X60Psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1KI-00000003WBP-3YKv;
	Mon, 16 Nov 2026 18:21:10 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1K4-00000003W4G-1Lmt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:20:57 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cdb684859cbso2697477a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853255; x=1795458055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=;
        b=ASKSXPfAMssHirRukp/+bSK3yqgkFjS/bkhHGWRdiNhCvcxHM1yr6BPWQHyo/YTjvG
         gpA4CTcKT11TVwoTfgMTSgCV2BLJxTtizLtY1nD1jVC0CPcWofUO5HWmpoTg7AD06cFs
         a6uH5nuLFbcPCZfjpm9bL7t+T/2thlUr9GprsPVEwUf8ROPZ53Wkd0d32M2oyGidscTq
         Zfo+XG6XwStkp+4ax2RPYn6EpA6RyXAd09ZWL6j1Q3iQiE5RwS0c4DnSHQujdXLcgG2S
         ocrzZDdShJw04IV91Y7z5C/oPZB/8rwp9UP2dnawjbfAkbHnd3vjidJ61wcZkj7QNoE1
         mnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853255; x=1795458055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=;
        b=jo2Ab+2tJ7c1aYRbqxbfFqlyENz8NqwW8uvWK5n03MQmMzqpZUMM28O7o8O3nHSB/3
         6sqDn2PVje/sFFclpThryeH5EpdRy1jLTVw/d1A2UkXYaExrIdzWkj9n1RFSaKWfqvDw
         omistme/yF+j3makhn00ML82mi9N4VXAhytpllkMxdNLvWPICe0r4Xzi4KQMMioeCe1Z
         qh3Qr+oLpOG/m7abGGRnlP5d4oE75qCmgmNgft7OypYQtJbSNwZLlW9Ml+9nZM4Floo0
         Q98FVkFA2eIaMjaMettYs0FJitHn+Dagn9uV9nw71xkixraZLIHEwiv8aQZm20biRmRn
         wUiw==
X-Gm-Message-State: APuU4Z+17XM6ifAqhdt9cpD9u4iHb0l9PPJRrWCabRBxbmUS3/FtQ5Hb
	dwa4HUKGI2FOCw62b3V9Xa99GKkVK8fGYErfPofLe6P9k1LWJQWB4Yhp
X-Gm-Gg: AZFdTZfZWOQ4hYUd20rGh2VwcHxUEFIhgCmlPKaG+WhdU25eoAnXKRCtI3GQ/phw/gO
	+WoER6KgbSHvaGKg62MJwuN3g/Q7RhJHAV7I/kGSIA/oOk+JE/JaE0Z97qrz9TQ7SewBN8jEJlF
	hkoZp7ZCTw5tnhj0UeMSbRkji0guZneP95WL6OI4X0NuKJ9CUsw1vTkQ6EpnmVVRQ5bl0bAOk/X
	UPKyTPD0b+6Sjz5ulPGznW69kcrx92TVSS9u0BP3RqbIwbflfhiROz20bbPdfehaP5J287gfZx6
	ikcxcKijkNTuDGeBgCnUFkI4/N7bxMKQczHoTouSGvClB1u8m7mnrlnPW1ktPe1Nc2FobNAUFHd
	/KRuGuF1Z/oerhv7o/8pUCF5beWWdgOm87ISfonp6ASLRl8HXiAg6jTdGiKHruJJAVM0PhL+JFs
	3pHdJ3f2O1uCPdb2uJNwYjngKa+fvcgtvKVVyLIq94fb1OZBHRg+L/loTN6ysgfDzR+eGjoS3Fa
	+SCUcrdEEh19Vim7herq/0eNJ0+sZSqFj4zRS7ewvetH4bp1UGoY/rt6a/ZEuxH+Lj+b4e7BbFM
	sXckZi6VZrGz9/i4vlLcTJLrCXNrVFsO3TJg3FSqlQey3VxhIXbi7QhoyruadnCKyxWzjD55xrv
	K9umScyE3NZRP8XBRVMWfJ+wn9AFGH8udwMpdkgpO06yZ46Dypj6yu3X2jg==
X-Received: by 2002:a17:90b:2f08:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b1b0a3c10cmr10695106a91.45.1794853255277;
        Mon, 16 Nov 2026 10:20:55 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac29a846sm304780a91.9.2026.11.16.10.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:54 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com
Subject: [PATCH net-next v3 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Mon, 16 Nov 2026 10:20:51 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
References: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102056_739235_D25088C6 
X-CRM114-Status: GOOD (  23.91  )
X-Spam-Score: -2.1 (--)
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Exercise the driver's private register accessors with memory-backed
registers instead of physical hardware. Cover native byte/halfword and
forced 32-bit accesses in both register byte orders, across 22 register
offsets. Check payload truncation, high-bit values and neighboring
sentinels. These tests do not validate physical bus transaction widths
or hardware interrupt behavior.

An allocated RAM address is not a portable I/O cookie. Limit the test
to the direct x86-64 MMIO implementation, which uses ordinary memory
loads and stores at these addresses. Exclude UML (which can also set
X86_64) and indirect I/O. KUNIT_ALL_TESTS cannot enable the suite on
other architectures. This restriction does not apply to the driver.

Include the tests in the driver translation unit so no accessors need
to become exported interfaces. Require built-in KUnit to avoid a
built-in driver depending on a modular test framework. The tests follow
the driver into either its built-in image or module.

The four parameterized cases passed in an isolated x86-64 QEMU boot
with networking disabled and no physical-device passthrough.

Tool-origin disclosure, as required by generated-content.rst: Codex was
used to implement this test suite, run the KUnit build/boot and draft
this changelog, in response to a request for upstream-quality testing.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 MAINTAINERS                               |  1 +
 drivers/i2c/busses/Kconfig                | 15 ++++
 drivers/i2c/busses/i2c-xiic.c             |  4 +
 drivers/i2c/busses/tests/i2c_xiic_kunit.c | 91 +++++++++++++++++++++++
 4 files changed, 111 insertions(+)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c..4588569e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4018,6 +4018,7 @@ F:	drivers/cpuidle/cpuidle-zynq.c
 F:	drivers/edac/synopsys_edac.c
 F:	drivers/i2c/busses/i2c-cadence.c
 F:	drivers/i2c/busses/i2c-xiic.c
+F:	drivers/i2c/busses/tests/i2c_xiic_kunit.c
 F:	drivers/mmc/host/sdhci-of-arasan.c
 N:	zynq
 N:	xilinx
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 275aaa7f3..0a7a2aeb7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1322,6 +1322,21 @@ config I2C_XILINX
 	  This driver can also be built as a module.  If so, the module
 	  will be called xilinx_i2c.
 
+config I2C_XILINX_KUNIT_TEST
+	bool "KUnit tests for Xilinx I2C register accesses" if !KUNIT_ALL_TESTS
+	depends on I2C_XILINX && KUNIT=y
+	depends on X86_64 && !UML && !INDIRECT_IOMEM
+	default KUNIT_ALL_TESTS
+	help
+	  Test the Xilinx I2C driver's register accessors with both byte orders
+	  and with native-width or forced 32-bit accesses. The tests use
+	  allocated RAM in place of registers. This relies on the direct
+	  x86-64 MMIO accessor implementation; no controller is required.
+
+	  The tests are compiled into the driver to exercise its private
+	  accessors, and follow the driver's built-in or module configuration.
+	  If unsure, say N.
+
 config I2C_XLP9XX
 	tristate "Cavium ThunderX2 I2C support"
 	depends on ARCH_THUNDER2 || COMPILE_TEST
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index edb5e271c..7e2ed61c6 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1650,3 +1650,7 @@ MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("info@mocean-labs.com");
 MODULE_DESCRIPTION("Xilinx I2C bus driver");
 MODULE_LICENSE("GPL v2");
+
+#if IS_ENABLED(CONFIG_I2C_XILINX_KUNIT_TEST)
+#include "tests/i2c_xiic_kunit.c"
+#endif
diff --git a/drivers/i2c/busses/tests/i2c_xiic_kunit.c b/drivers/i2c/busses/tests/i2c_xiic_kunit.c
new file mode 100644
index 000000000..1b691de7e
--- /dev/null
+++ b/drivers/i2c/busses/tests/i2c_xiic_kunit.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Included by i2c-xiic.c to exercise the driver's private accessors. */
+#include <kunit/test.h>
+
+struct xiic_access_param {
+	const char *name;
+	enum xiic_endian endianness;
+	bool force_32bit_access;
+};
+
+static const struct xiic_access_param xiic_access_params[] = {
+	{ "native_little_endian", LITTLE, false },
+	{ "native_big_endian", BIG, false },
+	{ "word_little_endian", LITTLE, true },
+	{ "word_big_endian", BIG, true },
+};
+
+KUNIT_ARRAY_PARAM_DESC(xiic_access, xiic_access_params, name);
+
+static void xiic_register_access(struct kunit *test)
+{
+	static const int offsets[] = {
+		XIIC_DGIER_OFFSET, XIIC_IISR_OFFSET, XIIC_IIER_OFFSET,
+		XIIC_RESETR_OFFSET, XIIC_CR_REG_OFFSET, XIIC_SR_REG_OFFSET,
+		XIIC_DTR_REG_OFFSET, XIIC_DRR_REG_OFFSET, XIIC_ADR_REG_OFFSET,
+		XIIC_TFO_REG_OFFSET, XIIC_RFO_REG_OFFSET, XIIC_TBA_REG_OFFSET,
+		XIIC_RFD_REG_OFFSET, XIIC_GPO_REG_OFFSET,
+		XIIC_TSUSTA_REG_OFFSET, XIIC_TSUSTO_REG_OFFSET,
+		XIIC_THDSTA_REG_OFFSET,
+		XIIC_TSUDAT_REG_OFFSET, XIIC_TBUF_REG_OFFSET,
+		XIIC_THIGH_REG_OFFSET, XIIC_TLOW_REG_OFFSET,
+		XIIC_THDDAT_REG_OFFSET,
+	};
+	const struct xiic_access_param *param = test->param_value;
+	struct xiic_i2c *i2c;
+	u32 expected;
+	u8 *mem;
+	size_t i;
+	int reg;
+
+	i2c = kunit_kzalloc(test, sizeof(*i2c), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, i2c);
+	mem = kunit_kmalloc(test, 0x200, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, mem);
+	/* Only built for direct x86-64 MMIO, which accepts this RAM address. */
+	i2c->base = (void __force __iomem *)(mem + sizeof(u32));
+	i2c->endianness = param->endianness;
+	i2c->force_32bit_access = param->force_32bit_access;
+
+	for (i = 0; i < ARRAY_SIZE(offsets); i++) {
+		reg = offsets[i];
+		memset(mem, 0xa5, 0x200);
+
+		xiic_setreg8(i2c, reg, 0xc0);
+		expected = param->force_32bit_access ? 0xc0 : 0xa5a5a5c0;
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg), expected);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xc0);
+
+		xiic_setreg16(i2c, reg, 0x03ff);
+		expected = param->force_32bit_access ? 0x03ff : 0xa5a503ff;
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg), expected);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xff);
+
+		xiic_setreg32(i2c, reg, 0x12345678);
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg),
+				0x12345678U);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0x78);
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32)],
+				(u8)(param->endianness == BIG ? 0x12 : 0x78));
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32) + 3],
+				(u8)(param->endianness == BIG ? 0x78 : 0x12));
+		xiic_setreg32(i2c, reg, 0x89abcdefU);
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg),
+				0x89abcdefU);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xef);
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32) - 1], (u8)0xa5);
+		KUNIT_EXPECT_EQ(test, mem[reg + 2 * sizeof(u32)], (u8)0xa5);
+	}
+}
+
+static struct kunit_case xiic_access_test_cases[] = {
+	KUNIT_CASE_PARAM(xiic_register_access, xiic_access_gen_params),
+	{}
+};
+
+static struct kunit_suite xiic_access_test_suite = {
+	.name = "i2c_xiic",
+	.test_cases = xiic_access_test_cases,
+};
+
+kunit_test_suite(xiic_access_test_suite);

