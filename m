Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFF960A2622
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bjbplNt0;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SATt0x6K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fq6yFeIpFYUq9GidwudNaGDfTK+jNPkZlihcuSaBGS4=; b=bjbplNt0VypItm
	ERCTi3M4LIkeP6drHoDyPt61DSJGZENHKfdTYgd/L6kNrVLdGKkD6u8TJJm9Dv5HAj33hAD+cZCdK
	bhPcoQ+4K5/SAv6IddzTz8g2pb5h9o13HaK39WzASvplu2BvWqJWh++mX9OncLB3blew8S7IsbBZg
	si0vThMw7e2aCuMocVBZqU5kHwqWVmIIYPPreaHG/SvzZo4j3HQ9q081xRcO6Z/2KYtOA1fm7l8EX
	5qxmSoMXKsoSLcW1oB1IbR2SRSkTqXwZOFDQjC7QpFVW1ddiL65YTnTH6QY5DoggWuB8J5yk9b1zh
	eFKpP23vhV2DVQbO6+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVS5-00000003pZl-2wFy;
	Mon, 23 Nov 2026 14:55:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQY-00000003oXR-2D2Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso25197865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445633; x=1796050433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq6yFeIpFYUq9GidwudNaGDfTK+jNPkZlihcuSaBGS4=;
        b=SATt0x6KR9KozSzf7gpjdx+MWiHB1gcI2fLauwWGZr5HXK73j4guHFkCK5Jzzm2Bsz
         d91H8dsJ9qAxFw9z752dVIAHXEyZJwAg+URTjcXhpRuPyDbqxF37HHdfCvQqo4/aOAxr
         GP8+VoE97B6ptp2Swi/fLqP9nkgIodvAw2y3rMjjNfPHE0nVY4lmYlcZCohn62TB7q6h
         Rq208LJghQTcNHYbTPQPWE/V+Hnf+p+vpZPtZ3x3E8bPG8BiA70etYba/R5PsXterUen
         OIOgNdDzz1tLPJHp792XMIGgpoXH8uIt58KM4D7mf1qa/LBrTRyEX1Ms+Qq1NWLY6C8u
         a/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445633; x=1796050433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq6yFeIpFYUq9GidwudNaGDfTK+jNPkZlihcuSaBGS4=;
        b=AIcgNhrgh0lT7ohFNnKxvvXwEgsVbBC5cosJD1wXgfXsRFb/ZKJurq+H3LUyCsVpUn
         HqIbUXcVMXqwX40zjebK4YgKHgbFs1GcbmqNch4vDwsUxV/PgBz51uVw97uq4JJ4E8RJ
         07xOCiy79+UZzsymeG6Bjs4rYpV9jDVpLFdRIzw+3QgJmbwVLLjPhKnwNo6xuW6klz3/
         A9qacIQHfqI2BE29xt6MiGJbhbvCB7aJ5HvW4/86yM5Q7e4Zi2qJYxtkvaH7ylbXrGcZ
         mwQYlHN/QlvBT760d3I45GHP4gV4rHbiBQq9KMIIuXPUaPUQqVOBWAVS+gok5kfl6+eZ
         eldw==
X-Forwarded-Encrypted: i=1; AL+hErGXXYtJX9Ugmhpg6p118YC1dnpJHSte0tObQqr6/07lEnwY+jKyJTi2szCQU8uLPugMfCBo8qyEj9fJCzR1wOoD@lists.infradead.org
X-Gm-Message-State: APuU4Z+VMDQd1WsfCyMcrebIAohBg1n6GSgPat867nw8pXBlCoLBa5GJ
	q4xA+tDkv7WT1Cepu4dTZ19zAs0ukN4S1nX5R2b6RUoEhvzydUT1v4kQ43TBSOmDSqM=
X-Gm-Gg: AZFdTZf/ftadp8Jg8D6uGnvo2crQMxm5fulWXc7tGb/txR7gxi2aSEPHQgbHdy4hurq
	Zg8/qV9PmmtpAcA/YCiFpbKntD6V2QanJWF94gfwK9wiQpupEqrzO/5itV8NCXc3z3fdQqLLSHJ
	aSlxRS/0ETFYioCGV6Em5Nf5bSRXAvWLC6Y8RlHN+/9sEvjFpN33GXWMh6GsOquztO0vst3Gh4Z
	TKXgN6HYOLTUdCaao7bNncUX6+OFFx6JOLHxpkiOYNDQB2oh/N1oe6e/hAwCRm7+aIpDwwOD34C
	IDo4E9RWcvpk4x3FoDkZVsc3mrXgZxxiXbOe02f7uM758xHfb1C0gCjixs1f+S1W5snZqXfPhsq
	52xrL0CPb0ps/dMAspG72t1P9JLeqPBxW4J3s2UglmMULotfIlcrChG9PJoMy0hB2xiq53vpZNe
	MeCe5/pC+Y2MXbekKn332q2PdusLIo/ZOpXXYoeq5gOBO+3Wtssx/5ePGjC6oeNPA0+bNi5wQG0
	H9j5bVST7FZlU5lyCZS3t53NhJKpfhonDdQn+gtIUaofHI6NCrXdZAeBFbgj1Ux1+u6VIZCX+NV
	6hkdqA3ZjEddwuNrkpPCLgw9Z2M=
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb888120famr244703865e9.16.1795445632908;
        Mon, 23 Nov 2026 06:53:52 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm362775075e9.1.2026.11.23.06.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:52 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 14/28] dmaengine: bcm2835: Use dma_map_resource() to translate slave addresses
Date: Mon, 23 Nov 2026 15:56:52 +0100
Message-ID: <20261123145728.29082-15-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065355_752315_61F7C1CE 
X-CRM114-Status: GOOD (  32.38  )
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

Slave addresses in struct dma_slave_config are CPU physical addresses
and it is up to the DMA controller driver to translate them into the
addresses it has to program into the hardware. The BCM2835 DMA driver
instead uses them verbatim, which only works because its clients pass
pre-translated bus addresses read straight from their DT node, bypassing
the bus translations described there.

Translate the addresses with dma_map_resource(), which applies the
dma-ranges of the DMA controller since the conversion of
dma_map_resource() to dma_map_phys() with DMA_ATTR_MMIO, and map them
once in device_config() instead of at every prep call. The mappings are
released when the channel is reconfigured or freed.

Existing device trees only describe the RAM in dma-ranges, so
dma_map_resource() would fail for any peripheral. Detect this case at
probe time, by looking for the controller registers themselves in the
dma-ranges of the closest ancestor bus, and fall back to reverting the
translation given by the ranges property of the parent bus, which is
how the VideoCore bus addresses of the peripherals have been derived so
far. Addresses not covered by those ranges are passed through, so that
clients still providing bus addresses keep working.

The fallback translation is a platform callback, as different kinds of
channels see the peripherals at different addresses; implement the one
of the legacy channels.

Link: https://lore.kernel.org/linux-arm-kernel/ee19a95d-fe1e-4f3f-bc81-bdef38475469@arm.com/
Link: https://lore.kernel.org/all/CAPY8ntByJYzSv0kTAc1kY0Dp=vwrzcA0oWiPpyg7x7_BQwGSnA@mail.gmail.com/
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 180 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 175 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index f8b2202096d6..3ff30c41dc63 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -30,6 +30,7 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_dma.h>
 
 #include "virt-dma.h"
@@ -43,12 +44,16 @@
  * @base: base address of register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
+ * @cfg: platform specific description of the DMA channels
+ * @map_resource: the peripheral window is described by dma-ranges, so slave
+ *	addresses can be translated with dma_map_resource()
  */
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
 	dma_addr_t zero_page;
 	const struct bcm2835_dma_cfg *cfg;
+	bool map_resource;
 };
 
 struct bcm_dma_cb {
@@ -70,10 +75,24 @@ struct bcm2835_cb_entry {
 	dma_addr_t paddr;
 };
 
+/**
+ * struct bcm2835_slave_addr - bus address of a slave FIFO
+ * @addr: address as seen by the DMA controller
+ * @size: size of the mapping
+ * @mapped: @addr has been obtained from dma_map_resource()
+ */
+struct bcm2835_slave_addr {
+	dma_addr_t addr;
+	size_t size;
+	bool mapped;
+};
+
 struct bcm2835_chan {
 	struct virt_dma_chan vc;
 
 	struct dma_slave_config	cfg;
+	struct bcm2835_slave_addr slave_src;
+	struct bcm2835_slave_addr slave_dst;
 	unsigned int dreq;
 
 	int ch;
@@ -106,6 +125,8 @@ struct bcm2835_chan {
  * @read_addr: read the current memory side address of a channel
  * @cs_flags: per-channel flags for the CS register
  * @abort: stop and reset a channel
+ * @legacy_bus_addr: translate a slave address for device trees which do not
+ *	describe the peripheral window in dma-ranges
  */
 struct bcm2835_dma_cfg {
 	u32 cs_reg;
@@ -138,6 +159,8 @@ struct bcm2835_dma_cfg {
 				enum dma_transfer_direction direction);
 	u32 (*cs_flags)(struct bcm2835_chan *c);
 	void (*abort)(struct bcm2835_chan *c);
+
+	u64 (*legacy_bus_addr)(struct device *dev, phys_addr_t phys);
 };
 
 struct bcm2835_desc {
@@ -798,11 +821,30 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 			   c->irq_flags, "DMA IRQ", chan);
 }
 
+static void bcm2835_dma_unmap_slave_addr(struct dma_chan *chan,
+					 struct bcm2835_slave_addr *sa,
+					 enum dma_data_direction dir)
+{
+	if (sa->mapped)
+		dma_unmap_resource(chan->device->dev, sa->addr, sa->size, dir, 0);
+
+	memset(sa, 0, sizeof(*sa));
+}
+
+static void bcm2835_dma_unmap_slave_addrs(struct dma_chan *chan)
+{
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+
+	bcm2835_dma_unmap_slave_addr(chan, &c->slave_src, DMA_FROM_DEVICE);
+	bcm2835_dma_unmap_slave_addr(chan, &c->slave_dst, DMA_TO_DEVICE);
+}
+
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
+	bcm2835_dma_unmap_slave_addrs(chan);
 	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
@@ -925,11 +967,11 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		src = c->cfg.src_addr;
+		src = c->slave_src.addr;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		dst = c->cfg.dst_addr;
+		dst = c->slave_dst.addr;
 	}
 
 	/* count frames in sg list */
@@ -987,12 +1029,12 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		src = c->cfg.src_addr;
+		src = c->slave_src.addr;
 		dst = buf_addr;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		dst = c->cfg.dst_addr;
+		dst = c->slave_dst.addr;
 		src = buf_addr;
 	}
 
@@ -1019,10 +1061,87 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
 }
 
+/*
+ * Device trees which do not describe the peripheral window in dma-ranges
+ * are handled by assuming that the legacy DMA channels see the peripherals
+ * at the same address as the bus they sit on, i.e. by reverting the
+ * translation described by the ranges property of the parent bus. This is
+ * how the VideoCore bus addresses have always been derived. Addresses which
+ * are not CPU physical addresses of that bus are passed through unchanged,
+ * as legacy clients used to provide bus addresses.
+ */
+static u64 bcm2835_dma_legacy_bus_addr(struct device *dev, phys_addr_t phys)
+{
+	struct device_node *bus = of_get_parent(dev->of_node);
+	struct of_range_parser parser;
+	struct of_range range;
+	u64 addr = phys;
+
+	if (bus && !of_range_parser_init(&parser, bus)) {
+		for_each_of_range(&parser, &range) {
+			if (phys >= range.cpu_addr &&
+			    phys - range.cpu_addr < range.size) {
+				addr = range.bus_addr + (phys - range.cpu_addr);
+				break;
+			}
+		}
+	}
+
+	of_node_put(bus);
+
+	return addr;
+}
+
+static int bcm2835_dma_map_slave_addr(struct dma_chan *chan,
+				      struct bcm2835_slave_addr *sa,
+				      phys_addr_t phys,
+				      enum dma_slave_buswidth width,
+				      enum dma_data_direction dir)
+{
+	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
+	struct device *dev = chan->device->dev;
+	size_t size = width ? width : DMA_SLAVE_BUSWIDTH_4_BYTES;
+
+	if (!phys)
+		return 0;
+
+	if (!od->map_resource) {
+		sa->addr = od->cfg->legacy_bus_addr(dev, phys);
+		return 0;
+	}
+
+	sa->addr = dma_map_resource(dev, phys, size, dir, 0);
+	if (dma_mapping_error(dev, sa->addr)) {
+		dev_err(dev, "failed to map slave address %pa\n", &phys);
+		sa->addr = 0;
+		return -EINVAL;
+	}
+
+	sa->size = size;
+	sa->mapped = true;
+
+	return 0;
+}
+
 static int bcm2835_dma_slave_config(struct dma_chan *chan,
 				    struct dma_slave_config *cfg)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+	int ret;
+
+	bcm2835_dma_unmap_slave_addrs(chan);
+
+	ret = bcm2835_dma_map_slave_addr(chan, &c->slave_src, cfg->src_addr,
+					 cfg->src_addr_width, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	ret = bcm2835_dma_map_slave_addr(chan, &c->slave_dst, cfg->dst_addr,
+					 cfg->dst_addr_width, DMA_TO_DEVICE);
+	if (ret) {
+		bcm2835_dma_unmap_slave_addrs(chan);
+		return ret;
+	}
 
 	c->cfg = *cfg;
 
@@ -1116,6 +1235,8 @@ static const struct bcm2835_dma_cfg bcm2835_data = {
 	.read_addr = bcm2835_dma_read_addr,
 	.cs_flags = bcm2835_dma_cs_flags,
 	.abort = bcm2835_dma_abort_chan,
+
+	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
 };
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
@@ -1157,6 +1278,48 @@ static int bcm2835_dma_suspend_late(struct device *dev)
 	return 0;
 }
 
+/*
+ * The DMA controller registers sit in the same peripheral window as the
+ * FIFOs of its clients, so the window is described by dma-ranges if and
+ * only if the controller registers are.
+ */
+static bool bcm2835_dma_mmio_in_dma_ranges(struct device *dev,
+					   phys_addr_t mmio)
+{
+	struct of_range_parser parser;
+	struct of_range range;
+	struct device_node *np;
+	bool found = false;
+
+	for (np = of_get_parent(dev->of_node); np; np = of_get_next_parent(np))
+		if (of_property_present(np, "dma-ranges"))
+			break;
+
+	/*
+	 * Without any dma-ranges the translation is unknown: the peripherals
+	 * are not at their CPU physical address on any of these SoCs.
+	 */
+	if (!np)
+		return false;
+
+	if (!of_pci_dma_range_parser_init(&parser, np)) {
+		/* An empty dma-ranges describes a 1:1 translation too */
+		found = !of_range_count(&parser);
+
+		for_each_of_range(&parser, &range) {
+			if (mmio >= range.cpu_addr &&
+			    mmio - range.cpu_addr < range.size) {
+				found = true;
+				break;
+			}
+		}
+	}
+
+	of_node_put(np);
+
+	return found;
+}
+
 static const struct dev_pm_ops bcm2835_dma_pm_ops = {
 	LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
 };
@@ -1164,6 +1327,7 @@ static const struct dev_pm_ops bcm2835_dma_pm_ops = {
 static int bcm2835_dma_probe(struct platform_device *pdev)
 {
 	struct bcm2835_dmadev *od;
+	struct resource *res;
 	void __iomem *base;
 	int rc;
 	int i, j;
@@ -1192,12 +1356,18 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	od->base = base;
 
+	od->map_resource = bcm2835_dma_mmio_in_dma_ranges(&pdev->dev,
+							  res->start);
+	if (!od->map_resource)
+		dev_info(&pdev->dev,
+			 "peripheral window missing in dma-ranges, please update DT blob\n");
+
 	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, od->ddev.cap_mask);
-- 
2.51.0


