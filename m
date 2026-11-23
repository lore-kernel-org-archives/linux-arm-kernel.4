Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC547606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GfgTr5t4;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dk1kQbXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=; b=GfgTr5t4jkejtj
	6Qnoo8v8U8+koXb7+wt3jBsnfYlCBrUN9Rz4ebupcdn4aia31fDUhopigcju4/c+WSFW4Wc5G9H1X
	m4io9+YfntS0bBk/W9dz3li7eMBQXb7y3DT0zUH9wG9i+VMidTZyE0/zXbn8BFMrTz7grmyu/t/ua
	JQYpCQ1Tn3hKMaaKM2Mvx3xVeA2aBNp2l6s9W6e2oyHYnWbuHAa0HWg54LxW1fZzZFdu1Bs5U9i9M
	Qzpo8B8Pd0i1e6JRw+HVmQOIFgHs+HG9r9m+cmppMJDwsZD2lJGbWIStszctw4WGsBkGMgxi3ito/
	X42JDDT/2Han8AbQv/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTd-00000003qJn-1OkL;
	Mon, 23 Nov 2026 14:57:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQN-00000003oOm-1MCV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso33573585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445621; x=1796050421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
        b=dk1kQbXeFjaG7R5XPUrmFwIL4ShWPhpPcpt4t/kXP5SZn61tPRd+MJUu9wPVu9Z/86
         tMlzmDpVVvI04Rv+7uZY2f5sIrHYnyGYDF9aE4SFoWmoDygYhr+3Wryw/e/n3EZjicvW
         D9gNTnCggERblhmIWZW/va1O0wLb/eMoVEB0QYxBTiTWPLUsAQ47pXW+mLHWxsaeT9WC
         i/QDTyPb6rc/Rza/+xv+WcDn5lZcY21Hemf8iZED97yHr0uE1UBYWGMlcMuiUleoJMB7
         Y62FCR+ptIx702UIKTIogjBcgwlDPtmcCI3CsN6gNttiX7wdRwl/UddTQcBGPkspUKpI
         vGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445621; x=1796050421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
        b=NemqFiLuvKL19R5anQ6yIEDgUiA/BLNrCjXkqUj9tQ0zrkqIx0qaDbLQ7yZBYvlqmV
         ++BJeZUcLYpRed9QiRCL6GqlcMA+lE6YxDrxwbkWMC1QfrTLBARBOak/1uz3kyvbLLkn
         I0kJN5WmdMDqkOuXBBvguyWNxON4jm1E2cgkq+QBw4OaPpQbaZ5ZHW4Hxo/Oht/huVLV
         N2Yr+vIp8pF9bpsC74M/VGSWLLsv1D9rtqqJ2DsdmPt9e9mL9esdgLhEErCr3rG0TYvc
         OoxeZ96k/G7CvJn2IuLfGIzf+usMtLkLXvQ0gJQ2QyLpgzOk2ze3My+Bu/yrj3B6BdyZ
         /m0A==
X-Forwarded-Encrypted: i=1; AL+hErHIKF9hDshxNNgPrch68IyzWl2JEvV5qXmbveEvI0ZHMwPyqFm8+1i9qN7YjHy4BImU/mxrk2kKkZBl0maqFBJr@lists.infradead.org
X-Gm-Message-State: APuU4Z+Bb9iO8O0uETxKUkNNFYBq+dAxSl3fCoRM/5UWH9qUrDRUnpmM
	Bdo2BeYCuumWSX6BMXOg9txvgetcH5K+wr/czvO/edInWE4mRG/HTPxfiQYtqdG7aU0=
X-Gm-Gg: AZFdTZeM86iskEmXDV28g0epImnEtVRrF4aUC08gMlZdxcpOm7j2lCopyAZc+Z78hD6
	jgU+gc84+pIy+E+TBR/QHKHJCPrdru8Lq2OR+1KtCN744r3z6l9qO251RWweIAx7vhg9vv7vqFC
	idXnNmggDFwWg6IMbr7WFiMcyjOyXGmfFqM8uw0wCTlNCPkZkGxMdUA8ZXFDoFPuRdggaKQoDfY
	cNb6vnoRU3VO9ck1uVrGBw/DCTptY/GBhlVC19fifyGDlIsJ0K04qrgjAj4z+0bAMcPVZ1Jw3E0
	8m6mFsX+/PVslVezWjdNkmQWpahO6GblKg9M7Vofc2vEhTKLkSBIJsA8hucikJPBlgiX0SPMeNk
	4JTQQAnHEBI7Xn7Qcprxbm8JlpsJ8dAYNfhR4p706Yj7dEF2toNxZz7ZrASc27UeYtQyKUCs7re
	3H9iakvn0UO7cxyjC1g4qdE1Tor7HwVPuuUserjljhuk2vjebzcIYouaq+Ncm1adK0XLnhHEX98
	/iDi3soreJF8qs2errb+mrQtoBZo64GTSvtd054zfwhW1NaAnwJUrm43mW3iyZ6jDDwibKYswvR
	05Sh3EKdtQFSyPdayqzZ9V2reBs=
X-Received: by 2002:a05:600d:1c:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb8c526ac4mr199511415e9.8.1795445621520;
        Mon, 23 Nov 2026 06:53:41 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm173289665e9.3.2026.11.23.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:40 -0800 (PST)
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
Subject: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document dma-channel-mask and DREQ flags
Date: Mon, 23 Nov 2026 15:56:44 +0100
Message-ID: <20261123145728.29082-7-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065343_379263_A87A8A9F 
X-CRM114-Status: GOOD (  13.46  )
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

The available channels are currently described by the vendor specific
brcm,dma-channel-mask property, while the generic dma-channel-mask
property from dma-common.yaml carries exactly the same information.
Allow the generic property and mark the vendor one as deprecated,
requiring at least one of them, so that device trees can provide both
for compatibility with older kernels.

The single specifier cell is also not limited to the DREQ number: the
driver interprets some of the upper bits as per-channel flags (AXI
priorities, wide accesses, burst and write-response handling). Document
the meaning of those bits.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826..f619e395cf0d 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -37,15 +37,30 @@ properties:
     maxItems: 16
 
   '#dma-cells':
-    description: The single cell represents the DREQ number.
+    description: |
+      The single cell contains the DREQ number in bits 0-4, optionally
+      combined with the following per-channel flags:
+        bits 16-19: AXI priority
+        bits 20-23: AXI panic priority
+        bit 24: use wide (128-bit) source reads
+        bit 25: use wide (128-bit) destination writes
+        bit 27: do not wait for AXI write responses
+        bit 28: wait for outstanding writes before signalling completion
+        bit 29: do not pause the channel when the debug signal is asserted
+        bit 30: use multi-beat bursts
     const: 1
 
+  dma-channel-mask:
+    maxItems: 1
+
   brcm,dma-channel-mask:
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
     description:
       Bitmask of available DMA channels in ascending order that are
       not reserved by firmware and are available to the
       kernel. i.e. first channel corresponds to LSB.
+      Use the generic dma-channel-mask property instead.
 
 unevaluatedProperties: false
 
@@ -54,7 +69,12 @@ required:
   - reg
   - interrupts
   - "#dma-cells"
-  - brcm,dma-channel-mask
+
+anyOf:
+  - required:
+      - dma-channel-mask
+  - required:
+      - brcm,dma-channel-mask
 
 examples:
   - |
@@ -96,7 +116,7 @@ examples:
                         "dma14",
                         "dma-shared-all";
         #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+        dma-channel-mask = <0x7f35>;
     };
 
 ...
-- 
2.51.0


