Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B47606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ua9b4c3B;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=P0q1BjKX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ncDzTHpCPV4lwKcdX/E+CqJ1ByUzIH55tg22LmuRbMI=; b=ua9b4c3BkqH6kI
	0Xf3GDA05MbrmOgQDBcNiP2+IlwgetNvHvrRbSmtdlql1S1Jq+0GA+A9rZUR5ghFvz7efX2+MW3Fx
	BDoBCl+wrjY34oabqRk92NhzAlOje2jpbQH7+FgWrNRxNQGypi6QPUXVOqVc4koioDMRrHxL8a9db
	zVK5FSHJkQRrlZnCfX+kngMS+BBb2YRdblm+ERHiINCcNG927ymOzUDxS3ADrybaXNlBJ8Eb/b+8l
	u2Y2/S3de1M86nOgqbELiSqAPdPr247m4SuUTSZrLafOjK+ahNpYxB57U183gANqfRHrflgKZoAab
	S2PuQQ+2Jyn/bgQm1vfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpqP-0000000F515-1fVH;
	Fri, 27 Nov 2026 06:54:05 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpqJ-0000000F502-3M8o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:54:00 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 17CE74C953;
	Fri, 27 Nov 2026 17:53:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795762432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncDzTHpCPV4lwKcdX/E+CqJ1ByUzIH55tg22LmuRbMI=;
	b=P0q1BjKXojKbvNl8JdxL3Hi5fPTS0hjWeXi1UtIBm0xTdWw5trRZIVh3c2doFDoiLbZEj8
	PYmTbVNkmw8uh8Qw/HHYWXiL4RvE1JJCR+EFKYyz3JNyp0bNv2+X6ZSVxPKPWy8pyJ77tj
	MFUG65jrMPvpH1/tikQZ8ETwGS/Al3Qjy2JG+5Nftdq0aT4xZ+AEjhetIvoijNYUAZ+5CR
	ITFKVUVxn10SkzFW7hewbeEJ3X6qFhfohxtV6LgMlCP/wNz3VEDPSgjHq/RaR15rqBS+HW
	6jiN5orSED5xebufw5IqvdywWN0NRmJCymCqTBCalPMRdDyog+FRPiYMSPbX1A==
X-GPT-Reason: legitimate personal/professional correspondence.
	The email is a standard Linux kernel patch submission ([PATCH
	v2 1/2]) regarding hardware bindings for the OrangePi 4 Pro. The
	sender's identity (alastair@d-silva.org) perfectly matches the
	intended recipient's domain (alastair@d-silva.org), indicating
	a personal or trusted communication. There are no links, urgency
	tactics, or marketing elements present in the body.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4 Pro
Date: Fri, 27 Nov 2026 17:53:42 +1100
Message-ID: <20261127065343.1449675-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127065343.1449675-1-alastair@d-silva.org>
References: <20261127065343.1449675-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_225359_994719_222BE1DC 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Document the Xunlong OrangePi 4 Pro board compatible.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7a7f96f21f57..2fdf614e639a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1043,6 +1043,11 @@ properties:
           - const: xunlong,orangepi-4a
           - const: allwinner,sun55i-t527
 
+      - description: Xunlong OrangePi 4 Pro
+        items:
+          - const: xunlong,orangepi-4-pro
+          - const: allwinner,sun60i-a733
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.53.0


