Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55882606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0mL4bnPb;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=muRlSoiT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=; b=0mL4bnPbVj9vsZ
	4m4qW5aW9ghyZ1VhAVXOK0YM+U6bjP7Y3xl6+dX9g8DGta+IZCCdq9HNyoa2HugyiZOuPiJAI57tw
	4W2ontcrKT+bHAoBnfeNqcRQvNA5AkmOrqjvo01bFMcffEHIEF0JJ1Np+rQ3pvZTGBG5x25HEMVXz
	np8B3cvxlojxJELZaSGv4z4D49RMJL74kK2EJvfm6AVg5ly8kGhUOzzEvvWdEPL7J06Miy7ztkb5Z
	iEfzNhQAk5roB49qygYbgfOLCbpU8T40etbFRxrTvbkHTYXYE/3k0oU+1zVygLp6wTVGaqwzr8aBt
	mDnuosp6XQl+5C88V0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0XP-000000087Ca-072P;
	Wed, 25 Nov 2026 00:07:03 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0X0-000000086xg-2031
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:06:39 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-386b8f2f671so2345105eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565197; x=1796169997; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=;
        b=muRlSoiThgobSbVldw1mpy2Dvm911rXZptM9BszEXAfeO9daUDndxH7v4U82T3TT1C
         xo87m0TnJfhs9Gf5LU7EPTmoErDq6jcJcu3bFSTHwSEPstXOFhCCWiETqkLjyjlRJeUX
         kA9xiBvEXJe/IbUQNf0Ezcm2Ur9KEQVERARnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565197; x=1796169997;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=;
        b=o9V9kqW07N07S2kSvDYeBrAibzP+uAKA4uSmTxpCUgwjlc+7/V2AdTloA0HYPZVpmm
         /iv8G7TpVi/bkx4A01yqMSQOjDnJKdpShnL6lYTrtOu9O6sLNZqbnoqF1MVbivV5vLXq
         hvwtfIcy7GthoaqT4lxfgBhADts5JxnvCBqumNfTvdXGczUP4jPGlFXWwTSJfroX1ueM
         PwBod1gZcLqR9X/xiTIU49wGGAWEZmn3WAmh/a6Cl1cM9J3AODNIt/Z6tRQZg+0ADQ8x
         p942a1oxmuh/2TMPiIbBuVdkEWe6b+gBglWhhQ9ODrAnOojO92O1rNCoktxzxVeyKJSt
         7k/Q==
X-Forwarded-Encrypted: i=1; AL+hErGepjsLSdL40xkAnIyoIWlMUFC1j/Wdz8ML31TdGPKd9KkGHBOK/C1PMOvS1bFlM/SbN+iTclq9xFT0hefK4nUN@lists.infradead.org
X-Gm-Message-State: APuU4Z+i2eIVDtd0D+l5ySuKQdlm6mAx91jRQotPVoTi4r4RGKM0UzbO
	aAU/3FJzHlqlWCZc29slWXdvAH9K2K1VdBIoyhAsSz5D4XSSZv86Gdxees4fwSWObcIG0wqAX2Q
	9fBY=
X-Gm-Gg: AZFdTZdddVhwAfY5H9OFxS/oRctRQ++56IYhgAWy0MPD0XS5jRgzMxHbOoh/MtrDgvg
	/e31osbt/utUGSMVqY0dsr6mYC0PBSQvLBh8rD2nTZkzwiSq25trm7mlyGiuIuQSDThLIx36V5f
	Zt9OWwJwzldbc5PgdKleXXYPDxyBauhkllHbNyu1GPHE0kFdBfqjVBwij6jt2kWLPV7UbL3oIRP
	jvkqNt1fef1fne7nO2EzC4atmq2MXHasiuxQe7e3aB4O+RNl5WNaiHXZrgIohSDVaNCekiNcjjF
	p8OJJuXcTB4gpVOEdD9Y0J2+0ZskUROsnh9RwU0lijC1tAXeqnVAvB5MokQkUT1D+Bn9AcOXI0s
	oNPVuUTj9n3ZcWiRlZF/7lJsXTBiWi1IfR7oKho0RW94y1u6pPt9sgZgvGvSx95XeTlzLh1b8aO
	1P7vdH3cRuzLSsWO4gWVEmYuwPQt0N1mT1fQ0aQyhrM0AtiDPsP5S2CoKyzad1IXedewgAvDQqm
	h2ORzB0PQUdu0tWNoPjzLZeAxXl+M4dduiuVTLlaR1b3OEx/fOhUpH+bpeTtQ2NTcn/2bIoKXCM
	9ZDyk69rWzdfH5lH7mzn2Pr0lv5bnlmpsJYvJ1cWPIAJ7OneIl0rsKz8tm6xPTu5cdQe
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr6043229eec.34.1795565197480;
        Tue, 24 Nov 2026 16:06:37 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385666e99fdsm60034542eec.5.2026.11.24.16.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:36 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 6/9] irqchip/google-cpm: Add CPM IRQ driver
Date: Tue, 24 Nov 2026 16:03:40 -0800
Message-ID: <20261124160343.v2.6.I41e14e9460b3add41e69dac97abf57a741e9c4c5@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160638_536155_B95F8DE0 
X-CRM114-Status: GOOD (  26.38  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jim Wylder <jwylder@google.com>

The Central Power Manager (CPM) on Google Tensor SoCs can signal
events/interrupts over its mailbox communication protocol. Today, the
downstream driver for these chips only supports interrupt notification,
although the CPM firmware may also have mask/unmask support (not
currently used) that could be added later if needed.

In practice, this driver is used for RTC alarms and for events driven by
the Always-on Compute (AoC) subsystem.

Signed-off-by: Jim Wylder <jwylder@google.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Formatting requests from v1 review
 * Adapt to devm_cpm_register_rx_callback()
 * Update author/SoB to retain downstream heritage

 drivers/irqchip/Kconfig          |  10 +++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-google-cpm.c | 131 +++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 drivers/irqchip/irq-google-cpm.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8aee8f731848..ceaad2ab04f6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -556,6 +556,16 @@ config CSKY_APB_INTC
 	  by C-SKY single core SOC system. It uses mmio map apb-bus to visit
 	  the controller's register.
 
+config GOOGLE_CPM_IRQ
+	tristate "Google Tensor CPM interrupt controller"
+	depends on GOOGLE_CPM_MBA
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	select IRQ_DOMAIN
+	help
+	  Support for the Central Power Manager (CPM) interrupt controller
+	  found on Google Tensor SoCs. This controller routes interrupts from
+	  the CPM to the Application Processor.
+
 config IMX_IRQSTEER
 	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index eb539d41251e..ac6352d3b797 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
 obj-$(CONFIG_QCOM_MPM)			+= irq-qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
+obj-$(CONFIG_GOOGLE_CPM_IRQ)		+= irq-google-cpm.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
diff --git a/drivers/irqchip/irq-google-cpm.c b/drivers/irqchip/irq-google-cpm.c
new file mode 100644
index 000000000000..ce960b48f271
--- /dev/null
+++ b/drivers/irqchip/irq-google-cpm.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google CPM IRQ chip driver
+ *
+ * Copyright 2023-2026 Google LLC
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/types.h>
+#include <soc/google/cpm-service-ids.h>
+#include <soc/google/google-cpm-mba.h>
+
+#define CPM_IRQ_COUNT				512
+
+struct cpm_irq_info {
+	struct device		*dev;
+	struct irq_domain	*domain;
+};
+
+static void cpm_irq_process_irq_status(struct cpm_irq_info *info, u32 irq_number)
+{
+	int ret = generic_handle_domain_irq_safe(info->domain, irq_number);
+
+	if (ret)
+		dev_err(info->dev, "Error handling IRQ %u, error code %d\n", irq_number, ret);
+}
+
+static void cpm_irq_rx_callback(const struct cpm_payload *msg, void *priv)
+{
+	struct cpm_irq_info *info = priv;
+	u32 irq_number = msg->payload[0];
+
+	cpm_irq_process_irq_status(info, irq_number);
+}
+
+static void cpm_irq_domain_remove_action(void *data)
+{
+	struct irq_domain *domain = data;
+	unsigned int hwirq;
+
+	for (hwirq = 0; hwirq < CPM_IRQ_COUNT; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(domain, hwirq));
+
+	irq_domain_remove(domain);
+}
+
+static int cpm_irq_domain_map(struct irq_domain *d, unsigned int virq,
+			      irq_hw_number_t hwirq)
+{
+	struct cpm_irq_info *info = d->host_data;
+
+	if (hwirq >= CPM_IRQ_COUNT)
+		return -EINVAL;
+
+	irq_set_chip_data(virq, info);
+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
+
+	dev_dbg(info->dev, "Mapped hwirq %lu to virq %u\n", hwirq, virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops cpm_irq_domain_ops = {
+	.map	= cpm_irq_domain_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static int cpm_irq_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct cpm_irq_info *info;
+	struct cpm_handle *cpm;
+	int ret;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = dev;
+	auxiliary_set_drvdata(adev, info);
+
+	info->domain = irq_domain_create_tree(dev_fwnode(dev), &cpm_irq_domain_ops, info);
+	if (!info->domain) {
+		dev_err(dev, "Unable to add irq domain\n");
+		return -ENODEV;
+	}
+
+	ret = devm_add_action_or_reset(dev, cpm_irq_domain_remove_action, info->domain);
+	if (ret) {
+		dev_err(dev, "Failed to add irq domain removal action\n");
+		return ret;
+	}
+
+	cpm = devm_cpm_get_handle(dev);
+	if (IS_ERR(cpm))
+		return dev_err_probe(dev, PTR_ERR(cpm), "Failed to get CPM handle\n");
+
+	ret = devm_cpm_register_rx_callback(dev, cpm, CPM_AP_NS_IRQ_SERVICE,
+					    cpm_irq_rx_callback, info);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register CPM RX callback\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id cpm_irq_id_table[] = {
+	{ .name = "google_cpm_mba.irq" },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, cpm_irq_id_table);
+
+static struct auxiliary_driver cpm_irq_driver = {
+	.name		= "cpm-irq-chip",
+	.probe		= cpm_irq_probe,
+	.id_table	= cpm_irq_id_table,
+};
+module_auxiliary_driver(cpm_irq_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jim Wylder <jwylder@google.com>");
+MODULE_DESCRIPTION("Google CPM IRQ chip driver");
-- 
2.56.1.831.g720f3f5937-goog


