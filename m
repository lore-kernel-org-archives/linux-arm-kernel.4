Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C5A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDyb5o23;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNrEqCEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=; b=kDyb5o23uWFj03
	NBRHZz00xLIJXiSjRn4i9MKCI3g47MAbbCvzlMzs05+KPrr2CDywjismhPWEpi4mVLlfIrR0HoI5u
	nFwvzY1EPzBvTYjOvinz+mjaQQQ9VmWGJIUBcpCdysdvKIZnbR3zDcR1Es2f3XSYfXGERPSXCfueP
	19mc47o8ADCaD7C7JbowryKVKbIl5Walt25P3oilYrKg6edikoryRNZiX5+sF40+9EFlBA6TBM1AB
	BjyOeGUDX/dJBpWI5FMZlMDekETxzApdYIPrPOXsD0hrr50HMoaqC0z1Drx/9NjAOjiyf69pMq7Gc
	wPrPbLyJMSX42ZHs1gDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJCp-00000000p4F-2ucz;
	Sat, 28 Nov 2026 14:15:11 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJCk-00000000p2x-24cF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:08 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso147931eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875306; x=1796480106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
        b=LNrEqCEB02LmDiyZtVwhrVkr7/ruCW6LNne7njMLyMw6TXr87LfU+9bVav3atmJiXo
         NcM7bWRVPtuIw28l2bevrSTjr27na8Dygx8ozwJgOwMlPiEv8EmTkM5LMCn7srhuX17O
         2/B2UzGn0EYcyAEps5MpPed/nUE3YJvg2bEOVhFUZM7Zfo2+XR7Ofl8ouEDe73Q1tS0E
         lRRQaJcjvwOug5lrW75r0UcJzgrZgu2Kk33RHtMLUPJ77y8Ief+zSG8Nlz9glJo6smVB
         EEcDUFPYtNLh3qRD7jfgMG399tTzT6pGNny07P8rrDtg032mXALC1qBW4zBLB5ksFVav
         jeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875306; x=1796480106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
        b=Ux5IdVlK5cic60ip/Ud2HAEDV/UEWC3DR7l6dDQX5EJ1yRD9KZ8v3whHmxtFrZfD3s
         r17rjdXvbKbW0WnD8lk5q181fIEFB3tTogsHv/nZ8vrj/oRu9ktmhaFuqbiY88JFJiox
         y1Ili5D4WX1j/5WQRSsTqDctgQnYsnYw36yKih8fkc2UdtiUXgbtJIFz1gJXkGO6IrAe
         rpJyz/zVJhnrK43AiGDAYJ+18RM6DP8HOb9+Ly1b9DD/HFDiW4Ls1kJH7evmBvKh+bf4
         l4HyTVD2h/aa44P1QBl9bf+W2OdIszFlm6ehBXLjOcu1CwpGdCesoHYNuyHmH6VAYcqB
         vviA==
X-Forwarded-Encrypted: i=1; AL+hErGaNnd3E8U9AOMvLql3N4eLr12bsPgvFe1Gsyp92r7aBpYk8bZOXL0xErfZQr2bB7PEBtvFJ6reKiLNw6Dwf8lF@lists.infradead.org
X-Gm-Message-State: APuU4Z/eRaRKJPmb4MjLkDZ7LauB3+3ysrhebaO88GmHWFOViaD3vs3u
	iYaVwL4StQ6rXJ4mVknYEpIpSaEgt6cKXlczg3Wtk/elIIjrp+hW3hZQ
X-Gm-Gg: AZFdTZdhhUGrfUrL5dr238cELpAp3G8zYpJP8DVKywjJmUTn7izoUq4Fh+58fvzk3Df
	kh8sXPwxAM0hcGQ6pHHgm9ipqomtqHkOaQzOfYYWOE5YnWly+p7+mMu0y+BoDMRKC1/zSTHEyFs
	9kIJC5J2zfneB6LSYZNk+pr28kmIl63gS78OJZSFPEkbwh96B7Z4rOV3Okd3L/YFdanfXqdKNwq
	ySpy11sTucmiuK7B5/j+IMLPONyyRrQ6W7HmXXxqe6rth1vpR4vkDIKc6w0GbvRAjfD22sNETuj
	1blnQcjWqP+65/s+XUDKP2w9TLZf/+yAbvfJTG+z/NtpU7nBEhIJqDc3rkgAgk18mPZK8EHdJ3s
	rj31jdyWVHBdsBfaeTShB3+badIFFavDfOHlYI8jrB7CDr/RdbpFN+HjyFtL9yxTPZUJV1iMHtP
	oBn7hppEHp/m8vJLfx7fF1mqmATaE4CoTnkoRwGaRE6BN0WirczsjMsCshslp9bxjWclEvn12o2
	T12xnmm8Y1OqHweH53S0Q0iOSLe7qpc5Y9P1+qIG95MP+35wVDSf9PoCgv3CRjh49nUifA5ZCjh
	Es19JrcZzlGB1TMs09OrAVapRIV4Qzu0xJu3EeZt0LikYLcQYOdLrs5P9VQfYaOGy7n7faD+EoT
	WL5KEIzfegdh/IlrX8hN8Ivxz+PTF
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr24469794eec.7.1795875305781;
        Sat, 28 Nov 2026 06:15:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.14.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:05 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 1/6] dt-bindings: spi: mediatek,spi-mt65xx: Add MT8189
Date: Sat, 28 Nov 2026 19:44:25 +0530
Message-ID: <20261128141443.13065-2-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061507_472475_DD085769 
X-CRM114-Status: GOOD (  10.49  )
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

The SPI controllers on MT8189 use the same IPM design as MT6991, so add
the MT8189 compatible with mediatek,mt6991-spi as the fallback, the same
way MT8196 does.

The vendor driver's MT8189 data differs from MT6991 only in not setting
must_tx. That makes no difference here, the driver then just supplies a
dummy TX buffer for RX-only transfers.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
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
-- 
2.46.0


