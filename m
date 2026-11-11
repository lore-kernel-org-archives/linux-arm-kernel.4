Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53675606A882
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=reKlAH4X;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=haA7zHJR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=; b=reKlAH4XrQnXcP
	PSPKpmD0TfaQLXNoB6LZx1KKMTE6sYT0PC7vKq3M/jPqYBdeNhpU2168jMjULtVbAta9SsG8GeGXw
	k9N/kbC0p7wj4AIP7CZWhKC4r7x+3EDW6cOu4S2GZOGiQYdJRoLc4Opt9i9xpthUSisob6zhLGiH3
	kvp3VGIWscQzySrGcT2H2uYiD2Oz2WaTgrNnj70ivNzbKn3r0Ji9UUMFxvEJhqE2rC1rM0dnHXyIK
	BwuhK/EQzQz0Yn/cx2ILPZrN+nRq9dO/Ou2+UgBxAE96/ttHcVAxusReUfxLMA3tdcowBw6aHRxxq
	Q6kZQ613pJROXEJAidUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8QY-00000006oq2-0DnZ;
	Wed, 11 Nov 2026 13:31:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8QQ-00000006onU-0Gtm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:31:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so2088037f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403900; x=1795008700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
        b=haA7zHJRlpo6mTtZW5NOd6KiGpW1o5g7PbvTW+pQ5EnZw6AKdUD4VfyPHs7AqI+732
         zfjMbqdr/t5e/Grw2jyVxk/XDI7ZZmmTAjbDTrLemFPQYTGtqzCj2iTj4dPiLllvJY8H
         9sAnPsnvILE9QFo+QvozsFW+JjGM5IgBLfsyM6ddW2KoZckPv4wwsgqTo26tu412kdVP
         PhXOxy+GA6ExhOf+F7gf6yp8YAW2XpRw6Na97BHQbX5BuPBDrNiOi2ZPR9WZ8WQAMZ23
         0oVQh/Xnmd2Glz7QHMD+W9rtOj7ByLTd789GQTAFRO6mbnDy2xRabKvIK/0BsJ36ZssM
         obCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403900; x=1795008700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
        b=hiz7Kj2Yom37hd0vQ2yCJQ888Y+4MYBENQ+1pt9ghwWPy6Vdr2vMA9AxGguCp0xnpd
         /lIrYUYArWtWq/sqTMyCPqfW/DqMmRd9PaLtnnVrRuNFqT308Mdh48TZoQodwbeEySQb
         MfAn8H6hk3xeJSUDtfqiF95dT9TVz9BhHm6aFuXYKw674QD5WohtCUjVWouNwQYqPn4j
         qaQsxSOoUmTFCMiws084oSlZfdPq6GvJARs2HqBuN4JWwqDrgDnGsdHkgUXbwaPcGPvx
         s5AjR1xxxIWCI+7NDzyDe0Nqow4PtSDKEU/X+/KdZf0/Q1JfycTPfVA9xl3IgM0Cq1IB
         fWbg==
X-Forwarded-Encrypted: i=1; AL+hErGlLI0nwHtwINW/D08UAv52LZWXlb+x8lSC3ydSvN2Xc8fGk5x55vYPNnL+nf0f6OuQXfLa3pYya1XScifqnC6K@lists.infradead.org
X-Gm-Message-State: APuU4Z8bdPjmprq4LHcFTHfcd9FiIqxsk2XvPBmrSQmu0l6B+oITFw5O
	EGfti3cLDF3OQAOCcStLJv+vcZFpnj6vfhfQSWC3e3M5WXcmbNzY1roMKnNfq3bteC8=
X-Gm-Gg: AYBFou1wYJI9KdosKYXSuCJoUyMYR4kEQTh2eRIYbKx4MHzzngjXsEPyY7TD42eX4Fw
	dH/zC/Q8ugfM6iivrZRWoH7lBiHvMkQZJp8TBKvq8oFXt2CtTA9KoHT76hI4MzIo+8pqwTQrrzB
	/g/TqszLd1kBZdB8Yenlwn5rklkwqk7P2wj8nNAdxYdRFGznNRDdqroIxCxKK3+vNPXp43F38u8
	9VIX4OnHyIsD7DPWAuowtbwMkJ86rD4dMyO5B9WiKjnGwRCvaUhxRRt76mX33gBy1D7JdFepaE0
	DA3ijl/7KkLGQ+6hKS2TsIFgRoUVXjQbqILC5VxhBoncqvHlrA0dz3lQcNIjgWw449PuKLbPDgR
	XHMvE7d44KAVYoUy7UWzoQ4QI/vY0sBXLM2+3Jugag94wmFvqaMGt4qcP73ngfLOWxMTciNRgTM
	Cw1nlJTOGqBOemyYngopcAmBQ/G2kfwTgz+WE5/sGHGM1qNGf78ZGlHTQ57dC8pep5TldZAkiYx
	/0lktH8fO/CUkoSOJANovlaDMcSEFAmWWp1CxY/47AidC1jZM59ZtlkQ9oqJm1fFudioQ/x77oj
	kW5YvU2joL2VsZIYIT4F1o6YC2ZIQTlGOkrTa8qG0eFIWndOt2XtrdcTzGoo0PLptoxVEZqsRHY
	PVCccNlKxiQ==
X-Received: by 2002:a5d:5f47:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-499c3ba0637mr4190729f8f.3.1794403900138;
        Wed, 11 Nov 2026 05:31:40 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:39 -0800 (PST)
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
Date: Wed, 11 Nov 2026 14:31:15 +0100
Message-ID: <20261111133119.1063210-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053142_115923_D54F2A5D 
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

Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
compatible string for the Youritech et050fw01-kt panel.

The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
display controller.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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


