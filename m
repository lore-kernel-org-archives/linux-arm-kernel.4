Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D0D60A2600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fRsR5A46;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdOjy646
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tHeZv3ZliFEJTukVqg7SMz1pDdq8S6Vyf0qNndIQL6A=; b=fRsR5A46TOMb8B
	J4m3dw/81j892NCkWA0O8PIUeBesEdWBCPXdCpsbNGH1xAPu3HiYEc6Wtp9LXnwYi4/4PMAQd+Euj
	Atdv1F/Vm318Du3owVpEUqXhF+bFCYteGbERjYWIimEOfSpoy8H0P0NKJppwjBnfBF02dYaNOSQMX
	VkoIRgXpW47gUg0ktx0E0mS3vq9KsXDli4mHAa2rC40oXdGW2JcJ+8nXrY/iyvzfiPTXkizyj63Hf
	t7JTcKTfFlKDGIvNs84micP7vw904Fp2E94a4miH20GFY0v3Gei8ZcHB2vGiSMKY6Y9rsZ8pWpKvq
	4iQlclZGXVNvGojnFHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQXe-0000000FQY1-3YQZ;
	Fri, 20 Nov 2026 15:28:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQXC-0000000FQPu-0azv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:28:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C0B8B44310;
	Fri, 20 Nov 2026 15:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5861F000C4;
	Fri, 20 Nov 2026 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188497;
	bh=tHeZv3ZliFEJTukVqg7SMz1pDdq8S6Vyf0qNndIQL6A=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kdOjy646UeKmckP9axiN38fK0EIoqnI43F7Enwwln9V5btURw8JkwmPFb1godRbQN
	 JVO46Exg6f60GsDKV+Jk46WbQ/D9h+Qpo6wxseY0JQYIRxj1uSj1KHcS/qpIelPR6S
	 rrNouzuXLbmv7M8B5PlxRXUnt37itM5+nf4xpBAN258j0kRgpZNa9uQCaTHoHhANHP
	 FE/Jp3/M+HBUjBvKW32hk6K/+aJffUGPnNkAQaRbSVhl5f9Rt2ke3eoRPjOITSnXAv
	 bk+lZIkfWQpoSBUNDlg49gcjgDnvTHA32NfHFlRHd+J0Vf1q9F0NvaHF5EpowhweKV
	 ++uXyovi5rb/A==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash
 controller driver
From: Mark Brown <broonie@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
 stefandoesinger@gmail.com, krzk@kernel.org, Mark Brown <broonie@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-21-ghahramani.navid@gmail.com>
Date: Fri, 20 Nov 2026 15:28:09 +0000
Message-Id: <179518848943.6016.13945215542092138415.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8606; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ycCsxp5E+ZtDP/02xjAzwX77w+/YdEWtSaGWhSDPgJA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZ0rkPxuZvzgh/Nznpz/XfO3gatk38z9+wJDrxScira
 aLBER6GHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIzn1Ghj07kwv1Nof6nbrk
 mddwdHpaxg8mpncp0g0JP83OXHNM3cjwT9nw7a+ZdbPCcr+ZrfEx793TJ9DeuOhse1XRqzJHyZx
 gJgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add support for the SPI flash controller found on ZTE ZX family SoCs
> (ZX297520V3, ZX279128S). Implement tuned PIO to avoid redundant FIFO
> depth reads, dynamic CCF clock scaling, 4KB operation chunking, and
> optional DMA support.

> +config SPI_ZX
> +	tristate "ZTE ZX family SPI flash controller"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	depends on OF && HAS_IOMEM

There's no build time dependency on OF, it should have an ||
COMPILE_TEST.  The whole subsystem depends on HAS_IOMEM alraedy.

> @@ -0,0 +1,728 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) ZTE (for HW register defines and initial PIO implementation)
> + * Copyright (C) Stefan Dösinger 2026
> + * Author: Stefan Dösinger <stefandoesinger@gmail.com>
> + *
> + * This device has certain similarities to stm32-qspi, but it isn't as simple as remapping register
> + * offsets.
> + */

Please keep the entire comment block a C++ one.

> +//#define DEBUG

Shouldn't be upstream.

> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/sizes.h>
> +#include <linux/spi/spi-mem.h>

gpio/consumer.h, mutex.h, pinctrl/consumer.h, pm_runtime.h and sizes.h
are not used.

> +static irqreturn_t zx_qspi_irq(int irq, void *dev_id)
> +{
> +	struct zx_qspi *qspi = dev_id;
> +	struct device *dev = &qspi->ctrl->dev;
> +	u32 sw, raw = 0;
> +	/* The RAW_REG register reports the unmodified hardware status while the SW/CLR reg reports
> +	 * RAW_REG & INT_EN_REG.
> +	 *
> +	 * Beware that clearing a FIFO flag here doesn't do much - the RX fifo will still have data
> +	 * and the TX fifo will still have room, so it will re-raise the same int again. The
> +	 * solution is to mask the RX/TX ints and re-enable them after reading or filling the fifo.
> +	 *
> +	 * By and large IRQs from this controller are not very helpful. If we're in PIO mode we are
> +	 * forced to do a lot of busy waiting anyway because we have to drain/fill FIFOs every 64
> +	 * bytes. In ad-hoc benchmarking, doing PIO with IRQ notifications resulted in both slower
> +	 * reads as well as slower parallel CPU computation.
> +	 *
> +	 * In DMA mode we just piggypack on the DMA IRQ.
> +	 */
> +	sw = readl_relaxed(qspi->io_base + ZX_QSPI_INT_SW_CLR_REG);
> +	raw = readl_relaxed(qspi->io_base + ZX_QSPI_INT_RAW_REG);
> +
> +	dev_dbg(dev, "Got an IRQ, sw %x raw %x\n", sw, raw);
> +
> +	writel_relaxed(0, qspi->io_base + ZX_QSPI_INT_EN_REG);
> +
> +	return IRQ_HANDLED;
> +}

This doesn't check that it actually got an interrupt, it should return
IRQ_NONE if sw is clear.  If the interrupts are truly useless just don't
request the interrupt line.

> +/* IRQs for PIO aren't worth the bother. The hardware is sloppy with IRQs in larger (>2000 byte)
> + * transfers and in my testing it does not free up measurable amounts of CPU resources. DMA is the
> + * answer to better performance, not tuning PIO.
> + *
> + * To get IRQs for PIO operations set ZX_QSPI_{R/T}XFIFO_THRES to a non-zero value and enable
> + * ZX_QSPI_INT_{R/T}X_BYD_THES in ZX_QSPI_INT_EN_REG. Beware that the TX fifo will report empty
> + * until it is fed with data, so only unmask this interrupt after the pipe is full. Then either
> + * signal completion from zx_qspi_irq when it sees ZX_QSPI_INT_{R/T}X_BYD_THES and command
> + * completion or fill new data from the IRQ handler.
> + */
> +static int zx_qspi_read_fifo(struct zx_qspi *qspi, u32 len, u8 *val)
> +{
> +	struct device *dev = &qspi->ctrl->dev;
> +	u32 *p = (uint32_t *)val;
> +	u32 fifo, readval;
> +	u32 cnt = 0;
> +	int ret;
> +
> +	len = ALIGN(len, 4) >> 2;

This will read beyond the end of the buffer for anything that's not a
multiple of 4.  You should memcpy() the data into a local variable, and
use readsl()/writesl() for the I/O.

Similar issues on the write side.

> +static u32 zx_qspi_setup_dma(struct zx_qspi *qspi, const struct spi_mem_op *op)
> +{
> +	struct device *dev = &qspi->ctrl->dev;
> +	enum dma_transfer_direction dma_dir;
> +	u32 ctrl0 = 0;
> +	int ret;
> +
> +	qspi->cur_dma_ch = NULL;
> +	qspi->dma_desc = NULL;
> +	if (op->data.nbytes < ZX_QSPI_FIFO_SIZE * 4)
> +		return 0;
> +
> +	if (op->data.dir == SPI_MEM_DATA_IN && qspi->ctrl->dma_rx) {
> +		dma_dir = DMA_DEV_TO_MEM;
> +		ctrl0 |= ZX_QSPI_RX_DMA_EN;
> +		qspi->cur_dma_ch = qspi->ctrl->dma_rx;
> +	} else if (qspi->ctrl->dma_tx) {

We check the direction in the above branch but not here?

> +static int zx_qspi_set_speed(struct zx_qspi *qspi, unsigned int max_hz)
> +{
> +	unsigned long rate;
> +	long rounded;
> +	int ret;
> +
> +	if (!max_hz)
> +		return -EINVAL;
> +	if (qspi->speed_hz == max_hz)
> +		return 0;

Note that we'll store the speed we actually set, not the speed that was
requested, so if we don't achieve the requested speed we'll always try
again.  Perhaps it might work on retries if the rest of the clock tree
changes?

> +static int zx_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> +{
> +	struct zx_qspi *qspi = spi_controller_get_devdata(mem->spi->controller);
> +	u32 ctrl0, ctrl1 = 0, ctrl2 = 0, txstatus;
> +	struct device *dev = &qspi->ctrl->dev;
> +	dma_cookie_t cookie;
> +	int ret;

> +	if (op->addr.nbytes && op->addr.buswidth) {
> +		ctrl1 |= ZX_QSPI_ADDR_TX_EN;
> +		switch (op->addr.buswidth * op->addr.nbytes) {

Why do we multiply by buswidth here?

> +	/* dummy config */
> +	if (op->dummy.nbytes && op->dummy.buswidth) {
> +		ctrl1 |= ZX_QSPI_DUMMY_TX_EN;
> +		ctrl2 |= (0x1 << ZX_QSPI_DUMMY_BYTE_NUM);

This ignores nbytes, and we accept up to 15.

> +	if (op->data.nbytes && ctrl0 & (ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN)) {
> +		dev_dbg(dev, "Attempting DMA %x %s qspi 0x%08x...\n",
> +			ctrl0, ctrl0 & ZX_QSPI_TX_DMA_EN ? "tx" : "rx",
> +			(unsigned int)qspi);

If you need the cast something is wrong; print pointers with %p.

> +		} else {
> +			dma_async_issue_pending(qspi->cur_dma_ch);
> +
> +			if (!wait_for_completion_io_timeout(&qspi->dma_completion,
> +					 msecs_to_jiffies(2000))) {
> +				dev_err(dev, "DMA timed out\n");
> +				spi_controller_dma_unmap_mem_op_data(qspi->ctrl, op, &qspi->sgt);
> +				return -EIO;

We need dmaengine_terminate_sync() to clean up the DMA.

> +	ret = readl_relaxed_poll_timeout_atomic(qspi->io_base + ZX_QSPI_INT_RAW_REG,
> +						txstatus, txstatus & ZX_QSPI_INT_CMD_END, 1,
> +						1000);
> +	if (ret) {
> +		dev_err(dev, "Wait for transfer end failed: %u.\n", ret);

ret is signed.

> +static int zx_qspi_probe(struct platform_device *pdev)
> +{
> +	struct dma_slave_config dma_cfg = {0};
> +	struct device *dev = &pdev->dev;
> +	struct spi_controller *ctrl;
> +	struct zx_qspi *qspi;
> +	struct resource *res;
> +	int irq, ret;
> +	u32 reg;
> +
> +	dev_info(dev, "ZX QSPI Controller driver initializing\n");

This has no information, drop it.

> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	qspi->phys_base = res->start;

We didn't check the return value before using it.

> +	qspi->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);

The binding doesn't have any resets.

> +	dma_cfg.direction = DMA_DEV_TO_MEM;
> +	qspi->ctrl->dma_rx = devm_dma_request_chan(dev, "rx");

Nor DMAs. 

> +	if (IS_ERR(qspi->ctrl->dma_rx)) {
> +		dev_info(dev, "Cannot get RX DMA, using PIO\n");
> +		qspi->ctrl->dma_rx = NULL;
> +	} else {
> +		if (dmaengine_slave_config(qspi->ctrl->dma_rx, &dma_cfg)) {
> +			dev_info(dev, "Cannot configure RX DMA, using PIO\n");
> +			dma_release_channel(qspi->ctrl->dma_rx);

This was requested using devm so this will cause a double free.

> +	ctrl->bus_num = -1;
> +	ctrl->dev.of_node = dev->of_node;

These are configured by the core.

> +static void zx_qspi_remove(struct platform_device *pdev)
> +{
> +	struct zx_qspi *qspi = platform_get_drvdata(pdev);
> +
> +	writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);

You used devm_spi_register_controller() so the controller is still live
at this point.

-- 
Mark Brown <broonie@kernel.org>

