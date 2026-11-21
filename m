Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDB6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E1+hR5GL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CfjQ8HsH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=de/zgkDFGYSdLBTnqb+HXEzXLJe1FdmuCcE9kYLWjgI=; b=E1+hR5GLA5or+ZkiwxoanbaWwa
	lPIDYy/wAg9HjTtA9wX7i8ZpM5iLT6QhQEfSKiUqzLMI1pScZKjh6pYhcGleXBxJlDgiNApQrC90y
	Uy+fwoyjpLxKCjH9ru36hMoUbEy/KBiVEKtTy1AvSu95A5pMgOq/exfaqcYzs8fK/wTpqz5w6DmsR
	gqVjxvLLB3d5aGcoL1gEjnt1sVr+vbIii1nKq+1S7t+rDDIZlnhwEnZnxjJax9uqbfiJ4pQuLHSB6
	PSWE6SlwIF6zKuB6bqjV40llqYgcJjpHtj+qYXZeESekR2SH30aX6AEgXHmxs7Svzakd29hsIcyyB
	7T1zydgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkRR-0000000HCaB-0Qx3;
	Sat, 21 Nov 2026 12:43:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkR4-0000000HCMp-0qug
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 12:43:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1B8745AE5;
	Sat, 21 Nov 2026 12:43:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795264997;
	b=eHHTg5wJ8yxyNW442BMJmyJUXprTi5T0/+Wa091TSjx0nYXncHL4jERKhAbW9KGCHUlY
	 TYpLwS1tNeR6bU0iVzBwMaGkcHq0Zkc9Fv9MxoUIorVM4wNVyv7gkRfOYqp7CqcSKsk7f
	 l3LGHWBnbOSjQ+f2f7fHDbfgUpLkkmH0x3okUCp895y88DU2cKPKibn6ch0yDJC5GAS/F
	 CW+z4xmCYLChhVmR7Ur6AZ/yQX2cedZ5ndskEvOdb1u2vNc7AcgH0NbeauoTrePuH8Vp1
	 ioKR/E8UkLT7IMga231gl0/KC2mj2SMFJFIsvxulAscQTc2pnbndRQutaRYVkmEB5sg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795264997;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=de/zgkDFGYSdLBTnqb+HXEzXLJe1FdmuCcE9kYLWjgI=;
	b=Y0eOyjLpvEde/zVrwCk6Rw218bWsa5VOMTO7diLTeAg71GUQGbIarcPfqp18IwVZlS1q
	 N8gKpb0piO6c3TQHmUY+RiChn5UeZGlMNCMW2iSLPk6yxyimNa0+NTfy50WIBH28AUpFe
	 CR4zqsV0hFBt5DAD88Wd8Iuh4t9zxqrLHz8cuqUEuM/MxqFNm9eb2mkO5ikkow5l6fGbW
	 8jRZW99V2vuao9RwZprklfYxbaa5s6SzvqqpC/v8d5hgfayOFG0GT9Hbr1/YVh8KCC59E
	 /S60qFyul+TJ5laQpG5anSAuC+nDqVMhNHg1ckLIbjg7xx+PnrGmk8U7nucc7UsRglQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F6521F000E0;
	Sat, 21 Nov 2026 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264997;
	bh=de/zgkDFGYSdLBTnqb+HXEzXLJe1FdmuCcE9kYLWjgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CfjQ8HsHOb++jn8h4ZdL4G1coTf5ic9Yy3UCu9ihe0lTup0pfbQ7s9e1Zm1Ra76gy
	 RoYRxu9GPq3IeDNPWZodiODUd33mKo3SEtQJ24W82GpxT7dNfnIMkeLZvF2jj5Y1GR
	 1cTI9igu6ndZy82HoeYIySEq0rJW2WxKT+vkQGYsMxUMmBHCZ9Han9Xe/VH0Fk0ESW
	 U4sYzYTzqX2EwHswm/f0mjKhqQsoJu8em7WCQDEpdUl1KnuqFzKK2aGxqMgFPGENw5
	 z4mPVxwWFop80yWppqidQJJ6SJfBXMfqRA4Oww2E48ZlhHQydyjrjP4Q7D3EreyGP/
	 Oq8w+LkJZ+FlQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E8C0B4BC5A;
	Sat, 21 Nov 2026 12:43:13 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 21:43:20 +0900
Subject: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
In-Reply-To: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, soc@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795264991; l=3700;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=lLUcutGX6X4e7Y1C/cRp2+SQBhJ32ubOSzrRcMWPbOc=;
 b=v8DAdauk7XLOkFUVJ5JH3CmGSOAkceaCiwFKutb1k7uQ9l4PY0RQREgAM4lgKeBksqHFm2+o7
 QP3rzsSg6sgDz6tj2AXVG7CNK+hfpsO5ZCqcczyCS2U96T5fAH0Z2di
X-Developer-Key: i=yogo.0917.sabu@gmail.com; a=ed25519;
 pk=TIQ8Tk4xQrxyn8rmk3GI2f5qg/kO6g2KZm7YOOyBHeg=
X-Endpoint-Received: by B4 Relay for
 yogo.0917.sabu@gmail.com/ypl514-20261117 with auth_id=1550
X-Original-From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: yogo.0917.sabu@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>

Add a platform SDHCI host driver for the SiRF AT550 using programmed
I/O, as CPU-to-controller DMA address translation is not yet validated.

Use sdhci_pltfm_init() with default platform ops and
sdhci_pltfm_remove(), leaving bus width, clock limits, and
card-discovery constraints to the device tree.

Signed-off-by: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
---
 MAINTAINERS                    |  1 +
 drivers/mmc/host/Kconfig       | 10 +++++++++
 drivers/mmc/host/Makefile      |  2 ++
 drivers/mmc/host/sdhci-at550.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1164152dc..9d02a79a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25858,6 +25858,7 @@ F:	Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
 F:	drivers/clocksource/timer-at550.c
 F:	drivers/input/touchscreen/at550-ts.c
 F:	drivers/irqchip/irq-at550.c
+F:	drivers/mmc/host/sdhci-at550.c
 
 SIS 190 ETHERNET DRIVER
 M:	Francois Romieu <romieu@fr.zoreil.com>
diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 79bfc425e..72e7c279a 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1125,3 +1125,13 @@ config MMC_LITEX
 	  module will be called litex_mmc.
 
 	  If unsure, say N.
+
+config MMC_SDHCI_AT550
+	tristate "SiRF AT550 SDHCI host"
+	depends on MMC_SDHCI_PLTFM && OF
+	help
+	  Say Y to enable the AT550 removable SD host using programmed I/O.
+	  Firmware must configure the peripheral clock and pin multiplexing.
+	  DMA address translation is not supported by this initial driver.
+	  Card discovery and bus frequency are configured by the device tree.
+	  To build as a module, choose M; it will be called sdhci-at550.
diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index fd043afab..6f7b0dd14 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -115,3 +115,5 @@ endif
 
 obj-$(CONFIG_MMC_SDHCI_XENON)	+= sdhci-xenon-driver.o
 sdhci-xenon-driver-y		+= sdhci-xenon.o sdhci-xenon-phy.o
+
+obj-$(CONFIG_MMC_SDHCI_AT550) += sdhci-at550.o
diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at550.c
new file mode 100644
index 000000000..11c9de0c9
--- /dev/null
+++ b/drivers/mmc/host/sdhci-at550.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivalence. */
+#include <linux/mmc/host.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "sdhci-pltfm.h"
+
+static const struct sdhci_pltfm_data at550_sdhci_data = {
+	.quirks = SDHCI_QUIRK_BROKEN_DMA | SDHCI_QUIRK_BROKEN_ADMA,
+	.quirks2 = SDHCI_QUIRK2_NO_1_8_V,
+};
+
+static int at550_sdhci_probe(struct platform_device *pdev)
+{
+	struct sdhci_host *host;
+	int ret;
+
+	host = sdhci_pltfm_init(pdev, &at550_sdhci_data, 0);
+	if (IS_ERR(host))
+		return PTR_ERR(host);
+
+	ret = mmc_of_parse(host->mmc);
+	if (ret)
+		return ret;
+
+	sdhci_get_property(pdev);
+
+	return sdhci_add_host(host);
+}
+
+static const struct of_device_id at550_sdhci_of_match[] = {
+	{ .compatible = "sirf,at550-sdhci" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, at550_sdhci_of_match);
+
+static struct platform_driver at550_sdhci_driver = {
+	.probe = at550_sdhci_probe,
+	.remove = sdhci_pltfm_remove,
+	.driver = {
+		.name = "sdhci-at550",
+		.of_match_table = at550_sdhci_of_match,
+		.pm = &sdhci_pltfm_pmops,
+	},
+};
+module_platform_driver(at550_sdhci_driver);
+
+MODULE_DESCRIPTION("SiRF AT550 SDHCI PIO host");
+MODULE_LICENSE("GPL");

-- 
2.56.0



