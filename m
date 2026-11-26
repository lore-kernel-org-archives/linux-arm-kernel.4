Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FLVczMcB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZSln2cO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=; b=FLVczMcB6APz1w
	opjNYy2iw82LlOsv2zFFpo5F2oTRvVTZ7pxx2ppNpKv9uNZgDFFu0xVRnrccvE9DV1y1yod2BND1O
	iD+k17sywzSiPLyxshr9Enwj36Q4kLPD/iUjydMX6zEEuknKNlmE/XZtcXqlVZ6gKszYD1tOktptO
	IKe9HCKotzt3IzqOobO/2YAwpOd53vV0MF9flLR86XPFQZK1ZRHlJF8d+ZddoJ68yEQQpgMBT7M0J
	v3D5LnrYqL3dTZLO4slpnC8Hwmg5DJA1MrUKzAdf9j9H8wNFtf4Z4353R92RL9uIyc/4zau8+eD2Z
	xypwhvYEkhmCBT07qzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEG-0000000EKnI-2kw1;
	Thu, 26 Nov 2026 19:34:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDg-0000000EJej-1izS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so66980815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721603; x=1796326403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=TZSln2cOJ5GxeKH8ZQiwX3MHzCxn4DqVEZuTHoP9z2RxzHbXP23fVvStDDmdKGsDf1
         r7MEY6Gksfa/sNQnwpCP9wA9pIayAwYPZGox/K5U0tT/EO/80yzvEyHq4TpnTvxp8KoI
         sboqsuOEFqfhxs0emRb9bzCrEAsqPyPGBdLG+7KqEJR5R+BYzLjjWXFg/hYxwLvA9h9y
         rieMTupfscxG82TypylvbXeqlZzYjbdkf+kXmjFOrpzjfu4WAEMEDQycKVrdSkIF0g31
         TbTyRaBuggIxNyFHzYZEr9XZ7sN2EJ+kUL/aQg6eB7HpSrYmClZNlwTXW/U+WZ386/Tw
         FpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721603; x=1796326403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=NHQZ9YtkLNPa0I5tyvEYDs4j7sktMEkOzdAcDtidr4pgwQoZCY030XcssTk4ZQdlQ9
         JTTpIDL4oMR/Tx12/nE7/5q+bUdwqiHjvlLBe/54qNeZf7P1mCwIJbGYZ044Y1Iol5/U
         vNCz1pe8FBCUGf5NBw8C6fQC4uaIt6lVRuA3sQbraHu7eKQOA1SIjPcAewdy/lwSxYle
         2AIeFcni9xDMqhOUKSvHgqecAZ6fD2t/+meCTzuc5xOZQHiQX1Je98nSbc33jHocBjHR
         Lacp4WkD9ex+lXGrStdRMWLWMW4/ct3e/qlGTsgUmCY0Pe21NwaaUZK5+TnxR53LFKe1
         sSdQ==
X-Forwarded-Encrypted: i=1; AL+hErGllT86Q5N9H9HvTOL/h5tAtgbzbzVmuAAQSlyWfbEmG17kXHbNXNBYJdkp72a0gsMQLLFPc7IULcD3Z0ew1iCa@lists.infradead.org
X-Gm-Message-State: APuU4Z/E+SlhkfYFfyWjjz4xGYxR1JJmtdWVzm8o7PjQV2OcUrsfoQyi
	Z1lPuyvRprsIzkNGRd5nLmJpwre9pgcMLoGMvgN5tqgSBds1f3NweX6u
X-Gm-Gg: AZFdTZe0Am4GeKoHK97hP92DjweP2CGYSrBf5zjla+EGt9rpb5h7Y6gRxr/RF4hf9oe
	RZ99WfckbCRxxo4OIpctx6LjLPVOKfw3Bx0i3ABQslu+S6NfKi1FZobWMuilLIowyvxbxBPug9Q
	1jZejNwV7VUjd2mBiFOcwfD2KR4KlJqYgJFLcxbjUzfkOEhmJuv7rPno30pUpuT6wRwLghRzvdc
	5eF6SnO+XWd+zoxszU2Q21875j5eiN3vKk47G7V6LaF3zq7OTLiEUsy5i5Gut0uQrh5e/X4Iwbi
	iYFL494l/DY3f8kDHcKOi9DElzwsWsW5j2dmWJ/SsAw0N5Ojg+rIjht+gLdb9iJRXU/kohKL4In
	Xklv79wXVnYMJyOob5r11X/btJMtsUPacr2LL3eUkqNYFam0IcIfJe3tIGWLmnZCfIubWU1CU4E
	efmEwI/jJ4l/3nUEdAtYwgV4hA9Muy739XkERtC4EXNCmOnBQp9/DbYYshWXpSgdzlbGnod2Yuk
	DYNP+e6HG8kfoVpktQ8KJUQTVfz7FuTUd9g7nZZEt+1SD6ZRqIA4PFqGTNmtSZYeCWnwBpLl5vP
	/I2wuYgCr2h9x+KKeprGSYctr7KU97v1XnvsuvigOBOIvg==
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr392936815e9.32.1795721602653;
        Thu, 26 Nov 2026 11:33:22 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:22 -0800 (PST)
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
Subject: [PATCH v13 15/25] crypto: amlogic - Add support for G12-series
Date: Thu, 26 Nov 2026 20:32:31 +0100
Message-ID: <20261126193241.1471372-16-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113324_476520_BA68CF19 
X-CRM114-Status: GOOD (  11.11  )
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


