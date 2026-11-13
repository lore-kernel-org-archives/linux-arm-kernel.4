Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B242060A3820
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1KeJJHvX;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=DJ2J+tAo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ypJpX4Q0D6tdF54BhB7iOG7qhUH5EliBut7ri8IWw0E=; b=1KeJJHvX5CWJCE
	DBsZckZSAOcwXW6x6zICZHP7D04wOqFm68bQAIyawZy6tS7Icjm6e5u5DHE9MzC4cnq0iS2PExGFM
	CatQ15weK0zzD9vascyj3ESqclPSD3hZwVLlZCj/2ieqbrkZ/6Nwr4LccZ93/KZDCt4UDhFDAxpRx
	YluRdWo9NYBxLFOAoe2KlWys9O3dG1PbDrx/eE97D+opmEVu7gVmnJl06nKGVZYq+L37xm9XEqLMl
	UnbjMTcvRsgb4P2Dx+gz2t2UHrmGTVcCLD3F9riMY7MmI+nR/QxKBrQ9hEvc10b8f2gGykyFGbigf
	9LcYfPmj27HZq4bJwpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrgG-0000000D1yl-29nh;
	Fri, 13 Nov 2026 13:51:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrfi-0000000D1VK-2Rks;
	Fri, 13 Nov 2026 13:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=ypJpX4Q0D6tdF54BhB7iOG7qhUH5EliBut7ri8IWw0E=; b=DJ2J+tAoIaBD5MH8ytLNulakRQ
	U0JAYjRk/zl7AW0oSZFWG5hTimxh9g4Vg7arnb5h66i+SdvZeolMYu3Bi8xc2rxN66Zn7IELfVaMC
	iapam3CQTC2ltX3dwYH8jy8n4CEeYBBrTfBt14DSY5lpfirzV7VUSbajkFEFxs1KL88m98Ijs2por
	+wSQ5QpXvhhlOB/2qmg3fpG3fA3jXCH46WKA48ocUvJ2t11YdaRctrSRk0j9rAm9ejvXmHGvND4Cb
	J2m0vs3lQ71oUfSx2XmjsF4jULpaTTQuYoXl8+M3CoOodliXGPdXfKgdyqmw9zNlLq1MEpmmcX6x1
	HJKZBGEg==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 6/6] spi: rockchip: Add an atomic transfer function
Date: Fri, 13 Nov 2026 14:50:17 +0100
Message-ID: <20261113135017.1047959-7-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113135017.1047959-1-heiko@sntech.de>
References: <20261113135017.1047959-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_055030_624143_56AA6DFD 
X-CRM114-Status: GOOD (  19.70  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Rockchip SPI controllers are often used to handle SPI connected PMICs that
also handle system power-off events, like the RK806.

When the kernel signals the power-off, all the interrupts are already
disabled, so regular SPI with its mutexes and DMA transfers does not
work anymore.

Implement an atomic transfer function that does SPI transfers polling the
controller in a loop without any DMA or IRQ.

This can successfully handle the power-off command to RK806, but also
read back the 2 chip-id registers just fine before that, as a test.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/spi/spi-rockchip.c | 116 +++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index ce1629e5a513..7c9ded3b3720 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -7,12 +7,14 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/pm_runtime.h>
+#include <linux/reboot.h>
 #include <linux/scatterlist.h>
 
 #define DRIVER_NAME "rockchip-spi"
@@ -218,6 +220,19 @@ static inline void wait_for_tx_idle(struct rockchip_spi *rs, bool target_mode)
 	dev_warn(rs->dev, "spi controller is in busy state!\n");
 }
 
+/* atomic transfers only in host-mode */
+static inline void wait_for_tx_idle_atomic(struct rockchip_spi *rs)
+{
+	u32 sr;
+	int ret;
+
+	ret = readl_relaxed_poll_timeout_atomic(rs->regs + ROCKCHIP_SPI_SR, sr,
+						!(sr & SR_BUSY),
+						10, 5 * USEC_PER_MSEC);
+	if (ret)
+		dev_warn(rs->dev, "spi controller still in busy state!\n");
+}
+
 static u32 get_fifo_len(struct rockchip_spi *rs)
 {
 	u32 ver;
@@ -724,6 +739,69 @@ static bool rockchip_spi_can_dma(struct spi_controller *ctlr,
 	return xfer->len / bytes_per_word >= rs->fifo_len;
 }
 
+static int rockchip_spi_transfer_atomic(struct spi_device *spi, struct spi_message *msg)
+{
+	struct spi_controller *ctlr = spi->controller;
+	struct rockchip_spi *rs = spi_controller_get_devdata(ctlr);
+	struct spi_transfer *xfer;
+	int ret = 0;
+
+	spi_set_cs(spi, true, false);
+
+	/* make sure all interrupts are masked and status cleared */
+	writel_relaxed(0, rs->regs + ROCKCHIP_SPI_IMR);
+	writel_relaxed(0xffffffff, rs->regs + ROCKCHIP_SPI_ICR);
+
+	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+		WARN_ON(readl_relaxed(rs->regs + ROCKCHIP_SPI_SSIENR) &&
+			(readl_relaxed(rs->regs + ROCKCHIP_SPI_SR) & SR_BUSY));
+
+		rs->n_bytes = xfer->bits_per_word <= 8 ? 1 : 2;
+
+		ret = rockchip_spi_config(rs, spi, xfer, false, false);
+		if (ret < 0)
+			goto out_disable;
+
+		writel_relaxed(0, rs->regs + ROCKCHIP_SPI_RXFTLR);
+
+		rs->tx = xfer->tx_buf;
+		rs->rx = xfer->rx_buf;
+		rs->tx_left = rs->tx ? xfer->len / rs->n_bytes : 0;
+		rs->rx_left = xfer->len / rs->n_bytes;
+
+		spi_enable_chip(rs, true);
+
+		while (rs->tx_left || rs->rx_left) {
+			u32 status = readl_relaxed(rs->regs + ROCKCHIP_SPI_SR);
+
+			if (rs->tx_left && !(status & SR_TF_FULL))
+				rockchip_spi_pio_writer(rs);
+
+			if (rs->rx_left && !(status & SR_RF_EMPTY))
+				rockchip_spi_pio_reader(rs);
+		}
+
+		wait_for_tx_idle_atomic(rs);
+
+		spi_enable_chip(rs, false);
+
+		if (xfer->cs_change && !list_is_last(&xfer->transfer_list, &msg->transfers)) {
+			spi_set_cs(spi, false, false);
+			spi_transfer_cs_change_delay_exec(msg, xfer);
+			spi_set_cs(spi, true, false);
+		}
+	}
+
+out_disable:
+	spi_set_cs(spi, false, false);
+	msg->status = ret;
+
+	if (msg->complete)
+		msg->complete(msg->context);
+
+	return ret;
+}
+
 static int rockchip_spi_setup(struct spi_device *spi)
 {
 	struct rockchip_spi *rs = spi_controller_get_devdata(spi->controller);
@@ -752,6 +830,19 @@ static int rockchip_spi_setup(struct spi_device *spi)
 	return 0;
 }
 
+static int rockchip_spi_power_off(struct sys_off_data *data)
+{
+	struct rockchip_spi *rs = data->cb_data;
+	int ret;
+
+	/* enable controller for possible calls from shutdown handlers */
+	ret = pm_runtime_resume_and_get(rs->dev);
+	if (ret)
+		dev_warn(rs->dev, "spi controller failed to runtime resume: %d\n", ret);
+
+	return 0;
+}
+
 static int rockchip_spi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -860,6 +951,31 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 	ctlr->max_transfer_size = rockchip_spi_max_transfer_size;
 	ctlr->handle_err = rockchip_spi_handle_err;
 
+	/* Only register atomic transfer in host-mode */
+	if (!target_mode) {
+		ctlr->transfer_atomic = rockchip_spi_transfer_atomic;
+
+		ret = devm_register_sys_off_handler(&pdev->dev,
+						    SYS_OFF_MODE_POWER_OFF_PREPARE,
+						    SYS_OFF_PRIO_DEFAULT,
+						    &rockchip_spi_power_off, rs);
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret,
+				     "failed to register poweroff handler\n");
+			goto err_disable_pm_runtime;
+		}
+
+		ret = devm_register_sys_off_handler(&pdev->dev,
+						    SYS_OFF_MODE_RESTART_PREPARE,
+						    SYS_OFF_PRIO_DEFAULT,
+						    &rockchip_spi_power_off, rs);
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret,
+				     "failed to register restart handler\n");
+			goto err_disable_pm_runtime;
+		}
+	}
+
 	ctlr->dma_tx = dma_request_chan(rs->dev, "tx");
 	if (IS_ERR(ctlr->dma_tx)) {
 		/* Check tx to see if we need to defer driver probing */
-- 
2.53.0


