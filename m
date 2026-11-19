Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F19E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMf/W+AH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxmARjC7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=; b=uMf/W+AHS7Kc7v
	3NvJl0rrS9uyFRMaKaI/+Sb+yb0bc5e18E6A6kn+VAX1pXxraHvqavF7dji4TqBAQUOemICRMkTB0
	OiFOjxpX8jGdY/Ikg1MKpDlCcsly7RVe7PV86qqHO1rf8sTzrxLC9BDmWoegbmdir4mDtl2gd44vg
	4h7zfhSYzl0ShGYPp3EOQ6lJj5WZynXXk5Z+2GNFguAdrgCnfpV9nfkwfgGHBFmOOuPYV1z0PFjiJ
	gQSr/ucDnZMytFUWL7e+JJg82M7D8yx0KphBk7JLY3RTAtHs/7fYsN9zX7xWr2BuuLFDPM+llTexV
	3xSYl1fGNVds+OPrW/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrMi-0000000AetW-0gIx;
	Thu, 19 Nov 2026 01:55:08 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrMa-0000000Aeqn-2vZn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 01:55:02 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cd69954c755so1402695a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053300; x=1795658100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
        b=uxmARjC7MTo41ppweFbF+oZOEVC8jXYtyZrtFuLzSaUnyPCPfp45OG+FMxFdHXW2ze
         clHJPMr3CQioNzoLd6bDSX07b6Y1YI6VkjhzzFRux9/FGUeT2YfsJEnJy3fZe6xvSwNZ
         LR/iXPgOOLp0l/5F924QcX9qwn6g0D6sNTvhn9Db0GIswU7eBxP0dhgGuVFgt3i4wvPj
         0ZNfLfKvsi1P0klYe8z0emLt9tsS+Za9m6WpnYm4OjtUFPFF3Cdv5FkH/vLGPCoMWPnR
         eNm5jH3UzsjEMlh7rUKt0Y5jXchZGLYBENFpvbREZD78eBlqo5EqtYHzvuVOiRQSUSgf
         EurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053300; x=1795658100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
        b=1kVsrUgUnTPAiBvghPiIzmsWgw/NpxCLxbY2l2AsdnnGL53jEeTkvK4UaSXXJaW4mD
         hDmFes7EgyqE483snmjAiNtUyfXowepPDNCNBGwCWtRmI9/jdLX7REesfuS0GIg0RqIV
         TAGEP1tkybYuTGqVkk/TM4Z12Llzrel0nFheeXp6HGOyNNObVDeXKYSJHJMMRPphux1N
         b6yuaGt+7IwGyspFruU7dPkAYbSx/JQwUFCrEVyhUkRUEx/QcOHUPXTXlr5TNaZiXI2k
         Jxc/NKR/vqk2P9OjM7UwCRE7YNpMY1XfIfzmlwokbkz6zI+nxfbFNkol0xKyvmJrDVSL
         gRoA==
X-Forwarded-Encrypted: i=1; AL+hErGfx92axBQMsh4ckFGsYxjysWjXgYp4a3MmOYpAZGD6mh+TchxsJnxWqxFre4YVovbwgY0tjtHCXQ59inD7ujZv@lists.infradead.org
X-Gm-Message-State: APuU4Z+HomoQ65uyRRD6N+SfiHha9LMIq+RieJTtbMA1mhw/HvbH8erz
	1JDEmDK8JehOq1ctrmFjI8vyLNcgzmQkMSmbyqrRKfeUsJmetCmLgcZ6
X-Gm-Gg: AZFdTZcExYpwYg31N9S+VEVf69jbGzLRLiEwakXa7wweYP9/jldYnzwDqX3xpC4wNQL
	RzlTW1N7Q4XZMb+j6KaMHX/NVmk42Ke/dHaaJTeOAzJX4WVtOuaQkFTw5fd/+HY+Rhrn5uLdWxO
	C4Ej+F9/VKdgFuHzMZGtqvC2/V++I72XzlXkhqbAmi344tpyl1rHSDzuhb8FLCkamxcvP1nkdDb
	L0K35W0JiHrdSM8NTE+ZaFXn6tYKDqwr4f6no0Dmq7nNKeOHHt5ex3Bpj0DNGBUzGeitgpx3gbS
	+IfTG80cG5jaWDNnupvLOif4NCemNeFXUInltpso0DwdwgCcfqAhmW7iysTgQLQ0qHkymOH7oTe
	js1KrXx7SdtQGKTUbmvDeVDQxCebxJQad4Z47vEai9Ew4wp3g+NociudzKrI1VGoLpa6aXJHPb4
	5BmhmksqGyQlueRb36HmVlMCeFzv07O9Kh9eFFQ0bVJrwbyN8Qvqg6UQwAcYMrh5C8bNmL5i1wR
	arq6TqDI7AdUmAT9b3UhDlzZxrTylTfZXoli4cnat+fUFiwpY1zp2jzfueCofN1zcw/Sd5IsC52
	AHvM3Qdz3IhDUEVPkUT+w4GqVLl4Q4kak0muvWl5Gy5Ej5vpfLMCv1dtXxG/lM6xbzYNDH0BGhz
	v48QChQNmThLf/fA=
X-Received: by 2002:a17:90b:3d8f:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b3d07cd7c6mr4085733a91.61.1795053299722;
        Wed, 18 Nov 2026 17:54:59 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:54:59 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Thu, 19 Nov 2026 09:54:46 +0800
Message-Id: <20261119015447.160470-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119015447.160470-1-shanchun1218@gmail.com>
References: <20261119015447.160470-1-shanchun1218@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_175500_754911_CBB1ED21 
X-CRM114-Status: GOOD (  13.13  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add binding for Nuvoton MA35D1 PDMA controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..d05971662a5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
+  has 10 channels and performs memory-to-memory, memory-to-peripheral and
+  peripheral-to-memory transfers.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the PDMA channel number. The second cell is the
+      peripheral request source number, as listed in the reference manual.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            resets = <&sys MA35D1_RESET_PDMA0>;
+            #dma-cells = <2>;
+        };
+    };
+
+...
-- 
2.25.1


