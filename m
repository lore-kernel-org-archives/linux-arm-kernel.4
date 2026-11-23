Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=he5IHyE1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UGVtILhR;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PRxTLktG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=; b=he5IHyE1583dem
	U+kkrCW2QC3ZYUWWVhMkkgpl6yEwj/t/k3VpQ+6JeMcredVwLatAUWi5gXH+uQkumtMso+OOu/64E
	Z/ci/mYj4neFu946zq6f+ciMEw5PqW27lXnYOxXBM4gJ8voBgQaIOYVFQwOS1F8QiC8CJWKmiAqvq
	Vy1Yi6BfyvZRUo9k9KivFu1q4PFoBYGwzoiexYeP0ntnA+xljBbzwtp6cinOH+CrvOZ+V27F2WZpS
	vZ/UYmaB5d33BO8XRzhbk3hz5hYHWwGoi/nUpXNvVJTMwawbYhNdxf9DLK5j344qOaIT1qlrgiLOx
	T8REWhbnlophAexnCtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTC-00000003q1h-2sAZ;
	Mon, 23 Nov 2026 14:56:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQo-00000003ol5-3Wbs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=; b=UGVtILhRsvMdghNej4aOVtafss
	zaSd1FiQpWrSDN4vlhtWoYvZ5EviG4/jhrg+jJ5ZtvVeCy3lZt+oVUMkQDDhrJJX+x5fIXVM+lrFK
	gbb5CLNSDoNEBBq07DJwg4nQTviPV6m2f/EzW0CPiYW6PxKVyBlAdxU/obLYVCa/YVA9Wo3yiCzwi
	btsqNYqnhcTQac6kh8Rnd/zF8RXJZTLYO3OcnTGOVzXWQrulNU8el6IMgDRAWpTBHlyHPVBh7+SF+
	N9FzjgL8QFTtQ2CTvZ7/huSB18s7B+99VAOMN/YA639ohA2IVsLb5OYfSveKIAr8XA1KR4RNL99Py
	HngA1VAg==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQl-00000003G2E-1HDK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4a9be758734so2052089f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445645; x=1796050445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
        b=PRxTLktG235lz2d//YJkwQ+OxDTk4HTHysuzBoKsrwlshXAVoY6vb6u0Baf2bnLVrS
         D1dX5JVHQpxRH5+tjnxd8XjWG+++ayY+1lhsnmXa9OmEh+BcLo4aHV2MgjhVAmpCBsog
         aaHPpdHgty3xm0FqUr4QXYIeFy8ILdrqaQDrHNAbJpul9igqjnluNzfTaWsaQckE8zcu
         SawVLLIUn/edmL6qiuZuARmPGWFjvoByE2LG9ls6rLfzWArKHLVcYXv28iRSw5sI0bYM
         5IhphEapyDsj4cAMvj7QgUZ+x9lQq3e4seFWN0UtGpyve+3Xrcv6tPoYU0ann2r+FvsL
         7uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445645; x=1796050445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
        b=z95J5FwcNmPEOFxjL9EZM+F6EAMaznjSdIsVuSd0f225nSrkQsDSF/BXZtJasEwHYO
         LLO9mp39FnvbF3QmdLq1Hk1/N6Ke7m4pcumCAUv9XJZIEDnUMWLNukCjx09BnYQY8S9s
         ISXVMsgZyfK8sOujHaofycJiHUQY3JrjE54KATmfwBSe+TwyGk+ElS98e5xqYFJaoric
         OfTjsMjkMGi4gf2rB3JaMC8+nnQ/gb89t/uGry05DmfKXXkCpC8G1cStGwLFF5jXFBnC
         IQyPjO/4VN91X3kGwXugiCM/fqJj7g2U6TSZF8yt0+v9tuzKhEiJeAJ6kdIC7xx7T/aG
         rVqw==
X-Forwarded-Encrypted: i=1; AL+hErHH0mnay3hP/27aZSfUqR0424yCH6JQqO+CSnfGnmcwxMOedb3fPgtubHROt5sE+MyRgHSOBOG3hIjeVkhjusBO@lists.infradead.org
X-Gm-Message-State: APuU4Z8+KJdT/yzDzTOIlzAXQRKZz+c29EaLTAibXA8h+mDRssHPobAw
	BVsiYIiHVU4fIyKLCZFQCNBUA2Bgd63x+Y8Lo90t7H8/U0e19Dq13irhvd7YpP1yfoY=
X-Gm-Gg: AZFdTZeJto/Ur7rbQMRuHo2jqwvBPOxMZQABlAl/7rpjpx4GW08X5D09Cf62DuvIch4
	TFH5TaL2LQfMfkw33OLxzlwjP7d25E50BH/gMdnSP4I7zUrRaUs6zxr3Lip4Ynr94Sj2TZ8MfZR
	GwX8N+KDLLSnBciKz7zNt/Or0sty2kUuzy9ToG1IOm1SCZfRGyBklqE5An44yLC3U9rYbg/d4N4
	rMovtQ7wJc/xtyXfwTB5HazIFpYrPvY0SbgGkk8sx9/k6KhamfBiUZ9grkFGIZsqj27tJhbB6SA
	uVWvja6A83Q6zKSsbmgz7IQE2m7z419lZiB+7LBGE4miuTwXzEeJnRXnVo6mcX6fn2C91/XqwMo
	x882zwc2tUGa/c0zt/09lvnAb50kVThAMR5LuEZbCT78jS0LCQpVPC6wZcBnBxf5Z+KNefnnE3i
	kcxbB7KTa/lRhCAomA+vQkG9L5wm1IlwUO8OqtGSzb9SQz7MPqqNrDSeOREO7NnBpIMdLWShjEe
	Y1JdvGPvMOeu6bjaUrWxTdGXcNDRycXmZTb/9tY+Qe1YEnYggNMpZ93W+snf7pPOqzfDs+/aj1N
	Stal7ISt4LdrS5tu90YWD9HEEpVRSlNSSHEusKhncn9Gkc1F
X-Received: by 2002:a5d:5d87:0:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4abaf64be07mr25689240f8f.10.1795445645615;
        Mon, 23 Nov 2026 06:54:05 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm22057256f8f.20.2026.11.23.06.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:05 -0800 (PST)
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
Subject: [PATCH v3 24/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2712 40-bit DMA
Date: Mon, 23 Nov 2026 15:57:02 +0100
Message-ID: <20261123145728.29082-25-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_145407_340747_26D2D9AC 
X-CRM114-Status: GOOD (  13.04  )
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
index b53652d5146b..0c74cc1d223e 100644
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


