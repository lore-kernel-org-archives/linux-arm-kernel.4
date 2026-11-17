Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D0A606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0/4PrqSs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rh7nCWYR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ip7WW9LYq2XaFn3cz3EajUZgkrneTRdDmQiuR96TXKk=; b=0/4PrqSsbWrAl6
	6NvgGf78G9cgEJNTtH8NoEMzYbWtH1vMjbosz5Ctbl+uRCvUqT3lDaCDCPfCH9jJ3VM/upY8VYhg+
	Iq7CeWPS/Re/PClnuFRNJdBWkHOPI4klLB8OQNZc92yzfwlG8b/Nfql6/nfde/3ESBtVm6QvbAabB
	zCm4rwzIN0nOGBVGygwjz56uun5/xhzB66Sni2F91L2bvRi12oOjZLfRWT4lsB+gA6nEJGLu3/rBS
	aLa6X+PW2xReGQ3R+ybT4a+KtHfqytiuyn2urf45HeDBihU6EYAEVhO6U73121w1hJrOd4+FpbGad
	Lp20KJoCQem+wZtEQRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEZF-00000004tCt-3egz;
	Tue, 17 Nov 2026 08:29:29 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEZD-00000004tC1-1YqS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:29:28 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso1577625a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794904166; x=1795508966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ip7WW9LYq2XaFn3cz3EajUZgkrneTRdDmQiuR96TXKk=;
        b=rh7nCWYRBGHdLQektgnD6OngYPTIk3ruoUhzLVtZlTdaUD0fZGH+UUa4pXoWHbQDtY
         W9AyWNRJRiGaQGbVu6+f7lwW9tk6YW9lK/5xkgQyR298FusRWNmgGuJeZbjONJGYRyvb
         kzeLBQb9VVvKILnuKuZttDPSbZu55mavVHT/a/yRCNsoV2lwM8ECfBtui7yq/bSV0DA7
         w58MVTSZ28NWTvDqT08NAbEnlujI5eL+DiIAWf0vP0W0BcQ1L4ixQxGjz8gnIWKJ/ts1
         KIaNVyI9LNBDgVyEPlZTY/DEM46SAtSxtiyuiPld1caAeg9l+h7FioIijgd1tXuJ0zK7
         K7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904166; x=1795508966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ip7WW9LYq2XaFn3cz3EajUZgkrneTRdDmQiuR96TXKk=;
        b=h4QRbrKFi0yyAL1VzE2OymtmTJmfmtqYSCb/tv0toPk/00b0Bwp9+OMbPSmRYcQWkf
         KCbYvA+XM5bzKjPo4zo0x/pxNuym3tRfocGhbMbS0u90WVrIwnhGRjnotp0yJFLRjKlA
         K6pPkrqB2V83Dn2rDrkmFntHAEuG2mSJyaEzdne/n1Wvu3+HQmC0+6bpVvJGViwmeuhP
         uoy9lRQH9ZF3hMTM2u6nS//N/5pOBHykwlLQ1kI/ZurAXNOtRobLBoeEK23I9BJNAEUe
         f250jKV3Em/70BQOwaxhUX31cO5BQb6LQ+/BFQy3qUy4j3tqubIwmaTD87cer3k1nuri
         woGQ==
X-Forwarded-Encrypted: i=1; AL+hErE3qyVt52NeL4NjlnGbRiZxTc1qCxt6bwhC4jhr9MTY4glWOkJSSeuLks3LaKT2v+5oj6Zt6Xb/vJXUWMN927UN@lists.infradead.org
X-Gm-Message-State: APuU4Z/0HKKWnmzsZI8YKxHHckS+PdBsdF8eQQUrPFrdAQz+YzwmCxVA
	lLqg7AwzH2wVzVu1t9nDCRr4LGSHtavso8VvtaUogD0p7VGEDhEkWqWh
X-Gm-Gg: AYBFou2BlaMKhOlxIEzAwwY8cdIxRZM7Zk1h3t40yGOsVSjGdNkSIR8W6stFdfHSaYI
	KcN1Gsfb3coiokBUEZY2um8KJQHyvxRgB9HnS9JY5BuGzhZRxDsXqamaov+nJn6LvtyJCCuGrum
	5Ng0SJxraTzKhiU7AUMh9j9j+bAuIFvgF8r0+vO41PLwLhYYUuCQJ8+FaRdAtlicCM8GRcyQ4q8
	TVCyN3rbXc5SYK5wd2e9B0EJBwtmlwNnYqm6KPIZ8YIjsHjX88R9pL0JD2barSUM4wS7xMkPKvZ
	uwQcTGCJPHeShTQ8ihEdCBOtqJ66ALo0EFuxrzoPjVRGH4tR93vHv90ZCe+g08F5fxAWe49tSEZ
	qyAmqjUCqPZMjljqLOM06GtOnggxKrkO6NDDHe8YohrjORhAVh9O5xqVNrtEEBuzCX+fV+jhnag
	IHbYQbWCIvjOGDCwnoevr8ykt0GvJo7OGsJVI2434Ri2rLoT7ABvrCbCsx9QwX8p1acDToM7eWB
	FLIYEnRdTA8DcAjNhdjgF7qJo/lImkXaUV/Bb8wBCMhu63TonhmzN06Eljgi5Z9ohcfCnDPOqm8
	7q/8kT0HBTH87l/syQMyp0Kq7b/YegWYG13+gqqXM0QU+dVumpwshr4yLNNXiJ6e3mkNjMpWcUY
	blLXafGNS3cwMKqQ=
X-Received: by 2002:a05:6300:6f97:b0:3f8:c147:955e with SMTP id adf61e73a8af0-3f8c1479944mr7741046637.61.1794904166400;
        Tue, 17 Nov 2026 00:29:26 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm5422907a12.21.2026.11.17.00.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:29:25 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chernyakin.victor.j@outlook.com,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v5 2/3] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Tue, 17 Nov 2026 16:28:31 +0800
Message-Id: <20261117082832.1551574-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261117082832.1551574-1-cwweng.linux@gmail.com>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_002927_425156_03F3B0CE 
X-CRM114-Status: GOOD (  15.88  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a binding for the Enhanced Analog-to-Digital Converter found on
Nuvoton MA35D1 SoCs.

The controller provides eight external analog inputs that can be used
as single-ended inputs or as the four fixed differential pairs 0-4,
1-5, 2-6 and 3-7. The VBAT input is internally connected and needs no
devicetree description.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..1bf64913d67d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+description: >
+  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
+  12-bit successive approximation converter with eight external analog
+  inputs and one internally connected VBAT input.
+
+  The external inputs can be used as eight single-ended channels or as
+  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The VBAT input
+  needs no devicetree description.
+
+  The controller provides four interrupt outputs, ADINT0 through ADINT3.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-eadc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: ADINT0
+      - description: ADINT1
+      - description: ADINT2
+      - description: ADINT3
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      Optional external reference voltage connected to the VREF pin. If this
+      supply is absent, the internal reference is used.
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  '#io-channel-cells':
+    const: 1
+    description:
+      The cell selects the logical external EADC channel identified by the reg
+      value of the corresponding channel child node. Only channels represented
+      by child nodes are valid I/O channel specifiers.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^channel@[0-7]$':
+    type: object
+    $ref: /schemas/iio/adc/adc.yaml#
+    description: >
+      External EADC channel description. The reg property identifies the
+      logical IIO channel index.
+
+      A single-ended channel may use single-channel to select an external
+      analog input independently of reg. If single-channel and diff-channels
+      are both absent, the external analog input is selected by reg.
+
+      A differential channel uses diff-channels to select one of the fixed
+      hardware input pairs: 0-4, 1-5, 2-6 or 3-7. Each single-ended input
+      and each differential input pair may be described at most once.
+
+    properties:
+      reg:
+        maximum: 7
+
+      single-channel:
+        maximum: 7
+
+      diff-channels:
+        oneOf:
+          - items:
+              - const: 0
+              - const: 4
+          - items:
+              - const: 1
+              - const: 5
+          - items:
+              - const: 2
+              - const: 6
+          - items:
+              - const: 3
+              - const: 7
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - '#io-channel-cells'
+  - '#address-cells'
+  - '#size-cells'
+
+anyOf:
+  - required:
+      - channel@0
+  - required:
+      - channel@1
+  - required:
+      - channel@2
+  - required:
+      - channel@3
+  - required:
+      - channel@4
+  - required:
+      - channel@5
+  - required:
+      - channel@6
+  - required:
+      - channel@7
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adc@40430000 {
+            compatible = "nuvoton,ma35d1-eadc";
+            reg = <0x0 0x40430000 0x0 0x10000>;
+            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk EADC_GATE>;
+            resets = <&sys MA35D1_RESET_EADC0>;
+
+            #io-channel-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                single-channel = <2>;
+            };
+
+            channel@1 {
+                reg = <1>;
+                diff-channels = <0 4>;
+            };
+        };
+    };
+
+...
-- 
2.25.1


