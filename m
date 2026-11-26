Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5001606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=azdVehg4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtWEh8ae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=; b=azdVehg42y+ykI
	dbWSz5vWh+pKY3Gc2PfT3IAcCt9L6R87w8r+ZAk80j6zqgaEOxBn5VKgbltRlNOR7vP95wj539K0s
	5fHxdng6MFuqxA0dCFt9kU4P8uBV46FP7C3c2G1PGBeZ3r6sHXDg6LroAd+MLr9YX59r5EHLJaEO9
	iY4UlMj8M++0jD+nXHXtmlwb3uQn75BashZnRCRN2WKSk15UpIfFOGeAlPTCqI8I13MR+FQ8L5nuy
	qzG9oyY5X2LU/WfsgKbI5No4jHR5Zg/zYYU9A6xUXuBOjIC73xNiQh4fTeGr2Mt47EQn4iYfrTPQ+
	4XHC0E2tmj15SEHtx0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEH-0000000EKpC-1gUN;
	Thu, 26 Nov 2026 19:34:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDh-0000000EJg9-2n2u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso57793385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721604; x=1796326404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=jtWEh8aeJTh9GscLSmQVJ7C+eoKwO4dVgNSfG25ZeSun+dVtJLr5/KwNr/Y+OUY5Od
         YkVvRXHuHFTJNoG1AXZm6zZpbkv/lgrGDKvCi+6hsyky/IRjUZeTrdzLo5KmNRZVvZ55
         nVZVLnU9ZUpaQG4TVgv2/2eh/KuLipcbscrRct6B75CRC188DuBmsCa/L7ta4oKxJq4z
         6QA9I9IaPiqejzNGxsK0D78Ln4I6bTYPZJrfy+Ia4CPo3bGUqPX6WcHI7QSd/JTI5r/F
         6/N2RYyws4SCRSttXt4EkHbltKoJMwutZGodLdyMcC7W9tIc48lHv+1mU4qEF5TWf5ck
         /fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721604; x=1796326404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=sO9BgZsm1vfVn8vHJcIwcd2J7bGceGQ5ihTyLF0w7SMwLi8p4ocD3peTVHMs3lKqub
         7Z5ZMPxampnJFXiOIkaiNB/naJQQDphnKtfKyz2wJzeWqY/+GFsv1q9YhVTFkbnI65ia
         0dPp9wUigSU1JCLmzpf2cVI7EsIUZGsFbWAgHcF6tmcuKvnURUPv3PMEt+mZ5GTUGTHf
         EvINxsUXfQqdfAS02arCYpeGIe1oy1mBi3xQ9YJrCcxni5nKvh4skQyMSUyfyRCb6UkB
         g32JSiK2u2mSHrqsqphFuQySP8wPcbhmCcFCLLGCMHlr0LoYMYV1GRTJt5OVJ6iJ2qAT
         ddsA==
X-Forwarded-Encrypted: i=1; AL+hErGtD/rW/FaAHzf9Juvesmm+rEgJYAJS068y9gCArQB7hcTEi8mB6L7LAShKKdmjOzmjRSFNHF+LiyXFVqzWvS8C@lists.infradead.org
X-Gm-Message-State: APuU4Z+X1nB8izLN29qKZXNSrDZRvYbSYGhusTFiGJpWsUep5gKkN6HJ
	3KzoQ3zQACbY07S84fjbuekvWHozyhqWPjBeUj/IdaGhHa8NeOrlvUfX
X-Gm-Gg: AZFdTZdsvp68nboexyUBy58rnTDFarYjouUNrdGAYjsNewzzH2dTREl8BOZvNYA1kZT
	dajkhnlxmLy90rlGEIbsE9Hi29zFWdMw3s0mTBfcLsafreHHUEiZb5lGX2SlEmJ8QSTa1G3I2G9
	bKlyoG/tm0bvcPcoJJcHh+/eQRP2bOEa6jLvED9rUz8oiG5qOIlNl/j4zHVfN8k0cG4eMekqbeo
	7feG/lTlne/ANP8KqXNG4Cnh3XbikotzdKw8gEtapGx5TJpXQRZuWN68yUeymF+/TobSTGUduUw
	XqV5FaXtjp/+d9zpCsu8ai186LLKoVBKhKObdXdbLOY3zVQpf/N6tKIObaC6ZCZX94IRfv1HXh2
	/tAiRbO6tAhssyTPzY8Ru+KVqQEM6MNGy7pcQjIvE/TzNJypxqCV/hWyjjoNQnIHnqtP7evpOrl
	k44Mv6tFYFl6S69Pyx7PeZ9ZHs/aa46g60+TuLZSc2DH2mRprJCP1xqQHfPtZRj9h4lTr14LfNp
	t54byT1hvl7ETknwKKeXpJ32ozTvYJ0V4fd6eBWZ7IqaGQ3UL6uO9HxMC2R2dPzoQpnAdpKD9G+
	jftxTb01YUisJ3adTrQ+Uqdj/4+wfMZ2qUHv35R2oRODtw==
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr424253185e9.32.1795721604012;
        Thu, 26 Nov 2026 11:33:24 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:23 -0800 (PST)
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
Subject: [PATCH v13 16/25] crypto: amlogic - Add support for AXG-series
Date: Thu, 26 Nov 2026 20:32:32 +0100
Message-ID: <20261126193241.1471372-17-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113325_757138_CDA984B2 
X-CRM114-Status: GOOD (  11.40  )
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


