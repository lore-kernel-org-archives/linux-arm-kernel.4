Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F43606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUnTxDjQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwBvG3Ku
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wzcq643kxqzm6dmiI//QkyvyRvgf5SDiG72cWiaVszc=; b=GUnTxDjQmYumWAXy8z6kTqjrDJ
	WSSWfD6QnjmksQoKJB6s4jV1eM4XXv/oGn262or2zIVybjZlRRvTFMIkvaZ290CDMLwmKHwrezCwO
	C3MJ0YeI0/qO7eEdabRn6vQ2lQP0zivNp61ifj4/6X5JhYKARrAIzTcERD7G5S701XVyVuEbRcF7F
	ZvbZGYU10RNjrMbus8DdEizXN3XZ41u9UOckedWdUXO5vvhXMEG0g/DhhVVhz3fBRAmz4EOSoqMV0
	2gK8F5qKRH7WV7WnoZXalIp+qGWdjlpAmAB/7x2zxGWk5YC8X1/W/stFHWTG4rf/F1AlAIou7Z36x
	Zac8nKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUPe-00000001UaD-0XyN;
	Mon, 09 Nov 2026 18:48:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUPc-00000001UZy-2C0q;
	Mon, 09 Nov 2026 18:48:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9799061133;
	Mon,  9 Nov 2026 18:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39181F0089F;
	Mon,  9 Nov 2026 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250091;
	bh=wzcq643kxqzm6dmiI//QkyvyRvgf5SDiG72cWiaVszc=;
	h=From:To:Cc:Subject:Date;
	b=ZwBvG3Ku4ZEwKSKey17VtGpJlOGR7qSBiroi5pBDv8Aw5R1tZ2MCU/eWgnF/33DS5
	 h/zqFPVc3LQLug14ppeQv8CNu8NpLAY2BCrW4zPdB/CQ/0Bzs94BOHpadBvfwE+EU/
	 SOcbuPHL3VQouyX0LpqkU8K3pTzhsrIbX3cNouXEzVs900C3ZbuzJUcGAbxZOUTULy
	 tcOVZ8yYFL5Xu5yeijdEdnBtUBjsAulBNpkYv0OfITgqxP6nmRLYZmx07/j7w59dtp
	 fVFxaE4Is5/s6PjIETaMJOSGL6/Z2v3G4eHnueTyipoMnLHhvtS3Za2Nuqty0uefsz
	 2lsBotMH0L9Jw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chip.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: rockchip: Allow single 'port' node for DP input port
Date: Mon,  9 Nov 2026 12:47:58 -0600
Message-ID: <20261109184759.467215-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Existing RK3399 users have only a single 'port' node. This was common before
connector nodes were defined. Allow for this since there are already stable
users.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
index 195f665970bf..425b27346132 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -63,7 +63,12 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      port@0:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output of the CDN DP
+
+    patternProperties:
+      '^port(@0)?$':
         $ref: /schemas/graph.yaml#/properties/port
         description: Input of the CDN DP
 
@@ -74,13 +79,11 @@ properties:
           endpoint@1:
             description: Connection to the VOPL
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: Output of the CDN DP
-
-    required:
-      - port@0
-      - port@1
+    oneOf:
+      - required:
+          - port@0
+      - required:
+          - port
 
   power-domains:
     maxItems: 1
-- 
2.53.0


