Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C32606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 15:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CQi2R3Ss;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urrS3s9f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=; b=CQi2R3SsUEbu8wlpiDXOiywrtO
	UKh6w6lRuEa1ELPB7u+wjsa9UwKn9BoQZw1h8Hw0Rd3QiCp4TVuGJsq0BIWgomfz8It9v7fiq6Gl8
	1t0Xoe1R6+Pyd389srvqZp0S+0tEPTPC/9yNJIIly2ZnO9bFNot8ij1shZH8oLM6cWUph3IUHHXzb
	x5O2aIUJ39lqtN3Uj/vT5IQsqhcv+O+KTctWW5dWEaFwbkqp6Ut9GLlIhm4N5zYSkR/uaSsfvztsW
	w+hl5EsYl6vPooDQvS+7hN3Rcqb0Lec27vqas1x8hVw4n0N1dkp4jUgLZLAx2YbFpBjTqszkFPIPz
	WhDG7r5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKAa-00000000uNY-3vyT;
	Sat, 28 Nov 2026 15:16:56 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKAY-00000000uMp-0zhU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 15:16:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3b402824d07so5836196a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795879013; x=1796483813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
        b=urrS3s9f11zeYmU2FnvXmxX8AIi1P8dpCxpp2sK+8jL78svQsW0+Yl2yQsG8swmCPn
         Y6b74Dv7TX+Nsvavjf5eGE8IDBxC87KoYaRv8UB9lvs/D0nsKREgrG8edTD7Yp1ogsyq
         gKp1a0Un6h4vMhEUaXEwvNfnXIWkmwpjt5cYTSe48tWiptrakxEN2vaVKZkgizYC32lv
         g4PJLTdIm4MNso/56/bH2Y6EWA1AZ8PV06+M0ADhXd6jKodtbjo0gd+XvtdXyOht9+Me
         WovAG/aBqrw7C0p7Mqeq9mq078wGKFe1iKbtaghJwJHT9DwaS3wc3yTvQmo2d0xNuYd/
         lUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795879013; x=1796483813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
        b=lzylYmjiT1VC0MEIs5K5+8YOJiRMHKQwy5XN9DCcVqvqVHz9PVKGgVMYyEPnBe82O0
         wLFn9JBkHmye5i/GslUD0zFi3cVixwgV34ZRVAZ3oLKGr52CnizaMsmMvXPrffdHXqE2
         As/gHQ3+sPnE+EXcEkslquGniIT3vtkVsaRCVv4w402/Ma9x+0dgM9NqfOg8TB732W6X
         d0xgf8i5/ptkdJ2sINkEz157rumqIKjtQJN2Kmv6Py9HowyGseRcFauDzRwiBRI3ZHRU
         NSc7l/j9G32FufwapIUSW8wcs+L7wyIEsk6o4r176CwxhCBA9ytN12ky5wAEjQzzQPT6
         2GDg==
X-Forwarded-Encrypted: i=1; AL+hErG9A9vwLUAResQCWMcyMK8PEJXphH8gwA5hSSoxoniY1bPrbdj2y7xncu1zkGV/JkHjWNKyucMODPTPQ5M2cyF1@lists.infradead.org
X-Gm-Message-State: APuU4Z9EGDmCJPyYHmV2WxOMAxYQhultMHaZkSgBydNPT9kn53KKY5sh
	HIUOPQHokkoeuq0QGcUDPEF97ZGfAP5hCCV8VDBvNFfX47MgRRLurjax
X-Gm-Gg: AZFdTZc7jgNYSpmRjp74oFNhQZlqPnhILaTVZ75BMKWSdRhMm2xDHOZWmVlSjHEVDIz
	ZtMX55YAANRvoNAxOZ62jXif2lVF5vQV8+8wSwArWN2zR9mQ7kiU7lth1vk3Te71hvcTHq4CpG8
	o9ODASmgXSpgz1hOkqHh6mKAXsgS5/TJmeA05sX5vsWxKtPIw7kgVIu2jcDJpgawjhjUWNpJuqP
	CsNEguzl+z2mjDqF0e38TPsSqwZnAsF5u5hW1U1l+zAFZj0pfzpaKWTkgUICKnbQFYpTmmRnjuk
	3YagRWFKgBpS6/XAbCUHzF+joIeKuKEZPhkeS1AWl1WR7o2CjmPQsmVqVKqrskHq+CeDDh+Wxta
	IWb/J0yApmBAgnApv0vi/3KOOZtSZ960ue0ebX8d+74HAOeDaZQ+mYsnNsL2/xuh4BLfnpU6r+4
	4Ysw+LUFkLXjHPRhL93I05zHtUh+9sUaQLK+agdE5Hr8PAZfNqs8cfZQBrB5RJ9VU/5BUIf84+X
	vxZEKZPl9CVOaFteVOs+qwqSt2mSQtnvxsZHydmXz3RJnxwwvSoel4za55hko0DuBNkVxNXkU2v
	N+lDMZIcmPruFmv5IbuSHipBZwOGsBi/BlUmg5lq2q0STHAFr/Uk6vJTEU5CpxipO2M1B1LNdo/
	WaQxEPZy3x56tswL8WXzNFiHQUnSD
X-Received: by 2002:a17:90b:268f:b0:3b0:d0c5:c110 with SMTP id 98e67ed59e1d1-3b41c95ce7fmr27156870a91.56.1795879013360;
        Sat, 28 Nov 2026 07:16:53 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm19769280a91.3.2026.11.28.07.16.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 07:16:52 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Leilk Liu <leilk.liu@mediatek.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH v2] spi: dt-bindings: mediatek,spi-mt65xx: Add MT8189
Date: Sat, 28 Nov 2026 20:46:41 +0530
Message-ID: <20261128151643.16934-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_071654_313872_4FDA6584 
X-CRM114-Status: UNSURE (   9.99  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SPI controllers on MT8189 use the same IPM design as MT6991. Add the
MT8189 compatible with mediatek,mt6991-spi as the fallback.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
Changes in v2:
- Sent on its own so it applies to the SPI tree, the rest of the
  series depends on unmerged MT8189 patches (Mark)
- Fixed the subject prefix (Mark)
- Link to v1: https://lore.kernel.org/r/20261128141443.13065-2-sinha.aryan03@gmail.com

 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8..34e833745 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -41,6 +41,7 @@ properties:
           - const: mediatek,spi-ipm
       - items:
           - enum:
+              - mediatek,mt8189-spi
               - mediatek,mt8196-spi
           - const: mediatek,mt6991-spi
       - items:

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.46.0


