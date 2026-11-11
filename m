Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E32F60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sGfxNvRr;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=aHJR0yrv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=; b=sGfxNvRrhTEpSV
	87J+bw0BM7l6pE+j+eKOz/7v3IKN62Ct/qqsT9soc7qWEMDYUHc44bNx19zcBBLxDys7FOOaAWRqf
	3gxM9gqPKJd0/KKWZueS2Yl4u01E3FpxlHDXtDEGbyXnOG0tPPqKLE1iJ/dkRkHnQbXjBRAhCaO3p
	bfmYr47tidF/nE2yujJBUXWcywHF67Kl7hsUXC57NWlG4T4XkkDOeKlMzW4Ow4Ad5VFlEzORKdxFl
	UNXIyxpdWNg7hP0WPiSmhFzPo+qfu/o4Ja5UuS0RnOSw0uKzrmsepB5Ox6AzvyO6RZwphvTDuh/NB
	Tt1RZrqEQ3GIDOhc7t7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB03-000000079nu-19KB;
	Wed, 11 Nov 2026 16:16:39 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAzz-000000079lZ-3Zxj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:16:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a214af2076so24843005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413794; x=1795018594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=aHJR0yrvwJG2KX7l9BOROMtHzYA+dsi9SkvqcJgpp7oyPHzXbQ9MXlNX6RUgUZhALa
         bTzhNElavIqfJEmZpO09OHQvxxj0J7oRbZ2Ll08AG9CYFGZXjJmClgE7sp+/0cWbxl18
         hKd9uMGHA55Krl4cEWVcfK/eaOYaUHgh75qW47reL6zmOMoI6chXaX8y5bxawezLPZwH
         iWhycQG+AsnDneLtbFE7knydnwxprbjTcQSEF1+MB1fa/z6TENOk4JeUfndS1RzlMjZ3
         TdiLII4qNJLrh7naqvegieVoUvRuyP7647Iqd3cneRoQwKMykw8/KNRJjID/tVd8IMnb
         2j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413794; x=1795018594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=D/nIfy82PW/U9ff/xEQwlpL8u3CuH083Ts0308o3PDRdQ1u7DZwdUU+1GrW54bOgUd
         ahWmNZM1WqyHDEA2nDr7v9NuRJrMNeLLUVzX2N47dYBjRL6KcsDQpc65gKsYMJEs+Ycn
         AYfI+x8E7Mza1kdbhtroesQeggYHSdNsX2mDTbLjpAE5u5f1eIwQIhPuvPJzHQDJyE8F
         9uSqQsnJvOoBMQhPNmnczh62YuDpslIMz5+9fX/LuQFUZZnvSp7Yauh/V0kZoU/IwH2X
         wRfphTDsUa9Qi4IXIjnE3xjdmcHD9LI//m9tSCBpxOoxGGtRWi6IWjHkTKQoVoK3okDP
         yXFg==
X-Forwarded-Encrypted: i=1; AL+hErGpLEi7P066mogBa0iqMAqW6rsOGu1jNKRG4WAE5mVb+8e0xvIUre1Gi2CsC1Zn7cp3a4bLS9EjUAJAO8GrOt59@lists.infradead.org
X-Gm-Message-State: APuU4Z++87eWxt8VOuZVJ5bcatMuyauB9zneb7NGx02hlERNxVjZ2ise
	5ypd1x+5NevdyH1Zp8gCPYjVp7lsESx9+b8D3cPxJIyiwUCUSrKRf56QZgnz8CGZbbQ=
X-Gm-Gg: AYBFou1nod8AwFjbStDhcxE8GAn5iUkTknJ3j3KmQj7Vu0qRn4maO+sagw3+7d6+SeU
	ZnJa74hZzNA1LSqtoxjkQdTC51uJ8VqNxlGQAlOe3v1OH/rm/iyAOezAdkeZ5KRoMrGVMZaG7rg
	3W3Op0/wK7Q23BubKQgvxjSg/Tc82mIp7Fg31Bg2oE/YoYUeLTfuMWs3DMxwMQuW4dIpDJKkn9b
	DeBtTpxLzyOZ3z+nju3wAgs2siGST/HEQch/gMxOdRenamsndT72/4aLi/l0s00DJqDNYfV1vPe
	rpxPbR8cz+LC/gBovVX4QU5Lz6Uy1NkgW5qsqqlOZhxOuqhoQ3UaPWfpT/wFfDtrJK9BGlUHJ5I
	DFXX/fJKHgNkBFxK/jez0IUwTuVLNIhV8bwFhNEMzb9euXm5RFWuxXpDWUk2v2/yIlBqYh8rJwV
	eOXwmOQGVBgHA1tZFPnhPl+Y8mUdraFC/3l0eu7AHTyBDKrypAxSr+l3SLHxkJmp5k/Xpsh+4eb
	y/PsBYnlyUDC+XBm0YOrWHCQJ0aCpEPsEwcbeoNC6XAubFMtvRkx13SU0snB18K1nUAhycirEFp
	rvoQDh4LUpGXzaLF8zOXxAzOef4VlwWqqYLCMGP4CUHwiXLvaOSfEwuXav5Wp5nmq/QWTHQQ8ng
	6f6vTVZPbQvJUsWTI7e54nXqjAH50sJpS6iRHqCzzaPVR1aEc8LFKo6tTUR07Hrc8SpX+DR4Q2y
	6GGYPmNsUnX/XqZa6uQlgbgv4=
X-Received: by 2002:a05:600c:348d:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ba0935cdafmr48000605e9.8.1794413793928;
        Wed, 11 Nov 2026 08:16:33 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Wed, 11 Nov 2026 17:12:46 +0100
Message-ID: <20261111161619.232141-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_081635_913340_7EC47E7E 
X-CRM114-Status: GOOD (  14.46  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Drop the unnecessary literal-style description marker.
- Inherit pulse-count bounds from fan-common.yaml.
- Require cooling-levels only when #cooling-cells is present.
- Add Conor Dooley's Acked-by tag.

Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..6a8d05a62f7c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,79 @@
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
+description:
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
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
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


