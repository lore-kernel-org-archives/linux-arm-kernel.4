Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2612606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sskBIFDE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P+/J468P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OTiSNZqbQN4M40RFxRDF8x0rjE/JgMxDJSkZxeJQ8uo=; b=sskBIFDEoutoIj
	KSGh+WXJa2B37gfVFNcbNWeg+mRC0T3VROgKl0nhrmluYLbo4DhRrpWvJYhipNwAOZLIeg0SZUs/w
	SFNzs6xQtU+vl0q+X2EvnIVegYdVqK/hiAaFqi2GWiWuZYEVQ4IWWTWjXixhHw7S2YT4No4W8uDWl
	WBe/kx6UjjEDuycrVkNFyfUGuc8ZNwuAqwJ5lbV72Te3DDy0zfz0Zl0QGxZ1mxZRCAfa/Sy++nMFG
	CyS/lBbeop+rLndx3l+HUcOO64CInrqV7aeWMRXWoESNjdRImFmPffXFDZSCGsCteIbUPo/XoTyYu
	mZAakndC6I4Am08zLFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzEu-0000000819I-0JwF;
	Tue, 24 Nov 2026 22:43:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzEc-0000000811y-178n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:43:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-492f0a1b685so3497779f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560212; x=1796165012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTiSNZqbQN4M40RFxRDF8x0rjE/JgMxDJSkZxeJQ8uo=;
        b=P+/J468PtzmQy+5l3TpD3hiH12skOxQ6kDyjZavHZD7tC+s3pqyTI+r3MK7AXPQJTs
         Vp34Z9gRAhSCNN/EkUcQ+RLHYY8CF3U/dO6AWJhHF+dHq0w65q4O4k9sZGBawed2Mol2
         vm7EFOESGk6Yb5w7TIg3MFvIM7hnzJE4YfP+cXy7YiKlGDrNEX5oUlQFH6oFyqH/WE/k
         1tVIBLV31htN6eWNhBpLgjPmnR8VnCct5pcJDKDiW1EY+MGKjfPB741TekTrsxrmfroz
         Q9P6MLke1lSYPPM4AI2W+XHq4wYccZpSiiO/PxsLzskZT9wtAIqtoUlcVwvVzBMJcPpK
         /JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560212; x=1796165012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTiSNZqbQN4M40RFxRDF8x0rjE/JgMxDJSkZxeJQ8uo=;
        b=CQKIlGp6lGJLnIFCSMM9ope+NYJ4caDDUnzcZtQAlP9jeWN4T8OpEC57JpprsBIzZ/
         xKG6fQJWiQR+qw3YgGVoN1aorIXHfOAZKcj/6rT3Pv/eTD7jZv1stU8VkgRjPwy6ZMIZ
         dDD7cMl37O/uXuk9VIwW9EePj07oM+1wJr91zeOJKvqH7Bj5TjAI84crztqj0X1Siip2
         /QbIO2g009TNpZLRRAM155JPi3PW4EQmFA9CkGgQoaODUGj5nAdGLPlrtdUT8O4ImNgC
         /vBENl7EznHeUHzDJ41vjwdbmRgDDZrpvzs+YE7YVQeVU42jInsaQ7FBB77IFAkcPWWb
         9koA==
X-Forwarded-Encrypted: i=1; AL+hErFluafYTuq5CFVnz/r0C2f3bDgKoykcilFiXe8Pum7GyvM9v4nZ7N9D61ZMHUo5+W7b1ZogQQ8xbaE5mU2nIQtn@lists.infradead.org
X-Gm-Message-State: APuU4Z97U8/GvIbuVX2zA/QA7Q/qEdOuY6J8S9Hs6RO91uPot/vVZWY6
	QqHY8DSBwofNdkI5eDiEhwVYNYDHJ/oLT1yqsWUp/KOk22ovd5nBCPnq
X-Gm-Gg: AZFdTZee0ylboKwvCSwdhb5gYpB35GN3d2k1MpFelkoGg4SvrvbHDJw2r55KOWbIAfU
	e1Do4uO/9Ixf/44D0iu56Lp437Wp4fUdJOKGbb7tzz7lWqPpEuOZKCfZNNqn/8Wz7WJvxajBeHU
	wbrNIgo2G3iYSZbUyppraWOxeIRzNKc/7fOKz7rXEePf6iSfPn15kZRcqxD9NFWxF0u/XGvtz38
	fxsQBIIhWEfZB00tm/k1FlhcBPBtefEaf8KvYKid/iHyuEFb+BHJZEJzQT4Plpu6EpMX4RkVOPi
	oaV/G71LZYNEieoQ3jHLDXId5Gnhe7Qou59Ldbhuljb1kJatAbyJ4VIYoP1cWglGM4V9bb1xDIq
	WNNHdQaks5GbpWcyACeq0zjvVR6mGOVjvlrrqzfLewobYN3RflHbTX+JpURdat0fP6xBdBNmpzx
	TiZKFkXkHPzOBYHecM4bzpNKnnxK9N75V0Dbj+qTzebC0oEtfuPCuosaCtnzUnpKmpOuu5h9KzB
	LfQUC0bJpW6qLL6Jy40tRUdvKZ6eZ9XLAEudIygceAnIqw/7uV5glcrOglKy6aEDQYnk63jP+Fb
	dZYeJu0bwIIjUPTaggKb8lcG9c4xYPTty3lfrD+8itdx7tlDCJ73rNvhUyRt834djxdM15GSXk1
	btNw=
X-Received: by 2002:a5d:5f91:0:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-4abb2910559mr30997152f8f.25.1795560212059;
        Tue, 24 Nov 2026 14:43:32 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm30900915f8f.58.2026.11.24.14.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:30 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v6 2/2] phy: airoha: add support for AN7583 Gen3 PCIe PHY driver
Date: Tue, 24 Nov 2026 23:43:16 +0100
Message-ID: <20261124224318.227478-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124224318.227478-1-ansuelsmth@gmail.com>
References: <20261124224318.227478-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_144334_604307_BBBB40EB 
X-CRM114-Status: GOOD (  19.24  )
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for AN7583 PCIe PHY driver. This is required to make the
Gen3 PCIe port present on the Airoha AN7583 SoC correctly work.

A different setup is needed compared to Airoha EN7581 where the
calibration process and the register map greatly changed.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                               |   8 +
 drivers/phy/airoha/Kconfig                |  11 +
 drivers/phy/airoha/Makefile               |   1 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h | 377 ++++++++++
 drivers/phy/airoha/phy-an7583-pcie.c      | 831 ++++++++++++++++++++++
 5 files changed, 1228 insertions(+)
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c689bdf1da89..50a6dee88d1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -771,6 +771,14 @@ S:	Supported
 F:	fs/aio.c
 F:	include/linux/*aio*.h
 
+AIROHA AN7583 PCIE PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
+F:	drivers/phy/airoha/phy-an7583-pcie-regs.h
+F:	drivers/phy/airoha/phy-an7583-pcie.c
+
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
index 634448ee39b5..10394aaf3071 100644
--- a/drivers/phy/airoha/Kconfig
+++ b/drivers/phy/airoha/Kconfig
@@ -12,6 +12,17 @@ config PHY_AIROHA_AN7581_PCIE
 	  This driver create the basic PHY instance and provides initialize
 	  callback for PCIe GEN3 port.
 
+config PHY_AIROHA_AN7583_PCIE
+	tristate "Airoha AN7583 PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Say Y here to add support for Airoha AN7583 PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
+
 config PHY_AIROHA_AN7581_USB
 	tristate "Airoha AN7581 USB PHY Driver"
 	depends on ARCH_AIROHA || COMPILE_TEST
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
index 944bf842deba..bf6f9b244767 100644
--- a/drivers/phy/airoha/Makefile
+++ b/drivers/phy/airoha/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+= phy-an7581-pcie.o
+obj-$(CONFIG_PHY_AIROHA_AN7583_PCIE)	+= phy-an7583-pcie.o
 obj-$(CONFIG_PHY_AIROHA_AN7581_USB)	+= phy-an7581-usb.o
diff --git a/drivers/phy/airoha/phy-an7583-pcie-regs.h b/drivers/phy/airoha/phy-an7583-pcie-regs.h
new file mode 100644
index 000000000000..ce9180a7c2ca
--- /dev/null
+++ b/drivers/phy/airoha/phy-an7583-pcie-regs.h
@@ -0,0 +1,377 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef _PHY_AN7583_PCIE_H
+#define _PHY_AN7583_PCIE_H
+
+/* G3 ANA */
+#define REG_PXP_CMN_EN				0x0
+#define   G3_ANA_PXP_CMN_TRIM			GENMASK(28, 24)
+#define   G3_ANA_PXP_CMN_EN			BIT(0)
+
+#define REG_PXP_JCPLL_IB_EXT_EN			0x4
+#define   G3_ANA_PXP_JCPLL_CHP_IOFST		GENMASK(29, 24)
+#define   G3_ANA_PXP_JCPLL_CHP_IBIAS		GENMASK(21, 16)
+#define   G3_ANA_PXP_JCPLL_LPF_SHCK_EN		BIT(8)
+
+#define REG_PXP_JCPLL_LPF_BR			0x8
+#define   G3_ANA_PXP_JCPLL_LPF_BWR		GENMASK(28, 24)
+#define   G3_ANA_PXP_JCPLL_LPF_BP		GENMASK(20, 16)
+#define   G3_ANA_PXP_JCPLL_LPF_BC		GENMASK(12, 8)
+#define   G3_ANA_PXP_JCPLL_LPF_BR		GENMASK(4, 0)
+
+#define REG_PXP_JCPLL_LPF_BWC			0xc
+#define   G3_ANA_PXP_JCPLL_KBAND_DIV		GENMASK(26, 24)
+#define   G3_ANA_PXP_JCPLL_KBAND_CODE		GENMASK(23, 16)
+#define   G3_ANA_PXP_JCPLL_LPF_BWC		GENMASK(4, 0)
+
+#define REG_PXP_JCPLL_KBAND_KFC			0x10
+#define   G3_ANA_PXP_JCPLL_POSTDIV_EN		BIT(24)
+#define   G3_ANA_PXP_JCPLL_KBAND_KS		GENMASK(17, 16)
+#define   G3_ANA_PXP_JCPLL_KBAND_KF		GENMASK(9, 8)
+#define   G3_ANA_PXP_JCPLL_KBAND_KFC		GENMASK(1, 0)
+
+#define REG_PXP_JCPLL_MMD_PREDIV_MODE		0x14
+#define   G3_ANA_PXP_JCPLL_POSTDIV_D5		BIT(24)
+#define   G3_ANA_PXP_JCPLL_POSTDIV_D2		BIT(16)
+#define   G3_ANA_PXP_JCPLL_MMD_PREDIV_MODE	GENMASK(1, 0)
+
+#define REG_PXP_JCPLL_MONCK_EN			0x18
+#define   G3_ANA_PXP_JCPLL_REFIN_DIV		GENMASK(25, 24)
+
+#define REG_PXP_JCPLL_RST_DLY			0x1c
+#define   G3_ANA_PXP_JCPLL_SDM_DI_LS		GENMASK(25, 24)
+#define   G3_ANA_PXP_JCPLL_SDM_DI_EN		BIT(16)
+#define   G3_ANA_PXP_JCPLL_PLL_RSTB		BIT(8)
+#define   G3_ANA_PXP_JCPLL_RST_DLY		GENMASK(2, 0)
+
+#define REG_PXP_JCPLL_SDM_IFM			0x20
+#define   G3_ANA_PXP_JCPLL_SDM_IFM		BIT(0)
+
+#define REG_PXP_JCPLL_SDM_HREN			0x24
+#define   G3_ANA_PXP_JCPLL_TCL_AMP_VREF		GENMASK(28, 24)
+#define   G3_ANA_PXP_JCPLL_TCL_AMP_GAIN		GENMASK(18, 16)
+#define   G3_ANA_PXP_JCPLL_TCL_AMP_EN		BIT(8)
+#define   G3_ANA_PXP_JCPLL_SDM_HREN		BIT(0)
+
+#define REG_PXP_JCPLL_TCL_CMP_EN		0x28
+#define   G3_ANA_PXP_JCPLL_TCL_LPF_BW		GENMASK(26, 24)
+#define   G3_ANA_PXP_JCPLL_TCL_LPF_EN		BIT(16)
+
+#define REG_PXP_JCPLL_VCODIV			0x2c
+#define   G3_ANA_PXP_JCPLL_VCO_SCAPWR		GENMASK(26, 24)
+#define   G3_ANA_PXP_JCPLL_VCO_HALFLSB_EN	BIT(16)
+#define   G3_ANA_PXP_JCPLL_VCO_CFIX		GENMASK(9, 8)
+
+#define REG_PXP_JCPLL_VCO_TCLVAR		0x30
+#define   G3_ANA_PXP_JCPLL_SSC_PHASE_INI	BIT(17)
+#define   G3_ANA_PXP_JCPLL_SSC_EN		BIT(16)
+#define   G3_ANA_PXP_JCPLL_VCO_TCLVAR		GENMASK(2, 0)
+
+#define REG_PXP_JCPLL_SSC_TRI_EN		0x34
+#define   G3_ANA_PXP_JCPLL_SSC_DELTA1		GENMASK(23, 8)
+#define   G3_ANA_PXP_JCPLL_SSC_TRI_EN		BIT(0)
+
+#define REG_PXP_JCPLL_SSC_DELTA			0x38
+#define   G3_ANA_PXP_JCPLL_SSC_PERIOD		GENMASK(31, 16)
+#define   G3_ANA_PXP_JCPLL_SSC_DELTA		GENMASK(15, 0)
+
+#define REG_PXP_JCPLL_SPARE_H			0x48
+#define   G3_ANA_PXP_JCPLL_TCL_KBAND_VREF	GENMASK(20, 16)
+#define   G3_ANA_PXP_JCPLL_SPARE_L		GENMASK(15, 8)
+
+#define REG_PXP_JCPLL_FREQ_MEAS_EN		0x4c
+#define   G3_ANA_PXP_TXPLL_LPF_SHCK_EN		BIT(25)
+#define   G3_ANA_PXP_JCPLL_VCO_KBAND_MEAS_EN	BIT(8)
+
+#define REG_PXP_TXPLL_CHP_IBIAS			0x50
+#define   G3_ANA_PXP_TXPLL_LPF_BC		GENMASK(28, 24)
+#define   G3_ANA_PXP_TXPLL_LPF_BR		GENMASK(20, 16)
+#define   G3_ANA_PXP_TXPLL_CHP_IOFST		GENMASK(13, 8)
+#define   G3_ANA_PXP_TXPLL_CHP_IBIAS		GENMASK(5, 0)
+
+#define REG_PXP_TXPLL_LPF_BP			0x54
+#define   G3_ANA_PXP_TXPLL_LPF_BWC		GENMASK(20, 16)
+#define   G3_ANA_PXP_TXPLL_LPF_BWR		GENMASK(12, 8)
+#define   G3_ANA_PXP_TXPLL_LPF_BP		GENMASK(4, 0)
+
+#define REG_PXP_TXPLL_KBAND_CODE		0x58
+#define   G3_ANA_PXP_TXPLL_KBAND_KF		GENMASK(25, 24)
+#define   G3_ANA_PXP_TXPLL_KBAND_KFC		GENMASK(17, 16)
+#define   G3_ANA_PXP_TXPLL_KBAND_DIV		GENMASK(10, 8)
+#define   G3_ANA_PXP_TXPLL_KBAND_CODE		GENMASK(7, 0)
+
+#define REG_PXP_TXPLL_KBAND_KS			0x5c
+#define   G3_ANA_PXP_TXPLL_MMD_PREDIV_MODE	GENMASK(17, 16)
+#define   G3_ANA_PXP_TXPLL_POSTDIV_EN		BIT(8)
+#define   G3_ANA_PXP_TXPLL_KBAND_KS		GENMASK(1, 0)
+
+#define REG_PXP_TXPLL_PHY_CK1_EN		0x60
+#define   G3_ANA_PXP_TXPLL_PHY_CK1_EN		BIT(0)
+
+#define REG_PXP_TXPLL_REFIN_INTERNAL		0x64
+#define   G3_ANA_PXP_TXPLL_PLL_RSTB		BIT(24)
+#define   G3_ANA_PXP_TXPLL_RST_DLY		GENMASK(18, 16)
+#define   G3_ANA_PXP_TXPLL_REFIN_DIV		GENMASK(9, 8)
+#define   G3_ANA_PXP_TXPLL_REFIN_INTERNAL	BIT(0)
+
+#define REG_PXP_TXPLL_SDM_DI_EN			0x68
+#define   G3_ANA_PXP_TXPLL_SDM_IFM		BIT(16)
+#define   G3_ANA_PXP_TXPLL_SDM_DI_LS		GENMASK(9, 8)
+
+#define REG_PXP_TXPLL_SDM_ORD			0x6c
+#define   G3_ANA_PXP_TXPLL_TCL_AMP_EN		BIT(24)
+#define   G3_ANA_PXP_TXPLL_SDM_ORD		GENMASK(1, 0)
+
+#define REG_PXP_TXPLL_TCL_AMP_GAIN		0x70
+#define   G3_ANA_PXP_TXPLL_TCL_AMP_VREF		GENMASK(12, 8)
+#define   G3_ANA_PXP_TXPLL_TCL_AMP_GAIN		GENMASK(2, 0)
+
+#define REG_PXP_TXPLL_TCL_LPF_EN		0x74
+#define   G3_ANA_PXP_TXPLL_VCO_CFIX		GENMASK(25, 24)
+#define   G3_ANA_PXP_TXPLL_TCL_LPF_BW		GENMASK(10, 8)
+#define   G3_ANA_PXP_TXPLL_TCL_LPF_EN		BIT(0)
+
+#define REG_PXP_TXPLL_VCO_HALFLSB_EN		0x78
+#define   G3_ANA_PXP_TXPLL_VCO_SCAPWR		GENMASK(10, 8)
+#define   G3_ANA_PXP_TXPLL_VCO_HALFLSB_EN	BIT(0)
+
+#define REG_PXP_TXPLL_SSC_EN			0x7c
+#define   G3_ANA_PXP_TXPLL_SSC_PHASE_INI	BIT(8)
+#define   G3_ANA_PXP_TXPLL_SSC_EN		BIT(0)
+
+#define REG_PXP_TXPLL_SSC_DELTA1		0x80
+#define   G3_ANA_PXP_TXPLL_SSC_DELTA		GENMASK(31, 16)
+#define   G3_ANA_PXP_TXPLL_SSC_DELTA1		GENMASK(15, 0)
+
+#define REG_PXP_TXPLL_SSC_PERIOD		0x84
+#define   G3_ANA_PXP_TXPLL_SSC_PERIOD		GENMASK(15, 0)
+
+#define REG_PXP_TXPLL_VTP_EN			0x88
+#define   G3_ANA_PXP_TXPLL_VTP_EN		BIT(0)
+
+#define REG_PXP_TXPLL_TCL_VTP_EN		0x90
+#define   G3_ANA_PXP_TXPLL_SPARE_L		GENMASK(31, 24)
+
+#define REG_PXP_TXPLL_TCL_KBAND_VREF		0x94
+#define   G3_ANA_PXP_TXPLL_VCO_KBAND_MEAS_EN	BIT(24)
+#define   G3_ANA_PXP_TXPLL_TCL_KBAND_VREF	GENMASK(4, 0)
+
+#define REG_PCIE_CLKTX0_AMP			0x98
+#define   G3_ANA_PXP_PCIE_CLKTX0_IMP_SEL	GENMASK(31, 27)
+#define   G3_ANA_PXP_PCIE_CLKTX0_HZ		BIT(26)
+#define   G3_ANA_PCIE_CLKTX0_SR			GENMASK(17, 16)
+#define   G3_ANA_PCIE_CLKTX0_OFFSET		GENMASK(9, 8)
+#define   G3_ANA_PCIE_CLKTX0_AMP		GENMASK(2, 0)
+
+#define REG_PXP_PLL_MONCLK_SEL			0xa0
+#define   G3_ANA_PXP_PLL_CMN_RESERVE0		GENMASK(15, 8)
+
+#define REG_PXP_TX_CKLDO_EN			0xc4
+#define   G3_ANA_PXP_TX_DMEDGEGEN_EN		BIT(24)
+#define   G3_ANA_PXP_TX_CKLDO_EN		BIT(0)
+
+#define REG_PXP_RX_REV_0			0xd4
+#define   G3_ANA_PXP_RX_REV_1_10_8		GENMASK(26, 24)
+#define   G3_ANA_PXP_RX_REV_1_6_4		GENMASK(22, 20)
+#define   G3_ANA_PXP_RX_REV_1_3_2		GENMASK(19, 18)
+
+#define REG_PXP_RX_PHYCK_DIV			0xd8
+#define   G3_ANA_PXP_RX_TDC_CK_SEL		BIT(24)
+#define   G3_ANA_PXP_RX_PHYCK_RSTB		BIT(16)
+#define   G3_ANA_PXP_RX_PHYCK_SEL		GENMASK(9, 8)
+
+#define REG_PXP_CDR_PD_PICAL_CKD8_INV		0xdc
+#define   G3_ANA_PXP_CDR_PD_EDGE_DIS		BIT(8)
+
+#define REG_PXP_CDR_LPF_RATIO			0xe8
+#define   G3_ANA_PXP_CDR_LPF_TOP_LIM		GENMASK(26, 8)
+
+#define REG_PXP_CDR_PR_BETA_DAC			0xf8
+#define   G3_ANA_PXP_CDR_PR_KBAND_DIV		GENMASK(26, 24)
+#define   G3_ANA_PXP_CDR_PR_BETA_SEL		GENMASK(19, 16)
+
+#define REG_PXP_CDR_PR_VREG_IBAND_VAL		0xfc
+#define   G3_ANA_PXP_CDR_PR_VREG_CKBUF_VAL_2_0	GENMASK(10, 8)
+#define   G3_ANA_PXP_CDR_PR_VREG_IBAND_VAL_2_0	GENMASK(2, 0)
+
+#define REG_PXP_CDR_PR_CKREF_DIV		0x100
+#define   G3_ANA_PXP_CDR_PR_CKREF_DIV_1_0	GENMASK(1, 0)
+
+#define REG_PXP_CDR_PR_TDC_REF_SEL		0x108
+#define   G3_ANA_PXP_CDR_PR_CKREF_DIV1_1_0	GENMASK(25, 24)
+#define   G3_ANA_PXP_CDR_PR_LDO_FORCE_ON	BIT(16)
+
+#define REG_PXP_CDR_PR_MONPR_EN			0x10c
+#define   G3_ANA_PXP_CDR_PR_XFICK_EN		BIT(2)
+
+#define REG_PXP_RX_DAC_RANGE			0x110
+#define   G3_ANA_PXP_RX_SIGDET_LPF_CTRL		GENMASK(25, 24)
+
+#define REG_PXP_CDR_PR_MONCK_EN			0x104
+#define   G3_ANA_PXP_CDR_PR_MONCK_EN		BIT(0)
+#define   G3_ANA_PXP_CDR_PR_RESERVE0		GENMASK(19, 16)
+
+#define REG_PXP_RX_SIGDET_NOVTH			0x114
+#define   G3_ANA_PXP_RX_FE_50OHMS_SEL		GENMASK(25, 24)
+#define   G3_ANA_PXP_RX_SIGDET_VTH_SEL_4_0	GENMASK(20, 16)
+#define   G3_ANA_PXP_RX_SIGDET_PEAK_1_0		GENMASK(9, 8)
+
+#define REG_PXP_RX_FE_EQ_HZEN			0x118
+#define   G3_ANA_PXP_RX_FE_VB_EQ3_EN		BIT(24)
+#define   G3_ANA_PXP_RX_FE_VB_EQ2_EN		BIT(16)
+#define   G3_ANA_PXP_RX_FE_VB_EQ1_EN		BIT(8)
+
+#define REG_PXP_RX_FE_VCM_GEN_PWDB		0x11c
+#define   G3_ANA_PXP_RX_FE_VCM_GEN_PWDB		BIT(0)
+
+#define REG_PXP_RX_OSCAL_CTLE2IOS		0x128
+#define   G3_ANA_PXP_RX_OSCAL_VGA1VOS		GENMASK(29, 24)
+#define   G3_ANA_PXP_RX_OSCAL_VGA1IOS		GENMASK(21, 16)
+
+#define REG_PXP_RX_OSCAL_VGA2IOS		0x12c
+#define   G3_ANA_PXP_RX_OSCAL_VGA2IOS		GENMASK(5, 0)
+
+/* G3 PMA */
+#define REG_RX_CTRL_SEQUENCE_DISB_CTRL_1	0x10c
+#define   G3_PMA_DISB_RX_SDCAL_EN		BIT(0)
+
+#define REG_RX_CTRL_SEQUENCE_FORCE_CTRL_1	0x114
+#define   G3_PMA_FORCE_RX_SDCAL_EN		BIT(0)
+
+#define REG_SS_RX_CAL_2				0x164
+#define   G3_PMA_CAL_OUT_OS			GENMASK(11, 8)
+
+#define REG_SS_RX_SIGDET_0			0x168
+#define   G3_PMA_SIGDET_WIN_NONVLD_TIMES	GENMASK(28, 24)
+
+#define REG_SS_TX_RST_B				0x260
+#define   G3_PMA_TXCALIB_RST_B			BIT(8)
+#define   G3_PMA_TX_TOP_RST_B			BIT(0)
+
+#define REG_RX_FORCE_MODE_0			0x294
+#define   G3_PMA_FORCE_DA_XPON_RX_FE_GAIN_CTRL	GENMASK(1, 0)
+
+#define REG_SS_DA_XPON_PWDB_0			0x34c
+#define   G3_PMA_DA_XPON_CDR_PR_PWDB		BIT(8)
+
+#define REG_SW_RST_SET				0x460
+#define   G3_PMA_SW_XFI_RXPCS_RST_N		BIT(8)
+#define   G3_PMA_SW_TX_FIFO_RST_N		BIT(6)
+#define   G3_PMA_SW_REF_RST_N			BIT(5)
+#define   G3_PMA_SW_ALLPCS_RST_N		BIT(4)
+#define   G3_PMA_SW_PMA_RST_N			BIT(3)
+#define   G3_PMA_SW_TX_RST_N			BIT(2)
+#define   G3_PMA_SW_RX_RST_N			BIT(1)
+#define   G3_PMA_SW_RX_FIFO_RST_N		BIT(0)
+
+#define REG_FORCE_DA_PXP_TX_TERM_SEL		0x77c
+#define   G3_PMA_FORCE_SEL_DA_PXP_TX_TERM_SEL	BIT(8)
+#define   G3_PMA_FORCE_DA_PXP_TX_TERM_SEL	GENMASK(2, 0)
+
+#define REG_FORCE_DA_PXP_CDR_PR_FLL_COR		0x790
+#define   G3_PMA_FORCE_SEL_DA_PXP_RX_DAC_EYE	BIT(24)
+#define   G3_PMA_FORCE_DA_PXP_RX_DAC_EYE	GENMASK(22, 16)
+
+#define REG_FORCE_DA_PXP_CDR_PR_IDAC		0x794
+#define   G3_PMA_FORCE_SEL_DA_PXP_TXPLL_SDM_PCW	BIT(24)
+
+#define REG_FORCE_DA_PXP_TXPLL_SDM_PCW		0x798
+#define   G3_PMA_FORCE_DA_PXP_TXPLL_SDM_PCW	GENMASK(30, 0)
+
+#define REG_FORCE_DA_PXP_RX_FE_VOS		0x79c
+#define   G3_PMA_FORCE_SEL_DA_PXP_JCPLL_SDM_PCW	BIT(16)
+
+#define REG_FORCE_DA_PXP_JCPLL_SDM_PCW		0x800
+#define   G3_PMA_FORCE_DA_PXP_JCPLL_SDM_PCW	GENMASK(30, 0)
+
+#define REG_FORCE_DA_PXP_CDR_PD_PWDB		0x81c
+#define   G3_PMA_FORCE_SEL_DA_PXP_CDR_PD_PWDB	BIT(8)
+#define   G3_PMA_FORCE_DA_PXP_CDR_PD_PWDB	BIT(0)
+
+#define REG_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB	0x824
+#define   G3_PMA_FORCE_SEL_DA_PXP_CDR_PR_PIEYE_PWDB BIT(8)
+#define   G3_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB	BIT(0)
+
+#define REG_FORCE_DA_PXP_JCPLL_CKOUT_EN		0x828
+#define   G3_PMA_FORCE_SEL_DA_PXP_JCPLL_EN	BIT(24)
+#define   G3_PMA_FORCE_DA_PXP_JCPLL_EN		BIT(16)
+#define   G3_PMA_FORCE_SEL_DA_PXP_JCPLL_CKOUT_EN BIT(8)
+#define   G3_PMA_FORCE_DA_PXP_JCPLL_CKOUT_EN	BIT(0)
+
+#define REG_FORCE_DA_PXP_RX_SCAN_RST_B		0x84c
+#define   G3_PMA_FORCE_SEL_DA_PXP_RX_SIGDET_PWDB BIT(24)
+#define   G3_PMA_FORCE_DA_PXP_RX_SIGDET_PWDB	BIT(16)
+
+#define REG_FORCE_DA_PXP_TXPLL_CKOUT_EN		0x854
+#define   G3_PMA_FORCE_SEL_DA_PXP_TXPLL_EN	BIT(24)
+#define   G3_PMA_FORCE_DA_PXP_TXPLL_EN		BIT(16)
+#define   G3_PMA_FORCE_SEL_DA_PXP_TXPLL_CKOUT_EN BIT(8)
+#define   G3_PMA_FORCE_DA_PXP_TXPLL_CKOUT_EN	BIT(0)
+
+#define REG_SCAN_MODE				0x884
+#define   G3_PMA_FORCE_SEL_DA_PXP_JCPLL_KBAND_LOAD_EN BIT(8)
+#define   G3_PMA_FORCE_DA_PXP_JCPLL_KBAND_LOAD_EN BIT(0)
+
+#define REG_FORCE_DA_PXP_RX_FE_GAIN_CTRL	0x88c
+#define   G3_PMA_FORCE_SEL_DA_PXP_RX_FE_GAIN_CTRL BIT(8)
+#define   G3_PMA_FORCE_DA_PXP_RX_FE_GAIN_CTRL	GENMASK(1, 0)
+
+#define REG_FORCE_DA_PXP_RX_FE_PWDB		0x894
+#define   G3_PMA_FORCE_SEL_DA_PXP_RX_FE_PWDB	BIT(8)
+#define   G3_PMA_FORCE_DA_PXP_RX_FE_PWDB	BIT(0)
+
+#define REG_ADD_DIG_RESERVE_12			0x8b8
+#define   G3_PMA_DIG_RESERVE_12_8_8		BIT(8)
+
+#define REG_ADD_DIG_RESERVE_27			0x908
+#define   G3_PMA_DIG_RESERVE_27_16_16		BIT(16)
+
+#define REG_ADD_DIG_RESERVE_30			0x914
+#define   G3_PMA_DIG_RESERVE_30			GENMASK(31, 0)
+
+#define REG_ADD_DIG_RESERVE_31			0x918
+#define   G3_PMA_DIG_RESERVE_31_20_16		GENMASK(20, 16)
+#define   G3_PMA_DIG_RESERVE_31_12_8		GENMASK(12, 8)
+#define   G3_PMA_DIG_RESERVE_31_4_0		GENMASK(4, 0)
+
+#define REG_ADD_DIG_RESERVE_32			0x91c
+#define   G3_PMA_DIG_RESERVE_32_31_16		GENMASK(31, 16)
+
+#define REG_ADD_DIG_RESERVE_33			0x920
+#define   G3_PMA_DIG_RESERVE_33_31_16		GENMASK(31, 16)
+#define   G3_PMA_DIG_RESERVE_33_15_0		GENMASK(15, 0)
+
+#define REG_ADD_DIG_RESERVE_34			0x924
+#define   G3_PMA_DIG_RESERVE_34			GENMASK(31, 0)
+
+#define REG_ADD_DIG_RESERVE_35			0x928
+#define   G3_PMA_DIG_RESERVE_35			GENMASK(31, 0)
+
+#define REG_ADD_DIG_RESERVE_40			0x93c
+#define   G3_PMA_DIG_RESERVE_40			GENMASK(31, 0)
+
+#define REG_ADD_DIG_RESERVE_43			0x948
+#define   G3_PMA_DIG_RESERVE_43_18_16		GENMASK(18, 16)
+#define   G3_PMA_DIG_RESERVE_43_14_12		GENMASK(14, 12)
+#define   G3_PMA_DIG_RESERVE_43_10_8		GENMASK(10, 8)
+
+/* DTIME */
+#define REG_PCIE_PEXTP_DIG_GLB44		0x0
+#define PCIE_XTP_RXDET_LATCH_STB_T_SEL		GENMASK(31, 29)
+#define PCIE_XTP_TXPD_RXDET_DONE_CDT		BIT(28)
+#define PCIE_XTP_TXPD_TX_DATA_EN_DLY		GENMASK(27, 24)
+#define PCIE_XTP_RXDET_FINISH_STB_T_SEL		GENMASK(23, 16)
+#define PCIE_XTP_RXDET_EN_STB_T_SEL		GENMASK(15, 8)
+#define PCIE_XTP_RXDET_VCM_OFF_STB_T_SEL	GENMASK(7, 0)
+
+/* RX AEQ */
+#define REG_PCIE_PEXTP_DIG_LN_RX30		0x0
+#define PCIE_XTP_LN_RX_PDOWN_E0_AEQEN_WAIT	GENMASK(31, 16)
+#define PCIE_XTP_LN_RX_PDOWN_T2RLB_DIG_EN	BIT(8)
+#define PCIE_XTP_LN_RX_PDOWN_L1P2_EXIT_WAIT	GENMASK(7, 0)
+
+#endif /* _PHY_AN7583_PCIE_H */
diff --git a/drivers/phy/airoha/phy-an7583-pcie.c b/drivers/phy/airoha/phy-an7583-pcie.c
new file mode 100644
index 000000000000..5ec8f302f4d3
--- /dev/null
+++ b/drivers/phy/airoha/phy-an7583-pcie.c
@@ -0,0 +1,831 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include "phy-an7583-pcie-regs.h"
+
+/* PCIe-PHY initialization time in ms needed by the hw to complete */
+#define PHY_HW_INIT_TIME_MS	30
+
+struct an7583_pcie_phy {
+	struct device *dev;
+	struct phy *phy;
+	struct phy *qp_phy;
+
+	struct regmap *g3_ana;
+	struct regmap *g3_pma;
+
+	struct regmap  *xr_dtime;
+	struct regmap  *rx_aeq;
+};
+
+static void an7583_pcie_phy_init_default(struct an7583_pcie_phy *pcie_phy)
+{
+	/* Load E-Fuse */
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CMN_EN,
+			   G3_ANA_PXP_CMN_TRIM,
+			   FIELD_PREP(G3_ANA_PXP_CMN_TRIM, 0x10));
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TX_TERM_SEL,
+			G3_PMA_FORCE_SEL_DA_PXP_TX_TERM_SEL);
+	regmap_update_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TX_TERM_SEL,
+			   G3_PMA_FORCE_DA_PXP_TX_TERM_SEL,
+			   FIELD_PREP(G3_PMA_FORCE_DA_PXP_TX_TERM_SEL, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_SIGDET_NOVTH,
+			   G3_ANA_PXP_RX_FE_50OHMS_SEL,
+			   FIELD_PREP(G3_ANA_PXP_RX_FE_50OHMS_SEL, 0x1));
+
+	/* Default Init */
+	regmap_set_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_12,
+			G3_PMA_DIG_RESERVE_12_8_8);
+	regmap_clear_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_27,
+			  G3_PMA_DIG_RESERVE_27_16_16);
+	regmap_write(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_34, 0xcccbcccb);
+	regmap_write(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_35, 0xcccb);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_CMN_EN,
+			G3_ANA_PXP_CMN_EN);
+}
+
+static void an7583_pcie_phy_init_clk_out(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_update_bits(pcie_phy->g3_ana, REG_PCIE_CLKTX0_AMP,
+			   G3_ANA_PCIE_CLKTX0_AMP,
+			   FIELD_PREP(G3_ANA_PCIE_CLKTX0_AMP, 0x5));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PCIE_CLKTX0_AMP,
+			   G3_ANA_PCIE_CLKTX0_OFFSET,
+			   FIELD_PREP(G3_ANA_PCIE_CLKTX0_OFFSET, 0x2));
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PCIE_CLKTX0_AMP,
+			  G3_ANA_PXP_PCIE_CLKTX0_HZ);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PCIE_CLKTX0_AMP,
+			   G3_ANA_PXP_PCIE_CLKTX0_IMP_SEL,
+			   FIELD_PREP(G3_ANA_PXP_PCIE_CLKTX0_IMP_SEL, 0x12));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PCIE_CLKTX0_AMP,
+			   G3_ANA_PCIE_CLKTX0_SR,
+			   FIELD_PREP(G3_ANA_PCIE_CLKTX0_SR, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_PLL_MONCLK_SEL,
+			   G3_ANA_PXP_PLL_CMN_RESERVE0,
+			   FIELD_PREP(G3_ANA_PXP_PLL_CMN_RESERVE0, 0xd));
+}
+
+static void an7583_pcie_phy_init_ana(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_set_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			G3_PMA_SW_XFI_RXPCS_RST_N);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			G3_PMA_SW_REF_RST_N);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			G3_PMA_SW_RX_RST_N);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SS_TX_RST_B,
+			G3_PMA_TXCALIB_RST_B);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SS_TX_RST_B,
+			G3_PMA_TX_TOP_RST_B);
+}
+
+static void an7583_pcie_phy_init_rx(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_write(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_30, 0x2a00090b);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_MONPR_EN,
+			G3_ANA_PXP_CDR_PR_XFICK_EN);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_CDR_PD_PICAL_CKD8_INV,
+			  G3_ANA_PXP_CDR_PD_EDGE_DIS);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_PHYCK_DIV,
+			   G3_ANA_PXP_RX_PHYCK_SEL,
+			   FIELD_PREP(G3_ANA_PXP_RX_PHYCK_SEL, 0x1));
+}
+
+static void an7583_pcie_phy_init_jcpll(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
+			G3_PMA_FORCE_SEL_DA_PXP_JCPLL_EN);
+	regmap_clear_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
+			  G3_PMA_FORCE_DA_PXP_JCPLL_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SPARE_H,
+			   G3_ANA_PXP_JCPLL_SPARE_L,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_SPARE_L, 0x20));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_RST_DLY,
+			G3_ANA_PXP_JCPLL_PLL_RSTB);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_DELTA,
+			   G3_ANA_PXP_JCPLL_SSC_DELTA,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_DELTA, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
+			   G3_ANA_PXP_JCPLL_SSC_DELTA1,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_DELTA1, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_DELTA,
+			   G3_ANA_PXP_JCPLL_SSC_PERIOD,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_PERIOD, 0x0));
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCO_TCLVAR,
+			  G3_ANA_PXP_JCPLL_SSC_PHASE_INI |
+			  G3_ANA_PXP_JCPLL_SSC_EN);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
+			  G3_ANA_PXP_JCPLL_SSC_TRI_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_LPF_BR,
+			   G3_ANA_PXP_JCPLL_LPF_BR,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_LPF_BR, 0xA));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_LPF_BR,
+			   G3_ANA_PXP_JCPLL_LPF_BP,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_LPF_BP, 0xC));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_LPF_BR,
+			   G3_ANA_PXP_JCPLL_LPF_BC,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_LPF_BC, 0x1F));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_LPF_BWC,
+			   G3_ANA_PXP_JCPLL_LPF_BWC,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_LPF_BWC, 0x1E));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_LPF_BR,
+			   G3_ANA_PXP_JCPLL_LPF_BWR,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_LPF_BWR, 0xA));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_MMD_PREDIV_MODE,
+			   G3_ANA_PXP_JCPLL_MMD_PREDIV_MODE,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_MMD_PREDIV_MODE, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_MONCK_EN,
+			   G3_ANA_PXP_JCPLL_REFIN_DIV,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_REFIN_DIV, 0x0));
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_RX_FE_VOS,
+			G3_PMA_FORCE_SEL_DA_PXP_JCPLL_SDM_PCW);
+	regmap_update_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_SDM_PCW,
+			   G3_PMA_FORCE_DA_PXP_JCPLL_SDM_PCW,
+			   FIELD_PREP(G3_PMA_FORCE_DA_PXP_JCPLL_SDM_PCW, 0x50000000));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_MMD_PREDIV_MODE,
+			G3_ANA_PXP_JCPLL_POSTDIV_D5);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_MMD_PREDIV_MODE,
+			G3_ANA_PXP_JCPLL_POSTDIV_D2);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_RST_DLY,
+			   G3_ANA_PXP_JCPLL_RST_DLY,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_RST_DLY, 0x4));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_RST_DLY,
+			   G3_ANA_PXP_JCPLL_SDM_DI_LS,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_SDM_DI_LS, 0x0));
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_FREQ_MEAS_EN,
+			  G3_ANA_PXP_JCPLL_VCO_KBAND_MEAS_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_IB_EXT_EN,
+			   G3_ANA_PXP_JCPLL_CHP_IOFST,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_CHP_IOFST, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_IB_EXT_EN,
+			   G3_ANA_PXP_JCPLL_CHP_IBIAS,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_CHP_IBIAS, 0xC));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_MMD_PREDIV_MODE,
+			   G3_ANA_PXP_JCPLL_MMD_PREDIV_MODE,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_MMD_PREDIV_MODE, 0x1));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCODIV,
+			G3_ANA_PXP_JCPLL_VCO_HALFLSB_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCODIV,
+			   G3_ANA_PXP_JCPLL_VCO_CFIX,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_VCO_CFIX, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCODIV,
+			   G3_ANA_PXP_JCPLL_VCO_SCAPWR,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_VCO_SCAPWR, 0x4));
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_IB_EXT_EN,
+			  G3_ANA_PXP_JCPLL_LPF_SHCK_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_KBAND_KFC,
+			G3_ANA_PXP_JCPLL_POSTDIV_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_KBAND_KFC,
+			   G3_ANA_PXP_JCPLL_KBAND_KFC,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_KBAND_KFC, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_KBAND_KFC,
+			   G3_ANA_PXP_JCPLL_KBAND_KF,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_KBAND_KF, 0x3));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_KBAND_KFC,
+			   G3_ANA_PXP_JCPLL_KBAND_KS,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_KBAND_KS, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_LPF_BWC,
+			   G3_ANA_PXP_JCPLL_KBAND_DIV,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_KBAND_DIV, 0x1));
+	regmap_set_bits(pcie_phy->g3_pma, REG_SCAN_MODE,
+			G3_PMA_FORCE_SEL_DA_PXP_JCPLL_KBAND_LOAD_EN);
+	regmap_clear_bits(pcie_phy->g3_pma, REG_SCAN_MODE,
+			  G3_PMA_FORCE_DA_PXP_JCPLL_KBAND_LOAD_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_LPF_BWC,
+			   G3_ANA_PXP_JCPLL_KBAND_CODE,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_KBAND_CODE, 0xE4));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SDM_HREN,
+			G3_ANA_PXP_JCPLL_TCL_AMP_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_TCL_CMP_EN,
+			G3_ANA_PXP_JCPLL_TCL_LPF_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SPARE_H,
+			   G3_ANA_PXP_JCPLL_TCL_KBAND_VREF,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_TCL_KBAND_VREF, 0xF));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SDM_HREN,
+			   G3_ANA_PXP_JCPLL_TCL_AMP_GAIN,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_TCL_AMP_GAIN, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SDM_HREN,
+			   G3_ANA_PXP_JCPLL_TCL_AMP_VREF,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_TCL_AMP_VREF, 0x5));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_TCL_CMP_EN,
+			   G3_ANA_PXP_JCPLL_TCL_LPF_BW,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_TCL_LPF_BW, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCO_TCLVAR,
+			   G3_ANA_PXP_JCPLL_VCO_TCLVAR,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_VCO_TCLVAR, 0x3));
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
+			G3_PMA_FORCE_SEL_DA_PXP_JCPLL_CKOUT_EN);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
+			G3_PMA_FORCE_DA_PXP_JCPLL_CKOUT_EN);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
+			G3_PMA_FORCE_SEL_DA_PXP_JCPLL_EN);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
+			G3_PMA_FORCE_DA_PXP_JCPLL_EN);
+}
+
+static void an7583_pcie_phy_txpll(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_CKOUT_EN,
+			G3_PMA_FORCE_SEL_DA_PXP_TXPLL_EN);
+	regmap_clear_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_CKOUT_EN,
+			  G3_PMA_FORCE_DA_PXP_TXPLL_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_REFIN_INTERNAL,
+			G3_ANA_PXP_TXPLL_PLL_RSTB);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SSC_DELTA1,
+			   G3_ANA_PXP_TXPLL_SSC_DELTA,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_SSC_DELTA, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SSC_DELTA1,
+			   G3_ANA_PXP_TXPLL_SSC_DELTA1,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_SSC_DELTA1, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SSC_PERIOD,
+			   G3_ANA_PXP_TXPLL_SSC_PERIOD,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_SSC_PERIOD, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_CHP_IBIAS,
+			   G3_ANA_PXP_TXPLL_CHP_IOFST,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_CHP_IOFST, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_CHP_IBIAS,
+			   G3_ANA_PXP_TXPLL_CHP_IBIAS,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_CHP_IBIAS, 0x2D));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_REFIN_INTERNAL,
+			   G3_ANA_PXP_TXPLL_REFIN_DIV,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_REFIN_DIV, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_LPF_EN,
+			   G3_ANA_PXP_TXPLL_VCO_CFIX,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_VCO_CFIX, 0x3));
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_CDR_PR_IDAC,
+			G3_PMA_FORCE_SEL_DA_PXP_TXPLL_SDM_PCW);
+	regmap_update_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_SDM_PCW,
+			   G3_PMA_FORCE_DA_PXP_TXPLL_SDM_PCW,
+			   FIELD_PREP(G3_PMA_FORCE_DA_PXP_TXPLL_SDM_PCW, 0xC800000));
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SDM_DI_EN,
+			  G3_ANA_PXP_TXPLL_SDM_IFM);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SSC_EN,
+			  G3_ANA_PXP_TXPLL_SSC_PHASE_INI);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_REFIN_INTERNAL,
+			   G3_ANA_PXP_TXPLL_RST_DLY,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_RST_DLY, 0x4));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SDM_DI_EN,
+			   G3_ANA_PXP_TXPLL_SDM_DI_LS,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_SDM_DI_LS, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SDM_ORD,
+			   G3_ANA_PXP_TXPLL_SDM_ORD,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_SDM_ORD, 0x3));
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_KBAND_VREF,
+			  G3_ANA_PXP_TXPLL_VCO_KBAND_MEAS_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SSC_DELTA1,
+			   G3_ANA_PXP_TXPLL_SSC_DELTA,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_SSC_DELTA, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SSC_DELTA1,
+			   G3_ANA_PXP_TXPLL_SSC_DELTA1,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_SSC_DELTA1, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_LPF_BP,
+			   G3_ANA_PXP_TXPLL_LPF_BP,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_LPF_BP, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_CHP_IBIAS,
+			   G3_ANA_PXP_TXPLL_LPF_BC,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_LPF_BC, 0x18));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_CHP_IBIAS,
+			   G3_ANA_PXP_TXPLL_LPF_BR,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_LPF_BR, 0x5));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_CHP_IBIAS,
+			   G3_ANA_PXP_TXPLL_CHP_IOFST,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_CHP_IOFST, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_CHP_IBIAS,
+			   G3_ANA_PXP_TXPLL_CHP_IBIAS,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_CHP_IBIAS, 0x2D));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_VTP_EN,
+			   G3_ANA_PXP_TXPLL_SPARE_L,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_SPARE_L, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_LPF_BP,
+			   G3_ANA_PXP_TXPLL_LPF_BWC,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_LPF_BWC, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_KBAND_KS,
+			   G3_ANA_PXP_TXPLL_MMD_PREDIV_MODE,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_MMD_PREDIV_MODE, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_REFIN_INTERNAL,
+			   G3_ANA_PXP_TXPLL_REFIN_DIV,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_REFIN_DIV, 0x0));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_VCO_HALFLSB_EN,
+			G3_ANA_PXP_TXPLL_VCO_HALFLSB_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_VCO_HALFLSB_EN,
+			   G3_ANA_PXP_TXPLL_VCO_SCAPWR,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_VCO_SCAPWR, 0x7));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_LPF_EN,
+			   G3_ANA_PXP_TXPLL_VCO_CFIX,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_VCO_CFIX, 0x3));
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_CDR_PR_IDAC,
+			G3_PMA_FORCE_SEL_DA_PXP_TXPLL_SDM_PCW);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SSC_EN,
+			  G3_ANA_PXP_TXPLL_SSC_PHASE_INI);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_LPF_BP,
+			   G3_ANA_PXP_TXPLL_LPF_BWR,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_LPF_BWR, 0x0));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_REFIN_INTERNAL,
+			G3_ANA_PXP_TXPLL_REFIN_INTERNAL);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_KBAND_VREF,
+			  G3_ANA_PXP_TXPLL_VCO_KBAND_MEAS_EN);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_VTP_EN,
+			  G3_ANA_PXP_TXPLL_VTP_EN);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_PHY_CK1_EN,
+			  G3_ANA_PXP_TXPLL_PHY_CK1_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_REFIN_INTERNAL,
+			G3_ANA_PXP_TXPLL_REFIN_INTERNAL);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SSC_EN,
+			  G3_ANA_PXP_TXPLL_SSC_EN);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_FREQ_MEAS_EN,
+			  G3_ANA_PXP_TXPLL_LPF_SHCK_EN);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_KBAND_KS,
+			  G3_ANA_PXP_TXPLL_POSTDIV_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_KBAND_CODE,
+			   G3_ANA_PXP_TXPLL_KBAND_KFC,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_KBAND_KFC, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_KBAND_CODE,
+			   G3_ANA_PXP_TXPLL_KBAND_KF,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_KBAND_KF, 0x3));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_KBAND_KS,
+			   G3_ANA_PXP_TXPLL_KBAND_KS,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_KBAND_KS, 0x1));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_KBAND_CODE,
+			   G3_ANA_PXP_TXPLL_KBAND_DIV,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_KBAND_DIV, 0x4));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_KBAND_CODE,
+			   G3_ANA_PXP_TXPLL_KBAND_CODE,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_KBAND_CODE, 0xE4));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_SDM_ORD,
+			G3_ANA_PXP_TXPLL_TCL_AMP_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_LPF_EN,
+			G3_ANA_PXP_TXPLL_TCL_LPF_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_KBAND_VREF,
+			   G3_ANA_PXP_TXPLL_TCL_KBAND_VREF,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_TCL_KBAND_VREF, 0xF));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_AMP_GAIN,
+			   G3_ANA_PXP_TXPLL_TCL_AMP_GAIN,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_TCL_AMP_GAIN, 0x3));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_AMP_GAIN,
+			   G3_ANA_PXP_TXPLL_TCL_AMP_VREF,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_TCL_AMP_VREF, 0xB));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_TXPLL_TCL_LPF_EN,
+			   G3_ANA_PXP_TXPLL_TCL_LPF_BW,
+			   FIELD_PREP(G3_ANA_PXP_TXPLL_TCL_LPF_BW, 0x3));
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_CKOUT_EN,
+			G3_PMA_FORCE_SEL_DA_PXP_TXPLL_CKOUT_EN);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_CKOUT_EN,
+			G3_PMA_FORCE_DA_PXP_TXPLL_CKOUT_EN);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_CKOUT_EN,
+			G3_PMA_FORCE_SEL_DA_PXP_TXPLL_EN);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_CKOUT_EN,
+			G3_PMA_FORCE_DA_PXP_TXPLL_EN);
+}
+
+static void an7583_pcie_phy_init_ssc_jcpll(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_DELTA,
+			   G3_ANA_PXP_JCPLL_SSC_DELTA,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_DELTA, 0x106));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
+			   G3_ANA_PXP_JCPLL_SSC_DELTA1,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_DELTA1, 0x106));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_DELTA,
+			   G3_ANA_PXP_JCPLL_SSC_PERIOD,
+			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_PERIOD, 0x31B));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCO_TCLVAR,
+			G3_ANA_PXP_JCPLL_SSC_PHASE_INI);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCO_TCLVAR,
+			G3_ANA_PXP_JCPLL_SSC_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SDM_IFM,
+			G3_ANA_PXP_JCPLL_SDM_IFM);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SDM_HREN,
+			G3_ANA_PXP_JCPLL_SDM_HREN);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_RST_DLY,
+			  G3_ANA_PXP_JCPLL_SDM_DI_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
+			G3_ANA_PXP_JCPLL_SSC_TRI_EN);
+}
+
+static void
+an7583_pcie_phy_set_rxlan0_signal_detect(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_TDC_REF_SEL,
+			G3_ANA_PXP_CDR_PR_LDO_FORCE_ON);
+	usleep_range(10, 110);
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_32,
+			   G3_PMA_DIG_RESERVE_32_31_16,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_32_31_16, 0x18B0));
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_33,
+			   G3_PMA_DIG_RESERVE_33_15_0,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_33_15_0, 0x18B0));
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_33,
+			   G3_PMA_DIG_RESERVE_33_31_16,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_33_31_16, 0x1030));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_SIGDET_NOVTH,
+			   G3_ANA_PXP_RX_SIGDET_PEAK_1_0,
+			   FIELD_PREP(G3_ANA_PXP_RX_SIGDET_PEAK_1_0, 0x2));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_SIGDET_NOVTH,
+			   G3_ANA_PXP_RX_SIGDET_VTH_SEL_4_0,
+			   FIELD_PREP(G3_ANA_PXP_RX_SIGDET_VTH_SEL_4_0, 0x5));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_REV_0,
+			   G3_ANA_PXP_RX_REV_1_3_2,
+			   FIELD_PREP(G3_ANA_PXP_RX_REV_1_3_2, 0x2));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_DAC_RANGE,
+			   G3_ANA_PXP_RX_SIGDET_LPF_CTRL,
+			   FIELD_PREP(G3_ANA_PXP_RX_SIGDET_LPF_CTRL, 0x1));
+	regmap_update_bits(pcie_phy->g3_pma, REG_SS_RX_CAL_2,
+			   G3_PMA_CAL_OUT_OS,
+			   FIELD_PREP(G3_PMA_CAL_OUT_OS, 0x0));
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_RX_FE_VCM_GEN_PWDB,
+			G3_ANA_PXP_RX_FE_VCM_GEN_PWDB);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_RX_FE_GAIN_CTRL,
+			G3_PMA_FORCE_SEL_DA_PXP_RX_FE_GAIN_CTRL);
+	regmap_update_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_RX_FE_GAIN_CTRL,
+			   G3_PMA_FORCE_DA_PXP_RX_FE_GAIN_CTRL,
+			   FIELD_PREP(G3_PMA_FORCE_DA_PXP_RX_FE_GAIN_CTRL, 0x3));
+	regmap_update_bits(pcie_phy->g3_pma, REG_RX_FORCE_MODE_0,
+			   G3_PMA_FORCE_DA_XPON_RX_FE_GAIN_CTRL,
+			   FIELD_PREP(G3_PMA_FORCE_DA_XPON_RX_FE_GAIN_CTRL, 0x1));
+	regmap_update_bits(pcie_phy->g3_pma, REG_SS_RX_SIGDET_0,
+			   G3_PMA_SIGDET_WIN_NONVLD_TIMES,
+			   FIELD_PREP(G3_PMA_SIGDET_WIN_NONVLD_TIMES, 0x3));
+	regmap_clear_bits(pcie_phy->g3_pma, REG_RX_CTRL_SEQUENCE_DISB_CTRL_1,
+			  G3_PMA_DISB_RX_SDCAL_EN);
+	regmap_set_bits(pcie_phy->g3_pma, REG_RX_CTRL_SEQUENCE_FORCE_CTRL_1,
+			G3_PMA_FORCE_RX_SDCAL_EN);
+	usleep_range(100, 200);
+	regmap_clear_bits(pcie_phy->g3_pma, REG_RX_CTRL_SEQUENCE_FORCE_CTRL_1,
+			  G3_PMA_FORCE_RX_SDCAL_EN);
+}
+
+static void an7583_pcie_phy_set_rxflow(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_RX_SCAN_RST_B,
+			G3_PMA_FORCE_SEL_DA_PXP_RX_SIGDET_PWDB);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_RX_SCAN_RST_B,
+			G3_PMA_FORCE_DA_PXP_RX_SIGDET_PWDB);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_CDR_PD_PWDB,
+			G3_PMA_FORCE_SEL_DA_PXP_CDR_PD_PWDB);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_CDR_PD_PWDB,
+			G3_PMA_FORCE_DA_PXP_CDR_PD_PWDB);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_RX_FE_PWDB,
+			G3_PMA_FORCE_SEL_DA_PXP_RX_FE_PWDB);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_RX_FE_PWDB,
+			G3_PMA_FORCE_DA_PXP_RX_FE_PWDB);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_RX_PHYCK_DIV,
+			G3_ANA_PXP_RX_TDC_CK_SEL);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_RX_PHYCK_DIV,
+			G3_ANA_PXP_RX_PHYCK_RSTB);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			G3_PMA_SW_TX_FIFO_RST_N);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			G3_PMA_SW_ALLPCS_RST_N);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			G3_PMA_SW_PMA_RST_N);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			G3_PMA_SW_TX_RST_N);
+	regmap_set_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			G3_PMA_SW_RX_FIFO_RST_N);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_RX_FE_EQ_HZEN,
+			G3_ANA_PXP_RX_FE_VB_EQ3_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_RX_FE_EQ_HZEN,
+			G3_ANA_PXP_RX_FE_VB_EQ2_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_RX_FE_EQ_HZEN,
+			G3_ANA_PXP_RX_FE_VB_EQ1_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_REV_0,
+			   G3_ANA_PXP_RX_REV_1_6_4,
+			   FIELD_PREP(G3_ANA_PXP_RX_REV_1_6_4, 0x4));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_REV_0,
+			   G3_ANA_PXP_RX_REV_1_10_8,
+			   FIELD_PREP(G3_ANA_PXP_RX_REV_1_10_8, 0x4));
+}
+
+static void an7583_pcie_phy_set_pr(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_VREG_IBAND_VAL,
+			   G3_ANA_PXP_CDR_PR_VREG_IBAND_VAL_2_0,
+			   FIELD_PREP(G3_ANA_PXP_CDR_PR_VREG_IBAND_VAL_2_0, 0x5));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_VREG_IBAND_VAL,
+			   G3_ANA_PXP_CDR_PR_VREG_CKBUF_VAL_2_0,
+			   FIELD_PREP(G3_ANA_PXP_CDR_PR_VREG_CKBUF_VAL_2_0, 0x5));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_CKREF_DIV,
+			   G3_ANA_PXP_CDR_PR_CKREF_DIV_1_0,
+			   FIELD_PREP(G3_ANA_PXP_CDR_PR_CKREF_DIV_1_0, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_TDC_REF_SEL,
+			   G3_ANA_PXP_CDR_PR_CKREF_DIV1_1_0,
+			   FIELD_PREP(G3_ANA_PXP_CDR_PR_CKREF_DIV1_1_0, 0x0));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CDR_LPF_RATIO,
+			   G3_ANA_PXP_CDR_LPF_TOP_LIM,
+			   FIELD_PREP(G3_ANA_PXP_CDR_LPF_TOP_LIM, 0x20000));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_BETA_DAC,
+			   G3_ANA_PXP_CDR_PR_BETA_SEL,
+			   FIELD_PREP(G3_ANA_PXP_CDR_PR_BETA_SEL, 0x2));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_BETA_DAC,
+			   G3_ANA_PXP_CDR_PR_KBAND_DIV,
+			   FIELD_PREP(G3_ANA_PXP_CDR_PR_KBAND_DIV, 0x4));
+}
+
+static void an7583_pcie_phy_set_txflow(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_TX_CKLDO_EN,
+			G3_ANA_PXP_TX_CKLDO_EN);
+	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_TX_CKLDO_EN,
+			G3_ANA_PXP_TX_DMEDGEGEN_EN);
+}
+
+static void an7583_pcie_phy_set_rx_mode(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_write(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_40, 0x804000);
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_31,
+			   G3_PMA_DIG_RESERVE_31_4_0,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_31_4_0, 0x5));
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_31,
+			   G3_PMA_DIG_RESERVE_31_12_8,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_31_12_8, 0x5));
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_31,
+			   G3_PMA_DIG_RESERVE_31_20_16,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_31_20_16, 0x5));
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_43,
+			   G3_PMA_DIG_RESERVE_43_10_8,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_43_10_8, 0x7));
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_43,
+			   G3_PMA_DIG_RESERVE_43_14_12,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_43_14_12, 0x7));
+	regmap_update_bits(pcie_phy->g3_pma, REG_ADD_DIG_RESERVE_43,
+			   G3_PMA_DIG_RESERVE_43_18_16,
+			   FIELD_PREP(G3_PMA_DIG_RESERVE_43_18_16, 0x7));
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_MONCK_EN,
+			  G3_ANA_PXP_CDR_PR_MONCK_EN);
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_CDR_PR_MONCK_EN,
+			   G3_ANA_PXP_CDR_PR_RESERVE0,
+			   FIELD_PREP(G3_ANA_PXP_CDR_PR_RESERVE0, 0x2));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_OSCAL_CTLE2IOS,
+			   G3_ANA_PXP_RX_OSCAL_VGA1IOS,
+			   FIELD_PREP(G3_ANA_PXP_RX_OSCAL_VGA1IOS, 0x19));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_OSCAL_CTLE2IOS,
+			   G3_ANA_PXP_RX_OSCAL_VGA1VOS,
+			   FIELD_PREP(G3_ANA_PXP_RX_OSCAL_VGA1VOS, 0x19));
+	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_RX_OSCAL_VGA2IOS,
+			   G3_ANA_PXP_RX_OSCAL_VGA2IOS,
+			   FIELD_PREP(G3_ANA_PXP_RX_OSCAL_VGA2IOS, 0x14));
+}
+
+static void an7583_pcie_phy_set_eye_scan(struct an7583_pcie_phy *pcie_phy)
+{
+	regmap_update_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_CDR_PR_FLL_COR,
+			   G3_PMA_FORCE_DA_PXP_RX_DAC_EYE,
+			   FIELD_PREP(G3_PMA_FORCE_DA_PXP_RX_DAC_EYE, 0x0));
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_CDR_PR_FLL_COR,
+			G3_PMA_FORCE_SEL_DA_PXP_RX_DAC_EYE);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+			G3_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB);
+	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+			G3_PMA_FORCE_SEL_DA_PXP_CDR_PR_PIEYE_PWDB);
+	regmap_clear_bits(pcie_phy->g3_pma, REG_SS_DA_XPON_PWDB_0,
+			  G3_PMA_DA_XPON_CDR_PR_PWDB);
+}
+
+static int an7583_pcie_phy_deinit(struct an7583_pcie_phy *pcie_phy)
+{
+	/* Disable JCPLL spread-spectrum clocking */
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCO_TCLVAR,
+			  G3_ANA_PXP_JCPLL_SSC_PHASE_INI |
+			  G3_ANA_PXP_JCPLL_SSC_EN);
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
+			  G3_ANA_PXP_JCPLL_SSC_TRI_EN);
+
+	/* Disable RX CDR/PR */
+	regmap_clear_bits(pcie_phy->g3_pma, REG_SS_DA_XPON_PWDB_0,
+			  G3_PMA_DA_XPON_CDR_PR_PWDB);
+
+	/* Disable TX PLL output/enable */
+	regmap_clear_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_CKOUT_EN,
+			  G3_PMA_FORCE_DA_PXP_TXPLL_CKOUT_EN |
+			  G3_PMA_FORCE_SEL_DA_PXP_TXPLL_CKOUT_EN |
+			  G3_PMA_FORCE_SEL_DA_PXP_TXPLL_EN |
+			  G3_PMA_FORCE_DA_PXP_TXPLL_EN);
+
+	/* Disable JCPLL output/enable */
+	regmap_clear_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
+			  G3_PMA_FORCE_DA_PXP_JCPLL_CKOUT_EN |
+			  G3_PMA_FORCE_SEL_DA_PXP_JCPLL_CKOUT_EN |
+			  G3_PMA_FORCE_SEL_DA_PXP_JCPLL_EN |
+			  G3_PMA_FORCE_DA_PXP_JCPLL_EN);
+
+	/* Assert PHY resets */
+	regmap_clear_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
+			  G3_PMA_SW_TX_FIFO_RST_N |
+			  G3_PMA_SW_ALLPCS_RST_N |
+			  G3_PMA_SW_PMA_RST_N |
+			  G3_PMA_SW_TX_RST_N |
+			  G3_PMA_SW_RX_FIFO_RST_N |
+			  G3_PMA_SW_XFI_RXPCS_RST_N |
+			  G3_PMA_SW_REF_RST_N |
+			  G3_PMA_SW_RX_RST_N);
+
+	/* Disable TX analog blocks */
+	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TX_CKLDO_EN,
+			  G3_ANA_PXP_TX_CKLDO_EN |
+			  G3_ANA_PXP_TX_DMEDGEGEN_EN);
+
+	return 0;
+}
+
+static int an7583_pcie_phy_init(struct phy *phy)
+{
+	struct an7583_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	u32 val;
+	int ret;
+
+	/* Setup Tx-Rx detection time */
+	val = FIELD_PREP(PCIE_XTP_RXDET_VCM_OFF_STB_T_SEL, 0x33) |
+	      FIELD_PREP(PCIE_XTP_RXDET_EN_STB_T_SEL, 0x1) |
+	      FIELD_PREP(PCIE_XTP_RXDET_FINISH_STB_T_SEL, 0x2) |
+	      FIELD_PREP(PCIE_XTP_TXPD_TX_DATA_EN_DLY, 0x3) |
+	      FIELD_PREP(PCIE_XTP_RXDET_LATCH_STB_T_SEL, 0x1);
+	regmap_write(pcie_phy->xr_dtime, REG_PCIE_PEXTP_DIG_GLB44, val);
+
+	/* Setup Rx AEQ training time */
+	val = FIELD_PREP(PCIE_XTP_LN_RX_PDOWN_L1P2_EXIT_WAIT, 0x32) |
+	      FIELD_PREP(PCIE_XTP_LN_RX_PDOWN_E0_AEQEN_WAIT, 0x5050);
+	regmap_write(pcie_phy->rx_aeq, REG_PCIE_PEXTP_DIG_LN_RX30, val);
+
+	an7583_pcie_phy_init_default(pcie_phy);
+	an7583_pcie_phy_init_clk_out(pcie_phy);
+	an7583_pcie_phy_init_ana(pcie_phy);
+
+	usleep_range(50, 100);
+
+	an7583_pcie_phy_init_rx(pcie_phy);
+
+	/* phase 1, no ssc for K TXPLL */
+	an7583_pcie_phy_init_jcpll(pcie_phy);
+
+	usleep_range(200, 300);
+
+	/* TX PLL settings */
+	an7583_pcie_phy_txpll(pcie_phy);
+
+	usleep_range(200, 300);
+
+	/* SSC JCPLL setting */
+	an7583_pcie_phy_init_ssc_jcpll(pcie_phy);
+
+	usleep_range(30, 130);
+
+	/* Rx lan0 signal detect */
+	an7583_pcie_phy_set_rxlan0_signal_detect(pcie_phy);
+
+	/* RX FLOW */
+	an7583_pcie_phy_set_rxflow(pcie_phy);
+
+	usleep_range(50, 200);
+
+	an7583_pcie_phy_set_pr(pcie_phy);
+
+	/* TX FLOW */
+	an7583_pcie_phy_set_txflow(pcie_phy);
+
+	usleep_range(50, 200);
+
+	/* RX mode setting */
+	an7583_pcie_phy_set_rx_mode(pcie_phy);
+
+	an7583_pcie_phy_set_eye_scan(pcie_phy);
+
+	usleep_range(50, 200);
+
+	regmap_set_bits(pcie_phy->g3_pma, REG_SS_DA_XPON_PWDB_0,
+			G3_PMA_DA_XPON_CDR_PR_PWDB);
+
+	usleep_range(100, 200);
+
+	ret = phy_init(pcie_phy->qp_phy);
+	if (ret) {
+		an7583_pcie_phy_deinit(pcie_phy);
+
+		dev_err(pcie_phy->dev, "failed to initialize QP phy\n");
+
+		return ret;
+	}
+
+	/* Wait for the PCIe PHY to complete initialization before returning */
+	msleep(PHY_HW_INIT_TIME_MS);
+
+	return 0;
+}
+
+static int an7583_pcie_phy_exit(struct phy *phy)
+{
+	struct an7583_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	phy_exit(pcie_phy->qp_phy);
+
+	return an7583_pcie_phy_deinit(pcie_phy);
+}
+
+static const struct phy_ops an7583_pcie_phy_ops = {
+	.init = an7583_pcie_phy_init,
+	.exit = an7583_pcie_phy_exit,
+	.owner = THIS_MODULE,
+};
+
+static const struct regmap_config an7583_pcie_phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static struct regmap *an7583_pcie_phy_regmap_init(struct platform_device *pdev,
+						  const char *name)
+{
+	struct regmap_config config = an7583_pcie_phy_regmap_config;
+	void __iomem *base;
+
+	config.name = name;
+
+	base = devm_platform_ioremap_resource_byname(pdev, name);
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	return devm_regmap_init_mmio(&pdev->dev, base, &config);
+}
+
+static int an7583_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct an7583_pcie_phy *pcie_phy;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+
+	pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
+	if (!pcie_phy)
+		return -ENOMEM;
+
+	pcie_phy->g3_ana = an7583_pcie_phy_regmap_init(pdev, "g3-ana");
+	if (IS_ERR(pcie_phy->g3_ana))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->g3_ana),
+				     "Failed to initialize g3 ANA regmap\n");
+
+	pcie_phy->qp_phy = devm_phy_get(dev, NULL);
+	if (IS_ERR(pcie_phy->qp_phy))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->qp_phy),
+				     "Failed to get QP PCIe phy\n");
+
+	pcie_phy->g3_pma = an7583_pcie_phy_regmap_init(pdev, "g3-pma");
+	if (IS_ERR(pcie_phy->g3_pma))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->g3_pma),
+				     "Failed to initialize g3 PMA regmap\n");
+
+	pcie_phy->phy = devm_phy_create(dev, dev->of_node, &an7583_pcie_phy_ops);
+	if (IS_ERR(pcie_phy->phy))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->phy),
+				     "Failed to create PCIe phy\n");
+
+	pcie_phy->xr_dtime = an7583_pcie_phy_regmap_init(pdev, "xr-dtime");
+	if (IS_ERR(pcie_phy->xr_dtime))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->xr_dtime),
+				     "Failed to initialize Tx-Rx dtime regmap\n");
+
+	pcie_phy->rx_aeq = an7583_pcie_phy_regmap_init(pdev, "rx-aeq");
+	if (IS_ERR(pcie_phy->rx_aeq))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->rx_aeq),
+				     "Failed to initialize Rx AEQ regmap\n");
+
+	pcie_phy->dev = dev;
+	phy_set_drvdata(pcie_phy->phy, pcie_phy);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "PCIe phy probe failed\n");
+
+	return 0;
+}
+
+static const struct of_device_id an7583_pcie_phy_of_match[] = {
+	{ .compatible = "airoha,an7583-pcie-gen3-phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an7583_pcie_phy_of_match);
+
+static struct platform_driver an7583_pcie_phy_driver = {
+	.probe	= an7583_pcie_phy_probe,
+	.driver	= {
+		.name = "airoha-an7583-pcie-phy",
+		.of_match_table = an7583_pcie_phy_of_match,
+	},
+};
+module_platform_driver(an7583_pcie_phy_driver);
+
+MODULE_DESCRIPTION("Airoha AN7583 PCIe PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.55.0


