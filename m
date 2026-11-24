Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE209606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y7ereAG0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=o6GZ0zF1;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d1FaM5rm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=; b=Y7ereAG0SsjOH7
	FJczgapNiwyen6MRQ/SoF37mPghSqAZtH89sImVoijxorg90EIA9dfggf2BEbprs0uH6q4aCXH5PF
	PeDcZgNuyi6RE2AFWdPE7GpjJORnXCmhh674GFGuxZFpQUu2E8asElv9wxqdSVtsGfp+o5srOhoVm
	1QzGe50uOYCIOlvdZKe5QUMeJKGyTvLpTTNzm6MSW/z2woafOjlN9lfAb7GljvQZ/xjCuQJRSaVla
	dkMDjafSsQvRdUGEuRmYnsmrYms4vXd6Pe583BL4iJE9PgJdgdELqtgLED/9YbyXDdeAu7ZThZBzX
	qbtbNr4lU/SqxueaZw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuOH-00000007NCd-0TvJ;
	Tue, 24 Nov 2026 17:33:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuOC-00000007N9x-3co9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 17:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=; b=o6GZ0zF161LMydzdpB+IB9kSKC
	VTNLWQOAq2pj9l2hS/L7EmXpI1+jM+i/u4rt9oTY4HTVbt274GmuVyU8OOpj+8HwdF60w+IWucN0N
	5qavc4wnF9N9XMOShkrUGMpFxxUG2DSXW0VA5dStV+F52EQzvMOndKFTybN61OEapCTXJ53ui2Iy/
	HMcIS7AVYW5YETpDijpc5QqoS64MpE6dQeJ+fVYZeWOY1c31q6LmbXL1HibjjfFYc5FqvB1EPSe01
	ornduiNGoSbsa1jZ4+pmUJzpydUPRAHQWNdxaE9sj9AY7KMhMP4vlXwhfXEPrDzHFOSEPsgJY5ZVG
	X+UgZ73g==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuO7-00000004PiD-48TQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:33:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so32777005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541582; x=1796146382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=d1FaM5rmGhQ8OMBXv6EfbJJwqBtr1PT507E8/2/DfdyyDl7NpIpVDiOaVUCoVIRIMk
         qfQn+F/clG8Ze7Y7CLDWcYetipC2hmDyeqLnXRLg7TeURlBbdrO4ISrHBsIDsZrR79Am
         OxSTMrLS0x8yJqFf1PMjCWd/nXDO1jFyGBz3Z2rsbGuUxng9d1pfHaJYgEfstXxTzJel
         8xePOD158QD8YO3DIIYsucXgMEMkM6/sr6Nwgug/RyAQIAku+v/Y09eBRZzjf8sGVJKE
         MtMh9n7bzjD08iY19gl48nNHCxr3CoZSLMEMui4fs0dVqzTrfkY0JS/uYBiN/mDI+24v
         P7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541582; x=1796146382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=dKZEQbWPWIZMeUCWKbhpj93w5p3FwBqCpQTup7GNGzExi39JBNdSbNOSNttD/30Nnw
         PVMY7nWpC5+pFZpbQRsUJPii6TyPnjqyBgYaoWEM/sy5imVW872sjAj8d4yviV7aq+gW
         Fd3eduqwQMxFUwjEBE4aKnhyabBxyqNvZ0KJ0jLK0huFAwhlcWn4cufBCww0ODDxV4SD
         0wsXWrQzDNB6m/oBjjcc1K7eH+tL5ykI/v24kPL4cEgAwBh/IJfpyX2VwIN9qsN226tm
         S2f3OZto0mfFk2ogXwb5+l8IezpVdNAx+6gFq/n2vSJ7n46yb8r2d5AgpIAbXlFRWiMf
         EXWg==
X-Forwarded-Encrypted: i=1; AL+hErH+pX3We/7QVc9bqIvcKsACYSpeeO1r11eNpT71rsi8R4/195E4HFv5vAX0hhiXrk3X4NsN3/3a0GeUusm1n1c3@lists.infradead.org
X-Gm-Message-State: APuU4Z86sHVXcob8GQNyMf0C6iXwQaDnn2F/ddcIj9KcpjKV2ycrSQB0
	c1LTtxgOyxeu3HscCvFeLDjYyIvtYMd015KPDFH3LT8atKGmCzaW/ixJ7ep1hTZ5nmQ=
X-Gm-Gg: AZFdTZep6D/lSeK47LVT7HORWm0ZeepSEa4fq0g1Fj8SlpOz8NCIqbDP7sp9JBD7786
	LsNTPIziSMhSIER4wpcaSSOytQnjDOiAYpfKb3mGw2VcptG8feGmFOSfoGwc0UmXqo3JVSAewUn
	FIvmuHWGsokWrXo8qZm8xEc090ifwG5Vf1IgJ2YnTVpKfwRqewKZPC4WscYc8kAixYPQwkozh+q
	ZIhswO0R0S/75yx2ODyPMvVszAdpKEZCnLkwJ/QR7ATzS/FL7VG58XyjN7O0GqUXi2SCyWzB5aO
	KG6KZJQ2X5gNGqlIkUMN5vLA8rhxX+mhpJkB8ViI2LMWlMAgkA4eLGJYKRjwIzINUfx6hl+5Oyc
	r6M0N9ccq7m8b2dfSARwAa1iinjrZ8GyW2ZSRMFU1AMjfFS1qJb0sH3KdNuAZKuorlco7+PJo8v
	+jY0qsuYuR1ELLUscP6uk9tfscaXVKpgb8+/cQC95tdJVG1/oQekRuT4c928llrdNCO9mmLDBs7
	LO1kygl9UavuAkWizBLMwcKDOAQX44UaoOmwONojmRoYIM95UYwJLuCKlBzre9ShYhuTdSHqC/R
	guq5c/I0TN19/5MYklT58J+xT30=
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr309983845e9.34.1795541582068;
        Tue, 24 Nov 2026 09:33:02 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm439552155e9.6.2026.11.24.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:01 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v13 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Tue, 24 Nov 2026 18:36:55 +0100
Message-ID: <20261124173658.31030-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261124173658.31030-1-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173304_025733_00BD5423 
X-CRM114-Status: GOOD (  16.83  )
X-Spam-Score: -0.2 (/)
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
The DT binding has been applied by Rob (see [1]) for consistency tov7.4
and is part of v7.4-rc2: as a consequence, this patch is included only to
make this series apply 'logically' on top of v7.4-rc1 and can be dropped
when rebasing.

[1] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 000000000000..be020583fd0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.51.0


