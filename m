Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=svt4fOY1;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JzNlx/Bt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=; b=svt4fOY1GGBaFx
	hjY8ByNp7TyASCRpmM4DA0BjclpTT/nkL2xAH7AdzdLScdJkTWODjg6xT07xRmcqqwn+eGTVVJbwz
	UspUP5fmAruWTGhLCEbdKbo/cStcIaVZT3LrY34jYzqWct2HyxjOXSdo+epCT8Gv0WtJniC4riQyj
	NU+rrsca+Ujqc7xgz4npjqZxQzzafD3+imrdkkVB7udKUZVYgThnFIgRbFntgERtjw9Q0qGYOVPvO
	hEgfmqzqQuKkkU8uARbeZMPV9KlC5x3rQ7IrbsY3K5naQZQM8KcyuAc//GCr2q7D/9BKBPRaKnz/B
	eK/V/0YqZK5WkmeSWbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1m-00000006a2x-0fTF;
	Tue, 17 Nov 2026 17:31:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1c-00000006Zxf-2Qg7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:31:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so1072185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936679; x=1795541479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
        b=JzNlx/Bt+oZEh4xGkNxW9EojO9qMV4+dO3sfF96JkxAoOrW8zY3PNix55Q42q1XMEm
         BZMYubLozMvAAlTWQeJwVVxpx2UucTYfwL8lyouyCeMoCxVxMklSHRGT7YiHR2Zk4/tY
         dTkEBGunojCKc/ZZ/G0sS2Eo9UDRkbyvQm2AtGmy4HIiaR5nADdenvlcmsfFZXKw452M
         THAEf/Ks4PM6lxUqAWHdxW1xA/A6o8HpFNmCeCUT6cSTcJvElQ6TWfWc81Bvsp3njaco
         qVKpfnMbutiAeya7T2u1qB+7cS8ZMOBWZ+HxVGFarEEo7f62oc15+jEtBwWbH1SfK9JM
         c9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936679; x=1795541479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
        b=IdEITVXOtj5XyVnjQ3QHOfY2gkBv1aZKljgi5ozAiwkZYE6PQ6sdBoKxSFPZxRsJ12
         L0i52b2gIq/KldhfXht/0Q/Vms+f63NCL30lXyieqfCXTDDTqD6ITO3vgbWy0Z36xM1L
         3cCXYiS9ye9o3zP0ZfceqvZsfUThjmlcCr1VDDNk2X0kKWsEBAav4MPvLizGBd4a4G+Q
         yLoNtbsaoodcg0IexanR1VvjwCurVjLWxybeO+vNMCUfgOr51GHUmffzIFUUsOFO1t8N
         1rN50k8XduEq6S3NnWLNgOXvhbkG+cdYL0OGMVFcOQJFz59p/sKAhx+h0PdVCSB9dADy
         EbBg==
X-Gm-Message-State: APuU4Z8yVKAg5qDFH1O89PwcEE6/pmzol5ZfRE7Qmkggrbs3c35NNyEP
	x6qIU3gYLB93kgJHyU+xTw017qxS9wualmptufy0fY9kJ6QZtSA9aXhYPrnhjqBFusg=
X-Gm-Gg: AYBFou2rbXSwWqkIe7GcpuzoHF4TmUBRYVvGGzWMzmNssRcwqjh0/X8/Hwl29pRyJjn
	XFJEzpVVlb7M1Z8Ga3kLdXM1OB+JCoeiB9MdWFXokJu1VH62Z3/wwFM9j8d2bASz4p2tsoqQAXS
	zBDwTuSnRF2IQlo9uTkDBWGEhBPUIoW2hrFyGsf9vSZm88p9b4nChzhbKXnygg4V0qrzemh12Eg
	tLfJyuUjBSB4ODTZl6i87SD402bD3sy9suZNghRZNPkOOqZCrfzBrc+w2MYsUGkujBO/a7MMwxK
	fPptLAVjxXXFe7H06/+2sysv/ljcJIFx4fpN1a9lhsK2NMTrO+4rChdqh8K0g0Qolgm+ru53PUa
	MNfyLDshMia3coTbIBMI4LwT4RooH2g6F8iqX2eEyprXYkucksgaUiDo8GAXv8w4knPHX8qc7xv
	HTbt/UgLZIhMgeIHkk8/+E3xmuLyIJ4lwre6EYIucOHBpqg+Iyxs8aaNXrXbJeHoBo7+TDCVCcZ
	D+UkGU/KWI3SlikcMOdufsivis+ojjlTs4lSiC12RxuysoPpTtJtpixBD4c1roQDXj9c43OiOXE
	LSH9i1yfeFu3nERIi5UEyyqrqEEeBGdRrJte8oIvHhstDL9bJFLXjw86
X-Received: by 2002:a05:600c:3547:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb55a8a402mr298153595e9.28.1794936678575;
        Tue, 17 Nov 2026 09:31:18 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 17:31:04 +0000
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: Add MT8196 SMMU
 wrapper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-smmu-wrapper-v1-1-229f04d9f693@baylibre.com>
References: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
In-Reply-To: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_093120_652856_691431D2 
X-CRM114-Status: GOOD (  16.65  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT8196, a MediaTek wrapper holds the integration settings of the
multimedia SMMUv3 and merges its interrupts into one GIC line.

Describe it as an interrupt controller, in its own node next to
the SMMU.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../mediatek,mt8196-smmu-wp.yaml                   | 70 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
new file mode 100644
index 000000000000..b841d9d0e3fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt8196-smmu-wp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 SMMU Wrapper Interrupt Controller
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description:
+  The multimedia SMMUv3 of MT8196 is integrated with a wrapper block that
+  collects the interrupt outputs of the SMMU into a single interrupt line.
+  The wrapper latches each SMMU interrupt and keeps that line asserted
+  until the latched interrupts are acknowledged in the wrapper. The
+  wrapper also holds integration settings of the SMMU, such as clock
+  gating and system level cache attributes.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-mm-smmu-wp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: |
+      The SMMU interrupt source:
+        0 - Global error
+        1 - CMD_SYNC complete
+        2 - Event queue not empty
+        3 - PRI queue not empty
+        4 - Performance monitor
+        5 - RAS critical error
+        6 - RAS error recovery
+        7 - RAS fault handling
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mediatek,mt8196-power.h>
+
+    interrupt-controller@309e0000 {
+        compatible = "mediatek,mt8196-mm-smmu-wp";
+        reg = <0x309e0000 0x1000>;
+        interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        power-domains = <&hfrpsys_hwv MT8196_POWER_DOMAIN_MM_INFRA1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fe23913b1e43..5cc65a753ad2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17223,6 +17223,12 @@ F:	Documentation/devicetree/bindings/memory-controllers/mediatek,smi*
 F:	drivers/memory/mtk-smi.c
 F:	include/soc/mediatek/smi.h
 
+MEDIATEK SMMU WRAPPER INTERRUPT CONTROLLER DRIVER
+M:	Alexandre Mergnat <amergnat@baylibre.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
+
 MEDIATEK SWITCH DRIVER
 M:	Chester A. Unal <chester.a.unal@arinc9.com>
 M:	Daniel Golle <daniel@makrotopia.org>

-- 
2.43.0


