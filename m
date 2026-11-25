Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eYWBf01s;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QwoB9Sg5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=; b=eYWBf01snzxmt1
	/Wec0AniO4CgdJPdzUih2cM2CueBEQ6XzskTKI99ooaNlJWhlm7y69whaILvXxwhE1wd9oFQCjNLa
	s3c8p9fBwRUxSI38LRQRhNSjskq6hw6GPkLqSWRqdSOaF/ciUWJ57W5lS+5PeLLAHEa6MS4LDHacj
	R1mPVSrb3wIQw+W0GrCySSirsNKKgo22mc0odqoQVNQkcbYYyTygoOcAA2nYBGHgwfjuuIpMNyiOk
	KKxv9BmW1IX/lDW1lmbO4HSJ7sacbk2pzOaCmFjEl95yv+avJmjBbiJnLnRDdGdcMK1bPO+mwfJj/
	Cxb4wFdCCAiDS1y9RtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFjz-0000000AXCN-1THn;
	Wed, 25 Nov 2026 16:21:03 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFju-0000000AX6E-1c3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:21:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so4231700f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795623656; x=1796228456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=QwoB9Sg5RxbXam2cWLGa+qguWCZCzb8ZpjhruRlPrdY30djxhvvHLpEETKv65POzEU
         2XNOMdz/Z0Xi1pes+5JbNPxVyE5/fNRoPrXCZ012lnWA8P1JX4vNun+IW2l19PvMPnWJ
         v/aPUV6I/DRklu+wYxRX33Vf9na4ZGD7QnnR7l+omLpzoALM9zLDi1G4/qK4+CNeg/pR
         AyKUhbT2mKQnVk8kXdYsGOKetAXe91yVxA89uC3+g2L6RvUnIZZMXkJEUdzEUAXES3V1
         hxd/KkZpDa566Fzlr84jrTxF0GNXCGk0+6YWIt6+YURAFAj2gRUDyGYgx0w9etCy3gux
         BagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623656; x=1796228456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=t7QoSX2TTafXke3VX5+fyq/Xe2LwzIPXzp3f5uO7IutflBZ+injYLxe79y257XDBlg
         j7RHf9YsKJWjrdqLYy5ru94qjvIZEy30HM8J65MHjIqpIa5Qs/PSQAvIEQRsKn762aFw
         ms3JNUISdrvryihTV2d62A9W44+kYb0PJl6k40++D8NwxDtmAm0079r1ykrLZPUkVIOq
         OtHDdTqiQzYnRXi8pQGh2/zUkiULD7rXTpaGOmXA42crchbXaZUxOFmA2mncU57rIpvC
         c4C3Nl6WxIHxjmvQzF1Qv4iwOyMwOFQ9Vp3fKf9qnS5naqDnBuht2EqirambHWl+xg+D
         8jZw==
X-Forwarded-Encrypted: i=1; AL+hErEOZu5RKxkt20QYVdzKivJVlCiaE5fAwalwGCYyyuC0sLJegb/5PSwNfI8kz8EdDoyvbGinGtX10bKJGFOg+2RQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/XgGgsp5cABCM/kKV8ANvXfXvTq8PProqkDq0egeDMgIDur7Am
	36F/6d0Tm2XCcPLuWGPDHjFqsG4x5NbOvglIRPPgBS1Jj27KipkbZ/wIC7j+2AHP2hE=
X-Gm-Gg: AZFdTZc26ZsJMidVqxAy5Xw3fij+p78oukdQ3RFr5gMXBC+/L6oer4uTLkZaZeZXuHR
	GwI9GAHgN89nAC/w3LDcub0C9G0mKH65fsjKTejeDAf9xgRGok7jcfwJNujxlDL+IJv55aXSYI2
	dUljqEHv+LgdcyPB8vvSaqXnghEYxO6m1PglpSunz7WI/hKl0BcX/1nSfrey98NdDo1S/2/r5ND
	DYwtczFkRQGHJO0qvsNUdtyr4uYlH+IrVY4aPn87bQq1ehVQF1TvxOIVDMyhOLecGEbK0oo4pZs
	6TaWrspmpLQ6uve5o6CcIAuaLgD+HJs1P08Y802rBtz9cFySPCH692/Gl95Ls4dmTVdlCGJu4Iz
	A0x4JlwF+RfHQ6yBRMemUV8NlL8uoiZT07Fx+0VMjPO5Zz9yxMmnWn70Urji2UNp3rpvSgGuh9R
	s6c8kZekf69ZdzkeKmwwITZ8t8GHJYCG3vXbVE8HldKzKTvYZsi506o07FQzbp3T0QdL1If0PG+
	an08DdlSgic93KV7QGeVtHD0Y6T9ewP2SeMLo8gCKwxJwNMRCN/Oxh24tJPv+JEi8+KmmqYldLX
	tcQz6s+JGcrxp1Eo95C5tY6P0ajRAXyJXcq6gjDCwds9Er7hrA==
X-Received: by 2002:a05:6000:2b8e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-4abb3f158c5mr24317570f8f.44.1795623656351;
        Wed, 25 Nov 2026 08:20:56 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm40286290f8f.24.2026.11.25.08.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:20:56 -0800 (PST)
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
Subject: [PATCH v14 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Wed, 25 Nov 2026 17:24:50 +0100
Message-ID: <20261125162453.23573-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125162453.23573-1-andrea.porta@suse.com>
References: <20261125162453.23573-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_082058_460291_8D442AF4 
X-CRM114-Status: GOOD (  15.96  )
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


