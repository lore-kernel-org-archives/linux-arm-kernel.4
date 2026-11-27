Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110D9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DPBwriX7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIsBkSEJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=; b=DPBwriX79hLq44
	uMCMwBnVHDhjacebqWHdTvkIBjNd6HykKsZ6YVtt3QSpyCq3BG19Ccgr+78t5BN3GYV7ZuBxaBl3q
	Flq2yWL7QIKaLevBjwEPK496Y+k/r/So2pGw3WWLIkI70zhybLyqU9ECk1Rq8AQ43wu/OXTjhxfLk
	VphGISIO2B7f06xp81yl/4iPhuNF2UDcuRejPNz/jPQWQBPI12GVQbZEfSu7h0y8KWVnD9tPXzDUd
	VEBTFTTrZiu3t+pHAFF0y4TbNWiYQZYG252LemUWPrZVbnNiLHDRER3/RD3dcz9/VHqUjO1+geuyu
	gbTFMT4XavSM1reTJNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhF-0000000Fz4R-1Ca3;
	Fri, 27 Nov 2026 12:04:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueF-0000000FwQD-3x2r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so69817205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780909; x=1796385709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=WIsBkSEJH/MOU6uZdx3swVT8ZLA9ZVG801ecUWuFbcb3O7S2Yib6KVtAcBWh7nHEYm
         FYKAzQLHydIOwK8GfZE9yvxwHkv9osdn0rwTegKk7yjTonbWY2kngz0AliFjgAe8z7Jc
         4tElT2d9xjDzfrEIo3rBh7z8UlAplmx8O4E5Wm4C5ebCWHZIt5LsF5O3Dt71KEw9PqAP
         pZLjgHyRoU2bwbxCtWtOyDU7WKyf9a8+6RxZeMGVi2eRYWxME2M811I/EjzlFc0//nQA
         c1JroS429LTFYMtZytfsKLz6aRaXEac99tOzk0I8wHx9mGlSvMhOLJAsTQrb8QwW+QAn
         Byfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780909; x=1796385709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=NNagWyctBeMZ6AjQSJnzSfqr983Kky2bHFnWCPvHJqT25M1+ZSxqn3T5DcYqr1a/7V
         vNNlKNxyskrXlhyoGBH/wLlMX+0xSBuD7q0vtWI6WQUfYGJ4Nr3YoPNLn/njqy2XDwX4
         2+ZXnex+nlfEZy2XITUu92G6i6mycvjm6cXfDzuRCjKaAXlIXAWI5ehrLLL0b4RmWEYR
         CAtRsyi2MAtgwVY9dRigbr8GGY3Le0b6M4DRd5KI3ysMXXyufPvraUXurM3HcnT3cYqX
         mCWSb/aK6n3jAN12Mfh81ruahvfuQAWt8unZU4CDMJe9eTn/9ebXJLb+Sj0r3q3X3NCY
         oRPQ==
X-Forwarded-Encrypted: i=1; AL+hErFSa+jUIwRNhhaTItsDsWf1vFU+lnP3Ug28IU+c7SwvgE5DJ44FTAP9gp5MxHLIbHUrjWZD0WhtTrTxm9DIs6Gp@lists.infradead.org
X-Gm-Message-State: APuU4Z9Hi34fxyJYlXUiz56WEMs/MJYDaIMY5ePEdBTXyvySTiwdWbAh
	pT4jkSYGQFLMMwlNrynDVQtvs7OrUMcb8gbLzcTTz1MfBIfs8wRJ0t2z
X-Gm-Gg: AZFdTZcCDoNaU46oHRQLh5G3wSBMSCg+cNt41KpNgG+lfK+1rvZr/TXbl3xXVBjX90F
	vtEb3Ow7DoLyQaT8xIXYCAoQ7cO/yYWNm/PjjAAbE72g5Ts8TunLtU0WnpE3H3NdCOMe/C/TYpY
	2oBPM83gqMRql0HTu8pCgtg2Y1vUoEId04K9odYMAtjnL+ZSgH6seg3nHvEb8TJeU81gorLR3yJ
	1+D6dOqzSrf38ZS4DNVEFv5YTxrOL5I6pa29cz8bY0qcOWqf3cJkSgO2lWKcXGKTmHWJvQ4uY3b
	ohtQn5Y6WdwuaNFWjryxWmML95Ifz9ZvQrV2+UzbX0qgI4Hx/Ob1M1gF8dHlzZ4Q8OQtSpA5Fb6
	cbFw4kY6TXq9VoatzWAHzMA4DXOzpVV+buhIdyaU1GiHDXoMALVIporW88BwhCln8oO1sygE8eL
	2CBZ9s/IxToxw9FA2MVmuQkW9i7VJTQP8+v3yODQag96nhxCb57tmOReIfUs7QB4KsBzXRdYjBJ
	yUANAYjrtzmd+lkscdcWAGVxEtSW+ljN7XBkNw4LKHvB3PfBlYFqz9Yh4wawekSiEkBZV20P/Xh
	j0ezTmsGLUV/FemN3omsVTVQYvlUpV5oT1+/3UL8CI0DjAE=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353975225e9.10.1795780901984;
        Fri, 27 Nov 2026 04:01:41 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:41 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 16/30] crypto: amlogic - Add support for AXG-series
Date: Fri, 27 Nov 2026 13:00:49 +0100
Message-ID: <20261127120103.1532882-17-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040152_105142_FFF050E3 
X-CRM114-Status: GOOD (  11.24  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 0fb0da20e06b..08d89db14788 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -290,6 +290,14 @@ static const struct meson_pdata meson_g12a_pdata = {
 	.support_192bit_key = false,
 };
 
+static const struct meson_pdata meson_axg_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 3,
+	.hasher_supported = true,
+	.support_192bit_key = true,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -299,6 +307,10 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,g12a-crypto",
 		.data = &meson_g12a_pdata,
 	},
+	{
+		.compatible = "amlogic,axg-crypto",
+		.data = &meson_axg_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3


