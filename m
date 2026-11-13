Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C5606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TTliXuBD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GdXobWD5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pzwdGume78d+Ss8/RtaDjaZog/9tADCa21G3bSQ/eAo=; b=TTliXuBD+PsrO4
	b158QH2Q/7ThB3+GLnTBLQxAQcn55UmakssilAc42UuKW5EJk/Utp81EtRs/4DUoF4OidvjY3pBzm
	/d6+VfwSE9FmDtjL5V7MX4EIanXO6HLOCwyEnQWoAqY4ievCA5yILVjQtTOIoxCYG+KEPGAeYq71h
	Org05Xjv8z0ZEW6ADsVWI+AAXsdc0njAEjAnTJw0H4ev1+evx/lMPVlkOj5S4YBEd+XE9kH92khXF
	sp2o1C+IuKm5E7MeqCh/un6e7CIvNCw8D3fsr9PUEEBxXz6qSqSxUhHeCb64bhlYUeSCPb2rMLjNS
	DDqRDg7KVmOhaAwh9n4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFd-0000000ChRS-3Qxe;
	Fri, 13 Nov 2026 12:19:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFI-0000000ChD1-2CyN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pzwdGume78d+Ss8/RtaDjaZog/9tADCa21G3bSQ/eAo=; b=GdXobWD5h/zu2k0fMGp9vLubPh
	TG0iNSok957sm4iolDQQCdV5FmzpY/q97UY7pxJXtlQXYV5C0nZIKu2+Kenwtfl46y3jTuW3KzpIr
	QkZPc7va8m7xPRpFYUMQwSyFNnamkLRiTnoJcagi/bc62So6An/jeTzAslVPs3tcaXyOYKY6Zloiy
	Uel3CQ3TdJvxANQsigxfkc+DEBelNdbjhPw9fPZ8n/N/jqn1Z5JgCMMIB5FBA5v9fKX71/JPdBHCw
	qr8Yb/I7ftXhkQrcZ+0yvE+gGYmGS56+TG98E44UjK5QF9e+Ao79mj4V34Y2h951L8ZCtENuDDSEX
	aPwkorEA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF7-00000000mHC-3H1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-49412eb1474so406564f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572335; x=1795177135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzwdGume78d+Ss8/RtaDjaZog/9tADCa21G3bSQ/eAo=;
        b=lM3uTvItSQme39Wte9IsoSf+USHsYLZKZihnpE1q3GVO4yXJdbU+wSPSUWc4rkV5sI
         XzhQFDuIOPhcnu5qjIvvChpEBHymwN10hm+W0om4IC6VD2slpAeuW5xSwtRgs3ZBtqhu
         9S4anx7+yaE0QxubBSp/DqyRnIyE1GDVCfhDHSjR7RYHIL7U8JQVJG8xIRC5y6hBKZiB
         2rOJneshzHDpM59UEkFQuSt4/YT1VCVeqQYip0RtolgIUSwLWaIKwMq6SzYH1t08WWMe
         h0PI4PCn2U4q9UEg4RFSD+G6YjGz52ut/CljqbaAfeCPFP/E3AcSRlnAmbg87e7MiM5Y
         pxQQ==
X-Forwarded-Encrypted: i=1; AL+hErGGhLaJX7DzgxfpBp0SatJGnE107NxuJyDz5L+SE1f6q+gilfn1SDVqKVOJqXRxHlZG24eXExr+xiSBSZG7Pb8m@lists.infradead.org
X-Gm-Message-State: APuU4Z9voMvk6eAW168HOQDsTE5+qPJUFpO73HNFRZ7EUo1UoKNHRbnm
	psPXTDiMvOb/MgcRUUNT5yxGRx/mF7roOPX8uSgX9DwDBreCfoPsnvUW
X-Gm-Gg: AYBFou0dgeJPNRrFxmh5FmcfsSgI51cI/46/2cVtcHIHzA4CNw9Zvh+Q/g07l0K3ejc
	gHmH0AsyN3qAZFmnF8YAN9FRkplo7ZoCs5+H+XQ9V8dTdz7mqN1VdFgtHQxjRM8oEn3CTNyQvRl
	Kjhgoxfww/+rDesiHrDWJPtsPXbf2K5XEuAhy7yNb2BNvwAp0OzZEwNgLfCVvpo9tSpytmgesmC
	mAbJwxx+mX1KudPF0oQk58wg3AjDkUx9VLhxhHpbfQ6StTODaKBSQ861Eh9VkoPDiVVTFihKbEb
	bLQLjpf2YmwC86UDIS8VmLV3iEfhHxQnRnoqeU6OuqpBB3GMDrmuqZcJ3uxo6GaVjFoNl4SzIet
	3E2qjk+1b+7kc82yzmbAxI+DtqnLY2BZbDCXHXyakHdKu7soXNfe5eZSmn6MgnAPUYV6H1hx4P+
	8IEB/1FDHLag8ul2pPNSt4Y6YvrGJQeNXnuDqufjvFhuwkgXOYAcZm0askhfgx/5uzze8Mknz1l
	VebOgcRwhEP4djp21hTpHgKWry2mogXpOMcmOo98OVICmNtGoHzmhLs1vgQUcRjFB+WxwX2NRqX
	BRxcXqsFM0nxmYu2zP36x/JKrN8hXQOo8dmPwhDorl+dEKcXOV9bCvr6h1160hIXJJiLnOD3QsT
	k39I3XJQS/ehDDG7drXOPLL5n
X-Received: by 2002:a05:6000:2003:b0:490:411a:1eed with SMTP id ffacd0b85a97d-49c72f7a66cmr5198418f8f.39.1794572335385;
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
Date: Fri, 13 Nov 2026 12:18:47 +0000
Message-ID: <20261113121852.334604-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121857_857472_D02DBBB3 
X-CRM114-Status: GOOD (  15.96  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers share a gate with the
MDIO multiplexer, which probes after the controller has programmed
them: the writes are lost and the port keeps the bootloader's delays.

With a newer core, a clock list of its own and delays that follow
ethernet-controller.yaml, the T7 gets a binding of its own: the PHY
adds the 2ns, and only the receive delay line offers fine tuning, so
only rx-internal-delay-ps is valid here.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,t7-dwmac.yaml        | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml
new file mode 100644
index 000000000000..9b7c3864cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/amlogic,t7-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T7 DWMAC Ethernet controller
+
+maintainers:
+  - Lucas Tanure <tanure@linux.com>
+
+# The select keeps this schema from matching every "snps,dwmac-5.10a" node.
+select:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,t7-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: amlogic,t7-dwmac
+      - const: snps,dwmac-5.10a
+
+  reg:
+    items:
+      - description: registers of the DWMAC controller
+      - description: the glue registers PRG_ETH0 and PRG_ETH1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: First parent clock of the internal mux
+      - description: Second parent clock of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
+      - description:
+          APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
+          Without it, they read as zero and ignore writes.
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: clkin0
+      - const: clkin1
+      - const: pipeline
+      - const: pclk
+
+  power-domains:
+    maxItems: 1
+
+  rx-internal-delay-ps:
+    description:
+      Fine tuning of the RX clock, added on top of the delays that
+      phy-mode describes. The PHY adds the 2ns RGMII delays, see
+      ethernet-controller.yaml.
+    default: 0
+    maximum: 3000
+    multipleOf: 200
+
+  # The TX clock has no fine tuning, its only step is a quarter of the
+  # clock period, the full 2ns at 1Gbit/s. The PHY adds the TX delay, so
+  # the property is not accepted.
+  tx-internal-delay-ps: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
+    #include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,t7-scmi.h>
+    #include <dt-bindings/power/amlogic,t7-pwrc.h>
+
+    ethernet@fdc00000 {
+        compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+        reg = <0xfdc00000 0x10000>, <0xfe024000 0x8>;
+        interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clkc_periphs CLKID_SYS_ETH>,
+                 <&scmi_clk CLKID_FCLK_DIV2>,
+                 <&mpll CLKID_MPLL2>,
+                 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+                 <&clkc_periphs CLKID_SYS_ETHPHY>;
+        clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline", "pclk";
+        power-domains = <&pwrc PWRC_T7_ETH_ID>;
+        phy-mode = "rgmii-id";
+    };
-- 
2.56.1


