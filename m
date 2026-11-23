Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677E5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=00TL60Dd;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K31mqBY3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=; b=00TL60DduuAM89
	dKbfOmFJt1m7kLf5cIS3HjYry9esI+V8+suslKtm8XdMUU9gQJJiZu7u+I5eTlZeup3zFsu4QWPGO
	c7xzC3bMv6mc+Wk4V5ehip8hooMDOkdSuCtpo86m6M9TO1H5mY11BaLbDchsfh1yFgpxaFwn0q2Wx
	rh0V1sPYWepOwNFcz9OMWhkEgNarlogj9cCbkLI4RfpOZ4lcZNgcuSbzVFzDfBY7V3Nlc+ZgonBgv
	rH5n7jG4sD1FjnN/n2C6P0IO6ybUSvJJAg4wKyB2Iqzm4poLUJZlEEcRuVEIuasskHluglxVH+QIw
	JB2gG+pCYAAxKNyMaYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVR8-00000003p0w-1TaP;
	Mon, 23 Nov 2026 14:54:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQO-00000003oPn-2g1T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3042851f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445623; x=1796050423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
        b=K31mqBY3VroWYruQe8sfI+PLVuOfFS/5ZNgbfeHJwMu/ordoEXVdEdmpX2hAOP42RH
         nrxDEuHNTy6Z5Is7D5vBkJ/0PCJhWyRlm9ho2wj5eo0G4TL4PUSEME6jB6KF6wkuY95K
         toOCKBDtPM6HH9ROhc7czf9WkK1cv1pcmtTvLJ0joowdkT/V75j91BKqXL+0BeNU+TBO
         +BnvNnI9HV4KGjF8SCqpSQKgkU+q6Fbh80Phymt2y4809GLY6IjuTbB5ioBWqU6dDOrB
         b80jBIYyN2SrLHtO3YgvP9YQ1N6DsX8VvQtrfXCdLn/H6rpxV+I0gBMKD/MRPNrxe5Uh
         HQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445623; x=1796050423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
        b=z7h98bu8bYZVa55/N9TiUGhndHFm7FFkLqCuFF9brRztx8lykzl6A5hvk3za8KSec4
         F1WteBBOmLXOXUR4KdvbuLagdGwlwnWNjRlBXSkvIn2CWOAhGp6kvsWMEWVEUqWuGsSA
         HLzkTnL4W+8Sdj9PaRjfGUM7EFrxSmSQM6hV7EJQQ8sUvZX98djaJ6oICUzbAaQBiXOc
         ZXrtzd8sYaa72NdYBNPVvsqWu7rEmgAXIOigWK7fdOR+fnohXEPU35FWyaCDGR4wy90t
         r9jgQ0kRS3Ua3zr3msf28mpVZBrgtc0uGKCHMlbtaT8fcCEx3jRpJmQZBIR/eNC6ZB6A
         0HXQ==
X-Forwarded-Encrypted: i=1; AL+hErHh6YkXboNcPbtieoV53bHNPK1C7OpeGiTGVmU0EzKHTzUgkaLZB8Tgw/NXgvEJmGTTUyawy/gngCTIaOUhmip3@lists.infradead.org
X-Gm-Message-State: APuU4Z9caXxQrLBQyXPc9tq+Y0UQCPoLvcS1varL0uMgKG3k6pP7ZjJQ
	w0xxeAo5bgYK7EP+kxt+o8kcrID5rNsUghvTr7WcLkwLKNkxIWQdbSvuA403GHbX4gQ=
X-Gm-Gg: AZFdTZdpzfwusIdF7rsvT2CP5n0pEXXtmC+VhBXPL4R5JiReJ/kNf3gwF6aXEmCjU4T
	wloMCX8sGvDy9lo4NMNqIOthf7zjUs5+VZ6GcakZE4E0Abmq33TXPVOXeTAyyuzE3vUvkLbPtLk
	z4fNgTjr+W9dorXpKU9z5cYFKjaAT+t+5PZkXfBMZg+/PqhKjT+cHeVrAokSei6jYiW3OF4U+6B
	fEpIWUHmUSkKx6VzEGz5hNBLPtwchhOzxS2loxq8+tf7AqRtM+lpFnH1bzvLvzKYNbw4JxKAD2O
	O+kuRr9+F317USQMnJGa61t1FocA5n+BRkkrrX5io26v/MdNPE5cMeYv3HpeCQQm8wlUloRYPCB
	mBmsD5XaoFfAwqJUXed1FF4FjRJ3xBs3rWWgQDhGKwCjv4NXj2+TRdnjHYHrvcPXERlFNtGy3C0
	+6jQb835BlIeOpsxHQrzXWXu/jcQ0KngHKXtauvnWEeXgVWEU5c7kfbKGKy44rdiw362LOVGe8w
	7pZaZzlumpM8QKV/hiOQekxna+UsRiZ8d+2wSm6q1d28Bzbxd+uIFpiS3uhs8j9dnB1rFriPvvi
	Z4xVk+jWZ3vdXBI4Rml0ELKzxLuEZqjJrF1/673GLga4tCiX
X-Received: by 2002:a05:6000:22c2:b0:4ad:5e91:8fcb with SMTP id ffacd0b85a97d-4ad5e918ff5mr23600375f8f.25.1795445622898;
        Mon, 23 Nov 2026 06:53:42 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm22447029f8f.38.2026.11.23.06.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:42 -0800 (PST)
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
Subject: [PATCH v3 07/28] dmaengine: bcm2835: Support common dma-channel-mask
Date: Mon, 23 Nov 2026 15:56:45 +0100
Message-ID: <20261123145728.29082-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065345_243594_060F372F 
X-CRM114-Status: GOOD (  15.01  )
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

Nowadays there is a generic property for dma-channel-mask in the DMA
controller binding. So prefer this one instead of the old vendor specific
one. Print a warning in case the old one is used. Btw use the result of
of_property_read_u32() as return code in error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 51e3a40dbaec..1087157fb242 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Request DMA channel mask from device tree */
-	if (of_property_read_u32(pdev->dev.of_node,
-				 "brcm,dma-channel-mask",
-				 &chans_available)) {
-		dev_err(&pdev->dev, "Failed to get channel mask\n");
-		rc = -EINVAL;
-		goto err_no_dma;
+	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
+				  &chans_available);
+
+	if (rc) {
+		/* Try deprecated property */
+		if (of_property_read_u32(pdev->dev.of_node,
+					 "brcm,dma-channel-mask",
+					 &chans_available)) {
+			dev_err(&pdev->dev, "Failed to get channel mask\n");
+			goto err_no_dma;
+		}
+
+		dev_warn(&pdev->dev, "Please update DT blob\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.51.0


