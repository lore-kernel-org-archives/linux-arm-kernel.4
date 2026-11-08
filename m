Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51894606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w99gxZCn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVN9ENpC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZA/5FYnzqdS+nW2OO/uAeStvUW/+ooZY9jKEedX3LrE=; b=w99gxZCn441SYi
	X3NzTch0Cb7mEmLkJuICAfjqNAJbHcVUAH0W/ZstbLPkPI2I8zCWY65ZEJel9188wzAH7ll80LBVD
	/3VMGEy+oBq3N5In9SRPUsTaVcFPyJTKdEUAddDqsxqzCWPX4lLPum230P7vU594kzLY6tB6EFU93
	zNAOtksskg6E8NzoC9sfA4mXutU2z0/YWDpwbumNBOLK7vQnQrUjuVdxSqU69aLM90TE1fqbXnX7m
	TRRq6nu5pf2S/Fub0KwKTPGr39qsHrxy6B0JYcU6TGo6xJ0kN9r0DS57ZN2lRFJep3gi+bSL8A5AS
	etFbVCxdd8G5jqjgZ34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Hl-0000000GN2F-4BNv;
	Sun, 08 Nov 2026 15:58:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Hi-0000000GN0U-30mm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:58:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e4831c028so167596f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 07:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153501; x=1794758301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZA/5FYnzqdS+nW2OO/uAeStvUW/+ooZY9jKEedX3LrE=;
        b=NVN9ENpCq4sK6AWKhygMstfe82wFWddrfVBdcRLlHKC/shw+U3mBdJyqKdttW85k5t
         TZw28+o8cjY0eR1uV+cd+KELc6GFT2OHaMtXmn8m94xakoODu4hsppU71M4HicdSsmJh
         olSiSX2+9Pehcxt+HXKrIdLTmzt2cqGm1ZGit068skqg3id2cVN+ND0fySH8jvP4rge+
         yx3/DbZLoOs/fsY3Et+oDnlUDMfDYLJ5NyH5uHsRcI/IhRQDRoZks/wCRuCpHDGwD7Dd
         n6ApWZ72jjleZ/4nNnDlAej5oFEaFYCpI0ivImU+JcDaeoCBpEjeiTM6dLoPdg7kGM58
         u8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153501; x=1794758301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZA/5FYnzqdS+nW2OO/uAeStvUW/+ooZY9jKEedX3LrE=;
        b=Dhu08WHeBFC+/G4aRNprbcJbDqS4Rip+ptWbDtKJ5ZswA4KgcuOq6fTYqh9v76O1CH
         JF+mjokzSbB9pTYrTfOFWdkxnnQBB+ZD+0QR8tkxgxZMxFs10wxBMAx115/lBxA9bevB
         6bVXTpSGLicHjMkHUoGHS9ipxvyjIoIsDk524CgiJjg517/UgDmYil4fZnVGvWgJiD5O
         buh7itSJuZNA+8FHlwA+CrNuM2IR5VTxyzBsYLpdpqA+NKUaNGUqqxyhY+6a6h1UUbJY
         Uai5tUe8PdmCRaiIupkaDso3pmtEaO9o4dqCwMdS8rBWhBYlt97O6jtQ5YeR8FhQUssB
         WZYQ==
X-Forwarded-Encrypted: i=1; AL+hErE4RRKexSvioF/YeSJQoZJlzLRgCNmBOX7aTMfvJb0zESG93PCrTSSw0daqgxuKgc4QOeIx2lPFN17fcHS+a5wf@lists.infradead.org
X-Gm-Message-State: APuU4Z+EIFVIs9FJ/gb9RMkRCWAPy1HwMUuzRd1le5p8MOIsBAdXI/py
	pS0q3rJ3CJZDfbGUCbwipmWTxPHCU4t5gj7JlOLG7deyOPu7KbVWdmAD
X-Gm-Gg: AYBFou0929GQe6lnjBM1aih9yM82Zau1Gj2LYi1C4uMQsxUEA99wYu0XdPQcsrrRbd0
	RU/RQ3sR962QgLa8JHh2Y1AgXInw/86wkW+VczxLbu8hb/FhDxIFqvsxsTUcxQ137+n5Rm/ZmIF
	fCJNEP8sLmA2GZVHYmwkCgq7znynJfWY+FzGwHzGdu1twA6WUC1DknrfqTLXP2t8i1pkSF1mlle
	LVrUdTFfXBNCUmXOmQtI20IX1Dm42gHq8BAwaGmLmWojM3dHMlx2aAmpe0jB0fN3lxSrAXnx61s
	oMedFYU9K6E1YgTLdaHUA2zCB1L/DgWsw2qehFIpkr6khHT61MTnGWLcqSSXqa3uwqGi3HJBzn1
	I/19JOXYiv7V91uXf9E9lncNheQdB1Qqt/T+mK1E4bAUjwYV03+PsRAtwYtLqY8WYd/vsz4PTJ5
	HDJfFS2e0ENZkYuu2ZaNWI/G6neIqUGqX95Y9CZ62YPfuJBVieL4DvSwXSPcCIY6r7XO6TCd/7W
	2BoSKjjLpfYCBn6CmoKozpoxydXbd2rX7ImPblOoE8v346uT5JpIAN7vZztxIJJm1MS62AUpOSd
	NEa59QPlA8L42cWPdunHHyMsBPJKHg3TUmKthzxKZKODojAjASG5w3vLgaON1Xg=
X-Received: by 2002:a05:6000:26ca:b0:491:895b:4c02 with SMTP id ffacd0b85a97d-495844a33a2mr4117355f8f.23.1794153500777;
        Sun, 08 Nov 2026 07:58:20 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:20 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] clk: sunxi-ng: add Allwinner B288 CCU driver
Date: Sun,  8 Nov 2026 15:57:01 +0000
Message-ID: <20261108155702.361022-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_075822_823891_00BE0AC4 
X-CRM114-Status: GOOD (  22.05  )
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

Covers the PLLs, the CPU/AHB/APB tree, the module clocks and the bus
gates and resets, described as a table.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/clk/sunxi-ng/Kconfig          |   5 +
 drivers/clk/sunxi-ng/Makefile         |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c | 212 ++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h |  11 ++
 4 files changed, 229 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 6af2d020e03e..5bdfb8574794 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -88,6 +88,11 @@ config SUN6I_RTC_CCU
 	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
+config SUN8I_B288_CCU
+	tristate "Support for the Allwinner B288 CCU"
+	default ARCH_SUNXI
+	depends on MACH_SUN8I || COMPILE_TEST
+
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
 	default ARCH_SUNXI
diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index 796f443f4d76..debae396555f 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_SUN4I_A10_CCU)	+= sun4i-a10-ccu.o
 obj-$(CONFIG_SUN5I_CCU)		+= sun5i-ccu.o
 obj-$(CONFIG_SUN6I_A31_CCU)	+= sun6i-a31-ccu.o
 obj-$(CONFIG_SUN6I_RTC_CCU)	+= sun6i-rtc-ccu.o
+obj-$(CONFIG_SUN8I_B288_CCU)	+= ccu-sun8i-b288.o
 obj-$(CONFIG_SUN8I_A23_CCU)	+= sun8i-a23-ccu.o
 obj-$(CONFIG_SUN8I_A33_CCU)	+= sun8i-a33-ccu.o
 obj-$(CONFIG_SUN8I_A83T_CCU)	+= sun8i-a83t-ccu.o
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
new file mode 100644
index 000000000000..6e12ed8248f2
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Clock Control Unit driver for the Allwinner B288 (sun8iw10p1).
+ *
+ * Closely related to the A64; most of its PLLs are bit-identical.
+ * Transcribed from the BSP clk-sun8iw10.{c,h} and cross-checked against
+ * ccu-sun50i-a64.c; divergences are called out inline.
+ *
+ * The audio clock tree (i2s/spdif/dsd/dmic/adda) is not implemented.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "ccu_table.h"
+
+#include "ccu-sun8i-b288.h"
+
+/*
+ * APB2 mux index 2 selects PLL_24M here rather than PLL_PERIPH0_2X as on
+ * the H3.
+ */
+CCU_TBL_PARENTS(cpux_parents, CCU_TBL_LOSC, CCU_TBL_HOSC, CLK_PLL_CPUX,
+		CLK_PLL_CPUX);
+CCU_TBL_PARENTS(ahb1_parents, CCU_TBL_LOSC, CCU_TBL_HOSC, CLK_AXI,
+		CLK_PLL_PERIPH0);
+CCU_TBL_PARENTS(apb2_parents, CCU_TBL_LOSC, CCU_TBL_HOSC, CLK_PLL_24M,
+		CLK_PLL_PERIPH0_2X);
+CCU_TBL_PARENTS(mod0_parents, CCU_TBL_HOSC, CLK_PLL_PERIPH0_2X,
+		CLK_PLL_PERIPH1_2X);
+CCU_TBL_PARENTS(de_parents, CLK_PLL_PERIPH0_2X, CLK_PLL_DE);
+CCU_TBL_PARENTS(tcon0_parents, CLK_PLL_VIDEO0, CLK_PLL_VIDEO1);
+CCU_TBL_PARENTS(mbus_parents, CCU_TBL_HOSC, CLK_PLL_PERIPH0_2X, CLK_PLL_DDR0,
+		CLK_PLL_DDR1);
+CCU_TBL_PARENTS(dram_parents, CLK_PLL_DDR0, CLK_PLL_DDR1, CLK_PLL_PERIPH0_2X);
+
+#define CRIT		CLK_IS_CRITICAL
+#define UNGATE		CLK_SET_RATE_UNGATE
+#define RATE_PARENT	CLK_SET_RATE_PARENT
+
+static const struct ccu_tbl_clk sun8i_b288_clks[CLK_NUMBER] = {
+	/*
+	 * PLL_24M @ 0x034 -- B288 only. It feeds the PLLs 24 MHz whatever
+	 * the crystal: it converts a 26 MHz one and is bypassed with a
+	 * 24 MHz one.
+	 */
+	CCU_TBL_FIXED_RATE(CLK_PLL_24M, "pll-24m", CCU_TBL_HOSC, 24000000),
+
+	CCU_TBL_STD1(CLK_PLL_CPUX, "pll-cpux", PLL_CPU, CLK_PLL_24M, UNGATE),
+	CCU_TBL_STD1(CLK_PLL_AUDIO_BASE, "pll-audio-base", PLL_AUDIO,
+		     CLK_PLL_24M, UNGATE),
+	CCU_TBL_STD_AT(CLK_PLL_VIDEO0, "pll-video0", PLL_VIDEO, 0x010,
+		       CLK_PLL_24M, UNGATE),
+	CCU_TBL_STD_AT(CLK_PLL_VIDEO1, "pll-video1", PLL_VIDEO, 0x030,
+		       CLK_PLL_24M, UNGATE),
+	CCU_TBL_STD_AT(CLK_PLL_DE, "pll-de", PLL_VIDEO, 0x048,
+		       CLK_PLL_24M, UNGATE),
+	/* PLL_DDR0 @ 0x020 -- unlike the A64 there is no K, and N is 7 bits */
+	CCU_TBL_PLL_NM(CLK_PLL_DDR0, "pll-ddr0", CLK_PLL_24M, 0x020,
+		       8, 7, 0, 2, UNGATE),
+	/* PLL_DDR1 @ 0x04c -- B288 only, same layout; this one feeds DRAM */
+	CCU_TBL_PLL_NM(CLK_PLL_DDR1, "pll-ddr1", CLK_PLL_24M, 0x04c,
+		       8, 7, 0, 2, UNGATE),
+	/* PLL_PERIPH{0,1} -- as on the A64, post-div 2: 2x is the raw output */
+	CCU_TBL_PLL_NK(CLK_PLL_PERIPH0, "pll-periph0", CLK_PLL_24M, 0x028,
+		       8, 5, 4, 2, 2, 2, 0),
+	CCU_TBL_PLL_NK(CLK_PLL_PERIPH1, "pll-periph1", CLK_PLL_24M, 0x044,
+		       8, 5, 4, 2, 2, 2, 0),
+	CCU_TBL_FIXED_FACTOR(CLK_PLL_PERIPH0_2X, "pll-periph0-2x",
+			     CLK_PLL_PERIPH0, 2, 1),
+	CCU_TBL_FIXED_FACTOR(CLK_PLL_PERIPH1_2X, "pll-periph1-2x",
+			     CLK_PLL_PERIPH1, 2, 1),
+
+	CCU_TBL_STD(CLK_CPUX, "cpux", CPUX, cpux_parents, CRIT | RATE_PARENT),
+	CCU_TBL_STD1(CLK_AXI, "axi", AXI, CLK_CPUX, 0),
+	/* CPU_CFG @ 0x050 -- CPUAPB divider [9:8] */
+	CCU_TBL_DIV(CLK_CPUAPB, "cpuapb", CLK_CPUX, 0x050, 8, 2, 0),
+	CCU_TBL_STD(CLK_AHB1, "ahb1", AHB1, ahb1_parents, 0),
+	CCU_TBL_STD1(CLK_APB1, "apb1", APB1, CLK_AHB1, 0),
+	CCU_TBL_STD(CLK_APB2, "apb2", APB2, apb2_parents, 0),
+
+	CCU_TBL_MOD(CLK_NAND, "nand", mod0_parents, 0x080, 0),
+	/* mmc0/mmc1 use the old timing mode and need the phase clocks */
+	CCU_TBL_MOD(CLK_MMC0, "mmc0", mod0_parents, 0x088, 0),
+	CCU_TBL_PHASE(CLK_MMC0_SAMPLE, "mmc0_sample", CLK_MMC0, 0x088, 20, 3),
+	CCU_TBL_PHASE(CLK_MMC0_OUTPUT, "mmc0_output", CLK_MMC0, 0x088, 8, 3),
+	CCU_TBL_MOD(CLK_MMC1, "mmc1", mod0_parents, 0x08c, 0),
+	CCU_TBL_PHASE(CLK_MMC1_SAMPLE, "mmc1_sample", CLK_MMC1, 0x08c, 20, 3),
+	CCU_TBL_PHASE(CLK_MMC1_OUTPUT, "mmc1_output", CLK_MMC1, 0x08c, 8, 3),
+	/* mmc2/mmc3 halve the clock internally */
+	CCU_TBL_MOD_POSTDIV(CLK_MMC2, "mmc2", mod0_parents, 0x090, 2, 0),
+	CCU_TBL_MOD_POSTDIV(CLK_MMC3, "mmc3", mod0_parents, 0x094, 2, 0),
+	CCU_TBL_MOD(CLK_SPI0, "spi0", mod0_parents, 0x0a0, 0),
+	CCU_TBL_MOD(CLK_SPI1, "spi1", mod0_parents, 0x0a4, 0),
+	CCU_TBL_MOD(CLK_SPI2, "spi2", mod0_parents, 0x0a8, 0),
+
+	/* DRAM_CFG @ 0x0f4 -- M[1:0] mux[21:20] gate 31 */
+	CCU_TBL_DIV_MUX_GATE(CLK_DRAM, "dram", dram_parents, 0x0f4,
+			     0, 2, 20, 2, BIT(31), CRIT),
+	/* DE_CFG @ 0x104, EE_CFG @ 0x108, EDMA_CFG @ 0x10c -- M[3:0] mux[26:24] */
+	CCU_TBL_DIV_MUX_GATE(CLK_DE, "de", de_parents, 0x104,
+			     0, 4, 24, 3, BIT(31), RATE_PARENT),
+	CCU_TBL_DIV_MUX_GATE(CLK_EE, "ee", de_parents, 0x108,
+			     0, 4, 24, 3, BIT(31), RATE_PARENT),
+	CCU_TBL_DIV_MUX_GATE(CLK_EDMA, "edma", de_parents, 0x10c,
+			     0, 4, 24, 3, BIT(31), RATE_PARENT),
+	/* TCON_CFG @ 0x118 -- mux[26:24] gate 31, no divider */
+	CCU_TBL_MUX_GATE(CLK_TCON0, "tcon0", tcon0_parents, 0x118, 24, 3,
+			 BIT(31), RATE_PARENT),
+	/* MBUS_CFG @ 0x15c -- M[2:0] mux[25:24] gate 31 */
+	CCU_TBL_DIV_MUX_GATE(CLK_MBUS, "mbus", mbus_parents, 0x15c,
+			     0, 3, 24, 2, BIT(31), CRIT),
+
+	/* Bus gates; each reset is the same bit of the paired reset register */
+	CCU_TBL_GATE(CLK_BUS_DMA, "bus-dma", CLK_AHB1, 0x060, 6, RST_BUS_DMA),
+	CCU_TBL_GATE(CLK_BUS_SDMMC0_BUS, "bus-sdmmc0-bus", CLK_AHB1, 0x060, 8,
+		     RST_BUS_MMC0),
+	CCU_TBL_GATE(CLK_BUS_SDMMC1_BUS, "bus-sdmmc1-bus", CLK_AHB1, 0x060, 9,
+		     RST_BUS_MMC1),
+	CCU_TBL_GATE(CLK_BUS_SDMMC2_BUS, "bus-sdmmc2-bus", CLK_AHB1, 0x060, 10,
+		     RST_BUS_MMC2),
+	CCU_TBL_GATE(CLK_BUS_SDMMC3_BUS, "bus-sdmmc3-bus", CLK_AHB1, 0x060, 11,
+		     RST_BUS_MMC3),
+	CCU_TBL_GATE(CLK_BUS_NAND, "bus-nand", CLK_AHB1, 0x060, 13,
+		     RST_BUS_NAND),
+	CCU_TBL_GATE(CLK_BUS_SDRAM, "bus-sdram", CLK_AHB1, 0x060, 14,
+		     RST_BUS_DRAM),
+	CCU_TBL_GATE(CLK_BUS_PSRAM, "bus-psram", CLK_AHB1, 0x060, 15,
+		     RST_BUS_PSRAM),
+	CCU_TBL_GATE(CLK_BUS_SPI0, "bus-spi0", CLK_AHB1, 0x060, 20, RST_BUS_SPI0),
+	CCU_TBL_GATE(CLK_BUS_SPI1, "bus-spi1", CLK_AHB1, 0x060, 21, RST_BUS_SPI1),
+	CCU_TBL_GATE(CLK_BUS_SPI2, "bus-spi2", CLK_AHB1, 0x060, 22, RST_BUS_SPI2),
+	CCU_TBL_GATE(CLK_BUS_USBOTG, "bus-usbotg", CLK_AHB1, 0x060, 24,
+		     RST_BUS_OTG),
+	CCU_TBL_GATE(CLK_BUS_USBEHCI0, "bus-usbehci0", CLK_AHB1, 0x060, 26,
+		     RST_BUS_EHCI0),
+	CCU_TBL_GATE(CLK_BUS_USBOHCI0, "bus-usbohci0", CLK_AHB1, 0x060, 29,
+		     RST_BUS_OHCI0),
+	CCU_TBL_GATE(CLK_BUS_TCON0, "bus-tcon0", CLK_AHB1, 0x064, 4,
+		     RST_BUS_TCON0),
+	/* csi_s, csi_m and csi_misc share one bus gate, as on the A64. */
+	CCU_TBL_GATE(CLK_BUS_CSI, "bus-csi", CLK_AHB1, 0x064, 8, RST_BUS_CSI),
+	CCU_TBL_GATE(CLK_BUS_DE, "bus-de", CLK_AHB1, 0x064, 12, RST_BUS_DE),
+	CCU_TBL_GATE(CLK_BUS_EE, "bus-ee", CLK_AHB1, 0x064, 13, RST_BUS_EE),
+	CCU_TBL_GATE(CLK_BUS_ADDA, "bus-adda", CLK_APB1, 0x068, 0, RST_BUS_ADDA),
+	CCU_TBL_GATE(CLK_BUS_SPDIF, "bus-spdif", CLK_APB1, 0x068, 1,
+		     RST_BUS_SPDIF),
+	CCU_TBL_GATE(CLK_BUS_DSD, "bus-dsd", CLK_APB1, 0x068, 2, RST_BUS_DSD),
+	CCU_TBL_GATE(CLK_BUS_DMIC, "bus-dmic", CLK_APB1, 0x068, 3, RST_BUS_DMIC),
+	CCU_TBL_GATE(CLK_BUS_PIO, "bus-pio", CLK_APB1, 0x068, 5, CCU_TBL_NO_RST),
+	CCU_TBL_GATE(CLK_BUS_THS, "bus-ths", CLK_APB1, 0x068, 8, RST_BUS_THS),
+	CCU_TBL_GATE(CLK_BUS_KEYADC, "bus-keyadc", CLK_APB1, 0x068, 9,
+		     RST_BUS_KEYADC),
+	CCU_TBL_GATE(CLK_BUS_GPADC, "bus-gpadc", CLK_APB1, 0x068, 10,
+		     RST_BUS_GPADC),
+	CCU_TBL_GATE(CLK_BUS_I2S0, "bus-i2s0", CLK_APB1, 0x068, 12, RST_BUS_I2S0),
+	CCU_TBL_GATE(CLK_BUS_I2S1, "bus-i2s1", CLK_APB1, 0x068, 13, RST_BUS_I2S1),
+	CCU_TBL_GATE(CLK_BUS_TWI0, "bus-twi0", CLK_APB2, 0x06c, 0, RST_BUS_I2C0),
+	CCU_TBL_GATE(CLK_BUS_TWI1, "bus-twi1", CLK_APB2, 0x06c, 1, RST_BUS_I2C1),
+	CCU_TBL_GATE(CLK_BUS_TWI2, "bus-twi2", CLK_APB2, 0x06c, 2, RST_BUS_I2C2),
+	CCU_TBL_GATE(CLK_BUS_UART0, "bus-uart0", CLK_APB2, 0x06c, 16,
+		     RST_BUS_UART0),
+	CCU_TBL_GATE(CLK_BUS_UART1, "bus-uart1", CLK_APB2, 0x06c, 17,
+		     RST_BUS_UART1),
+	CCU_TBL_GATE(CLK_BUS_UART2, "bus-uart2", CLK_APB2, 0x06c, 18,
+		     RST_BUS_UART2),
+	CCU_TBL_GATE(CLK_BUS_UART3, "bus-uart3", CLK_APB2, 0x06c, 19,
+		     RST_BUS_UART3),
+	CCU_TBL_GATE(CLK_BUS_UART4, "bus-uart4", CLK_APB2, 0x06c, 20,
+		     RST_BUS_UART4),
+	CCU_TBL_GATE(CLK_BUS_UART5, "bus-uart5", CLK_APB2, 0x06c, 21,
+		     RST_BUS_UART5),
+	/* losc_out is the RTC's osc32k-out */
+};
+
+/* Resets without a bus gate */
+static const struct ccu_reset_map sun8i_b288_resets[RST_NUMBER] = {
+	[RST_USBPHY0]	= { 0x0cc, BIT(0) },
+	[RST_MBUS]	= { 0x0fc, BIT(31) },
+	[RST_BUS_WLAN]	= { 0x2c4, BIT(1) },
+};
+
+static const struct sunxi_ccu_table sun8i_b288_ccu_table = {
+	.gen		= &ccu_tbl_gen_a31,
+	.clks		= sun8i_b288_clks,
+	.num_clks	= CLK_NUMBER,
+	.resets		= sun8i_b288_resets,
+	.num_resets	= RST_NUMBER,
+};
+
+static const struct of_device_id sun8i_b288_ccu_ids[] = {
+	{
+		.compatible	= "allwinner,sun8i-b288-ccu",
+		.data		= &sun8i_b288_ccu_table,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun8i_b288_ccu_ids);
+
+static struct platform_driver sun8i_b288_ccu_driver = {
+	.probe	= sunxi_ccu_table_platform_probe,
+	.driver	= {
+		.name			= "sun8i-b288-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun8i_b288_ccu_ids,
+	},
+};
+module_platform_driver(sun8i_b288_ccu_driver);
+
+MODULE_IMPORT_NS("SUNXI_CCU");
+MODULE_DESCRIPTION("Allwinner B288 (sun8iw10p1) CCU driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.h b/drivers/clk/sunxi-ng/ccu-sun8i-b288.h
new file mode 100644
index 000000000000..976e205f4d95
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _CCU_SUN8I_B288_H_
+#define _CCU_SUN8I_B288_H_
+
+#include <dt-bindings/clock/sun8i-b288-ccu.h>
+#include <dt-bindings/reset/sun8i-b288-ccu.h>
+
+#define CLK_NUMBER		(CLK_MMC1_OUTPUT + 1)
+#define RST_NUMBER		(RST_BUS_KEYADC + 1)
+
+#endif /* _CCU_SUN8I_B288_H_ */
-- 
2.52.0


