Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE406606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4k0HM5q;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TNDM9ioc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=; b=P4k0HM5qI0PZE0
	ZGzJWp3LOOkKaUmlJ5KtXu9Aa+WgOdDkNttWeXcmTsfz2qCovALSDKzlSUVAnKbnlQ75YB4Naxr5Q
	fpyekhG9acwV/5R/ybOAQXGh4Ux1JIME8s8zBJvBKwzw2I9W4PwP72vP7hb9AxyPWNoyD+qrQODhL
	+gxSOGVTAdWSSkNHPtIr2i6dxv9nhGF1g0pJk44hfmmunTfNW4lZSRkRXtNm2rZDEP7YWtFsCLJDo
	4fZIpaq9osdQnCGZLBjs3YW7Bz8EHcBybNGz3O1bd1r8kwiLZu1/+T1G9H48MNnA1VPSTNCIowfpD
	akvAj2phE3JPu1QKhHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy3-0000000G5Dh-24gY;
	Fri, 27 Nov 2026 12:22:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuui-0000000G31T-1yBc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4763254f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781931; x=1796386731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
        b=TNDM9iocVtCUPER7WsrMBRST6EiFszPZOApw4KfJsUj8z3Yo844pyuvzogqxm8NLdT
         1mZTxAsnFTmb2dBy9VCwrR10PitwwZ/eZyF8klfchkVknaCV+0JI4l0zNwsqS5CkPtwG
         Mpc3Ul1g59+ykQGrNhb4RttV0B3DVp3JacajTXTUEW5XB9Fkhqr8ruWOuWbTEDoFZ9RJ
         wRM20PtMdq3mYFeasSZwJFTue33UbMb7QAUVLmmYKzeLlDrB5i1RZ7S9gIW50irnFC0N
         hP44PXfcuyKT6Rp1+Q53tirZ3d3C2RQq/kUNKH1kDhwkk69soOKwg0+dHf9k/lrOlnsD
         WkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781931; x=1796386731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
        b=2HasNo1LTj2JJ/CDuF7k3nr1rmgfAR3QdyZcrcNNSo6TCO5JWGSNWQot/OvcQc+Ws3
         FnI0omCTFmxpCFFtp9PggGFhcpYe+Tsp3RbxLrrK6+UrRVC+nYOstd9HDKlQlVCHNmof
         3Xd6eBiZwczW+UDBQgTNPX/CLzjLiyWw0cTyfqzrMgnYPLhwixd7uijUKuqrDrJhtzyH
         d1gkA79sZeemnZtJYbLkIZS7UAGX4yjzsHauqunqm6lJKpQn/hnSWqiBkeAGcoCSzmMM
         pAi/ySgHm/BWzhv45iWm45JVQRlJHGB8ocZL3dMRpdbc3sGstJxexT4fLpHZdLaQzW2u
         IJ3A==
X-Forwarded-Encrypted: i=1; AL+hErGBP6m5laMgryRxtAgYQJS63D6yifT9NwoYqGdYuC5YR4gNCSaqfKuTQUCNDnhbwRVM7HqEqQ7Ne7bc08YaKc7X@lists.infradead.org
X-Gm-Message-State: APuU4Z8fhtQbsMRPV+FIvMEonnExdsssTrrpvGaG6698lq0tPaTYJdEN
	lD2qYQG1KP/pBNakcsmjDomvclswbD4iQX9/CH/S8JcZJPpSvKMhYXhV0RUAlfCW/SQ=
X-Gm-Gg: AZFdTZf88QKjyjXJ34dBOdwrxPeSPpXwB13LjakStBxwIOyhkcG0EHfogaMHkCWzqbQ
	QUNxS1MyDuhGmQxc06ILRgr5Fuf7KmpXxhH/yGazBvXKFxWsw2eXoQL2e6aS2xjyoJQqWbdRlib
	LG70OjV7ACBkYAHf7+HxD54b8BCexqPPoxp88+YTAuprNlNJjsl+Bq1IjUy4E4129d62UcyWr4x
	IL4OKMHVlSgLUvIGi+9Sh3samcHD/DS19OIpL4pJTb8Lyb41ofmed7nouVYKYMJGsbkjJ41TUpm
	eljQe/a9rcsckHUwv7xa4KhGSOIkPWFR2TJhsKr609lNVpWkk+3PvW6mtU9bRKvI98/8oZf6wN+
	ZtLopUITOCktNYRuPkVce24XdtZ8tkQX20rLGBzxytq75du8e4cD/d+SnCMOyhha9M8R9JJbS8u
	1rInQ9/r84hGhegp+USUGD8m+KI3v1Z79MzYzAp8ijMBzOTrVwqP8mFaZdFstBIhb9S5k4peghf
	fqI3T/yqnWqU5t2GMoMu504gzyxDROVqDC9Utd1SgSZZB2YAs9fcrdENPAzOo1wFCgYp0CCzipN
	jqYFWf4RcviXHW8MqB8cDqWa5Qkc
X-Received: by 2002:a05:6000:4616:b0:4a8:cf12:6f34 with SMTP id ffacd0b85a97d-4abaab6318fmr47199743f8f.4.1795781930826;
        Fri, 27 Nov 2026 04:18:50 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm3453019f8f.53.2026.11.27.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:50 -0800 (PST)
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
Subject: [PATCH v4 07/28] dmaengine: bcm2835: Support common dma-channel-mask
Date: Fri, 27 Nov 2026 13:21:57 +0100
Message-ID: <20261127122236.4976-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041854_664793_A53E609E 
X-CRM114-Status: GOOD (  15.38  )
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
 drivers/dma/bcm2835-dma.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d65a93be5fa1..d2e000e94347 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -982,12 +982,20 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
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
+		dev_warn(&pdev->dev,
+			 "Please update the DT, replacing brcm,dma-channel-mask with dma-channel-mask\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.51.0


