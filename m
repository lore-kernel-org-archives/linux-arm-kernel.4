Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA802606A891
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWt6W8+0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4Q525L1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=; b=YWt6W8+0slx46t
	QUZoDSgnyX1jNeW6mvLT/fuA0bQ8WMGSe+uSD27dkM7Nr2bJspU3Noz2DTfRw/t5LHZ1pOSVUTw6h
	5McAt50a3ek8/McUfdY6Yy4lcWGqfWFKenh/NH914PuUUtwFaiIYKsHId2uc30xrTRFL6fZ55A/j6
	XcIboW3A3vYm2qHCnIFFE09AQNABKQD2N4vE9omIQQplTLxETtAfb+VolsIu2Xm8rBks/piK038IF
	thyoXoh4DvPnNq4l0mERKa79aslw6s9b76zcmTrDRNc2GPNnZ/jf5U81GnESZSrw5LyUr55f/gdvM
	KIJXitOnjOgQGymt7e5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEZA-00000004tAx-3Bmq;
	Tue, 17 Nov 2026 08:29:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEZ8-00000004tA9-0m2q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:29:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1779486b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794904161; x=1795508961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=;
        b=P4Q525L14xBoEbmuIulQmt6VXQucOI4iMdr4UgAGLiX50z7yt/rSy/ZFv1587qo4A1
         maim9tt5v6x7dOLCXXSGdGbylgYtDfAz+x2nxYldbOGKykTbrM9HPfUIKoUqi0sIUGIl
         6PLCEA1Jd3TysuGuEVB9vHaZ58PbAKZPRZmdwcf4xiFNxmv63geTkgyKUWoowwstsxHY
         JcAlvW2jWlzWZrpiE7fqNO3znn1WhtxvtWvhG/7C9B+bfZtPK5nJsUI6ng08JOvuoad8
         QlDHpqvYZAxUWPOWRJpfZ60wbcuDycKbb0dK42rDpnjWkH4QzGw8auBchBpSmw9RpBQo
         swCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904161; x=1795508961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=;
        b=Wc8m8AV8bTd2LnnrylrvX5TlNetKGcHcnW7iEZd2MNjACUjgF2ObyZsOWajjNNme7o
         GF8wWEO1fhtShCbNcjTwnBTnlLuqKXZ1e+2iTsFWiQKlawFnpMzKUVS6Rjb2ENOI2K0I
         MHsibbyS1OIIK9zE1SPzVVUj8trOG+Ea0SSfPWyIjFRjUsKTqbHSq/AXie7fSZPbdvK3
         67aiCzIFBvFgDbxrpG+U3SxYxYbIKqXrb5snROqQMnRVj+hk/BgV8kDbo5QHxiMeTLxa
         umS9yyaeWpNsE9OuADHaTPdcYQvbXliKcJ6Gb9EyCZyID+ZLMP39tWXKEoCInwl10BQS
         Oo8Q==
X-Forwarded-Encrypted: i=1; AL+hErGZE3C4BrD3rBLxlw9KZMpUqpCfIxgRiAJfFEUoSFwGgAQyTwHmFaj3BcNXSTajC++ZZ89iR9wGOPk92WgtEAaf@lists.infradead.org
X-Gm-Message-State: APuU4Z+cXp+hRBFeHCH6liroRoyyvLheVPkouvnKqQMB7EFZtWwY/3R1
	5IiywadsMdcZdyoqs6/v0AESp8XuB5/WZRmnvar+KEJvaKTgXvFxKdco
X-Gm-Gg: AYBFou1c39RmKaannO0qgJfDkmG9AFAfiao/zdNlSKOaaHZmDZB6imyBcMTONEvPcG1
	hU4xh57NTzMOHC1MPd0vAukGSjTQgILETHddFRbJ18kmdobRL+QNOwfEbdz2HEy/WwAvgyOduJk
	5ZOAUQl/VUv7as/v9Jpn3Nfzs7XckoI30T24VxQCQ4jUin9hU7sgiqCdPxboj/jxosYfmZZnGbr
	gm7YfLH1WQfDnAe0VUps/W+KCR8BlBzP7qrVNLI+deMz6qg5Ru2118PIUD/C5tgc864M8BVj+YK
	ubwSom0e76xO6g5m1XUAtYxfx3mHOKqW6ReSGEv8va2Up2GSNfAJ2hCDLFBLgyN2jU84dCBzT1l
	VdZ5Nu3/OeBjLmA6d3sHGQc6Kt9vkTyGndUHnAvRqYQeep5z1s1bJmejLPUEaB25eZQ32iFEq2w
	IC/pUiOBzrZCAMWcnw1FnspZfXCy2qHXTB8Pt8Q7/aK+QFbJ8YxQX2AoFzE7Mk6ocbLUMbMUDLI
	ouMIOq0uG8PLA6RDq/7/ZU5+fCOIa8XkfOuxLyRBJ4ZLWJHldDExKPryvglnEBPCYlI24JgfBS5
	ZvICdnFcP4np/baU79eQg1tjur+fYhEtStond49HSv6e0qd1/Modv6K0yandUHMsapCC1e1Ud6K
	OdzrU3egIIAmCjZs=
X-Received: by 2002:a05:6a20:431f:b0:3fa:f6c0:331a with SMTP id adf61e73a8af0-3faf6cf78b5mr6473329637.61.1794904161230;
        Tue, 17 Nov 2026 00:29:21 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm5422907a12.21.2026.11.17.00.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:29:20 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chernyakin.victor.j@outlook.com,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: iio: adc: Fix channel property validation
Date: Tue, 17 Nov 2026 16:28:30 +0800
Message-Id: <20261117082832.1551574-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261117082832.1551574-1-cwweng.linux@gmail.com>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_002922_230821_4F875500 
X-CRM114-Status: GOOD (  10.75  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

The common ADC channel binding currently uses an anyOf constraint
to require the reg property and select between single-channel and
diff-channels.

However, the reg-only branch allows validation to succeed even when
both single-channel and diff-channels are present, bypassing the
intended mutual exclusion.

Replace the anyOf constraint with an explicit reg requirement and
a not constraint that rejects channels specifying both properties.

This preserves support for reg-only, single-ended and differential
channel descriptions while rejecting conflicting configurations.

Fixes: dd471a2b7759 ("dt-bindings: iio: adc: Add single-channel property")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../devicetree/bindings/iio/adc/adc.yaml        | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b673eaa5d072..f2a16b896630 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -114,15 +114,12 @@ properties:
       Burn-out current sources provide current to the channel's input pins for
       open-circuit or short-circuit detection.
 
-anyOf:
-  - oneOf:
-      - required:
-          - reg
-          - diff-channels
-      - required:
-          - reg
-          - single-channel
-  - required:
-      - reg
+required:
+  - reg
+
+not:
+  required:
+    - single-channel
+    - diff-channels
 
 additionalProperties: true
-- 
2.25.1


