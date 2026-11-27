Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09AC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2t/ECNKr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Kps0dUjB;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dOA0XMSZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=; b=2t/ECNKrqAs0T2
	g7P+bN+GI0luq6baOFG5S1FKcJr4O48OKPAuoGREjynrSoPMA6jXdK4E586+cKnmmNCAS1jo9K199
	IDJ9Mxtym2a7B5RpXyIohAOOFzIWMmHU0ky7ch61tk7T2+2onzslXi07wazAqsrjtzONj/hxNaLtG
	JqXKaVrLDVgPQuu8xDzrYvggBYM2CBbClTrT5WWDYOWIo6rysgUgWcT0H627mPhU7yp1NcDC13m/b
	5r3LU0eLHz/v5rVj/XTuv18y/tYPlSRPhZOIj9/FNmwVC1FYkXFAeAlFFgC+BKRkkMrnOOMfiBsmc
	7JnhiQQi22FrHt5aa0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy4-0000000G5GH-2jET;
	Fri, 27 Nov 2026 12:22:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuv9-0000000G3QY-0axu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=; b=Kps0dUjBsXI2EY0r2cXHbwAVEw
	3Vy+deB+qh8wugc+LgUWLETGlP+xkZgQ54sYyQyic32kIlKx5lCllwUYKqEO861Io3iXP8g5bwx0k
	0DA2CN3n1ozWQwYynSSxoP3ByXnAuPv1KL2tZQssLiAIxQBTFZ+ym1q361VwlkVn7cdGuUUOpNbyG
	fAT660YfnhFxqGgc3EOrJf90trOPkfQ7ktwcaJs72F8EeKTayNJLi4W9YOr7WngdxOmrCEUEjw/cm
	Qz2VOV2QkufxousoaVHhNfxyVWLUz8sjL0s01I6ICMEaumSkG0j83wBdGuLOcKOOiRCUHVKILrYJD
	QgQiiFgw==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuv6-00000007gxZ-27a4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so85267725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781955; x=1796386755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
        b=dOA0XMSZo0OZ4nSMXMie1QXTQ//pPo5G5HQpfOZpfj5oCkUKHR/zPheqqj3NsNDuzS
         u7+2D6sO0Ave4G9PaZQIIYeL6PT2Gt9uN6fDV+R6C2BEnaeB4k1QHoYhMZoeP+r7Sbvx
         fdKt/Ked4KIxbcWSN4SR9sTnDaPSTiPm1LQABf1pk4Ei4av1Pj3JyppRz7JjZo+BTcHI
         LI/pGXqTQEdhHU/3h1bfS9NjURFdhBt1ecC2xX7h0UapHVEpm0CSbtFEZfbehBE1IKlT
         ldi1MET8gtSnNza88/YLo2jssytZt3aL8FGk2fVLTZjqbFlYhHj5uHr7kgfeR8BU+TKC
         ItAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781955; x=1796386755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
        b=MQJqObZR1Q3pfdmm74hMluS3Wy2OdKVzQy8jWYEyVlvyf3DvrGi2WtzKgJfswSubzp
         /IpM02LhcyV2XeGujlxkIVf7IZMSA55jjRtNnm3ULkwFyscejy1naHFTA0/ZwOsi4Ng7
         R7X7z7gJrAJ/f8J7PNY56RYR/HGE4UIsYUfi69sI72D9Pg658BB0ne1PtF1vQStveme6
         i6XO97R+tU8DEYaNrMbZMdMO4/QoB5NGxr7lwU4MmctV1KyQCjGk5h7MkuzZ0F1yLRdn
         JwWwK4eGooKy1sSw6VOs23VVWGKip+2wifDbRfPWeLzLVyE3hksJCIJcxA8vctRU1Ifz
         87uA==
X-Forwarded-Encrypted: i=1; AL+hErEAMvM44ZBA8yA9cKNiQVBeyiDW4S9Aw7e4bsvpAZDjAf0r5Mz+8JMvjrM14h/tosc3fxpK1f7LjxDVmNzHC3B8@lists.infradead.org
X-Gm-Message-State: APuU4Z+IjRLAWZWmggmAdPS8TRAkWB1za1Ae7JL337+Y/AXal0LYAw3m
	DAtYdhCrgrPSv/1wSVshO/Iq9NOw3AHfA8Rf+dSCAXmvQFlk0wxDnE59PYJHt04X4zc=
X-Gm-Gg: AZFdTZdDuS9WUnRX4zL/fn8DMkgO7vaS1QWepynckJNwqHH44owIlZfTD11Z+WLCDS8
	rQ4DkBZASrlgoue0juBn5OwRxzRGz8H85dwAU/QX+VFFy9/yMnKPzn2+X/tSmTbLkm+H9GF84hw
	TWyYSzujHGMoiVpNuGYD/fTUdQXI0G1GqIyYhW6blJI6C3tEQzATnExxvBD1x1Q9lmxWWUDDPdP
	lrUcY7x20gzeBDIPrmz/scOaKuopD7odaZLyJ3W4OVFLseLpK9PfW2Ch9k8kVhHVG7vPbIfCUCc
	hfnoNCkg2wwf+LMtS959IOEkUMkbkEej/BAdgDN2jiiHxkb5wixY1sRz4G6DuZMfTRekaWN1GyT
	fX8WKVwGSAOJgwA04ZOl7l9/e6eoRozEUAXCDV6YvGyb1HW1t4TjCt51KBFi27c2qAUtwUVPrKU
	LL8/dkI+2y/+h/R8Zm2A5xAqtql8GuR5UDGCME5J6IklFAVB6fZe/BUDNDZOWJ1oUHeE9UQlj/0
	jFTEaqSXOUhGGa0YcHVBw1DEBvA+5jda9j/AJIsu3Ts5/dBeukk7k7vOaz5Loe7dRFBTcvX2P9M
	wHC1dZ4XgGjnFHHpUfASXbmLxjGm2uerqzBY+97nbY/jjUtb0Q==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr462247745e9.3.1795781955134;
        Fri, 27 Nov 2026 04:19:15 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm623847775e9.1.2026.11.27.04.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:14 -0800 (PST)
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
Subject: [PATCH v4 24/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2712 40-bit DMA
Date: Fri, 27 Nov 2026 13:22:14 +0100
Message-ID: <20261127122236.4976-25-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_121916_461979_6BAC9B99 
X-CRM114-Status: GOOD (  12.92  )
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

BCM2712 has six DMA channels (6 to 11) with the same 40-bit programming
model as the BCM2711 ones, each with a dedicated interrupt. Add a
compatible for them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index d4a7001d6f97..e844fea55fb4 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -17,7 +17,8 @@ description: |
 
   On BCM2711 the channels 11 to 14 of the same DMA block have a different
   programming model, which allows them to address 40 bits, and are described
-  by a separate node.
+  by a separate node. BCM2712 has six channels with the same programming
+  model, numbered from 6 to 11.
 
   The channel numbers used in the channel mask and in the interrupt names
   always refer to the whole DMA block, also when a node only describes some
@@ -38,11 +39,25 @@ allOf:
           maxItems: 4
       required:
         - interrupt-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-dma
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+      required:
+        - interrupt-names
 
 properties:
   compatible:
     enum:
       - brcm,bcm2711-dma
+      - brcm,bcm2712-dma
       - brcm,bcm2835-dma
 
   reg:
-- 
2.51.0


