Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B35606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NAUUxYCa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBcWFJrM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qrL4o0PULdqFfuwcYS3OMeO2yJN8Iu7JXlTfeUe5POg=; b=NAUUxYCaOM9tuy
	xTGo1j3qL0MnIpblBCtq2wBtVcEq0aFzqVLp9mxyqfgVtXNG8ANqLtsK0zZ1QtarC9G3TGCjxYkTy
	Rqtcj+VYvIBjLHnyLZjN9JnREZLwwocba9f8LYynBTjHcgBRsRx+H5yFPL/FxqCeYV18lOhWORYdi
	1n0/4d3g3cIgw/r0tP/J2cqU/b2Z4lTxCLCYZrnoK+U8/crBZgjCEDZpALJTIO5eMK7luA/Igvdrd
	oDgD2gMRsUehPzQuP26jm4iDCTQ7Qd6PuBXEJs/x4XXF1HVXZiXR5yx5UZj8rOn81ISOTq/RUCBCn
	hdZ1XN3abfsu6g6WIk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUBT-0000000G48s-3HN7;
	Fri, 20 Nov 2026 19:22:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUAn-0000000G3wL-0oZ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:21:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso727075f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202483; x=1795807283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrL4o0PULdqFfuwcYS3OMeO2yJN8Iu7JXlTfeUe5POg=;
        b=rBcWFJrMvaKCQrTjM9EzU4Colo701uFe2pLJRwFHVWTX9GxfdnFHr1LdkT/eITW5AN
         skwpo/G05ce1UGCArdHf+P3aPgvnkK/kh2nf+CP2/F9V6kHxZ46sB2jI0RvlCzGZpd5t
         XZd4Ms9cOOeKCAnXP9KZ97drLec8xplJ9TTwLsIuuHBBglUE3HyhxGuT6XJGmFbVqiB1
         lz5s9tTj/sgPjm5wCcBwJniY4eMUq1h+naTfjNS6pYJ+u1aP0SFMEr0cljf3AJTFFWSb
         YJEWBEdrd3mMA5G/qyctboQOkVniug3ZHmETYrYgY08kDZjJANaHAuSfygN8gXUwZ2+a
         O2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202483; x=1795807283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrL4o0PULdqFfuwcYS3OMeO2yJN8Iu7JXlTfeUe5POg=;
        b=dFR+vgL/dfwVg5fKD5xq21I55Lh0o9W13HssqhJ1hCtxoyd/2X9PNblv1d/Sej5/Ou
         TH6F+v++1+LR1fAlBttFtIbFT95s+58yh7vqbFjoPPAPHowlc+l7s4aWrN7lA14Pc+hL
         +V+anp+eWBvW7LZKbUIE1g0gzqAhe8m2rya+XUsaJAsq59jfpABOaQ6aHXTfsjdzAbgv
         8AgJvXLU5m+Rw4SEyNejvQQA9B2/2dWKZRGWpo0I5GzFn2+WsGly8kMoLV2LosYYLXJ8
         a85Q5CbW9XTnXRkS5rmOAr0zGbVuXUQfXyro1rMiMWZHC+CLKEHdblVmGfWsNkC81otq
         rPDA==
X-Forwarded-Encrypted: i=1; AL+hErFbUevhyKZmCmbHCyb51RIxYU4IKQAou87sZAliIG9U2NvIOruDxfs/HhiWn591ISe/GlAgPPKcrMasLmnastmH@lists.infradead.org
X-Gm-Message-State: APuU4Z9jOr+D5U3Wh0x0wvbTlUjwmJYg5nJAWXrmjQWb8xkyjY7MA3KB
	4pvSZgRycQ9wEjkDnX47Ge6EhxzYrQo2GEJKmfYiJjuspOmQHmXR3qa3
X-Gm-Gg: AZFdTZeaf2I3umxCuo1tPr7dL/7H+kpv7FW8X6xJ8qPEu0z4g2qcySVyg/ys4GE7dCK
	CU9f3ZSzNKAqGlm/bFy4goCYGxbPFotiWh0TMxNlZbgqovth4ZQo/hRWb5z41GPP4t22jsAHW/K
	OdkuoRRHZjSg63NFFVFzM3nJTsCjil9yYPyRuEZLX2JzXzPrrmxoayH26Ye7YTErAPI3mk0m+on
	Yhnrs/oS4+1RtzkiIdXv/KqO/6CSwMxUEGvHWhA6hXHYtRsTjg6pOA31Or5NBvbekwfF62slmTF
	xWtSJHPaBcu9+y2YbP2KczhQN6wxiSrn1H9HnQrtU5zrAOp+l/2VEQ/WWye31N9hEOnbXXALc3p
	lWmSSlkCgSviE3AHiEzV+BcF6nEd5z8zVtMFycdiYj7RblAG9581z+yzLsdDa/PnIKXPljqSl+b
	BIaxsVU3Fh1DFQLS7gbMjaW8PtBzKWUHAm0PAWEfIQXiqthOHOOJl2u1XZdKxETRVQnzSrZgwta
	2D0GTECjGQ5VTLTVnCmIq8D7nMAg1Lmm6LazukAqjzYwGZ+1zL7Wrbs7q85tme5cgUIXqNEMkhh
	ELZwCxd9VyJu1vIgFPYC8WpUZBqOeGfl9TNhpi5f
X-Received: by 2002:a5d:5e8f:0:b0:48f:bf71:2ad9 with SMTP id ffacd0b85a97d-4abb400bcb1mr8820356f8f.41.1795202483117;
        Fri, 20 Nov 2026 11:21:23 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:22 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:52 +0300
Subject: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12340;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=VfvWHYxi8vxHqRxg9s/54zdayLBUu8LY5SmupIpw68k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2Wj2mjRcJ86eSiAk+9gbxi78e0958ZSB/bB
 sOwfk3XSJGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJSJQ/9G2A1qfjkRgEgWSLvjqNuwV6AiYVbdcb
 OnExHEAkvQ+C7cGpw8bpL7WKovivZZeIfX/ZWHLqnlFsE5pPXW+HWfGZSmxKgZ5N8DNGSioOvBe
 F2i/BWh0EbgZSHWMf3LKUQZyxnUU0hf8pIEsl1iDBHLLgsvggEUisvVbrmCewSheK0D4mn3kZC1
 b23jEXZPgjxLL+QXTNyddZD+ScwpFUqEPh6kzSMMuF1cgXmY4pKAK7Vep3XTl4skhtDckjyISJV
 EOTlD/3rAkdgwUY4TQ7GkQU0BsQ1McUAmB/bMPYbQC2GIOEoiAFxJTsaPjBVhFD9wi7jgKv2e16
 LpWyyjHF8MicAFnYmxiM2y3GQT+CRRPXFe8V8MCXQeqxqhxJ0MQMTqTKozSJA9cA1dxm3Hh6rth
 mBTuvOub4Ytsy17W8IeqZodC99cDpLHtWKtg2AiTr3MeqUbmdIMiI2G1lKY51DOdiZmCSK6CTA4
 EUapb4VqiaEgeaXHEruOmOhbpqsNM7lstdTwOekSiHeaG4ln4naujpm98BnkzQtZbMO+9/jVqkq
 bG+fd+EPTqjcaZ1EAdXlxE2X1v6j3hqXLBkMbC3zJBX6Tqg4kpZ6BN/ziFPAWoKkulMVr+mliwW
 tvXIN/xKcAtvJ49xs/5+iHiHRTIiUVRI1TbI4E7vziqaTmbnSwWU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112134_468675_B1D19BA2 
X-CRM114-Status: GOOD (  35.44  )
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This controller has bits for USB, HSIC, EDCP (a cryptographic engine)
and GSM. Not all of them work the way one might expect (see comments in
the code), but they are there and can be set.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

For now this driver can only enable and disable the USB controller. I
expect more LTE related power switches will be added later, but I don't
want to commit to how I expose GSM and EDCP in the bindings just yet.
---
 MAINTAINERS                                 |   1 +
 drivers/pmdomain/Kconfig                    |   1 +
 drivers/pmdomain/Makefile                   |   1 +
 drivers/pmdomain/zte/Kconfig                |  15 ++
 drivers/pmdomain/zte/Makefile               |   2 +
 drivers/pmdomain/zte/zx297520v3-pm-domain.c | 286 ++++++++++++++++++++++++++++
 6 files changed, 306 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab8797b8d0a5..e394e0044f1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4038,6 +4038,7 @@ F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
+F:	drivers/pmdomain/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 5341dff669be..d5050c22f064 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -21,5 +21,6 @@ source "drivers/pmdomain/tegra/Kconfig"
 source "drivers/pmdomain/thead/Kconfig"
 source "drivers/pmdomain/ti/Kconfig"
 source "drivers/pmdomain/xilinx/Kconfig"
+source "drivers/pmdomain/zte/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/Makefile b/drivers/pmdomain/Makefile
index d7aee13ae571..cc3cc7b3d1c2 100644
--- a/drivers/pmdomain/Makefile
+++ b/drivers/pmdomain/Makefile
@@ -19,4 +19,5 @@ obj-y					+= tegra/
 obj-y					+= thead/
 obj-y					+= ti/
 obj-y					+= xilinx/
+obj-y					+= zte/
 obj-y					+= core.o governor.o
diff --git a/drivers/pmdomain/zte/Kconfig b/drivers/pmdomain/zte/Kconfig
new file mode 100644
index 000000000000..cc329d085e5a
--- /dev/null
+++ b/drivers/pmdomain/zte/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config ZTE_ZX297520V3_PM_DOMAIN
+	tristate "ZTE zx297520v3 pm domain"
+	depends on HAS_IOMEM
+	depends on PM
+	depends on MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST
+	default SOC_ZX297520V3
+	select PM_GENERIC_DOMAINS
+	select MFD_SYSCON
+	help
+	  Say y to enable the power domain driver for ZTE zx297520v3 boards.
+	  This driver is necessary to enable the USB hardware found on this
+	  board. Say y or m if you are building a kernel for a zx297520v3 based
+	  device and plan to use its USB capabilities.
diff --git a/drivers/pmdomain/zte/Makefile b/drivers/pmdomain/zte/Makefile
new file mode 100644
index 000000000000..8a4185f48ff3
--- /dev/null
+++ b/drivers/pmdomain/zte/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_ZTE_ZX297520V3_PM_DOMAIN)	+= zx297520v3-pm-domain.o
diff --git a/drivers/pmdomain/zte/zx297520v3-pm-domain.c b/drivers/pmdomain/zte/zx297520v3-pm-domain.c
new file mode 100644
index 000000000000..3df4cd5f1b22
--- /dev/null
+++ b/drivers/pmdomain/zte/zx297520v3-pm-domain.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ *
+ * This driver controls power domain registers found on the ZTE zx297520v3 board. The USB and GSM
+ * controllers are controlled from here.
+ */
+
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/regmap.h>
+
+static const struct {
+	const char *name;
+	u32 reg;
+	u32 mask;
+} power_domains[] = {
+	/* ZTE's kernel defines the following power controls in 0x10c-0x114:
+	 *
+	 * Name			Bit
+	 * GSM_RAM		0
+	 * GSM_DSP		1
+	 * EDCP			4
+	 * USB_CTRL		8
+	 * USB_HSIC		9
+	 *
+	 * But the names are wrong/misleading.
+	 *
+	 * For USB, bit 9 appears to control both HSIC and USB, except for the isolation register,
+	 * where setting either bit 8 or bit 9 zeroes both of their address space. So we expose
+	 * one power domain that controls both bits.
+	 *
+	 * Bit 1 isolates and resets the mmio area from 0xf4000000-0xf7000000. The device behind it
+	 * is an Infineon PMB887x GSM controller derivate. The power bit doesn't appear to turn it
+	 * off, and it remains unset by the stock firmware. The reset works and the driver for this
+	 * hardware needs to assert and deassert it to wake it up on boot. The isolation bit 1
+	 * works, but only once the GSM hardware is properly booted - if the GSM chip doesn't
+	 * respond, and isolation is enabled, attempts to access this area nevertheless stall the
+	 * bus.
+	 *
+	 * Bit 0 controls the TeakLite DSP on the PMB887x.
+	 *
+	 * The functionality of bit 4 is not understood yet. The "EDCP" hardware seems to be a
+	 * cryptographic engine implementing PDCP and some hash functions.
+	 */
+
+	{"usb",		0x10c,		BIT(8) | BIT(9)},
+
+	/* There is a separate set of registers in 0x180 - 0x188 that accepts 4 bits (0, 1, 6, 7)
+	 * and is controlled by the cpko.ko blob in the same way as 0x10c-0x114 is controlled by
+	 * the USB driver: LTE on: Set *0x188=0xc3 and the others to 0. LTE off: Set 0x188 to 0 and
+	 * the others to 0xc3. It is therefore likely that up to 4 more devices can be powered on
+	 * and off in these registers.
+	 */
+};
+
+struct zx29_pm_domain {
+	struct generic_pm_domain	gpd;
+	struct regmap			*map;
+	unsigned int			domain;
+};
+
+#define REG_RST		0x0
+#define REG_ISO		0x4
+#define REG_PWR		0x8
+
+static inline struct zx29_pm_domain *to_zte_pm_domain(struct generic_pm_domain *domain)
+{
+	return container_of(domain, struct zx29_pm_domain, gpd);
+}
+
+static int zx29_pd_on(struct generic_pm_domain *domain)
+{
+	const struct zx29_pm_domain *zx29_pd = to_zte_pm_domain(domain);
+	u32 mask = power_domains[zx29_pd->domain].mask;
+	u32 reg = power_domains[zx29_pd->domain].reg;
+	int res;
+
+	dev_dbg(&domain->dev, "Power on\n");
+
+	res = regmap_set_bits(zx29_pd->map, reg + REG_PWR, mask);
+	if (res)
+		goto error;
+
+	/* The 10 microsecond delay is from ZTE's dwc2 USB driver integration */
+	udelay(10);
+
+	res = regmap_clear_bits(zx29_pd->map, reg + REG_RST, mask);
+	if (res)
+		goto error;
+
+	udelay(10);
+
+	res = regmap_clear_bits(zx29_pd->map, reg + REG_ISO, mask);
+	if (res)
+		goto error;
+
+	return 0;
+
+error:
+	/* Power the device off and isolate it from the bus (reads from an unpowered, unisolated
+	 * device can stall the CPU), but don't forcefully reset it.
+	 */
+	dev_err(&domain->dev, "%s: Power on failed: %d\n", domain->name, res);
+	regmap_set_bits(zx29_pd->map, reg + REG_ISO, mask);
+	regmap_clear_bits(zx29_pd->map, reg + REG_PWR, mask);
+	return res;
+}
+
+static int zx29_pd_off(struct generic_pm_domain *domain)
+{
+	const struct zx29_pm_domain *zx29_pd = to_zte_pm_domain(domain);
+	u32 mask = power_domains[zx29_pd->domain].mask;
+	u32 reg = power_domains[zx29_pd->domain].reg;
+	int res;
+
+	dev_dbg(&domain->dev, "Power off\n");
+
+	/* If isolation fails, abort. The device should still be operational as far as the pmdomain
+	 * settings are concerned. If isolation failed, asserting reset or powering it down leaves
+	 * the mmio space in a dangerous state: Attempting to access it will stall the CPU forever.
+	 *
+	 * If later steps fail, consider the device off. It won't work without removing isolation.
+	 */
+	res = regmap_set_bits(zx29_pd->map, reg + REG_ISO, mask);
+	if (res) {
+		dev_err(&domain->dev, "Bus isolation failed: %d\n", res);
+		return res;
+	}
+
+	res = regmap_set_bits(zx29_pd->map, reg + REG_RST, mask);
+	if (res)
+		dev_err(&domain->dev, "Device reset failed: %d\n", res);
+
+	res = regmap_clear_bits(zx29_pd->map, reg + REG_PWR, mask);
+	if (res)
+		dev_err(&domain->dev, "Power off failed: %d\n", res);
+
+	return 0;
+}
+
+static int zx29_pd_attach_dev(struct generic_pm_domain *domain, struct device *dev)
+{
+	/* The DT link to the consumer targets the (MFD) parent, which doesn't prevent unbinding the
+	 * this driver or removing the module. Either would leave the consumer with a dangling
+	 * reference.
+	 */
+	if (!device_link_add(dev, &domain->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int zx29_pd_is_on(const struct zx29_pm_domain *zx29_pd)
+{
+	u32 mask = power_domains[zx29_pd->domain].mask;
+	u32 reg = power_domains[zx29_pd->domain].reg;
+	int res;
+	unsigned int val;
+
+	/* To consider a domain on, PWR must be set and RST and ISO cleared */
+	res = regmap_test_bits(zx29_pd->map, reg + REG_PWR, mask);
+	if (res < 0)
+		return res;
+	if (!res)
+		return 0;
+
+	res = regmap_read(zx29_pd->map, reg + REG_ISO, &val);
+	if (res < 0)
+		return res;
+	if (val & mask)
+		return 0;
+
+	res = regmap_read(zx29_pd->map, reg + REG_RST, &val);
+	if (res < 0)
+		return res;
+	if (val & mask)
+		return 0;
+
+	return 1;
+}
+
+static void zx29_pd_release_provider(void *data)
+{
+	struct device_node *of_node = data;
+
+	of_genpd_del_provider(of_node);
+}
+
+static void zx29_pd_remove_domain(void *data)
+{
+	struct generic_pm_domain *genpd = data;
+
+	pm_genpd_remove(genpd);
+}
+
+static int zx29_pd_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node = dev->parent->of_node;
+	struct genpd_onecell_data *zx29_pd_data;
+	struct generic_pm_domain **domains;
+	struct zx29_pm_domain *zx29_pd;
+	struct regmap *map;
+	unsigned int i;
+	int res;
+
+	map = device_node_to_regmap(of_node);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map), "Cannot get parent syscon regmap\n");
+
+	zx29_pd = devm_kcalloc(dev, ARRAY_SIZE(power_domains), sizeof(*zx29_pd), GFP_KERNEL);
+	if (!zx29_pd)
+		return -ENOMEM;
+
+	domains = devm_kcalloc(dev, ARRAY_SIZE(power_domains), sizeof(*domains), GFP_KERNEL);
+	if (!domains)
+		return -ENOMEM;
+
+	zx29_pd_data = devm_kzalloc(dev, sizeof(*zx29_pd_data), GFP_KERNEL);
+	if (!zx29_pd_data)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(power_domains); i++) {
+		zx29_pd[i].gpd.name = power_domains[i].name;
+		zx29_pd[i].gpd.power_off = zx29_pd_off;
+		zx29_pd[i].gpd.power_on = zx29_pd_on;
+		zx29_pd[i].gpd.attach_dev = zx29_pd_attach_dev;
+
+		zx29_pd[i].map = map;
+		zx29_pd[i].domain = i;
+
+		domains[i] = &zx29_pd[i].gpd;
+
+		res = zx29_pd_is_on(&zx29_pd[i]);
+		if (res < 0)
+			return dev_err_probe(dev, res, "failed to read initial pmdomain state\n");
+
+		dev_dbg(dev, "%s: %s\n", power_domains[i].name, res ? "on" : "off");
+
+		res = pm_genpd_init(&zx29_pd[i].gpd, NULL, !res);
+		if (res)
+			return dev_err_probe(dev, res, "failed to init power domain\n");
+		res = devm_add_action_or_reset(dev, zx29_pd_remove_domain, &zx29_pd[i].gpd);
+		if (res)
+			return dev_err_probe(dev, res, "failed to add pm_genpd release callback\n");
+	}
+
+	zx29_pd_data->domains = domains;
+	zx29_pd_data->num_domains = ARRAY_SIZE(power_domains);
+
+	res = of_genpd_add_provider_onecell(of_node, zx29_pd_data);
+	if (res)
+		return dev_err_probe(dev, res, "Cannot register power domains\n");
+
+	device_link_add(dev, dev->parent, DL_FLAG_AUTOREMOVE_CONSUMER);
+
+	dev_dbg(dev, "zx297520v3 power domain initialized.\n");
+
+	return devm_add_action_or_reset(dev, zx29_pd_release_provider, of_node);
+}
+
+static const struct platform_device_id pmdomain_zx297520v3_ids[] = {
+	{
+		.name = "zx297520v3-socsys-power",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, pmdomain_zx297520v3_ids);
+
+static struct platform_driver zx297520_pd = {
+	.probe = zx29_pd_probe,
+	.driver = {
+		.name = "zx297520v3-power-domain",
+	},
+	.id_table = pmdomain_zx297520v3_ids,
+};
+module_platform_driver(zx297520_pd);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 power domain driver");
+MODULE_LICENSE("GPL");

-- 
2.56.1


