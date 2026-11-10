Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B904D60A3802
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K5ya3NMZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beX7e5pa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=; b=K5ya3NMZTWVQpZAmeUCJk+aFHX
	hBeHBKMIYfrKhbgGk+zOEA5sqY2S4qxiDrcU7/Z+plEfjg3cSOncnmhqC0/lDC38RmUDL7YYsYtDk
	3/qZB8+kn7r/061YTBi0Gcp7T41W0XasOx3EoRLTwQBtwseKXETElhIlIkhCd0EQnvMBX899ob8iq
	VLvULT7XSkOv7K05m2Eg+zo2+veAiNEEYrJSvt45TyQcRNKuLnBHV9oio+ERBmHZDXH3v71Arfww0
	9f1+Wwoq2VxpU2n1PPnMBmcSO0Ky61OvuUGUdcG//OD749hSpDbu4f0bBl78RtrducYRqv60sxoLJ
	Oc5svhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbbI-000000029e8-25BC;
	Tue, 10 Nov 2026 02:28:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbbH-000000029di-3dVz;
	Tue, 10 Nov 2026 02:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16E8061281;
	Tue, 10 Nov 2026 02:28:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794277722;
	b=A9hwlogobFauFuBDdT4bYhkW8jdPA0+WwMurpqANcTtCprd4Jt5t1bP1mB/i6iNjAsfh
	 MSS0aM98tb/3EUYqLuy4oZfZ+wtPX8359YZ9VIcPeM+Hjx7gyZ465DwGou37REtI1Nkuq
	 Dua/3ASVVNs9ExwB8I6pLszG7iQ6SDXKpj4Bj6p8yf3ncWxsIe2zKJ3sA4BxfzPSepdGN
	 71d9CrETSl2/q0V7pEm1QBHWrWjrSXGbWQZiZJBo+AAatsrMYwqRF6izTMq4eYOAoLqH5
	 VZE31pLv/yuCY9JHi0MsoZP60qHKANYhkp5PPeJaLTlhL6G4yg46N5TG1t40UkfT9TA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794277722;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	b=B1w0hIPDb1ErLF5uX35DbwZ+FNB6AaMkDe3at3P0PqLG23qjYOdZa5IuFxUAD39C1BJJ
	 VC9v5JkGgaHnHZVl5XrTbn8TEoGvYd4V8U72/Syk4kfnhFnNIe0VPl8+XGjdBKLQCwsS0
	 iDPcG9HRkq+nyhPE4CloTsF5X6z/LG32WDvvI1laKVZpDSdEcTiQE1BLgj+ZUgCc9BwW+
	 GEv6oQsQAYepaj1F7ZC8InFuE0MzDJT3FjG/7UsALGmDJ+eyv2KHwTsNuPGbe9+KEYRD/
	 h5UY+9rPCPS+lOoJwI9PtccbKsObAjEd/wb+WyR6/JBqAjlrzbxrC3PbvzGetWyvJjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37CDD1F008A1;
	Tue, 10 Nov 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277722;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=beX7e5paOc9KFVijwsLTE3ezzZ3kbN9z5ZOKo1VbUIN+8E8WuRLJ5KGrKhEGJaHF5
	 S6QnqIYwOygb/0+uMf8prcZ8lM1rETmoDA/ZIDceKn15JmK1Bs2jbzFoFhY/6U2A9v
	 Dvi1RZoZt5xuBParXMt+kBt0vZL1S8w7yvnanzIuz/OUPK3AD3V2ICL4UgcyF0ySmW
	 GVaP7DE72OL0Syn9GiftySeskZG5eEZDLvzOROy2IUcRuOpNoUci/q1xGwCnz0LQ44
	 qcy7XOKQMOrTS77FUqUIIaRekHc4tHka9yOi4eGt2In5M3FRrPF8cSBTkUJO3uIm3H
	 dTGfvv+z7Tx1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A85E048764;
	Tue, 10 Nov 2026 02:28:41 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 10:28:24 +0800
Subject: [PATCH v8 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-audio_drvier-v8-1-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794277720; l=1619;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=8FHHLcJZtu8lo09r1PD8utgqmy2N7M4R5lGLzc1tkrA=;
 b=tU/7TKYYoslaBsaQeijapfVxmsVy8JtS0rrkc3CACnkHRYQIyBFT6kbd87jVYfci8R7Fzh/mK
 iGSeam7mSKGB88BQb+YABi60uAmQ164s7cm9IZfsUgqZrgENxe5Nh23
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jiebing Chen <jiebing.chen@amlogic.com>

The audio power domain has been found on S4 device.
It must be enabled prior to audio operations.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..75ddaf8d8091 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -100,6 +101,9 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +119,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,6 +127,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 
 additionalProperties: false
 

-- 
2.52.0



