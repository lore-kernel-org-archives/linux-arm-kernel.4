Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2E6606AB8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lBQ8fDcl;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WKqLuHkV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=; b=lBQ8fDclu4WvGW
	CU1GOROjgGBS0ApTkeUh4bRy+bj13G5PBIsEEjfTyxIbXqd6WMK5PpS6bbURUDn9QPjjs9tzBXVOY
	6VRcuH58ikuCtgLZSzTcN9u8SaAFid42EBXwayM0jn9iyXCz3IaQPWgDWeQAEcfV0/Yanuk6EqJ7L
	7sFWoVmaYt4OGEy6jOg0Ifh0N1OkBaMjvSOqaFNJ6bGR/2/3HfgeLU9f1sc+09PeyJIEpaKwI9DTX
	nW5rLOnlbIKXv2N04GR3cW+NixrjmkpvaZ1o+NZko74oOoktaVlhUd+xdcsaQUqtBDu51oa9VZUch
	0j0Dq0RLlty+4BpSQY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOy-0000000F3lA-2ErF;
	Fri, 20 Nov 2026 13:11:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOn-0000000F3cn-3OSa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:11:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so5605005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180288; x=1795785088; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
        b=WKqLuHkVG5V1cqLYRXmusPpo2gQmBY8oIToia9hrcEjZyIb3FY6ySJziRX5EFlWIBP
         XaM1ajT9QZbNhyyLd0br+SNJrBBw1tqKtKh+AiRKB2SPDNnKGA/7a1Yw9EQ8C+aovvGJ
         /GtnGBQWhna0/vvU+VwFL7T62I0ZaFIbb3fsetN7olvOS1eKbrMykHFlfIAThBHABzuW
         D5PKIso7g27B84OVEBJIWqVdCBf85ltKLOGalvZLeJ0QV11T5yIHfhOPj4KegQ10Yoms
         lybvdcBYglTagI64xTKy0LH4fpFmi1BLx2y7l9z0HI15lKiu0LBCmls11mNHHobGfiaR
         o/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180288; x=1795785088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
        b=RRgkQakIG0gmcVX3CQb0uYhslQosXTPk7puD0ZFSKmmPAMTuztnKJaifCmrxJijBH6
         xJyBafeQ+4xK02FQD5XtqJzoLOyGegwoiDYmAp1qp8GmvpgdI3EB6F3M2zqhoBcaIE+t
         04JQ27EuukM5V/et7WVcoqdrvobjJ6lFzKmTa5HXz4+bo/rvcAtUgd8LFuf4DThvXRbe
         wrCg7l0vh9VzboQZZNgJpa0/gMn0AJAPepfEh5jArE+tR2ybIwJ37+7l8i3B2fbj8frO
         6cUdroiihNHp3jHJ7Fc3CZMU8GHY1W/p/HJPZ1nWoo3MVb3HoaFvr22N5R51B6Ygfus/
         SGrQ==
X-Forwarded-Encrypted: i=1; AL+hErEzoue0pR3e4jOmJLe1LFTJsrXzqfzNWTYZun1OWXRokWQ7KCQgA6cAwZLV8GtLyNBQ0qV4xfaE1aaPFbWl5wv+@lists.infradead.org
X-Gm-Message-State: APuU4Z9rvl2xIgoK5hFQnwQYEICzJ4Zjw60mdDqkSef+ULv/mEsf0Fae
	Gm/djoTB+Sjhm0rDWRPJYghxJSqtLYV2eoqTxXIlkNLDJfpcIRYuGU0eSgtBDJMgrkQ=
X-Gm-Gg: AYBFou37RqqdqBsqf4cYSnE1k8RJciZkF//q3O/GpWEOMMzYoKhuy6FNjB34QL63L6k
	+fJ1n1IySZq5/bN6AelIf5TliBT/7GBmVZR9o7JG4RTBXq1u5UYfzrOV7025IDxOqk7XXUuJkPF
	1bgb0drDCZhlLYexWlmFFZIjCP/FJ/gINmSHB6APFHfC+cao5Z/CEI1NOM53rJvc5p6CGOhZ2q6
	aI6664uqQuD9fT69dYCRJK7qAWs6rrIUI21Y+a2G4YuZAyWPCgdcKtBfD2SBr6h+pFrhUUoIJML
	OvSBUiPaQFZFhCOM+DqALlvmQN/zIK8pj1BmSoS8EVigGAwgkCfaOavb1GoniltgMsssHR40NUv
	t++qdn+K7xayttyUWCYaAOaoY78QIKa5XU0wCEqXCWnc2bfx+WvoDxQhHF80fokXl2alABpxGgA
	rmOyXKq88VSS438RqL53htBcHsaD8LsDUVWDFxOhK93i6A2wN4SmH4MUsZO9lQOptMZonYlvo9K
	2t1yRS47TSY705Di28cE5kPG6ljts7R/xjtnvgzaT6NDjmsDVxrL8pENXp6OQF02pl8dDYU5l2y
	/5NJKn9DDt8cb95tp9QSqHJuUqR+TRX0yrhobKuol9twNGw5BricFxg6/RbiwJT1oFTOfahq1hg
	UXDepheNIOEbEEbWTeHT0VIlRp/1+/+aiudOFZVOUndSIEw==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr72814425e9.0.1795180288235;
        Fri, 20 Nov 2026 05:11:28 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:27 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:06 +0100
Subject: [PATCH v2 3/6] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-upstream-s7-clk-v2-3-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_051129_899041_10650566 
X-CRM114-Status: GOOD (  12.34  )
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

The S7 PLL controller supplies clock sources for the peripheral clock
tree and receives its reference clocks through firmware-controlled
oscillator gates.

Add the binding and clock identifiers needed to describe this
controller and its connections.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 71 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
new file mode 100644
index 000000000000..1984cd42fda9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S7 Series PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Carlo Caione <ccaione@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,s7-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: input fixed pll
+      - description: input gp0 pll
+      - description: input hifi0 pll
+      - description: input hifi1 pll
+      - description: input hdmi pll
+
+  clock-names:
+    items:
+      - const: fix
+      - const: gp0
+      - const: hifi0
+      - const: hifi1
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@fe008000 {
+            compatible = "amlogic,s7-pll-clkc";
+            reg = <0x0 0xfe008000 0x0 0x1e8>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 3>;
+            clock-names = "fix",
+                          "gp0",
+                          "hifi0",
+                          "hifi1",
+                          "hdmi";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
new file mode 100644
index 000000000000..6bea314deb31
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_VCO			0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2_DIV			2
+#define CLKID_FCLK_DIV2				3
+#define CLKID_FCLK_DIV3_DIV			4
+#define CLKID_FCLK_DIV3				5
+#define CLKID_FCLK_DIV4_DIV			6
+#define CLKID_FCLK_DIV4				7
+#define CLKID_FCLK_DIV5_DIV			8
+#define CLKID_FCLK_DIV5				9
+#define CLKID_FCLK_DIV7_DIV			10
+#define CLKID_FCLK_DIV7				11
+#define CLKID_FCLK_DIV2P5_DIV			12
+#define CLKID_FCLK_DIV2P5			13
+#define CLKID_GP0_PLL_VCO			14
+#define CLKID_GP0_PLL_DIV0P5			15
+#define CLKID_GP0_PLL				16
+#define CLKID_HIFI0_PLL_VCO			17
+#define CLKID_HIFI0_PLL_DIV0P5			18
+#define CLKID_HIFI0_PLL				19
+#define CLKID_HIFI1_PLL_VCO			20
+#define CLKID_HIFI1_PLL_DIV0P5			21
+#define CLKID_HIFI1_PLL				22
+#define CLKID_HDMI_PLL_VCO			23
+#define CLKID_HDMI_PLL_DIV0P5			24
+#define CLKID_HDMI_PLL_OD0			25
+#define CLKID_HDMI_PLL_OD1			26
+#define CLKID_HDMI_PLL				27
+#define CLKID_HDMI_PLL_PIX_DIV5			28
+#define CLKID_HDMI_PLL_PIX_DIV6P25		29
+#define CLKID_HDMI_PLL_PIX_DIV7P5		30
+#define CLKID_HDMI_PLL_PIX			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */

-- 
2.56.1


