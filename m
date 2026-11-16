Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AtbGw6Rk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvWojKOp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JZadbG6e1np2H4INxIfzGzER81/6aMvR4chC6fHHpoQ=; b=AtbGw6RkT1uum7zt8mPJ0UzmIW
	EeViEYqwGmToTJ1DAlmAhihGRfQkt24fa+r7orz/3UQu9KwV59/etYyITRJ4CacTPmmGvpx21E2zI
	N+on5nERw8/AEKgrykyl30sEWlJM3D5fYRyBx0DcGBK0xryMDQGc6ewLMoIiSlDNxpN4w3lVLVUvP
	IhQguIsfWrCdDAEjlw1dch4JrzOc3zXrbpi98KD2S5pR6+HDijW+dqjXbJQxV0C53WDAPckLVXux3
	zw5Cdceh6B2QpD+q0Vt/6uqfl2kq858zqGbyVKdzBgyqFsTBarCm5uxwAM2ZO/K5B1VMDdaJ2TkNa
	2w8Jltsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkXM-00000000msl-152h;
	Mon, 16 Nov 2026 00:25:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkX2-00000000mWZ-1hys;
	Mon, 16 Nov 2026 00:25:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A7ED625D8;
	Mon, 16 Nov 2026 00:25:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794788711;
	b=vHXH+c5RB4OoLQHRHDbp09bNz1VjBFLsf5bzQv2qvKsahSsKw9X6tuvT8leyYCNIXzpV
	 wINtyiu7m79IYBsXlsRZgeQGkiQYNrbx5ToW+mWsFpV8RQj2S5zV56mMwoGVGIDOba19n
	 yb81dJWiXHWWiCUu5dUPvVe0h7HLYKbX9HthG7DEjw1221QkiIIc68LwA8J30fHel2Xad
	 ErfMfwiUzStj9Zzp9VQn+cCYdaeKQbtoSR6aatI/24jsows3xUiRxS9jrmnEOVC28vxKX
	 tj5+r4ODa54XUd7f7v/Eg8Yysy5ur9WVgS7h4okhQKEzah7ZLezQfloI0c2ozWWgJQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794788711;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JZadbG6e1np2H4INxIfzGzER81/6aMvR4chC6fHHpoQ=;
	b=GG8+TaY6LUtqI8uPXWJtF8yST2+HoujZd+NUAI6bK/xXZ6sQ4Jo7vFamA5ghNlcu5fTl
	 fNfY8Tqiypzfs1Zy84e9dx8YhRiNbn49wS4vk/87rWQyt8H/V6JAlBGdAjukk1eRlJ3Su
	 4oAn4lskSYaEbOpEzdN5+cX5QtmyAY60fDfcuzJMWWufQdid1lpQAV8D4hqS9+ekDWouZ
	 qzD8/GKzxmBCzKtN7gFuIcrJKegxFS8spJAeiMP3bva3j5DtTE1MLNAnpR+0Ouxrd3Xmd
	 7HfkMtEod/LcgG5AFjd2vL7QINQ38k6Rnh/BMWTkz2aX/3hFG+YxEn3HqGsW4s7zG4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7842D1F000CC;
	Mon, 16 Nov 2026 00:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794788711;
	bh=JZadbG6e1np2H4INxIfzGzER81/6aMvR4chC6fHHpoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MvWojKOpOuoshbGEiAL7Uo5WCFe0DTCl3n9L+OehsfdHGObxHdxpJJBq9OEPSD9js
	 CqacL7qroIOQTGzr6PgCC7nx7WpP4plzPvhCG6Xz9peKeBgd0gLNrzZc9sc/G2GXib
	 8lvRMqkcxokAMj6/adED4D7d6vbKiSaYi4FwpTkUgA+ve+zKXqS4BuRxPc3NKS9boR
	 aAkW1phmYIj8m20PrV7e614vAWWIHqym9IIvQeka0SFioDLiw/m2k+36Iv7099sxGq
	 pDabUWMgYlOZj2508OeBxnhBF3gZCh4AGEo56Vwh0m053exb4G8RF2mIGjhq6nOL3P
	 Ys1up6eKFA98Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2D67A4A2A7;
	Mon, 16 Nov 2026 00:25:09 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 16 Nov 2026 00:25:05 +0000
Subject: [PATCH v2 6/8] dt-bindings: rtc: Add linux,wakeup-states
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-b4-alarmtimer-rtc-priority-v2-6-b2c69721e489@iav.lv>
References: <20261116-b4-alarmtimer-rtc-priority-v2-0-b2c69721e489@iav.lv>
In-Reply-To: <20261116-b4-alarmtimer-rtc-priority-v2-0-b2c69721e489@iav.lv>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=jiWwGKeX8J95JaxaQWkNTzGvuFoNUgKE+31aH14O6+k=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFm/fJM+HbRbzvOrcLN3Z3bohrn176QZAn96i7190bszJ
 9IldGF7RykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZhIjwTD/7z5Xad3PvXKsfZq
 2XV+acvpA6bqq77kFk7lX/5uM2fSf3WGv7LRzD55rDquroK32mX+n5qncENr0u8wQ1GmttgnrUI
 z+QA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

A board can have more than one RTC with an alarm that wakes the system,
for example an I2C RTC next to an RTC in the PMIC or the SoC firmware.
Which of them wakes the system depends on the sleep state and on the
board's firmware: amlogic,meson-vrtc is a register the firmware reads
when the application processors suspend, so it wakes the system from
deep sleep only, and whether an I2C RTC wakes the system from deep
sleep depends on the firmware handling its interrupt line.

Add linux,wakeup-states to describe this per RTC: the suspend states an
alarm of the RTC wakes the system from, named as in /sys/power/mem_sleep,
or none for an RTC whose alarm wakes the system from no suspend state.

List it in nxp,pcf8563.yaml and amlogic,meson-vrtc.yaml, which do not
allow unlisted properties.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../devicetree/bindings/rtc/amlogic,meson-vrtc.yaml     |  2 ++
 Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml  |  2 ++
 Documentation/devicetree/bindings/rtc/rtc.yaml          | 17 +++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
index a89865fa676a..51cce4b2a7ff 100644
--- a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
@@ -30,6 +30,8 @@ properties:
   reg:
     maxItems: 1
 
+  linux,wakeup-states: true
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
index 22909a96123e..e464432e4690 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
@@ -32,6 +32,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  linux,wakeup-states: true
+
   start-year: true
   wakeup-source: true
 
diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index e46d50b1063e..54f41858dda4 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -26,6 +26,23 @@ properties:
       0: not chargeable
       1: chargeable
 
+  linux,wakeup-states:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      Suspend states an alarm of this RTC wakes the system from, given
+      the board and its firmware, named as in /sys/power/mem_sleep. none,
+      given alone, means the alarm wakes the system from no suspend
+      state. An RTC without this property is taken to wake the system
+      from every suspend state.
+    oneOf:
+      - items:
+          enum:
+            - s2idle
+            - shallow
+            - deep
+      - items:
+          - const: none
+
   quartz-load-femtofarads:
     description:
       The capacitive load of the quartz(x-tal), expressed in femto

-- 
2.43.0



