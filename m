Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055F60A2605
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a2ZPAGYS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TX2l6Rpa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ppcz44YpOa+Rb6xSudMc3Cgx0KmX+T9PkTnsbJicNG8=; b=a2ZPAGYSzNU0ez
	jiz/bXtGT6rqHv5A2xMexl+2J3IFnkZf43/SoikUMTpr/YWjqWsjI/PhZZsI7g40Bz2BFgeOaaWVE
	uWuPC57lAc4AgKFWl3m03w3iNOj35kp6F470UB1LHlUrUZbn2LzkG3Mnc9CMHJgkvqGhXaYG1Iazd
	Q+Vxh0BIGYFQF9UOO2vJXPFX8pmmLcwoCR9GAzM/RUD3eCdmjNkYQp7ssNPhMe8m8AhYSfeOxCBCR
	vXM2irXT52MvZ5XETaM4E4mJQEaZjq615x0Ujd5S9l/IGX7n4V1W/OuLhXh+JGgEyzferbzTF9yMU
	38ee8QxVR+NFTUanRK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQznu-00000005bJd-2PDQ;
	Wed, 11 Nov 2026 04:19:22 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQznq-00000005bHv-0e0s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 04:19:19 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4590179eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 20:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370757; x=1794975557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppcz44YpOa+Rb6xSudMc3Cgx0KmX+T9PkTnsbJicNG8=;
        b=TX2l6RpaFFQPtZAv0xoKLmYOIc9rJiqf1MaVnO0iIagQCNOLnBi/L0eR89EAGua118
         IWLLTo7OHiI1FfaQzdRHrTq5OpVGPIxVaA4cYxv2OfIAIvvGTAMPbtmsIxfKpyhNjmJM
         0QTg9dHcglyRRg4Ot38NsRgq630Pc8N7kwa3uFqnyDpBYPFwuteMvxDM1RfHTsXwIIHa
         aQ6yv/m8CpCkYgqMYF6+EpSwxqeYaGkEM6IjKTghkSNon2CunGmdROog5tmhtL/HNavu
         oy4Dix3sgE3e+HgcuC2HE9rEDfyeWGxlNOVcsqSMHkjcEpL+wCUpcaHTaqGXHaf/l8/F
         MPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370757; x=1794975557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppcz44YpOa+Rb6xSudMc3Cgx0KmX+T9PkTnsbJicNG8=;
        b=hPDAvjdAL5G5b1Kbsf2h5Wj1OAkzyXJdgt5Xq9LaLDK1I9aQK9EVv+feyjsqQ8PGj9
         Mm36S6VuIwAvyQMu34xqxQO3TfkccjhtnOmfX34DPdwmm5djYhXy7snnX6H30cM9DLKf
         dEC2gpuDW0rngNrmMtbgzYiZTvGd1eAeMzIFDiOMFQzQkN/ti4/11kitsCOuu6JKvXrZ
         4oC4GxwZWQg2XnAgd7MHPUdrFSyZ7EfrspzENA/TEeJ0xIYFggqCSNug6vOuBxT+T0KS
         JughwsN/qhPgnJJWFkVDIklTgvhWFFu5mZstrA2JuAxorRoOwqqPHFD4CCgPoVRGia66
         SBRA==
X-Forwarded-Encrypted: i=1; AL+hErHFeuOJtudc7R4mv6CrVBPlumxXxr0nvLwt43lK3aSyB2ewm7CfUw5O3I99pGbs4CywDmAKCS9tUdkSdjJmkGRy@lists.infradead.org
X-Gm-Message-State: APuU4Z/+5qjMKUnrNOTxb5k4oTLFkVX+Zs8E7v5s4/nrShP+h3GNn5sc
	hWfZ+z40h82LwYKFRkd5DZQpgzNaIrfk+owS4MVKpAX/f5lo3Lksry4o
X-Gm-Gg: AYBFou1nJj5/eZsiAglhmCmAGKhJPcrXLshHMtGpwRcln08yhVLSdz5QphJV9SKE9+U
	b6+2JztQkdnM0Tbk7g01FqQaytUfVjNwEyfAYjYY2bTD/1Y7ah4zyo3Do81IKFZUgwJhEBuGYHe
	df5icVkPker3yx7R54n3Avi+99tpPuVXQZbjGUPOuLlpn3j2ZWwLL0KmjVl+AABp/5TQg50GeWm
	TKBs+PtxygD+MXppy+Kl9fK6s45bMi/iEF41n/QW817R5ZVyrotkdCqoNEtoaDit3lcmAFMVmjM
	L9TBTRwgyzjTq451MS+GjJIQJqiFulOT7AcPd+IBttZ66riSdXXeUdr8s4CQz5Q54pMJ3Y5zaPH
	CNrYbHVkWVETsWAnba6K5kgLzgP/aOVRyM2n8kOVNpE5Jvz0O4ZhiMPIydeE3Uu4gnZx6hiBmiM
	vQ4R4o2pXjRtFmdcqI+qQvXzGT1GfUsOGQigGnFfJaFdm/9Guws0QkzFyZTkl+9vXREjJzwW5JQ
	Vg9/lnk/13Q/B1faSB5iOGcXJtPHb51HuqKiQxag2/75acedxxTC8+MwFygdKZ7o/IB7uyIt4he
	TXusiIZDI6GyFhA8RjN0OH4juK9zksfKbt8BKz4PIad+5Gh3tjv/LkjLImRP3ZNOgViGzNsXVbC
	Zqyd73xwzk6B/BmmIwV5vqNQ6e8oRmMh6BrUXmlU4uduQ44rxLAv5vlfK+ZhQZK8zkjhR3rd4
X-Received: by 2002:a05:7300:f542:b0:376:98e7:eeae with SMTP id 5a478bee46e88-37698e7ef9dmr1582189eec.6.1794370756966;
        Tue, 10 Nov 2026 20:19:16 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm11820704eec.15.2026.11.10.20.19.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 20:19:16 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Tue, 10 Nov 2026 20:19:02 -0800
Message-ID: <20261111041904.48916-3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111041904.48916-1-ahmadexp@gmail.com>
References: <20261111041904.48916-1-ahmadexp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_201918_223654_CC0518FC 
X-CRM114-Status: GOOD (  22.55  )
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
 drivers/i2c/busses/Kconfig                | 14 ++++
 drivers/i2c/busses/i2c-xiic.c             |  4 ++
 drivers/i2c/busses/tests/i2c_xiic_kunit.c | 88 +++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 76fb13c87..eb5777316 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4017,6 +4017,7 @@ F:	drivers/cpuidle/cpuidle-zynq.c
 F:	drivers/edac/synopsys_edac.c
 F:	drivers/i2c/busses/i2c-cadence.c
 F:	drivers/i2c/busses/i2c-xiic.c
+F:	drivers/i2c/busses/tests/i2c_xiic_kunit.c
 F:	drivers/mmc/host/sdhci-of-arasan.c
 N:	zynq
 N:	xilinx
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 275aaa7f3..014281fa2 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1322,6 +1322,20 @@ config I2C_XILINX
 	  This driver can also be built as a module.  If so, the module
 	  will be called xilinx_i2c.
 
+config I2C_XILINX_KUNIT_TEST
+	bool "KUnit tests for Xilinx I2C register accesses" if !KUNIT_ALL_TESTS
+	depends on I2C_XILINX && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Test the Xilinx I2C driver's register accessors with both byte orders
+	  and with native-width or forced 32-bit accesses. KUnit is a kernel
+	  unit testing framework. These tests use memory-backed registers and
+	  do not require an I2C controller.
+
+	  The tests are compiled into the driver to exercise its private
+	  accessors, and follow the driver's built-in or module configuration.
+	  If unsure, say N.
+
 config I2C_XLP9XX
 	tristate "Cavium ThunderX2 I2C support"
 	depends on ARCH_THUNDER2 || COMPILE_TEST
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index d13cfb012..f2a77ca8d 100644
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
index 000000000..f8df88ca6
--- /dev/null
+++ b/drivers/i2c/busses/tests/i2c_xiic_kunit.c
@@ -0,0 +1,88 @@
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
+		XIIC_RFD_REG_OFFSET, XIIC_GPO_REG_OFFSET, XIIC_TSUSTA_REG_OFFSET,
+		XIIC_TSUSTO_REG_OFFSET, XIIC_THDSTA_REG_OFFSET,
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
+	/* Aligned RAM stands in for MMIO. No hardware is accessed. */
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
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg), 0x12345678U);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0x78);
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32)],
+				(u8)(param->endianness == BIG ? 0x12 : 0x78));
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32) + 3],
+				(u8)(param->endianness == BIG ? 0x78 : 0x12));
+		xiic_setreg32(i2c, reg, 0x89abcdefU);
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg), 0x89abcdefU);
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

