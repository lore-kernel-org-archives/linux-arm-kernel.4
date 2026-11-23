Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EDD606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3HPfVbqJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=P1tD6oIT;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bdx7Pj1y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=; b=3HPfVbqJIbxRYV
	qPiTtjc/qg8+sPBM1VuhfrIHO5YTtQobBKGsP17+48meUh3nLOPa8QDiHBhFuoKjjGjJfh8Y6vvs+
	F82COGWljmnLiiQAgOmY457zbmKVPpm9lXFvwTAVzKOOfQs15290B6ohCdaPvgveK93qmsR0+wgUq
	dnCurNcnqJwS5UWGofsNDE3r1exf5pW2+3XFFtITaCSVv6/u5mu2j+yeymzDez37k0TFHWpTax0nA
	a9S2OltHx9hoQJ8IlJ5E1675B6sJ5DeH7TzqQfXRfgm9HhFVIMbQRFzke/lbip1Xm3cLkiI9VA5iM
	+fBpWj9VE7K987yVns5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTe-00000003qLd-3E4C;
	Mon, 23 Nov 2026 14:57:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQf-00000003od1-30uE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=; b=P1tD6oITAZqo79CuRYDcK6YalQ
	9OAdnhmvXA6950PBjbn+FCKkm7GcBZsWV13Knz6JXXLhxvBhr/fFEu4r9Tm0fzIHso4NBpexIicak
	2cN6v9tBk/OhB6OEYEnn96hjQFPfI/mcGrQ21La4GYlsW5mG8K5iqKwXoWKtNOHeZThk6vo/OkTYa
	A8BqNhM6tFpx+lTOz+mCHnHqg1PmEj+qcMqZw/4LTVPv7ZVRsXPsO8atdjSUmuNIPLBUljonUxCAM
	CyU9YPRmoM6WqBl34KvUpIxJphYsX1Tf4mFv79OrA8qJtYqUziMjNCDDCReEnS016lf4ITqtjHsBA
	ex/KgwlA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQb-00000003FyN-1lPm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32706445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445635; x=1796050435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=bdx7Pj1ySrdih/Ttr8XJ0nBIcTqGP8TAwGn4+tgiBHzM/YPu0ST3p3KeICXgB/1mId
         UWmR1PKhP12MRzHre2SwXXFbTRw3Hcifblto6kYQFY9yGpmmLwjxD3mHFX1hCr7HLhXn
         /LUFWtrWNwWCi0Ed68K865tYlD/PVIp7Z8vTokgQxQAcVpk8PHOltOqffteY/BJjhfjR
         k8UunMUfRobqZJUasjTGM1JhESmWPKQzSIXca8UiqNYsCi+qDuRUHFaod7cxIVn2AYSR
         5KDBPTr4qmT7iYTdkzqOnZT2BFmlx6PcvXM6mlg/G+AdU1h/5TQ1F6z3lbCWyX/6rzCX
         yLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445635; x=1796050435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=EPgEZ4zH/rCxdhfMn6slGC5+3JZLv+SYQp0ikDvhJSD36MOHXHRL+4T6M4pBov739m
         mAWDuYvwovSr8cFaOhJIFzti4kmwryzug9CqRmQ9VqetbY1rC81agri68PsInllvy3Eq
         1PJIcTd6UJiM4pTGqfyiyAU33/lX3KkUtOT/w10lFbAUR/hxfm2ZxVdDT9Ia26/rXgJR
         eapkZRG/kEjXoldzkCijkCyYDdZ2XDihaVHxd/sN9fAnn/dYmt0fCzxdOVWJnBXWBngd
         ML3SLAygZtyC1CjuZaoVQ/KG02bX33yz96l4vNWBfGBikvnUqXl+RJWJZS98HXTvlaj+
         RBqQ==
X-Forwarded-Encrypted: i=1; AL+hErFhCDPlWxS/FIhdV5Vh0Penl8+EMS466S04sjv0IiinCtaN62vgwQRedS5M24Z5U0YO7d/mV7S8+NGzRyr4PXkr@lists.infradead.org
X-Gm-Message-State: APuU4Z89asCm8VBE8vU5DKnruesGoXPDWXNlJJM+s/NaHAi70IjxsKwN
	wElrZMJ2xLQnjCN45CITCw3/riHNMQRAjqldtHsRycMbiD0xG5IPNYfTUTqwKNkoI14=
X-Gm-Gg: AZFdTZfCgKYTVKwks3s1yxk66BIE6xOnnGbPvJ+iadM1uMfiIeIAe41EVRCRT3NJCUn
	QwaiQFBNNbLTDsVtvpD7d6YfIkT/6/FXXDMI7LBd2Wsd/IDCJYgG3j8vlPUugGt3RXL6GquyY3n
	29Otr11iEQtJR02q/I3xRUE0Zjy9VxqFqwidOMNBajuAkfqJ222OK5cdBzMyFRLcES5rc1FdxHU
	SCY35NnA/2h0KbJqyEAbjIpdWXjYNi2uguq39q8HRjcc8qx3mW1W0gbk1Yg67iLUmoYt5XV9u9u
	Kx37dgrFF4AtwnRR3kZzjkpCSEbHbvbdDYHqivARCwisY0ICkG1OphX3F0Z5WEApV1nu2yNJDId
	T8YtgGnClLCWUVTGnOtGrYwdm9TrLtLC3nvssmOs9UTD4UTw0ZN7mNvJUMsyrPZgC8VogfQjGBV
	ZIDvCKsOT6IonzFrkzmmqoq6r+QSEMXXogoINxGy+DvoSwS472KKF4V6Q4s6G6qOwLoF7oidmc8
	i5DqsxhtNsEnRKLEm8IvWbb6uQ3wXUn+bEll4EgYV5j6dbl1Pej8VhJJSvUt+85c7rpj0fk//6Y
	2vmaK0uRjooPiH0s2N96bWVrHtg=
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr265842135e9.32.1795445635536;
        Mon, 23 Nov 2026 06:53:55 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm340088765e9.10.2026.11.23.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:55 -0800 (PST)
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
Subject: [PATCH v3 16/28] mmc: bcm2835: Pass the CPU physical address of SDDATA to the DMA engine
Date: Mon, 23 Nov 2026 15:56:54 +0100
Message-ID: <20261123145728.29082-17-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_145357_459680_6C4AE462 
X-CRM114-Status: GOOD (  19.22  )
X-Spam-Score: -0.2 (/)
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


