Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58082606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RvZYtPdV;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C+J5tCMb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=; b=RvZYtPdVbIIWRS
	LgXjZmwCSu8iPQdHUO6VfZEayDQK7EBmr1Xqd0kEQjmgv88VbxWHhGfagIks6V71bOI2uo80T3PaM
	6jod8ux1GbjXCAjpxgdtogkkrEOk6l4O1nJPT93LNGJXH4vjNlKmTbRxfdRAQiaSyktjBDrY7Jxwk
	GDP1vK9gaoCLDviebB1mDBWoZWazlxKz68J9sxtr3LZ0eRuOVIdNypYjhWz7mhcBXPVPEtxzoS2rd
	1Ps3pqq1VPNqqZgUB04j8Luv1qMQcT9OxMyUPaaeSJreITQF7Lwbyt7nYtxgMIGvkdtP7IblyJcCj
	gK12S21x0P8lyQabczbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvG-0000000G3Wd-3Z1H;
	Fri, 27 Nov 2026 12:19:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuuh-0000000G2zk-0iOa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso26281625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781929; x=1796386729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
        b=C+J5tCMb8tG5D5VvyeVZfXxUdRvwoif5e6lhRbE3A6ymMw5by7cjMNUWiaaGrYH5CU
         ZLoARhEidMqB0bFu0828A/TEPB3a+fLu7Gab88+6z8GcN2pF+4uRA7+74zUQ1mYBjqwt
         fT9YzvwmnytCnt2RkJX4vuwoDWIXxCHpc9aSWg80Q/wrJmKIotpbfqu380TbGfB1ozEG
         h/rduStK1e+hwpGtlpY4hdqgnL6yfopZ5jsTCSR7bnUJIGGH4OsFykiCBHtdUl8Jo8rm
         a2tDvUiqgPJYUiQ6lY5JtAOeH5cD85Xdj7BJEe242ULy/FTVNoV8x1km3AuLj8gIDEB7
         lU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781929; x=1796386729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
        b=lgLZrM9FllzKdDR6SUApjwuTBcChjRHHTvY03p8gr1lnTXd+nkG/g6G/D+ERNlK3i5
         xsIYdvwO4onSfVLnqFs1exwAzrGG+B24y5eifSLeny8P7WqhLzubzebUq4zMrmxDIBaD
         4taOc7S+kwwUhUgeRqsijvZe1F/EpgEzbJ6Un+TXD4L68m0lja1Q9HMY+jdSOUFl6JOq
         9TnHeunm/QM6maAETHBmD65JNltnvgLjCI9sNp+TcW6oKWjGZ2JBcPMYmtKVcejfy586
         ItGBkXToH1i2VrYKWCEpXbYk4SKATNqTGrePl60rvfJDwlUmLcZDC9sWYHiQQqOhN26X
         cYeg==
X-Forwarded-Encrypted: i=1; AL+hErGN0T4wr04oqKpI20Dt8upqV+Kk4k0LDtIZSDpc3qv3MwZlxEo/243WyXHCcddai/KD7Y3gQzkHAG28B4RQWoia@lists.infradead.org
X-Gm-Message-State: APuU4Z/33mYHNOT6bVMrZOa8HjfsSuu2CNL8C98DlX2xXEGckkxIYjDn
	SW8xiGZjV3YEobmpQj9AYXTnGubnyBbokNOQpQ1bt3kBjdKvsnkYcYGT8Kr4jtquLsI=
X-Gm-Gg: AZFdTZfkRjgZ7TNbBYuD5u1TDcZaJZd/RKokwqvqFiQIBsPCmGxz2ewOV1QDzVl7ael
	M7WyPlKyNl8I5dKdju3U4p/8PcJEbe3abCzURH/aFj8QXpDhGxPDn1H5t3+WeXWSYb1SWNh5+o0
	smJZBZ3LiES4Os3KndRoYeUMd7Glz2TxZqPxhtrjcL3EfjuoIQud6hyR2KINXvfQEdjQr9QtzGu
	mFu8DIZPg71zOHRFiNg+bB+OBc+RDcXO3HCbdOxuNJi7UwVI9m1SOoqr0H4hQ2HbMlXdZmFyM0C
	GeSTrwfibg/j0yh/vuDldLN9K+MXIjW2CKZhNYAf5GXzbi1eEjDN9IjcLw1503q2XslAmDiq32Y
	XWQ7zK2apbD/Y6czD5ZkftbruCAAih4FpRuQfyImI0KXKOI1XP0N5UyoM5zjhQ+vwW3xEP3u2Bo
	M50jRybaRQ0HKwchhfFfqZC6cIIydYVU5xu/BTr/H8I85SPn9HxG2ZBSllSC7HvmZlZ6UX0gGiE
	nkNLLXTVb7BkBZTbOc6uvniINyapg8/E2evCI0CDKHR83awck0UvtYcR2jbNA7Gajm18IvXTowU
	NNJnZ1mtjNtXtUvbZs7ZmLVmmPR/
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr515690305e9.4.1795781929355;
        Fri, 27 Nov 2026 04:18:49 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm568064995e9.9.2026.11.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:49 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 06/28] dt-bindings: dma: brcm,bcm2835-dma: Allow the generic dma-channel-mask
Date: Fri, 27 Nov 2026 13:21:56 +0100
Message-ID: <20261127122236.4976-7-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041851_223433_59D6318E 
X-CRM114-Status: GOOD (  11.62  )
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

The available channels are currently described by the vendor specific
brcm,dma-channel-mask property, while the generic dma-channel-mask
property from dma-common.yaml carries exactly the same information.
Allow the generic property and mark the vendor one as deprecated,
requiring at least one of them, so that device trees can provide both
for compatibility with older kernels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/dma/brcm,bcm2835-dma.yaml  | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index f81740e49301..51ad8bc33d5b 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -51,12 +51,17 @@ properties:
         bit 30: use multi-beat bursts
     const: 1
 
+  dma-channel-mask:
+    maxItems: 1
+
   brcm,dma-channel-mask:
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
     description:
       Bitmask of available DMA channels in ascending order that are
       not reserved by firmware and are available to the
       kernel. i.e. first channel corresponds to LSB.
+      Use the generic dma-channel-mask property instead.
 
 unevaluatedProperties: false
 
@@ -65,7 +70,12 @@ required:
   - reg
   - interrupts
   - "#dma-cells"
-  - brcm,dma-channel-mask
+
+anyOf:
+  - required:
+      - dma-channel-mask
+  - required:
+      - brcm,dma-channel-mask
 
 examples:
   - |
@@ -107,7 +117,7 @@ examples:
                         "dma14",
                         "dma-shared-all";
         #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+        dma-channel-mask = <0x7f35>;
     };
 
 ...
-- 
2.51.0


