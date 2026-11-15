Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD396606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oc/IGoye;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AhLpBM8s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=; b=oc/IGoyepwi/7w
	fBgITkeiwaDe+QBLHVjYTJK93eaR4u5uLNWElS6CRPbNKejVHn4sYwE/iae3wEi28TbV16TEVTIvG
	Djh6RfvNzMtqvmltjLRd88rCm7O0xB+wXtPm1ckHnEPK1jrxKIzsn34d/ro7kL40Enr59MuPzWAzg
	cYW5jgowwZsjtj62DDpY7U7l70SVoVFUkYvDXFed29PqTiOKtfPOZbx3N96qGf/VW1jSDir76Bf+E
	RS9RmU5Xn/b2RgTmFWyws7yGTezuFO4FirFHRJwMqM12fje2TG3ao3p+9E+bh/kZI46NNa4ZZIMph
	LTusubzv3O+bO987qfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSf-0000000H6fK-1d7F;
	Sun, 15 Nov 2026 06:11:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSb-0000000H6ck-3iTL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 06:11:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so11995765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 22:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723088; x=1795327888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=AhLpBM8sftlZ4yWQ+vwsr3gpClhjkuq86c/Z0VH0UutVTqZhRwrNA/0oumyNLnCFG2
         3VESlnPtpuY7UCtQftzJTybwq1whJXLlqDItRwsa3upQGr1fMgnVz8QGzqPpD2Q3hFAn
         t7lBeAuJp+/elyDD3/y7jFgBw7nHNJ5r8HcUuEtvxalcInqFh7ROW6eqNQRyN27hH37E
         QRBFPexRZk4MtziW3V74lV+v3p0xB8sMkIW1d+JyGvyxf7UtjAD4xCUkrmlkyRaQC+lc
         s332DmKA6TyQYchc8DjjolYThe/iM6NK0sEiTyNnNCrMRN33f1Tq5Yj100AyCgCtGFmx
         Xzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723088; x=1795327888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=btzA5dDOs5GpoZHimg8t7rChv8MaPHASNWyFi05ZGeJfYQ2qEHENlbg9ZPHPMNJ0WO
         9NpFTHBFcoA5Kw5Y5+5kVNvQ+FmqHxuuHwL4v3YE7dEKtaWc1UNd+yX1OMgPNGOsJJMR
         Lc8bd4vUbdu7cAaqiavwHQoCzovQcegQNpPx+qJRYnrZKfTC4MSc5Afo4weRPeT128RX
         6MYpuGgPA8Eo4c1TLF/5bL1Uk7S3Nnh550LulGOf61rgJYeXrsxLvtMUVIjtDw/MrEas
         ZNIzCsaTwntPLJoCsGZi+iXFxJ/X7MX9DR4iKXcUr/w61pvEG4wcxK+9+0LXENe9ipHf
         Ig8w==
X-Forwarded-Encrypted: i=1; AL+hErGK0SsYADmEOCRPuDTIi+IIpUXCzu51JR6SzlBX9dKfD15CMUggmjVpMS8LzmEFfNAwwxQAbu1zHhcVFdT5g9n/@lists.infradead.org
X-Gm-Message-State: APuU4Z9+VT7bPYvoTM1JSwGhmmdudqzY5h4j6udMFcoQQ1i2kswUgEqA
	sxQD/IRnLVVsxuc64i60VUnQ6axUkLyFPalePldh+9dA5uDTsUnS82eL
X-Gm-Gg: AYBFou37TzuYyZ8gpb51QcKBrXN/uB75Ko5OpQvEi7q9IBNLMwZfaPdyGlUOKBJmhOX
	ly6bNnwNdn8uRYMfTb8EzDbPIgTVNL5KaO3klZTMyZnaaI6AuCh2zOwY2ocGv3ZKMHvHm2yK97m
	fMj8ZYTlEfKgOndcAXXdUMCqY1dTDxIBY9fWBcLMk1d0gdD5DoeoVTWaxtW9oNh/AHAtjSC/Icu
	CQlcKMZAqmzT2JJyBNojN5fY4nYLJqhlqHONF5ZFAxZ8zLAaiKVQRntXxelF5Hg3OfrpeMTrJdm
	fGHzcbZv34Jgp4foYj0R/t5u95Nbk50ZSUmJxrRFgGmsdi8qt4/chclniq9U30ojXXsJRkL08X6
	MFLvxleRDyMYBwS4WAQfJyx08fxChmq1x6MMPpqyjDJ3eJmTHYioMiFWFcuvnKIfLQwwAWBjMHS
	N4F0c9UwtZwArNIvx2Hl7CdQLuGyB1vfYR6xvOAV4IWedn1pwqyIqZf5XSTiqxa/qY9+jTErozH
	D9c15lmAU4RSHQvHMT/K4YRNdymGoe3pKCBdQcPXqMcz8JSrIUvd40GbRisup7KWpz5eYcoCs1h
	TX5XBgivCj9J2PXzhhCGKNvoCM1ZznSDE9Lr2PdjDTh90ysZi3ZS3/a8mZ64Z7DdJG24Uvfw0OI
	9CGaGzR1M7Z5ozNNqpZrftyd3cauWcKDSSbuCto7FlPZlWVmHHWZruvr1tdSSeZE6VtwIzRSBgn
	4MmG+2J4RSKdxVzUrZzXBhLaeflN3r0FzfbTDwGZoK0F35+CKWzLsY0btFGB/OVvmgB3revwjc9
	+ZFen5qz/Y1/w==
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr135894335e9.3.1794723087765;
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 15 Nov 2026 07:10:59 +0100
Message-ID: <20261115061102.229680-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_221129_945782_3B87F0CA 
X-CRM114-Status: GOOD (  13.36  )
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.43.0


