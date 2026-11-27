Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C323606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ewVPws3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAANzw7S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=; b=4ewVPws3OIdVjG
	yiKN2FMNWSE834bVwnG/XOVWBJ02XbqnMaGJRQDQdLvgEmqpbjwoqk3IAzaSAHtIisgXzIdbVbOq8
	FKztaaF5mAXtzCjBiUGGU+v9uql601w1ob5FZlr/dzYaLX2i0v0WYyLdWU37ygwJnQR/PtI7EAzAb
	MGJ5SVOB0MCxTBYecwyo75QElrbHlMpJZ+4yNFUDNIHmK3R9tCSqhoLNmymKpXUoMZyaZlZmC/Hi7
	T5FR6S2is7Xx1N9pHtMQzzg96Ei1vg4I894DWo2fTC7jzo6i7ySv6oZHwpta5SuglX5JEKpN0jWBw
	Q35ScmwN/0jQFdhRDvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueV-0000000Fwyc-1CSc;
	Fri, 27 Nov 2026 12:02:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWue6-0000000FwIK-3Yt2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6802341f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780901; x=1796385701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=yAANzw7SwhnyPDV59DD/j3lMHJ2cbkMImhHlmD8GgiEgUwhcgfLy2VXd3b370ODW8z
         3Q40RtObDnKZCjQbDJnuknql05v+Dukn6k6sb5zQ9xfN2HVfaaiIguaR+7eXSJwshtal
         tPyBxKlSsw7CYteP+91jJce5hwTxrNG4RGkcyJzhqyZOKrl4GWz3H98d70QdqALC9c/M
         aqfqztMRcSWtOAWiHhYcQFjxefuULapl0OZnEHNXNwI9SdyEei/D3snR1Ih1/czndkkG
         PZ4N7q0Bn3ySLbYLlISdppfFXs4NDBoGCuAgCuJbAnkUI9vtr0hs5xcsGF9HDRGoTlGk
         OabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780901; x=1796385701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=kuwh/FShEtzdnYDLeA5ZNWCz3ELxElY7Ut37S6Qd97Hk6rYpe119LR8tqRdduM2TtL
         EoUGGeTeusRX/UyQr8WXdSrdcqdL4JOnmT5LZoRGEjXb87cjJCfHg3zv+XPfbXzikiiO
         p6HkrifrkJ6tYEtbAWrzAxiRjW6Y7jobu8XLGbaoO6WXInyk8FU06c31eL3kElt68b08
         yt2U2KAsz3UCo9m9Pem2tbG9sXOd/fpeCe1d/oglUcu7jC16fx2HJbSNRdnrtKsQ+9X+
         r7yCWpGfhs2CgPoJz4j7jQ6AB+A8MrFr8Vpa97bwYpos2qd2KG63z06Asn4mk4Ofdlnc
         lCUQ==
X-Forwarded-Encrypted: i=1; AL+hErEZMKoAVGE4PcinWLOTxyKt32cPziMRemanZ5LGBoPULcbyxv1HPSxmvcXD+oXboeWmRnhA51bkGwApkuAVY8ai@lists.infradead.org
X-Gm-Message-State: APuU4Z++tYiB9gYd0no75sHWGwi7T8rXoW4MYrcjD61c+ISy0fE6GXGK
	5HU/xKX2XSbuHkjLvtIdlIcoR5JZSHje7fJrNosiOP5IxI9aKYUY04pw
X-Gm-Gg: AZFdTZcJY3uXl7oDPeh0ho6Z0ODW4hkFOz+TE4r6HGwYaaooZKVNkQ4jt/TyhrGchqI
	Sa46YIqk+YneZVxH73HZcPBEsDgTE3nd9Wb5PruXNqU5eC5MOBGy/+dibshoJLqbVYVYfgpJuhb
	2GJqGZOO74FZIF5yCfSIRKu8fI4fqZYGlowAg7QK5GqY6ozo3hDqWIBhRmM17UHzKSQKLq0EBbv
	tLGmhXMx8Pxzd+XDFDCdKLd7HL7jdR1yp4EYazhmmvLQ2eXGrvGDZidipaui51nUQZSUGjGRmx4
	NxWWzr1vydo9/iIE2TZc3j0Gm5D8Kv1tZLlnLzf1Mi/JS2++H+TWJ3vkMntbVo9gk191WcvSX/J
	RPPxg0m1dN/4rLLDyqeQ0jQY/M8W+QuC/UO7onsF+3JHX8NjQsdK1tRzXJvGEepjXYiDVlWvgvM
	l0XgTtrotqQSLliSv36ODC+bJb4qF+eGcieFERwVyksI0UG+ggsExbmQXpYFX2ebijjCYQYzaw3
	eZYAdqBZwDD5ra+PMfoWjfFNC4epIJ+6u/Y2FGTHCdDQ+7gpeQNetqljCwcEmtrihR2b9ZKna9X
	1HLfTE7X+HHKaa4vGpjEwhqYCsJor9oTh4IvdxomZy1T3Faz
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr505131085e9.15.1795780900684;
        Fri, 27 Nov 2026 04:01:40 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:40 -0800 (PST)
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
Subject: [PATCH v14 15/30] crypto: amlogic - Add support for G12-series
Date: Fri, 27 Nov 2026 13:00:48 +0100
Message-ID: <20261127120103.1532882-16-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040145_061058_2A1062C2 
X-CRM114-Status: GOOD (  10.86  )
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
index f530e238812e..0fb0da20e06b 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -282,11 +282,23 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_g12a_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 1,
+	.hasher_supported = true,
+	.support_192bit_key = false,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
 		.data = &meson_gxl_pdata,
 	},
+	{
+		.compatible = "amlogic,g12a-crypto",
+		.data = &meson_g12a_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3


