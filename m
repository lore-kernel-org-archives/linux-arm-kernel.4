Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1xeWEpZ+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ov6wZJ1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=; b=1xeWEpZ+l7ktOT
	yfhcY+hznDSqaTsAGDaT15HP6ovltcqPtIoq1L3psUyLLAec2G61fdF2ML6CUx0ap/Hz6HZuZZNFZ
	e0D51yT8w1g7vMnSwaCnpBvB3CRwRsYu1kaAcV6rzOX3wCcsIfb4umQOqKerTjCVDvT4eRKbcr2DX
	LLN9ikoHWd0Od7VP5b7K7yaikZ4OYVYlZNxi3ht+rqDpyuJ7dhj7UUZPjVM49YcRaPTh+swhvUJLd
	YVgfXtNQgAFy2I+m9HkY0oxB3HN9KGR6jASpQwIY86QWaJh4OmbUrVDXV+OmpD+W77r+xoDdLtVJb
	MzfaUhbtMypuVlnIxW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfE3-0000000EKPj-1OYz;
	Thu, 26 Nov 2026 19:33:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDf-0000000EJdL-1NVl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so4832105f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721601; x=1796326401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=Ov6wZJ1aufj0GHpCE1qwW3pSoEqyiR0dO5y4Ntb5T58w/sJeoCuMVyGPSpLb3vqc/A
         gsawa+daAzbZMCQin4ZxIRTNdeSqETMaorVDGvtSb3ntLT7ZJNDYH06FVrQzkZMogKzr
         7zXj4zsuLeOBHzqVLHE76LlVo8dBoiauMXCGMTBd/WoQXBAsiB8uKs9ZmtMpeIUR4XU2
         2tqVG65c1LRLQbDAOMqkOxhgVdXcewSVOlWi7zPBa7AgSq57pqdSiaw/74mqNSlmXZ4M
         CuPOWCOWsfLHhq4M7ZAGhl+2NobWs1ghTk9E82qbt9zzvNVBCojIhIzdpZJ3z6me/N3L
         ZqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721601; x=1796326401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=Uks9iuo+gsBhml72zwSB6iVIoS2NOZ5/ZKa8MMccynKhQ4/+q1SDgWyIE5aJhKlv8t
         QHZg4qJbnis0i9hm/+GFLtxsAzPJxtbk3X+X7RIYOIyI/eT8lXA6Q6pQs7d7WgB1agTI
         FDJ8o8cVMdyo3JkXP8VzY82zdDjeCZi1e5gIaI/LHOpnBqfk/u2Zi62ThbrCJg2CNgdN
         FdSq6CLczNp7DlpDD/sa8k3e/EnmrzSYsV9Nha6nfO0PiYOhm4/wdsXKFJZodWNAhYk4
         z51nF3QKmYxPrF9ZtqctgDZMLFcKmyWWCFQx/Z05imOkbsbV/jsPgfJ3DFQxxxZbLCD5
         uEAQ==
X-Forwarded-Encrypted: i=1; AL+hErGzELJ/hPwhNb1iY/AH2mdbRKOhSnf/9h6ub9t9cjBQ0nIl5UiCVCnAtWCxycwlKjjYEEDzAC3kGnZOGByGkpv+@lists.infradead.org
X-Gm-Message-State: APuU4Z+no3HxyRX4HA6KkBGyZnBOlS3R7WUNXYkFPUWaTOy+k19KQaUQ
	r7S1TDZKgf/boC9Aoj+/tscb2AP3oFhWO7H7QK3ouSfy6LCQvBfMbuPD
X-Gm-Gg: AZFdTZey+lFivST+plQY1N4QE7MkpaInE//uhSDFswGDt/3rAM8mMcZG0FHNbxQKkRT
	hYfs4grKPQdmZspwE7995ODjXHM47UGhlgbn5ZzJ2HeqUhjvwYWv0IdbLLnyXApICC12f6J316J
	U0C0cL7SUnjuujTwZfIHXwkm475+anwrcF1Mua2HTHri60zGhmbHzlVN71hgNeR6PzGMzWdM0PN
	SgtklBwqh2Gsl74v4ACDaoweAliF0IVK4HyhreVogX3TDteJCGQG2rCDaR35thU7yZ/DfvKm4NB
	MdYtZL49PPrNQhgmNdFDgucMrZGukQJsiqxATWPE7B7ruHyKmm/EeA9RWwL1OSUn0NQjW3kFBYy
	w50dMOY1ojpnljeSIp5moMzGgQk6BQTEO6FAtoqVgulxWtJqA9m2fkj54wXMA+zLUb+dBVpZLhR
	3KnlK/ZdrTPJJ0F4EAtovwavxDl1E5aNOw6Slb1Yll/PVBR3RTusV2cQhJUUC4DsZX0mupiaDtI
	VEfgnnkjUNgNNTEvFPxzaED+mMqTde4i3LGzlcahJZyJRRHo8xAMVOfnv+Y6vFnQJRMTDbYsfVI
	M32g4FXH0Q1BX4zy6TzmJKbwmpTE6AE1HN6mzIVV5bLkX2ei/5E51fe2Lk5yZSmeOco=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr471718395e9.14.1795721601329;
        Thu, 26 Nov 2026 11:33:21 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:20 -0800 (PST)
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
Subject: [PATCH v13 14/25] crypto: amlogic - Use fallback for 192-bit keys
Date: Thu, 26 Nov 2026 20:32:30 +0100
Message-ID: <20261126193241.1471372-15-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113323_410361_33FBD75C 
X-CRM114-Status: GOOD (  14.89  )
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

Unforunately, not all Amlogic SoC's have a 192-bit key
support for AES algo. In this case, use fallback.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 7 +++++++
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 1 +
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index df42940f1112..6070ee6b488e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -41,6 +41,13 @@ static bool meson_cipher_need_fallback_sg(struct skcipher_request *areq,
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
+	struct meson_dev *mc = op->mc;
+
+	if (op->keymode == DESC_MODE_AES_192 && !mc->pdata->support_192bit_key)
+		return true;
+
 	if (areq->cryptlen == 0)
 		return true;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 9676b86a5089..f530e238812e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -279,6 +279,7 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.status_reg = 0x4,
 	.setup_desc_cnt = 3,
 	.hasher_supported = false,
+	.support_192bit_key = true,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index b092d0c89cd8..a44290fcf3a0 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -94,12 +94,14 @@ struct meson_flow {
  * @reg_status:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
+ * @support_192bit_key:	indicates whether platform support AES 192-bit key
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
 	u32 setup_desc_cnt;
 	bool hasher_supported;
+	bool support_192bit_key;
 };
 
 /*
-- 
2.47.3


