Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC23D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PD38ePIV;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M5lwcJ3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=; b=PD38ePIV0glZ2e
	0Eiw/gh1Gbf49BQ4fk1A+qLil0rxMzcRnqcTl3csY6TVSlNrdn0y48XhoMbPTjFWV/VQGqd4JxHJW
	bthS+vEQ5jsheacUQ7tKtApDWbK9RjWnsvsEz1TujdB6G4m2YXePqQ+Y2OpqubC3qcewHKqEKXZ6Y
	netpyREG+E3wlRx9RrGi+XzWQy8K2ThUiw06rCN6zWRY1FdxXvPIFPsHviQkislCF+7ryhF+KT+4J
	0PewitMvtzxt+aghXlbS6VblHeAkJxww6mGlZe/COPJhdT+5Wsy7psnI9nZC0ftcd+d5u0iDWI4JY
	vTs8JmO82pQPasFFLeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy4-0000000G5F2-0NGG;
	Fri, 27 Nov 2026 12:22:20 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuuw-0000000G3CY-1crs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:07 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so25076705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781944; x=1796386744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=M5lwcJ3PoYKtXF3+yiEDF75+e8FDyT+fEh5QEVVIqUWlzO5aAJw87TakLJRINcOVu4
         0pETlbWTpPDjkeh+BH/lANz+RNdS20lqdKPDFA7fxyAujzpFCBdx9WszRIV7Iqd5YYYW
         txjAUW75KnbRQsVeRkfnQ9fnzVJxc9sl0j5ovUDvNp8e6LIv+FssjvS1KIYUZPcoUUhf
         RIAFRVWCNTkRGu7CvzSNWWhfy3v8aFddxQ0KY0WL/+EPUjRUJwkGA5IHlLzjzARs84A+
         1Hm0a15Q2A1DWuoqwktes1tRMKptsEZAyFgT8auwzdetfw7woPu9XHU1aowsOH0DzRDR
         4vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781944; x=1796386744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=Dv67be/K2DnoFpLMRyZ6ysR84d517gUUWI+mdtBslW9Csbjc1UEQmTAchWtcm2wCUO
         2d1dgjTIjNUlPynUIKEoQfKjUHZ03n1xH120FDDN4AlEqZCWt3QmBVKLL3CjYIQzBgvP
         wgvuHbiDJ1or7MIDUe4s6VynrX7xh8jeLuKlPYdxqZ97Rg2gc4v7Ap/7dVF5b37CRQRS
         QehncZH8O/P2xx/zugigZsskSyf4kjsWliixI0BkySbWGvEvJTjAOrtbiAIwSeI2WOVj
         ennMZX1UDncgGAMT2BD/FMD4bTVmzDCfqYI45GcTOqSsJ5std7u/AU6drkitd7JV5GO4
         BgCw==
X-Forwarded-Encrypted: i=1; AL+hErFNNaIgwmM45WRiuvhjVGZ+bTg1VSuiKXKhC87wCb9sMzV76ChYiEsuDY+ep7Av+myYzJqgE6ACvOF0FroTA4iK@lists.infradead.org
X-Gm-Message-State: APuU4Z9KXDwt3uMxYgMoBafAEJqkYRt6ZpaFPO5oV1A6e1Mxb2M5H2YA
	5eJKFMV0l7pDX9JmzGMWv06ec6Mp8ZP2aOICuK+wnRF2V3YLwH+8wj5pCwqMI2s+wdE=
X-Gm-Gg: AZFdTZclFU3DoTgbsP8mntr5UdE8jmWa9veoMEOrt9/+a/KfYwDDUJBgghsC6Dn4MzC
	DOQ4rl+vmIrC8Nyr0f35XTjaCQjLaIJMFvfh9RQS5krHnkQMarEP/hdUMZ5YQ2OhWrWVjrW1RZn
	XQaBLrAZR+8IeGvLYtc3P+hAH68N6+DKSrJYodVlruY/fkTFjWi6iYicwISdY85b9TGTIK1CsP8
	B/m3nBgY4POxphrTVIMOkE2DOm0fHHKxgMWy14SSmiSCSeTodYkiD384y6/WcHXB/s9xvKitQfx
	cwQCeZyH+d69+lFKo0zdji7auza9LhsKrQTFXPfrjD6l5ECu3z3oI8pnxkXOMywKkBsTKunMNoY
	Y2bogxIgtQC0YkM/9k4S0n9FXWh5JLFIOV7FAt9ZJObZkmMjrdn0G2ej3vaujtuSilWG/wZSDtX
	WFYyvj5IUShKTUwfDuXZE11CKcerNzxBwqArA3JxXlocFkYwwDrzLlWgL8Ta9oD5UsJkrIYjN5D
	UpG069j8I8ehVuaxsWYhxivP0EL6DP92PE6Xlx8ZEYXVs+CXgu6uMwQxUcoOFmPSMs7QXzLSVVA
	IkCdenCWv4fSZc8g7/RGbAvi+kpSpA==
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr524524725e9.7.1795781944276;
        Fri, 27 Nov 2026 04:19:04 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm702530165e9.7.2026.11.27.04.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:02 -0800 (PST)
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
	Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH v4 16/28] mmc: bcm2835: Pass the CPU physical address of SDDATA to the DMA engine
Date: Fri, 27 Nov 2026 13:22:06 +0100
Message-ID: <20261127122236.4976-17-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041906_439673_8AB5B4C6 
X-CRM114-Status: GOOD (  18.27  )
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

The addresses in struct dma_slave_config are CPU physical addresses, and
the DMA controller driver is responsible for translating them into its
own view of the bus. The driver instead reads the untranslated address
out of its reg property, which only happens to be what the BCM2835 DMA
controller expects because the DMA engine driver used the address
verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/mmc/host/bcm2835.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index efd1903c3ccd..cea7b2b6d2f0 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -38,7 +38,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/scatterlist.h>
@@ -147,7 +146,7 @@ struct bcm2835_host {
 	struct mutex		mutex;
 
 	void __iomem		*ioaddr;
-	u32			phys_addr;
+	phys_addr_t		phys_addr;
 
 	struct clk		*clk;
 	struct platform_device	*pdev;
@@ -1369,7 +1368,7 @@ static int bcm2835_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct bcm2835_host *host;
 	struct mmc_host *mmc;
-	const __be32 *regaddr_p;
+	struct resource *res;
 	int ret;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -1382,23 +1381,14 @@ static int bcm2835_probe(struct platform_device *pdev)
 	host->pdev = pdev;
 	spin_lock_init(&host->lock);
 
-	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
+	host->ioaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
 	}
 
-	/* Parse OF address directly to get the physical address for
-	 * DMA to our registers.
-	 */
-	regaddr_p = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!regaddr_p) {
-		dev_err(dev, "Can't get phys address\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	host->phys_addr = be32_to_cpup(regaddr_p);
+	/* the DMA engine translates the address into its own view of the bus */
+	host->phys_addr = res->start;
 
 	host->dma_chan = NULL;
 	host->dma_desc = NULL;
-- 
2.51.0


