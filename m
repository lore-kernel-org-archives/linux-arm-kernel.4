Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFFB60A260E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=greNfuhB;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WkPIcUxW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=; b=greNfuhBesN7AY
	ycYbqTcdNHCB3IcPqvdepYeQpWGHKfAqlgj8IjGLRpdu25ta1vR3UQWgBYlyNMrWeDN323/4NDWU6
	BXZymDvFZRmc5y4Vn+rpmGFoVGqbbShY2mvmYgQlO2Te9bGsNFWsbstHHS/i8bh0YEhF4iQ3vRNbo
	0OFAcyGCaiVeiWa7x28SnzdyqMq50v/i6jXQXjoWS8PlWfVAwsCjHBMAs0KE9ifnI98BxIIxT5QbR
	mP4/a73D9+OAjAEkkGt/cadagLcxhdzGCH656FjN6Zbge6sgfF7ZwXPMCN6fbL8XxFbVGZ7+2TyJ0
	lTqQjXMObLwtv3SEFJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3SC-000000060bB-39WD;
	Wed, 11 Nov 2026 08:13:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3S9-000000060Zx-1BJc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:13:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so18511435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384787; x=1794989587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
        b=WkPIcUxWG+zh3D3jmZaEYyma553yJWa4uu0NEC74r1XcuzIreConClOEzTCD9UQkrQ
         B79slOTXNPct3JiTXiW7FIo5ZH9UMs7bJUPbnomUF1Y8bUt4TXMVTAr6dIRd3q0mAO+R
         Sc8fBLFDw7OYX0R5aoTvAv4Z5iVkTXTSdtFMjQrKM0JJTTiXsBElwwi0QrNE9ljSF5oW
         cvjf2hn4iQqeCkc5rhySeltcktnITrA1AzFTzWl5OcBcvgSeb4YVc10YTPWK8VzIB6Gy
         i/yIKFXLkU8dVg5gnoOHUyz5I9T7ORWSrSyMW7cT3rWnDjOl/j3FM7pJ4F5NZEvbWlG3
         dyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384787; x=1794989587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
        b=1wdTFXpkeQTyMXx1R4Vjz9trM6wnAy+CdBvK5+jVzTMiQc01wn021rSoxMNvbw9urr
         iEK3SeUBoTFyCrZSSlGzzr8i8O2to070zkLHRIMHkTMGQFLAk7I/RcGehz0y786f6hzG
         +SwnWy+a3RuO8/EtInjhU5trTK/4mPcnS13Rt0SqRxkBStNL99ZhG9cWTtFw7FgB+x1X
         yEZhJ1pl/trD4qLVjJjJ4EPbwdDjpltU+AlMuc8KgPFzCSu9V2W4CZfBuhfFG1ZpbOAI
         HNIpMO/IoY/dn3+/HIvEg4yXW1XzuNVMULiMAhmYDukb1VBBDpHl3syTyf43IgIajEjt
         d+lA==
X-Forwarded-Encrypted: i=1; AL+hErG+tE8/fD7MkGFqdUnNTWEp0t++4W3X1k9wagvlRW+bJ+Kb2+oZhi8fXwtL3boeYLKzaHQU9mjiLLcYVPaqA4e7@lists.infradead.org
X-Gm-Message-State: APuU4Z9CLeEtaMyrQwkgjxf7902lutMZYJ/P33lMmsXRgtgRniolaJjt
	Qf3Z7+yJRpmt/PwAk94YLRqYBw7e0wirVMIxhFvH4Ta1RApFH2Mk5aLizup//kAJXww=
X-Gm-Gg: AYBFou1s1v2Q7GnxM+eCGMAsAX+bQ9RqU7sCUxfPMTbJnr/h6+yx/tdjT+zpujqyVR4
	4awBhLYKLlksQ5S7oxRkwDGLxJoK3nh2wYfaOrJNKzKY/nDh3ghYmyuAOJ54A3A9c+JsDzAhHBL
	LYeLd5mxV4FF46ywEgUg8GupGRPev7FfuI2JMSkE8/RR21b8W8k1IvN4wf2nEtBcp/eRPzTQBB5
	XT8rHUCLlcb2ge7+dyko1FVf48WmKHuU8Gwt5IRvmHBkeFsAZ/Gyjv6jyOFm9dVQLaN/nn7hOkm
	3y9kj43UCR2JjgPkb75i39SBa/Jy26P1j1U2KjapNPclzJMJm7GZ6Z9mEIZdF36HebsYR7R+dlB
	S90YvubcLdOIjFM5gYAM6U5J27DvRcDrAofxID2srwzF8OrjNR2Lg9N+XhsGU9KYirjk/NbiqPC
	PPbtjN5WWIqmj4VmL0M5ak0BlB2s9GuWfgAlkhQpIRPj+A21ecJlhKMBcaEux0tTUzKyBJ3J7W9
	zlzow+/NFK4+kfMl6lVxDm89Bg2QhLMzGSbTlgCMtIitmeElXc/oFvR4y140nbD9usEFOqtkCQ4
	kHPgCLc+d6MsZEVyTV0LwP3c5xI9fRMiiXN/Dj+OMuGGsqApGeZVSVYPvSCzSUDoGyR+oMt7tXv
	5EhE/HxCiDw==
X-Received: by 2002:a05:600c:4f46:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ba0937bce8mr32273765e9.28.1794384787479;
        Wed, 11 Nov 2026 00:13:07 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:07 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v2 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
Date: Wed, 11 Nov 2026 09:11:46 +0100
Message-ID: <20261111081150.950272-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_001309_372266_5FEA45D4 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
compatible string for the Youritech et050fw01-kt panel.

The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
display controller.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..c2e442c20c0c 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,et050fw01-kt
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3


