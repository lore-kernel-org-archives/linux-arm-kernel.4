Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F9606D808
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gB0BQ6aN;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=pZwbRThB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=; b=gB0BQ6aN/TR6Q45PAkBksL/hMR
	5B5pNYtL3nm5tpO0Z2w0WYai1J1D06Ojxh+wZcBrkEb9+yQIoSTZnwaQWu4Z1UWkx/URRKEu4uSk6
	D4KNvecbJPZmNx8ITWHPwlzgT0uVGXflnvuvuGuN0qbplQAMSDecElD11hJ+IskQCq0qg5sMdCMHR
	r6VNNXlYMLE5V62RcbJxzvyLJXHJiUPho0KhifptG6gqvNB2oMy4uX/zzaMoVeeSZm/aNQYBV8ONH
	IafXdes7edX3rBghQlHBoXXw5zgXvsivlb7ddedSDAjOwJLkRsr/s9hP4i7tpMxkys+4A6zvgwWQ+
	ZftQPQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPXy-00000000peV-0evU;
	Mon, 09 Nov 2026 13:36:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPXt-00000000pbb-2QDT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:36:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso4988185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231382; x=1794836182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=pZwbRThBkbqe9Jy/zGySJniRLnoTcR8LedG5Njem9DV785usBhNMl3ZB5gfArmXvYF
         6+aOnDH+c2Y1EKpVoGbGnFD5l1W/VUfz8p9ll9XhqXChNUkRlb/w16rIQ3KFbMefxNDL
         ke+QuMZ5z5dtNX3+GsPVUdCclHPrGsU3JfHgqN3ItmyepphlxBlVPGBVJLdtEImq2iUA
         EqC/RIgWLs+J+qN+45S54gRoQdV7RAhl7evPuLsbbquGzjZwCj4Bru6ioYmYtgC51ynV
         c+Qd731sSoyalvLq3S73Dd8orY4FKNpFONBiH1R223iIPjjU8nHPELxDYbwlyVH7HNp1
         euyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231382; x=1794836182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=Foyl0e0MqywbpltGH6ZEpabz3bxyNEeRWrFZBrMCYOmkXutLFdPj17UHiEnCFwr8/+
         1U26zyEC7xGT3wj5krGqxY9W9deE0eiDIzQYpuOeUcETcdaJ2c4HyGC8117j5bpdhzl7
         JjQ4VSvDwFvAto/f73VEazA7wX3k6zzWsAYbkBsl9wKnw7SgQA2vXlfR2G6Y6/3Xbigc
         Nn7FaGa5o0lcquT6BfeUrlEX6HUHTCRKrP8I1qOFC3oWvlYZOoifg4N0CZEVVuRow9mN
         Qdv/hqY2kZVobunK2PilvoF4GeFmd2k5gzgxkIAD9JZWCrbovLzo0TgkgEMPpYMg79md
         f8rA==
X-Forwarded-Encrypted: i=1; AL+hErHhJds8z0u3x+gW/AUtSIL+J4brwmzAvxRenLHfx88fxkdIVa9asAeBVxUjeMLL+tGENk04sBT3M7cby1dGegr1@lists.infradead.org
X-Gm-Message-State: APuU4Z/NRRQCsmtUe7UQI+s3HuG7coVc+dOx3Bo8HaOHx5CG1TOGTnzc
	U1VWQZYVot53/UXlxYH6Aj0RMcPUPWsF46F0yWSTvvNfvwXjhO8xCRDzV7UpLp2WZ/s=
X-Gm-Gg: AYBFou2eTPx1wJpRq8FiTMy2GNSbv4sOtpClk4jj17zUwxFJwGdDVIoz3GJ+6tlUSQP
	aHjHO33ih0XsKW8aAoDugJ6NiOOiyMsC/RTW///Ufl1hxM+RIr+McYYgUAQ79PxbgpnpiLkAwkH
	uq0Gk9pgrzn8+IFH1fiDBipIV92DG+8WqIlwT1OZqYlTH/+xVXzFIRs5Bbd/eDODP0H/rf3/lje
	SBrVPqUFqzfe6dRz/LaUghZrep8meXTkgclUbod/pCwlakbKM2eVjp8LC8aic9SnecDCKbVhtJO
	SkQt9/EAB0DaJ07ifTl5t8a7mQ6MlsJ5nE/StW6BtCqiY9/NKuv07stMa1D6o5EIJG3KUoK4rLW
	ZT/SvxmDdSDCgSZSLuGXk/e1WCkYyseF6Z7OXPVA0R1kVnTMeLslE60WDUQRbZONYrrZkcZ5lyg
	wicE2S5wZYwgsQ2gLN8Llom4VEh+H8zceAclnXTWZ8W37zC6gz+OGl/S+jNVlgGY88G+bqAYtdF
	/i5kmVCCLhzYLm3UoAWrZEpW2/IxVzKfXRF7jNKFKU+QlWbMAMjVsBTTfRKVCmyjG7XG625NJSR
	n9+Wn5OrhT70HfOBB4nwjB+hQwWiQ/KBqo4eCR8wwaKaNqmmJpyZo9LXB0nkhGXOUnQxDABg6sL
	2oul4nrihji54oTC9gWAQb27p+EQKy1s1mj5K+dVRJ1elrbvKii4CMsIG+WCTfxgJsXQ4raVhm6
	8FwX4WesbIIz+YqSzaAz/N5eYL
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr71051325e9.35.1794231382337;
        Mon, 09 Nov 2026 05:36:22 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:20 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Mon,  9 Nov 2026 14:35:05 +0100
Message-ID: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053627_444300_37F3AFDA 
X-CRM114-Status: GOOD (  13.57  )
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

The LAN969x fan controller has a PWM output and tachometer input in a
register block separate from the Sparx5-compatible temperature sensor.
Describe it with its own compatible and binding.

The optional fan child specifies PWM period and polarity, tachometer
pulses per revolution, and thermal cooling levels.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..0b7d38a6d20ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Fan Controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  LAN969x fan controller with a PWM output and tachometer input. The fan
+  child's pwms property references this node to specify the PWM period and
+  polarity.
+
+properties:
+  compatible:
+    const: microchip,lan9691-fan
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System reference clock
+
+  '#pwm-cells':
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: PWM period in nanoseconds
+      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
+
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      cooling-levels:
+        description:
+          PWM duty-cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
+      pulses-per-revolution:
+        minimum: 1
+        maximum: 4
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
+      cooling-levels:
+        - '#cooling-cells'
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#pwm-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    fanctrl: fan-controller@e2010348 {
+        compatible = "microchip,lan9691-fan";
+        reg = <0xe2010348 0xc>;
+        clocks = <&sys_clk>;
+        #pwm-cells = <2>;
+
+        fan {
+            pwms = <&fanctrl 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0


