Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B277E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hG9tXEbO;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VgdWL6Co
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9S9tN7UC/k2a0xucopDHn/VY8Xvt9IuOwi3Cr6/Dd8Q=; b=hG9tXEbO+BrGqU
	iy8pmJTBdWAxSpbM0R79Hn+f+HD5tAEf8zkPBH9rMhotYOWifYUEVoIrmKqAqNeMQnc2wV8QamA3X
	H3TUakHYNO+46ePgXL8nlphF+zwJpB1iPw2PWezcfLw0j7SwpnCcCxFQ0w0fTOxa7qlYXB0BeouKD
	Si5rZoqacZTbj1YwmsknsBTyUH6AiHfA+4gW6NXzo16bz1PLWxGWxN3ZED1sbAT1P2BjCngEvm332
	WRTypug0UpUp+DGLxkWNkIqmlw5Lwd7l9mKjEYxXbyKyu3/KG/6IcY3T/VXnuztUbhoL19YIItvwR
	4Vn/IXLXtHkDqdxS7Tdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU45Z-0000000CSVz-2BSn;
	Thu, 19 Nov 2026 15:30:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU45S-0000000CSRp-3a5G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:30:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 947B1C4CBEF;
	Thu, 19 Nov 2026 15:30:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A88D60237;
	Thu, 19 Nov 2026 15:30:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14A1311BC0B70;
	Thu, 19 Nov 2026 16:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795102207; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9S9tN7UC/k2a0xucopDHn/VY8Xvt9IuOwi3Cr6/Dd8Q=;
	b=VgdWL6Cob9A83peOgwEFNwz1hLTUl55tWfO9geMGEMJ5oSQ+K1AaPQiwk4rOpqW2nD/Lzn
	TJvhGhDf1b8C9WV5fUh/dW0y0+a9UsyHyK4qFi1cQA8rdPLNmRIGVGnfnXZh8snNqEVTPw
	OTRFchUDtSPWTU1LfNq8QJjkoN0z9FAy8Xn63tLJUgavgmbun28M7lKKtgB4SsM4R9nNqh
	S8ONfpp/vZNOs9uRcoJw8Kn7+CjidmxA5TMiZNgC8cKFRs89PBzsvi3+YyKJ3OfyASkzKP
	MUOCFpL/9o1zLQA6z1m/Ht7gXTXyKsoQ/8kz5X4By+P3505Nffj0QCMxo0IR2w==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 2/3] mailbox: marvell-mhu: add Marvell MHU driver
Date: Thu, 19 Nov 2026 16:29:43 +0100
Message-ID: <20261119152944.276763-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119152944.276763-1-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_073011_057380_0137205D 
X-CRM114-Status: GOOD (  28.47  )
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

From: George Cherian <gcherian@marvell.com>

Add support for Message Handling Units on Marvell OcteonTx and OcteonTx2
platforms. The module uses mailbox controller interface to provide
communication between SCP and AP using SCMI protocol over a single
shared memory communication channel.

Signed-off-by: George Cherian <gcherian@marvell.com>
Co-developed-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 MAINTAINERS                   |   1 +
 drivers/mailbox/Kconfig       |  11 ++
 drivers/mailbox/Makefile      |   2 +
 drivers/mailbox/marvell_mhu.c | 267 ++++++++++++++++++++++++++++++++++
 4 files changed, 281 insertions(+)
 create mode 100644 drivers/mailbox/marvell_mhu.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b592a62a5c56..63042166c0da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15964,6 +15964,7 @@ M:	Sujeet Baranwal <sbaranwal@marvell.com>
 M:	George Cherian <gcherian@marvell.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mailbox/marvell,mhu.yml
+F:	drivers/mailbox/marvell_mhu.c
 
 MATROX FRAMEBUFFER DRIVER
 L:	linux-fbdev@vger.kernel.org
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..ce3b70749a18 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -195,6 +195,17 @@ config MAILBOX_TEST
 	  Test client to help with testing new Controller driver
 	  implementations.
 
+config MARVELL_MHU
+	tristate "Marvell Message Handling Unit"
+	depends on (ARM64 || COMPILE_TEST) && 64BIT
+	depends on OF
+	help
+	  This driver adds support for Marvell MHU controller.
+	  The MHU mailbox is used by SCMI for OcteonTX and OcteonTX2
+	  to control various aspects of platform operation like cpufreq
+	  or sensors. The controller supports single channel to SCP.
+	  Say Y here to build this module. If unsure say N.
+
 config POLARFIRE_SOC_MAILBOX
 	tristate "PolarFire SoC (MPFS) Mailbox"
 	depends on HAS_IOMEM
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 45dc59bb3e7f..83b26e7bbd27 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -49,6 +49,8 @@ obj-$(CONFIG_BCM_PDC_MBOX)	+= bcm-pdc-mailbox.o
 
 obj-$(CONFIG_BCM_FLEXRM_MBOX)	+= bcm-flexrm-mailbox.o
 
+obj-$(CONFIG_MARVELL_MHU)	+= marvell_mhu.o
+
 obj-$(CONFIG_POLARFIRE_SOC_MAILBOX)	+= mailbox-mpfs.o
 
 obj-$(CONFIG_MCHP_SBI_IPC_MBOX)		+= mailbox-mchp-ipc-sbi.o
diff --git a/drivers/mailbox/marvell_mhu.c b/drivers/mailbox/marvell_mhu.c
new file mode 100644
index 000000000000..a037fe104195
--- /dev/null
+++ b/drivers/mailbox/marvell_mhu.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Marvell Message Handling Unit
+ *
+ * Copyright (c) 2023, 2026 Marvell
+ */
+
+#define DRIVER_NAME	"marvell-mhu"
+
+#define pr_fmt(fmt)	DRIVER_NAME ": " fmt
+
+#include <linux/pci.h>
+#include <linux/acpi.h>
+#include <linux/mailbox_controller.h>
+
+#define BAR0		0
+#define SCP_INDEX	0x0
+#define DEV_AP0		0x2
+#define SCP_TO_AP_INTERRUPT	2
+#define INT_VECS_MIN	0
+#define INT_VECS_MAX	3
+
+#define XCPX_DEVY_XCP_MBOX_LINT_OFFSET	0x000E1C00
+#define XCP_TO_DEV_XCP_MBOX_LINT(xcp_core, device_id)  \
+	(XCPX_DEVY_XCP_MBOX_LINT_OFFSET | \
+	((uint64_t)(xcp_core) << 36) | \
+	((uint64_t)(device_id) << 4))
+
+#define AP0_TO_SCP_MBOX_LINT    XCP_TO_DEV_XCP_MBOX_LINT(SCP_INDEX, DEV_AP0)
+
+/*
+ * Doorbell-Register: XCP(0..1)_DEV(0..7)_XCP_MBOX
+ * Communication data from devices to XCP. When written, sets
+ * XCP(0..1)_DEV(0..7)_XCP_MBOX.
+ * PS: it doesn't matter what is written into this register,
+ * Attempting to writing 'anything' would cause an interrupt
+ * to the target!
+ */
+
+#define XCPX_DEVY_XCP_MBOX_OFFSET	0x000E1000
+#define XCP_TO_DEV_XCP_MBOX(xcp_core, device_id) \
+	(XCPX_DEVY_XCP_MBOX_OFFSET | \
+	((uint64_t)(xcp_core) << 36) | \
+	((uint64_t)(device_id) << 4))
+
+/* AP0-to-SCP doorbell */
+#define AP0_TO_SCP_MBOX         XCP_TO_DEV_XCP_MBOX(SCP_INDEX, DEV_AP0)
+
+/*  Register offset: Enable interrupt from SCP to AP */
+#define XCP0_XCP_DEV0_MBOX_RINT_ENA_W1S	0x000D1C40
+#define XCP0_XCP_DEV1_MBOX_RINT_ENA_W1S	0x000D1C50
+#define XCP0_XCP_DEV2_MBOX_RINT_ENA_W1S	0x000D1C60
+#define XCP0_XCP_DEV3_MBOX_RINT_ENA_W1S	0x000D1C70
+
+/* Rx interrupt from SCP to Non-secure AP (linux kernel) */
+#define XCPX_XCP_DEVY_MBOX_RINT_OFFSET 0x000D1C00
+#define XCPX_XCP_DEVY_MBOX_RINT(xcp_core, device_id) \
+	(XCPX_XCP_DEVY_MBOX_RINT_OFFSET | \
+	((uint64_t)(xcp_core) << 36) | \
+	((uint64_t)(device_id) << 4))
+
+/* The interrupt status register */
+#define SCP_TO_AP0_MBOX_RINT  XCPX_XCP_DEVY_MBOX_RINT(SCP_INDEX, DEV_AP0)
+
+#define XCPX_XCP_DEVY_MBOX_RINT_OFFSET	0x000D1C00
+#define XCPX_XCP_DEVY_MBOX_RINT(xcp_core, device_id) \
+	(XCPX_XCP_DEVY_MBOX_RINT_OFFSET | \
+	((uint64_t)(xcp_core) << 36) | \
+	((uint64_t)(device_id) << 4))
+
+#define SCP_TO_AP0_MBOX_RINT  XCPX_XCP_DEVY_MBOX_RINT(SCP_INDEX, DEV_AP0)
+#define SCP_TO_DEV0 XCPX_XCP_DEVY_MBOX_RINT(0, 0)
+#define SCP_TO_DEV1 XCPX_XCP_DEVY_MBOX_RINT(0, 1)
+#define SCP_TO_DEV2 XCPX_XCP_DEVY_MBOX_RINT(0, 2)
+#define SCP_TO_DEV3 XCPX_XCP_DEVY_MBOX_RINT(0, 3)
+
+struct mrvl_mhu {
+	/* SCP link information */
+	void __iomem *base; /* tx_reg, rx_reg */
+
+	struct mbox_controller ctrl;
+	struct mbox_chan chan;
+};
+
+static irqreturn_t mrvl_mhu_rx_interrupt(int irq, void *p)
+{
+	struct mrvl_mhu *mhu = p;
+	u64 val;
+
+	/* Read interrupt status register */
+	val = readq_relaxed(mhu->base + SCP_TO_AP0_MBOX_RINT);
+	if (val) {
+		/* Clear the interrupt : Write on clear */
+		writeq_relaxed(1ul, mhu->base + SCP_TO_AP0_MBOX_RINT);
+		/* Poke mbox */
+		mbox_chan_received_data(&mhu->chan, (void *)&val);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int mrvl_mhu_send_data(struct mbox_chan *chan, void *data)
+{
+	const u64 doorbell = 0xff;  /* Arbitrary value, SCP requires a value */
+	struct mrvl_mhu *mhu = chan->con_priv;
+
+	/* signal SCP */
+	iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
+
+	return 0;
+}
+
+static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
+{
+	struct mrvl_mhu *mhu = chan->con_priv;
+	u64 status;
+
+	status = ioread64(mhu->base + XCPX_XCP_DEVY_MBOX_RINT(0, 2));
+
+	return status != 0;
+}
+
+static int mrvl_mhu_startup(struct mbox_chan *chan)
+{
+	struct mrvl_mhu *mhu = chan->con_priv;
+
+	/* Enable interrupts only if there is client for data */
+	writeq_relaxed(1ul, mhu->base + XCP0_XCP_DEV2_MBOX_RINT_ENA_W1S);
+
+	return 0;
+}
+
+/* Define operations related to mbox */
+static const struct mbox_chan_ops mrvl_mhu_chan_ops = {
+	.startup = mrvl_mhu_startup,
+	.send_data = mrvl_mhu_send_data,
+	.last_tx_done = mrvl_mhu_last_tx_done,
+};
+
+static int mrvl_mhu_setup_irq(struct pci_dev *pdev)
+{
+	struct device *dev;
+	struct mrvl_mhu *mhu;
+	int irq, ret, nvec;
+
+	mhu = pci_get_drvdata(pdev);
+	dev = &pdev->dev;
+
+	nvec = pci_alloc_irq_vectors(pdev, INT_VECS_MIN, INT_VECS_MAX, PCI_IRQ_MSIX);
+	if (nvec < 0)
+		return nvec;
+
+	irq = pci_irq_vector(pdev, SCP_TO_AP_INTERRUPT);
+	if (irq < 0) {
+		ret = irq;
+		goto irq_err;
+	}
+
+	ret = devm_request_irq(dev, irq, mrvl_mhu_rx_interrupt,
+			       0, "mvl-mhu", mhu);
+	if (ret)
+		goto irq_err;
+
+	return 0;
+
+irq_err:
+	pci_free_irq_vectors(pdev);
+
+	return ret;
+}
+
+static const struct of_device_id mrvl_mhu_dt_ids[] = {
+	{ .compatible = "marvell,octeontx-mhu" },
+	{ .compatible = "marvell,octeontx2-mhu" },
+	{ .compatible = "marvell,cn10-mhu" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mrvl_mhu_dt_ids);
+
+#define PCI_DEVICE_ID_CAVIUM_OCTEON_MHU	0xa067
+static const struct pci_device_id mrvl_mhu_ids[] = {
+	{ PCI_VDEVICE(CAVIUM, PCI_DEVICE_ID_CAVIUM_OCTEON_MHU) },
+	{ 0 },
+};
+MODULE_DEVICE_TABLE(pci, mrvl_mhu_ids);
+
+static int mrvl_mhu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct mrvl_mhu *mhu;
+	int ret;
+
+	/* Only support PCI devices with a corresponding OF node. */
+	if (!dev->of_node)
+		return -ENODEV;
+	if (!of_match_node(mrvl_mhu_dt_ids, dev->of_node))
+		return -EINVAL;
+
+	mhu = devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
+	if (!mhu)
+		return -ENOMEM;
+
+	mhu->chan = (struct mbox_chan) {
+		.con_priv = mhu,
+	};
+
+	mhu->ctrl = (struct mbox_controller){
+		.chans = &mhu->chan,
+		.num_chans = 1,
+		.txdone_poll = true,
+		.txpoll_period = 100,
+		.ops = &mrvl_mhu_chan_ops,
+		.dev = dev,
+	};
+
+	pci_set_drvdata(pdev, mhu);
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	ret = pcim_request_region(pdev, BAR0, DRIVER_NAME);
+	if (ret)
+		return ret;
+
+	mhu->base = pcim_iomap(pdev, BAR0, pci_resource_len(pdev, BAR0));
+	if (!mhu->base)
+		return -EINVAL;
+
+	/* Configure IRQ from SCP to AP */
+	ret = mrvl_mhu_setup_irq(pdev);
+	if (ret)
+		return ret;
+
+	ret = mbox_controller_register(&mhu->ctrl);
+	if (ret) {
+		pci_free_irq_vectors(pdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mrvl_mhu_remove(struct pci_dev *pdev)
+{
+	struct mrvl_mhu *mhu = pci_get_drvdata(pdev);
+
+	mbox_controller_unregister(&mhu->ctrl);
+	pci_free_irq_vectors(pdev);
+}
+
+static struct pci_driver mrvl_mhu_driver = {
+	.name = DRIVER_NAME,
+	.id_table = mrvl_mhu_ids,
+	.probe = mrvl_mhu_probe,
+	.remove = mrvl_mhu_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = mrvl_mhu_dt_ids,
+	},
+};
+module_pci_driver(mrvl_mhu_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Marvell Message Handling Unit");
+MODULE_AUTHOR("Sujeet Baranwal <sbaranwal@marvell.com>");
+MODULE_AUTHOR("George Cherian <gcherian@marvell.com>");
-- 
2.47.3


