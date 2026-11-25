Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4502E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xeYA7ayE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=jBboMUQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bHf1QGcNLukYOKvss8i7yiqfftKfCazZf1FcDcnc7fk=; b=xeYA7ayEImR1MU
	MWRdHa4kSVGxiUUKQ1ooC+JvlFy60Vjdo0ZElBdtBZTQTvAtb5UO5nDwRUt1B6PQvN8NNr+Iiuv1X
	oWuXG9sWp1lcdmQzEuS2iHgkBSnmrfiki2uKcaIoMsVwouVlT5A46TAaWwPZiVwODHWE0G4/HaK7U
	RbrH8NzE+OaFSbTgunrU4vnpPO1D1iqcZyD27EqO6x1B63ODD8lG5xlrwFfx1W+N6aXKIxhluTFim
	KqdHjeiAIZ31WIkacSIfSngpxtc6P2I2JZcAGCdous9iyXnbwVARQfVfpnvrFxOgJfIOUbuXzOTzS
	tlAwIF/CNN0HJnCnezuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RE-00000008sq3-0ifA;
	Wed, 25 Nov 2026 07:29:08 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RB-00000008smN-0fPj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bHf1QGcNLukYOKvss8i7yiqfftKfCazZf1FcDcnc7fk=; b=jBboMUQNel5D+hNLUK/fNLfj0X
	qvBqrIKRn/wgNZzOUw+WM7ZAZxIdoVUnZdRLGE3a/uwGEfonTwWaS5kOoC88xiZBgeIb50n+ICeTk
	Tu/jz+GZKFO9gm0LwNHJBDalsWYYPXpCKssN6siMYQXrX0V4Y46d2F+5nCywr0YdYyjKFzjBnQoBU
	LQ0L65TW9VglUSbm1E61Hef8+b6BNGclQJC13Vv9yiwFvLe74jZ/feX3OffI2eY5eXwi2jJGey11T
	GQ2b5JuNZtef4CULseBC6NEXicWM0NqjslEyaiBsf6mrmMmU/UGwmAONNA4mFxEdMyrrtzyWEIKE/
	NfAQFzxA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R2-000FhA-2O;
	Wed, 25 Nov 2026 08:28:56 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R2-0007YA-2d;
	Wed, 25 Nov 2026 08:28:56 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
Date: Wed, 25 Nov 2026 08:28:44 +0100
Message-ID: <20261125072851.3379079-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232905_345299_C009AF33 
X-CRM114-Status: GOOD (  10.30  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Both LEDs are active-high.

Fixes: 04b77e0124ef ("arm64: dts: freescale: add fsl-lx2160a-mblx2160a board")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index f6a4f8d543015..a79290401551e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -51,7 +51,7 @@ leds {
 		compatible = "gpio-leds";
 
 		led-user1 {
-			gpios = <&gpioex1 15 GPIO_ACTIVE_LOW>;
+			gpios = <&gpioex1 15 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_HEARTBEAT;
 			function-enumerator = <0>;
@@ -59,7 +59,7 @@ led-user1 {
 		};
 
 		led-user2 {
-			gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_HEARTBEAT;
 			function-enumerator = <1>;
-- 
2.55.0


