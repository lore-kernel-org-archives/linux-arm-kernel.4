Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920260A2606
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKkniD/3;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q59f5yXU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=; b=XKkniD/3oqb0uZ
	Hivc+ueRiIMeBu03zmQcMmIYXA0SsRoHyZuWSeDpNn9RvC4JoefkFyX3ps/djdtX7HDk9Cu9WrGmk
	KFsWftdZXyqdvSno9wMGeP3Ykp4MipYOz1+NnxTb+1JPRX5o5UPGodaKP0+EWsAuqgr5UQkq8m6Dj
	T45nIymZuT3PAYKro5WRyOvTMkwxwd1XZhtoIummhKfOrdypplh9K85//TEBSKqgd7xjiR3V4Njuk
	tm1q9aTeJpH8Y46nrYeFHQ05SA932FesKGgHOmj5vXpT+Daj0F2AaMBSigMTw0fCIiZ8DDzXYle3Q
	E8z3FicEQmfxdWjgBmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3SK-000000060ef-1GlZ;
	Wed, 11 Nov 2026 08:13:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3SD-000000060b9-2m8Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:13:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so30386325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384792; x=1794989592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
        b=Q59f5yXUhDhevJBGdAC2sfsYgUiIxd+DqSGmStXU2sNbAPDBEj1XrY79JUB4zzkdCg
         wyTGJHByFrhSDMSnvpKV90mN1LMCrjjiah1HPquNr10vOTA8t0Y8pxngEIeJtFXDC2NP
         PBVsPBih9g1Ck5PcZmLBaLvFM2brx+qa0fPoRLzjKcD3hEWZC48eFKnyThaqv5YHATZR
         MhqI2D6oc2pWSl/076RI6/qXlP3H+iUedAFOI9BblZsE8/YDz+r0t8tRsgeOcfTr2y0C
         9hIS86kcZqXGc+lmxv58m1CFDu/6MMObMJEIUH07DquKxdW6e+YY/UGvjzZmxe4lc3xE
         ax4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384792; x=1794989592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
        b=Arqy8+n1Kk4qVoJICzbQml8vJzNV/g8nFE04oF/3vDWqumUimFTERGlr/AMq/QoIqH
         xi9ujgzsnRxUpI2EktzXcjZW0iG3OuhXK997v5yYLF/cvV5852uokwuNvWSyY/ehEcgy
         mRd/qNbGpuYqJ7aP5u5nMvrZigwvLZxVQs5meTPQCuMGlKihgu6FG1sBRFbaciSNgJW8
         O1Q8yNelWNkX4edh/Nss8zm5ViSXtzfNdmF+/se1yZgvDmeAHSyvvLhvbtEpUY4QZYS5
         IpQnKWgOOFSVkVw7hONAR79Lx3+TW0ypdRZingl4nde1L+13xmKcw1/yov8lhTmEw3wL
         2q6g==
X-Forwarded-Encrypted: i=1; AL+hErG/Q+GkDcFbo0pvt3Y3cH3KfzTeyjHzu0JBacw92pqfMBUON9e2Ugn9w+kFfREtZFwDAS/i46XJn/9I4rvKHTbh@lists.infradead.org
X-Gm-Message-State: APuU4Z9lfiHhJQDQdELpaHZ1Kf7RLsSsDbcrEOg7Q87DQGpsh2+/6FjK
	uAYlo2MVUl/E5WKT8PwrE7D+TVHYx0oMdBQmZVRbASRKxGMK30l4LBMv+fpNJMKICZQ=
X-Gm-Gg: AYBFou0NBCQRp9RIxqWXxaah51728gyq4X+SLJEOaGtufsF7ks7nW1uHNjrumdJv0m4
	IEjciOMuq0FqnjHl4HQqpDP3rnMiqXNGxbE4qTtRwcl3EVxUz6y19UAsQCy7pBDzTXjguLmOPAE
	JYvE3Wh+ulYzcJpcNjxr3A2eZmi2BgA8/PdKVGVFgZrRQ9BX5VfLVolLY9+96vEfiAKCjRGUu/o
	HALp49WLCn/dKMNufRIXnEmIQOgl7OLB1L8V+/C8z3vZa7YiUfujG8NyjizfLaA1LFOANBeYpXj
	DdD6dbDcWceRQpd48wEydC29mZ1PSvjUwzeQ5YGvU9H3q2pQ4GXuI0OsPmiBBzl23hjFtTnBoSb
	ieVt5M90x6rbOyyVh++m2VtzzazJwu4k/xzWxC2EQL5l680BE4Y8/Ka/91KyliXeVYelD5xVUGj
	i9YGUj2ReDaOIiIzvW3uyOQ1WTego3zevIsqgNxQ2CB+ZBhGQ4/ZWpmdKFbXmLo2byaUnbHIzNX
	fhxc7zTmEkbJQYotwrOjayXS//fA0FY1GmPmWO7Qm3L37uog0RGZy7vgEidKTOPmEsjOl8/juGp
	aWWqxhZlXT8dwOv3DUkqKwvFh43/zPmsArGZHxaXiYxyfS8wslx85fL14n0ozrA6NHCR/zrfjnG
	ayjbka/jhKA==
X-Received: by 2002:a05:600c:8b24:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ba0938a10dmr25548105e9.19.1794384791851;
        Wed, 11 Nov 2026 00:13:11 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:11 -0800 (PST)
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
Subject: [PATCH v2 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Wed, 11 Nov 2026 09:11:49 +0100
Message-ID: <20261111081150.950272-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_001313_721722_A90EC53F 
X-CRM114-Status: UNSURE (   9.49  )
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

Document the vendor prefix for bytesatwork AG and add the compatible
strings for the byteENGINE i.MX93 System on Module (SoM) on the
byteDEVKIT carrier board.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..e4be6fdb5808 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,13 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and byteDEVKIT
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3


