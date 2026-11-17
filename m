Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7120606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=poZ64hIB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwV0pDEu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=; b=poZ64hIBkrOkwl
	MwN8JzrQfRS2dSsECC0RcZApoPEltVfcoZspKGRMktM/UDcSZLokM4ggto/vqrZhBi/RItIZEHCSI
	+LO2WFVXu9JW1uMoeIlAoO4rNPXDB02SmC4v21viuB6fV80VQtKg5h5zL20aO6ItXwMT1eusAs0wB
	ExDjxBvJhM2eRIOSfuN/bwqRoGgYsNuHMT2C0aJBlsK6BVL6tmQj184HLO25a5AGDoQGofATFz7Pr
	ToVon2+xWa2pFyJRIuPMLhRF8KELrq/yPU4vJNRtVpCt5tqph4IUJoFiMTmmFzy8jAIdbISyj6uZK
	7Fs0r1lhL8OaoDMd/ntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKY-00000004did-3bcf;
	Tue, 17 Nov 2026 06:06:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKT-00000004dgy-3oih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:06:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so3627167b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895565; x=1795500365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=;
        b=KwV0pDEulb5fpqm6ztPjcO3TQscAGKPjXaLGDY5ah3MFZcE/bpzgfj8MDEoGwNouNt
         1EBeuPSdOdFIpvuZlJ75zxEYGoeF4zMso7RtuJPOIP+Wp2f2EcU9vSryTZpvWUX3BQ85
         agTjQQ5GgdQYYrebYwJUAwQeR3ewHCEpgdPkQHdHG9RXeAMddkguj8FiomdBx5DPWNhy
         bpzVKTpbcw/yMBU43X3a86yxqWHLdYge74kuu2ca3bB0LPZwaGTAsyBV8JY8DAe5M6xD
         EcXck539vpAxi5bTJd0sv6PEXZx7T/JS+u538gHq/zMflcn8yhHatB271Mq79Sn2UH/X
         wbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895565; x=1795500365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=;
        b=FadmgjbmWpXYOKKYG60L8ffRCf/+T1a58Pa3j2as7huEUTq0ZebmmxYV+8BN61g5w+
         jg8a5OPBqsmKS5motSVY61ND1duHH3gAYMqIJySI1/rEw0cBGOcsdoNlV6isz0EjPGbJ
         r1bYY49w8QxF6DdSfJjxZpou6WFWeaQaFVhgZgpk4lTJwzdrHb7j1JcJaAjGqBXhB6ls
         aUM4r0JOiyE0JZnCZNujOzOg9+qikhkHQX2RodWF5Xm8gPieHLoeWSo0Bgg0ZXFffY6G
         kqgqiaIitd5aZcjVOEJigMCTkr+mrgpu52ZwWjXRkMszBBxmZds1/Hm9jzibsAYsdWK2
         bltw==
X-Forwarded-Encrypted: i=1; AL+hErEvyHswfhaFzE8eCAvAPyPpkYuHGiojqJhcgsI+wc3AHl5m4XeOZ5Cq0FAVOVYmhymy+cwJLrhtGsFAaS/SKC2T@lists.infradead.org
X-Gm-Message-State: APuU4Z/IPcX28oumDZu6Ttl6ckjQ1XOOVt3jthJIeYxnzUQc7w8I/dmB
	lvuRyzD3wIdF0iAztoViyVaabOjif3CTn/BQ0wcpCXQLqYcMthypoHFY
X-Gm-Gg: AYBFou14vIIJ4mBo+SK9yDwsrAhEKZ0gpeyI/+mhD90g96joHnpYLEq0SBZO5JnnrIf
	ndK7MGlOc61j4SNTNz11tXa4PAUNjSYsX8n1p7bDqtWQ8p/CYTj2RdajATGGyyxaQP1rZg94PRx
	r3sWQToh1F0wyJpMb6UO0un+BN0amfNDcNM0vxir+34HfmB6Lz2ZSofuf1JbWBNBLLaV2soG6of
	RTtl8eHKsST45Q+61kK96DAd9GJD188VoN3SHWzoEPB2GB3vhSRXbpZae6yiVGpfiRElPbsHYtD
	UGRjFrjIf0yZEoWwvFWjJRaWHtx4zGrhLx8+EyLzgf4iwS7kZY9yDTEQ+uvm14CrT/ABM7hy32i
	0r6dfocIX2eLXdhjqQ0sr0ui7Xc3K2kC5fF4RMRwRnnL7eNd/8j9mBf6im7SkZrJyavUJ9tJ6b3
	sdX52jJkYFmxlddhzD9lVyoy4kxkVxogLPCL/SqRVRm3bawPCZ88eafd7eaXIR9BsewWVFJGCmS
	S3+iEBjibsydsn5B9sTy7TO+zyKui3x3t0/nZslf7O3Hl0nxxYcc7uO0dUYvFUrhxFYifVULlYT
	l5us/BoPfosN/PuZHGKgeKGntNhOB5fenoQPjd6pO2BZFwooiYDx9tOvQU8y7tpHeFn2Q77f4Tw
	JVt5zZjqJ57s=
X-Received: by 2002:a05:6a00:1990:b0:8b5:efad:d088 with SMTP id d2e1a72fcca58-8beb609d4bbmr11260989b3a.9.1794895564913;
        Mon, 16 Nov 2026 22:06:04 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:04 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: Add #thermal-sensor-cells
Date: Tue, 17 Nov 2026 14:04:58 +0800
Message-Id: <20261117060501.2611071-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_220605_952247_CFCDAE5A 
X-CRM114-Status: GOOD (  12.69  )
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

The system management (SYS) block of the MA35D1 SoC also hosts the
on-chip temperature sensor. The sensor is controlled through a single
SYS register and has no resources of its own.

Allow the SYS node to act as a thermal sensor provider instead of
adding a child node that would only exist to instantiate a driver.

Reference the common thermal-sensor schema and update the title to
reflect that the node describes the whole SYS block. This makes
#thermal-sensor-cells a required property, which is fine as the sensor
is always present in the SoC and no driver depends on the property.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
index 3ce7dcecd87a..a0cb0f98c1b1 100644
--- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Nuvoton MA35D1 Reset Controller
+title: Nuvoton MA35D1 System Management (SYS) Block
 
 maintainers:
   - Chi-Fang Li <cfli0@nuvoton.com>
@@ -12,7 +12,10 @@ maintainers:
 
 description:
   The system reset controller can be used to reset various peripheral
-  controllers in MA35D1 SoC.
+  controllers in MA35D1 SoC. It also hosts the on-chip temperature sensor.
+
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
 
 properties:
   compatible:
@@ -26,12 +29,15 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#thermal-sensor-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#reset-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   # system reset controller node:
@@ -41,6 +47,7 @@ examples:
         compatible = "nuvoton,ma35d1-reset", "syscon";
         reg = <0x40460000 0x200>;
         #reset-cells = <1>;
+        #thermal-sensor-cells = <0>;
     };
 ...
 
-- 
2.34.1


