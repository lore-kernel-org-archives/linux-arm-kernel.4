Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4867606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=asUvloEA;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=GOd/YsQ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LMyaIeOekCuLTnuJbssjNi7FJvFc27BdHLPchlDN+WM=; b=asUvloEAEgkwH2
	UP/7LXN5xRs73JIxlgXDQO5SQ416ZPeqLMIszvL5BUa7l21RBRWosbLZxIovqHYB7e6i0aVRcSx1e
	HAufHeZ7ouIzVHNgfLf1ONsoM4nCb80e0hkWyn6KmHV+1ML8Rq9F4j2VjAcjiHycvvOVWefKG46Tm
	2J5ZXd6BU/dluLcdSwpGAoT9SOnhSnpKkJhelKYy0zj9Hpwt3MeThH6TYWQRpOZCBJd3LziGadOH7
	gFO1RQo1s1p25kCeB4Xt9m1I4EcuurX5leyB1yCgcIC+o2RUnnAWtPEbmmpUceXhUkbKQLv8sAq5d
	9BdkeAytdduykV/IDrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqS0-0000000F7RD-1Pr6;
	Fri, 27 Nov 2026 07:32:56 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqRt-0000000F7OY-2Fhm;
	Fri, 27 Nov 2026 07:32:50 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id DFF8F4C95E;
	Fri, 27 Nov 2026 18:32:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMyaIeOekCuLTnuJbssjNi7FJvFc27BdHLPchlDN+WM=;
	b=GOd/YsQ7g2Eh7I/IaPFht+veXWMqVOeBfO1wRSeo593m8hrdm/xfrchf8eDOJBfYPTsCwq
	cJ85On97rPPpN91jfilUvl/2AOxiJxy5U4I29IZuaQxCHXLd3JI2NxnfURkouw2ZZchoBJ
	82hvGYNClayPrfDHJGpEX4tPugHQYgxy7wqtFgMmM/u6cAjZUPxPBQaF4prJCgkUj4hM0n
	O+clUUCDvS9wKd3V7QO8JzF149ynMTV1oZFd0yXgCxgoAcBA4jpZy9eMSs8Lal36FORDp6
	og5OUJhMJ8qYU4o5CpmsymSl6lK6Hu1PYmTuhx7uaUUaAc2i+WnMUi0u4dCTnw==
X-GPT-Reason: legitimate; the message is a technical patch submission
	for a Linux kernel/device tree project which perfectly matches
	the personal mailbox (alastair@d-silva.org) and the sender's identity;
	the subject line and content describe a specific hardware binding
	(Allwinner A733 USB 2.0 PHY) consistent with a developer's workflow;
	the From and Return-Path domains align with the recipient's domain,
	and the URL (devicetree.org) is a standard, relevant domain for
	this type of technical contribution.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 01/11] dt-bindings: phy: allwinner,sun60i-a733-u2phy: Add Allwinner A733 USB 2.0 PHY
Date: Fri, 27 Nov 2026 18:32:21 +1100
Message-ID: <20261127073231.1776847-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_233249_752552_4536EFED 
X-CRM114-Status: GOOD (  10.86  )
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

Add DT binding schema for the Allwinner A733 USB 2.0 PHY.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../phy/allwinner,sun60i-a733-u2phy.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-u2phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-u2phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-u2phy.yaml
new file mode 100644
index 000000000000..7291311d3c4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-u2phy.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/allwinner,sun60i-a733-u2phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 USB 2.0 PHY
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-u2phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: OTG bus clock
+      - description: USB subsystem AHB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: ahb
+
+  resets:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+    #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+
+    phy@6b00000 {
+        compatible = "allwinner,sun60i-a733-u2phy";
+        reg = <0x06b00000 0x800>;
+        clocks = <&ccu CLK_BUS_OTG>,
+                 <&ccu CLK_AHB_USB_SYS>;
+        clock-names = "bus", "ahb";
+        resets = <&ccu RST_BUS_OTG>;
+        #phy-cells = <0>;
+    };
-- 
2.53.0


