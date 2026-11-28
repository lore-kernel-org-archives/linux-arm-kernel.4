Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85C606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X5o4VXnD;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=JfvaIfrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rxp+ojsSYP6df0Xl+X5RYTP1fM0f6afciX8XTYdpT1E=; b=X5o4VXnDw4+pfR
	fqx6IFOAn6+R3DWM/n/DQU4VnxsdyUV4lR3l38O327UsJbG001gK5jNdaLW3v2ZisjspjdjBVIC14
	ji1V49amNYRpSYTilB1y6fRHLblRl9rLuZpSWBGPNJs4g0FOsdoY3xu60CGjStNrxBjJ4alT78xRC
	GPxToZJmIdFuYaqf0kbcsxQ6SDuX1fmdLNcZV4WvepP1L4eWFfrlwlQRR71L+scNShu0oFWUyCLCF
	TBgQn3WYSGBeVXQIuLPGVXhuPwScOf1lM0Rc6nfJdow7lVIcAGTWkvScg+Pk/6j4yWXFgjkELSTdM
	jG+zblNvZeQ3v1U+giKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIqA-00000000nve-2rGv;
	Sat, 28 Nov 2026 13:51:46 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIq7-00000000ntg-2rxu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:51:45 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jcBXW6sbQzKp25;
	Sat, 28 Nov 2026 14:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxp+ojsSYP6df0Xl+X5RYTP1fM0f6afciX8XTYdpT1E=;
	b=JfvaIfrcj2TigiUqVR1TG8CiMZlJZWNqdm9Ujp0NakY909O53e19zPQ81j/Yy+u2JEhRhF
	taLyxrThwK94t2tOp5z/W7u3BErWPRch4jW+toVKK/9pOtGkmTn3rO1SJLcglMnGYZTqfH
	uacssl/Hb3wG9nYWMw3On1Llzua3//FzPtRPjrxP0g3gYMVp6hFBPuV+MI6LjNdFxoF3gS
	3d64uL34DhBwLF8PnbLhbQ74BNuw31lowkWmAiI3i8cWbA5rrd9xVpySRci91PbVrIwHIY
	WPtYMP4r6KgA+OIaBxZHzt9TuJaEywlsmls+SURdB6FilCcNWnfz6Q3zqYooxw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:28 +0100
Subject: [PATCH v2 1/7] dt-bindings: input: touchscreen: samsung,s6sy761:
 Add S6SY791 and reset GPIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-1-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXW6sbQzKp25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_055144_176857_E13343E5 
X-CRM114-Status: GOOD (  11.70  )
X-Spam-Score: -2.8 (--)
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

S6SY791 is the SPI-based counterpart of S6SY761. The register map and
commands are identical for the subset the kernel currently implements.
Therefore add S6SY791 as a related touch controller.

Optionally, the reset line can be controlled on some boards,
such as the Google Pixel 6 Pro (raven).

Also reference spi-peripheral-props for the SPI bus properties.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 .../input/touchscreen/samsung,s6sy761.yaml         | 51 +++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
index 1ffd17af3c53..d7a116b04f41 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
@@ -8,13 +8,31 @@ title: Samsung S6SY761 touchscreen controller
 
 maintainers:
   - Andi Shyti <andi.shyti@kernel.org>
+  - Lukas Timmermann <foss@timmermann.space>
 
 allOf:
   - $ref: touchscreen.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s6sy791
+    then:
+      allOf:
+        - $ref: /schemas/spi/spi-peripheral-props.yaml#
+        - required:
+            - spi-cpha
+            - spi-cpol
+    else:
+      properties:
+        spi-cpha: false
+        spi-cpol: false
 
 properties:
   compatible:
-    const: samsung,s6sy761
+    enum:
+      - samsung,s6sy761
+      - samsung,s6sy791
 
   reg:
     maxItems: 1
@@ -22,6 +40,16 @@ properties:
   interrupts:
     maxItems: 1
 
+  spi-cpha:
+    type: boolean
+
+  spi-cpol:
+    type: boolean
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin of the controller
+
   avdd-supply: true
   vdd-supply: true
 
@@ -52,3 +80,24 @@ examples:
             touchscreen-size-y = <4096>;
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@0 {
+            compatible = "samsung,s6sy791";
+            reg = <0>;
+            spi-max-frequency = <10000000>;
+            spi-cpol;
+            spi-cpha;
+            interrupt-parent = <&gpa9>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&gpp26 0 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&ldo26_reg>;
+            vdd-supply = <&ldo25_reg>;
+        };
+    };

-- 
2.56.1


