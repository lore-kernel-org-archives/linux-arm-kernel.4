Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2204606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GwatBpz8;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HBXcnSKu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SSpOCmv0tLBnDCt4+psDGHOiZSF3sd/Wc9Gm8wuymOU=; b=GwatBpz8GPEcth
	3Sn5yaoxSm1H88C4jC1tj/kk3x7lJdN3fLxgmUmMYmxzV2DWZ6sYQjGiPhMFgi/Nd9IhkKVWn0g5j
	cCxXhe6uvw8QfIbH1+ceDKdC8yrj7LWnS/N1+2WyyXn45YNQQkDHKvw1HSOOHL9V3GkvjMLImzKXk
	WYAEd+b4iPs/xNnq8jTAHvm7nMdAEPdM+Ku63go3rIimW/9l99/rtSbBBC0J7ZXkFGLmi2Za9D4Pq
	abKDJAunHKtw7a2DzQ5n0LoxklTIMgwnRUq+1exgJcfCBcrthkU06M8x7+2Zc6+EmxakuwwEGRxG8
	UGdDFXHQytYBDooVWxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nv-0000000Bxfv-3DWN;
	Thu, 19 Nov 2026 13:03:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nS-0000000BxHS-2Ss5;
	Thu, 19 Nov 2026 13:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795093403;
	bh=jo3nCflY99PJQS3l0ROT5/iJaEglvr9vdCeiMlh4QAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HBXcnSKuXpigViXWu71/Ilw9X8CBhIM54qdSWCiu1Zgod3Ew3rXfI6mj6jmNjftkM
	 cEGOS9U3wJs2qnv+zFyuHjJTY2OPvm1LWnE0owIOoZGXttRtEjCrS3sXeuU4cS3Mrd
	 LI6ne35oo5scnWmYd2qov+1MD1PQPsScwfnOqJP9C7M+AG/OjrDVJav7Toee/QLm60
	 NReTtPzTFaJZZnHaWc2jdAFSgPCEwylli8/qD+jcjLqBHTz2VSSJc/d64+fnG+upji
	 V2GmswlufzIcwX303u3bzHjyCblBpjYWGjNFM0FqXuiLnD0t4jQ6q86g8ydUBLtsyu
	 qR+WyrKmsag3w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2FA817E0311;
	Thu, 19 Nov 2026 14:03:22 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8FEB148002B; Thu, 19 Nov 2026 14:03:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 14:01:51 +0100
Subject: [PATCH v4 01/11] dt-bindings: devfreq: event: rockchip,dfi: add
 clocks to rk3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-1-517a68c008fe@collabora.com>
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3196;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZBKcYRMvGhObvY8W1+zIgAuybma3qErauP+lHK7ErAg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr+85rC5zp+q9Kk3t11KLkC9KBrSV0A4/cN0
 SwUa0BEuTkNoYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/vOaAAoJENju1/PI
 O/qaSnQP/ig/NqPWDyqLreQ+wXjTu0hw72W9L/5n+t9Kg4+GcUj58zOH79IILmgI8ZhwDexyoyj
 7HjvTPFQgdEHygotqBEkeRzDV3mbvMRCpiQO36yRRgiRwcRcjjbQ+fG3A2cJNsGiz2LfJTOj+rC
 tP+13NFrWMEIIPWZih+zuhJx7JYBNSSkYZK5P1q/QigTFZSx+vOYavLHExOaaskJSNBAjXxUrqT
 XuCzzwim2GGNytZ8jPzjjJbbVxl8Ee5OCflTxz2THYUS842zCWxQkXCpCsFr6vbjSsGKkBBby20
 BbceLnBWg+Myxvxea/TOHdu2fu22h2eM5fFV9jpRdy8VJqZB1bjyJiSt4Y/zTp1bt0ThjahKudG
 cNxfZNTT9bj7sOh/OVo1S89a4M9N0kClQaX/H6ctdo+uS632mCEnwBZfUpEe76yw1AOx/l/oE4R
 1rcol+n+6kyEQoL3kQkOQPXF0NkNaQo8d282aFRERXx1cpJbyvZTnH/rghiuBNr9JntpOkHFERW
 37t010cyaYuy4EUj3aEJpCjgrkgb+X5x9PAkMF+nCEsZLo2ao12akFZdyMfYvZeYYFOYHvtu7M2
 XUtuS4Jr5kCv74v5PTnTv08Fmu6Vw300Ot9lxigKHuwl8XvsLXjgFpvIF+IsnoGVCOGB0XEi+xj
 CR+2jEHBobA8Lb/cVHv8scA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050326_884669_A47A0C59 
X-CRM114-Status: GOOD (  12.47  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

RK3588's DFI has pclks for each channel. They just weren't noticed as
missing until now because nothing ever gates them, and they're ungated
by default on power-on.

The RK3399 clock situation needs no changes, as there the hardware
really just has one monitoring unit for both channels.

Add these clocks to the binding, so that drivers for this device can
properly know about their existence.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/devfreq/event/rockchip,dfi.yaml       | 70 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
index 50d3fabe958d..3450e28b4020 100644
--- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
+++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
@@ -17,11 +17,18 @@ properties:
       - rockchip,rk3588-dfi
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   clock-names:
+    minItems: 1
     items:
-      - const: pclk_ddr_mon
+      - enum:
+          - pclk_ddr_mon
+          - pclk_ddr_mon_ch0
+      - const: pclk_ddr_mon_ch1
+      - const: pclk_ddr_mon_ch2
+      - const: pclk_ddr_mon_ch3
 
   interrupts:
     minItems: 1
@@ -40,17 +47,37 @@ required:
   - interrupts
   - reg
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - rockchip,rk3399-dfi
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3399-dfi
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - clocks
+        - clock-names
 
-then:
-  required:
-    - clocks
-    - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3588-dfi
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          minItems: 4
+          maxItems: 4
 
 additionalProperties: false
 
@@ -72,3 +99,22 @@ examples:
         clock-names = "pclk_ddr_mon";
       };
     };
+
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dfi_rk3588: dfi@fe060000 {
+        compatible = "rockchip,rk3588-dfi";
+        reg = <0x00 0xfe060000 0x00 0x10000>;
+        clocks = <&cru 0x53>, <&cru 0x48>, <&cru 0x49>, <&cru 0x54>;
+        clock-names = "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
+                      "pclk_ddr_mon_ch2", "pclk_ddr_mon_ch3";
+        interrupts =  <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
+                      <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>,
+                      <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
+                      <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>;
+        rockchip,pmu = <&pmugrf>;
+      };
+    };

-- 
2.53.0


