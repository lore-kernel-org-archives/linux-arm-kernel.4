Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB7606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tgk2LOVo;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CirHkMWR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=; b=Tgk2LOVooF30QmtCtZw4Q6/d1q
	n/683kOy5tVrXTXt22lCgSx7ye8/NXl4sjsVP16qHx4J6KZxPyIGAy2KyNCytuZlZv2JWzGVxNzNb
	+4mVNPXM2oyFPyx0mb1nSUGWf+3dL0Pl0kFAm/DvFs5r9mUHKRdkftLZT7qWgJ2o8shAsiXc/cL3Q
	1Y6X1PvVFJ58v/+Z6YAxxFoUZl7uB7kbowoKyCw9qaJGsOnS6I9IZ3w7oWdHXow2redxYbsCK8eNl
	Yeu7CU70AFZ904i5AmqZT9R18t2o2pDLF3UfvYpCwiCoaALQYupnZsJOI6/y9pGaQ9D48xySuHoN4
	zmynnxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKJu-0000000011f-383C;
	Mon, 09 Nov 2026 08:01:38 +0000
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKJo-000000000yZ-3hNp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:01:34 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso984380eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794211291; x=1794816091; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=CirHkMWR2ycHhJ+NuDot1BB+SnQaG8d9+aNvEfA4FLHoS671ozmJk8t7jnUOyiHjTl
         PH6Iq8QYnsuAneXZNU1poppwwDHGyns8AGriYkDjPKWhqNOfiSTdGBzq2UyTpfCqnG3k
         5vb94k36eS9LmE2SA5UskXKMvdaGEeJxHtLleJZei2Kw0FF9QTUz5MMz5Jt0BhPAehmv
         8rD/1VASgDdFCS7YIwdfOjIh9gg1fKNYlrd7Czj9AWuBSGjM6pZId/27eMvPo1SwvY11
         jIOiVmwBPv0MKdE/O8EYinArUFj/B1IttVFGzUDyOoUBIYPwThnV7lOSUmgeoz3hn0V6
         +qcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211291; x=1794816091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=UdFPKH2ast09ppG3Y3XBeBGjUq1/QIH6qFJawqd8YwE445053sz0gP8yEmdhud40mz
         n7g0ZuN7Fr1vjHzUPyp9SKj5U/fCFnSrtkLxfMvwYeYX67ZhY9JlSv0MQiyL6u2mr03+
         /THSdUvmVJxOSZgya6R84L3RUXVYP25Odu4UtOCICTeKoNk9Yru/BEkPWxMTBOMdqY7E
         lP4BGt/TPikU145ds/JKCKjE/qMGivrPBVetE89uYOcdu1cyuu9Ugx6LFn97ydZrsc+H
         DZ/zUYBSliwxrwqR/i/BIqa6Fz7uvpx/JGAmbMASOImo/SBfV+OscJYIhTE6kUqRm1IQ
         FC7g==
X-Forwarded-Encrypted: i=1; AL+hErGn4onXg6yc3xnch+2KXrIz7GrirQqPo3V/YrcKBkzhSD2UEjC/wshMLU7UAYQ9cO7njbp04BuB2jkODOP3P1Xq@lists.infradead.org
X-Gm-Message-State: APuU4Z+Zg4s+JAfpIoQkJ3WSQzntGP8rQh1uc9fiV6ULTULauOTQKv6X
	CkZgy2WbgYfh9DqOFeKUwcEORN1Unl96TMzRzlHFLWiwBtUDLcEiztU9jBpppEBIVci4cEYM6+F
	qDV1+d75HsQ==
X-Received: from dyx10.prod.google.com ([2002:a05:693c:820a:b0:33e:5767:2163])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6486:b0:368:7c9d:1577
 with SMTP id 5a478bee46e88-37256bef592mr5746863eec.20.1794211290953; Mon, 09
 Nov 2026 00:01:30 -0800 (PST)
Date: Mon,  9 Nov 2026 00:01:24 -0800
In-Reply-To: <20261109080126.417161-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261109080126.417161-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261109080126.417161-2-irogers@google.com>
Subject: [PATCH v19 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dom Cobley <popcornmix@gmail.com>, Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, 
	bcm-kernel-feedback-list@broadcom.com, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_000132_916640_7B4D3AE6 
X-CRM114-Status: GOOD (  16.00  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

The hardware exposes two MMIO register blocks: the primary monitor
evaluates the System fabric and the secondary monitor evaluates the
VideoCore VPU fabric.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..e1a5a16b8d75
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description:
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present, with the primary
+  monitor evaluating the System fabric and the secondary monitor evaluating the
+  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
+  Module.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+      - brcm,bcm2835-axiperf
+
+  reg:
+    items:
+      - description: System monitor registers
+      - description: VPU monitor registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b8a3cb005c91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5338,6 +5338,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 AXI PMU DRIVER
+M:	Ian Rogers <irogers@google.com>
+L:	linux-perf-users@vger.kernel.org
+L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
+
 BROADCOM BCM2835 CAMERA DRIVERS
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
-- 
2.56.0.455.g6c5a503b38-goog


