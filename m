Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE04606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lvoNlvBY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itlG+/Sq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=; b=lvoNlvBYPLSArO
	LdJLbyu6kTlvVFVHS3fH8YW77Vbg0OT4q7oRA1GLwW3PjLXNv5eTi2C7BkoGZuD/VE5r7E9yapDfu
	r4o1RFsJvtlAHB/YyE0mZprpLbcFvbfB6FYYMAJELoZN6TfAHss0DAxMj3yTA0tnk77sFtbyGOmFk
	aX61pp8gKoLCkoM+CYXdGY6vCk2CK4P4AK1PPwhovj4wYO51wNStxbOJHPjZjNrjxkPeRuYFF7VV3
	k6aUSc3kEh25GxR0lv6fwbUw0AS2djYJ0mul+pnvMkDJ51hcWfLYMOhpOzGLxYDZkfdVYVHerDuL3
	lEzz6U4W/Eh0QuUPB/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQe-00000007vO2-3dS9;
	Tue, 24 Nov 2026 21:51:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQW-00000007vLM-1Cq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:51:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4750040f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557106; x=1796161906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=itlG+/Sq1Tdhx026KWTGb9jugJetYrrSJqMSDTXNkwwUvKEy3KOFLGEVXxR8Tw7I06
         /z85DjVCUmtiweTP/4GsvaHJRZu6SpnIkc1BRs6tMQwBJhDzGgn9jYOPbCVClBDNkQor
         yiRnWdwRR98p7eknddcF1rdPiCOp3tbY+QDo2worICBmBLqJMJc+lJk+w55/v8TRpXom
         bTJy4MNWNv04Gyua7sQZTDKckbh4OpWH0d7zms4oZzxHMrTg8EyxCH0ump8niWgtXPJz
         Rz4e/51RTTUF/tuzsVlwo1g7T0Y2h3L6wzhVy6bqCKPRcPEF7Zcd4A80AfWFx49ueEPr
         J2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557106; x=1796161906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=e0+hETG08lv36mPh1J0IOkBlnCeEIliHWbYuFkvN2yNIt60e2gk9q/7svf1QxRV4ef
         UToKn4r/cTRo3gEaO9GJi6fSwTybrNrQ4sSWpzY/Fw/cAvX+vTBaEtD9UkEhWGanOTuE
         FG0A9LVVGiEi3966/TVKe3mKHRoM/lSi23mGtbahPu/CElhdiLz0duHWyEbOwnfNS04V
         m80TTkAQbQynSxTowr1eyLjtrVErTl7/A4wRzbI/6v9DZPanAB5RESt5jH+SkwAQHwH2
         T/01Ay7hzwK8kmIA+TsXAm+pxEBNW4avv8suf66Q7x9PYsxjfVrm2CMrtheMbInc+kFM
         DKUQ==
X-Forwarded-Encrypted: i=1; AL+hErGIzA1LwIsCzVIC/2T3jVkwadFM8b7FkubDK/bssPnL0GHDeGYBv/qF05ZvZQS7km9z4tW8lDi+LqaaPKGMzITQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8naSZA9xZnUgR1vpmXBv181whV28uPVtlar5rDoYnodzmJ/yq8
	OhiZWOdzJGAy9bp76x4ODoBEiE4J2AA+aAK4/JX8NF5Nt4J92VyxVpUt
X-Gm-Gg: AZFdTZdwifZWZV8jfXhLBj42xVlwa1Fy3w8W63gj9Dx3DsWXFsP5GHBg1iYIxHd4yHk
	YujTAvEVmXhDv4vahA/XIAOoDHcuWqSN50U+uyZap9x/UEi0Q/+Fiko9purtsakNd7TdFl0yT5L
	o7dsIfPxYNSy+gKFIzwAETLFrEDE0538kvzciH4WbYHt0LtmT0SxfV0FRo01W8Hrvle1d+Y4PuU
	h47rHE2Y1cUwsCLcYHOxEjah7XDiP3WEsowjACgLfIX94DOQKc3j/qlWzUovXxM6KZJjrpdJNgJ
	lwtADYE0ecctJ6HGWjbXov5NgtSdssaJvR5iBub31GC8petQcO4AL0vDbqsjKUDVvIf5L54VJUA
	r8H0vNDUgpaDPj9veOXbPAPjeZdVgEfsnXUzTIKLy6kr1dkGTcFl9nQ5qYXZ9Y5oNuqh9t2o9Oz
	yGlDY3/WMhh+56tMdQc4cerbpPbtVmHxYEmXFbD4t0la8epiXX5o8W6Df2WTB3mpifmUfSrd84/
	2/vM9IfNOQOpQ6rc43qDmxEyxF98xiXUP/q4UxwLBDfpsfgMhTjh0W1vPU4RI74HraAfedM89a5
	MGUZFSy0xA6c2TFiuBfQ
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr29539105f8f.32.1795557106230;
        Tue, 24 Nov 2026 13:51:46 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:45 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Tue, 24 Nov 2026 21:50:47 +0000
Message-ID: <20261124215048.42074-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135148_678950_7F5F3A8F 
X-CRM114-Status: GOOD (  11.40  )
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.1


