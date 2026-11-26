Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FDB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s0zsYmt9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GxA6dOJS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=; b=s0zsYmt9FQ+SME
	izHUo1GJxJoOu1ihIcIG2kxgOnduX3aVY/FGpJ7fuKg/bQauRwBkxSb0E0paSoOKdpeDH8+4aAZMs
	n1hiSg9+hjQlhMqffhO4kzF7iT4ybieTBhChDxy7zW18gFkFhMHvmynQbGRt8zUdznPfAsVum6r02
	R1dkLxoPAo8MRXPCivWjm8kQ7hr4XXVbg/1MCqflH+YGuO05rriErr+2QwMl9ePAdKXdrb0VH4N6s
	JuL/NOnvHsTCDSXvfoNQ0BwsmuDxqFSufpcSWQj2Bb9u7XsFz1eRdLP/3ybBMs4orZLalyQZ1aZ38
	LndlK6Cox2pq5OZ4NCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDr-0000000EJyy-2TyY;
	Thu, 26 Nov 2026 19:33:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDY-0000000EJWL-1Y9F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso74457815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721595; x=1796326395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=GxA6dOJSKSli4/BtZIRQgGIpesHNXVR/GvM6jCu2hbC3I4KesGNNbNJrZB4WZYnLx2
         2w2jV1kztX5ywsYl6eMgVbmQ4AYft90cxbU6uqULrl8tAvjeQt4xK6hV/KRiACG1636+
         LO+uaI4eZs8lscnTQ6VOom7C+mMrRS5wJdGlDeegCRPiG+MB7oi77yOIHtSXs3nDG2Rq
         49boBeLhCRtsixYb2SEW0ofnQvMJAhIBTbcRSW3wCkDdQM4ZpmKxle/PtYK0k6xLrWiw
         AkGBokb088YzdzV8T6e7rXPNPEGTgP0hNf3zodhoh77ek1BfYFjO3HFnFhaiBL3ZlLgX
         cCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721595; x=1796326395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=oY3g0HDidJ8OSI90V17XrScm9he/5uYG42P1nUE+Jdgj38dNzh8/EvCe/QD/RXW0M8
         HkTCZT8HN8wlpqWXu+sfsIas+v28iyhJbfCr5Bz6iz5s/cdarg5LOWf2XO1RsaVz9EjU
         5TJoCe7iWPQVigS61uwkCXmZdHeCcst92IGz9dJnO+66sXPa+cyVjN+I5h0s3CSG67Ul
         NMZ1A4BQs98a93bby2sMbDBEO/EkNBIcgwulv82anWP3tSiKvTwahiqSwdwsWpD4riBY
         5AbxK/KqevxttP2KeVz3JsZDaeMR6VvW1YdKh8OQG6gw6g5AqXxXo5o3+m4U2LY2tdQC
         zBog==
X-Forwarded-Encrypted: i=1; AL+hErGRAA6O8s3AUDV0i8I+wYdEZ5Ee5cTw1MBRgKQLncNU8IDn1v6Q+U7NgUaOtpZybJfIevocTJl/DpuuJogamMBU@lists.infradead.org
X-Gm-Message-State: APuU4Z8At9//oTGajJlCIrdC77Jff67DRrraJUkXtAxDr0vu3kTUC34V
	gNDl+nvZSGyYJPM8sslC6u4hRk1XRb44xt1MfrgHbeD3f2ADMXlsE5J7
X-Gm-Gg: AZFdTZePk1MwFwa7+IeYMnYyTH6BE2fltEE+GKBfdppaWmuGFgB0zt2PLGE6Ff4ocwb
	9Zdke3yM32KwKAacpeyExH6Bnj2KGd4pozuqLRAXZj7OlpgKG2blbyY/dUvXlkZB0icyhmIKUSY
	G+esDzvE/RV622IVWUcsiV05/gMpADq0TUWehgIXvDryY+Qi6CUCWgI0pzcCCO5TVyKOjRt5asl
	yX0H12SH+DYItnykz07IHrnih6DoUfkbxxv1B3DdZ/Xi9wx9GEvdwppeR8Pl1ENmH8hRvGk3F03
	Qmdf4vhVTZubB68EiNtBaVhvn6mHBnOxhOf27VqaVbVXKRT28VvDDfbPrXE3wRPO2HohtgzK/wX
	bRnrlKNjjLsZ6NMwdzeuDruTjWvQbqOaG6GY59lLlNaXdYbynpu3Vu6Yvf8ekQnDmYOk1vSfv0p
	zlY0RfwqH286n+OQ2NERt3Y+1j9nXOBzAOBNqT8srycPx7FSoC2RhF4Pk3lUR5XYFy8jMsEPxEA
	QRv3nv0Yb2CYV8YEiddcII5/5wDfwubywb9z/iIzzSDHPCYZ2mCppA1ibP1rCpXwJtmPZ42nG+b
	hjQYF+6Q/RQ2qirBNm55da8+cnQWkvsUu0g/GGoBFXOj8WiFaokx8YWD4HkCiRXszNE=
X-Received: by 2002:a05:600d:6504:10b0:4bb:b378:a003 with SMTP id 5b1f17b1804b1-4bbb378a00bmr865745e9.2.1795721594660;
        Thu, 26 Nov 2026 11:33:14 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:14 -0800 (PST)
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
Subject: [PATCH v13 10/25] crypto: amlogic - Cleanup defines
Date: Thu, 26 Nov 2026 20:32:26 +0100
Message-ID: <20261126193241.1471372-11-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113316_445006_043B3E3B 
X-CRM114-Status: GOOD (  14.61  )
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

It is bad to use hardcoded values directly in the code.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 24 ++++++++++-----------
 drivers/crypto/amlogic/amlogic-gxl.h        | 16 ++++++++------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 00d3247ebea1..c17ce5cc70a8 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -141,8 +141,8 @@ static int meson_cipher(struct skcipher_request *areq)
 						 ivsize, 0);
 		}
 	}
-	if (keyivlen == 24)
-		keyivlen = 32;
+	if (keyivlen == AES_KEYSIZE_192)
+		keyivlen = AES_MAX_KEY_SIZE;
 
 	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
 				  DMA_TO_DEVICE);
@@ -161,7 +161,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		todo = min(keyivlen - eat, 16u);
 		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
 		desc->t_dst = cpu_to_le32(i * 16);
-		v = (MODE_KEY << 20) | DESC_OWN | 16;
+		v = DESC_MODE_KEY | DESC_OWN | 16;
 		desc->t_status = cpu_to_le32(v);
 
 		eat += todo;
@@ -214,7 +214,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
 		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
 		todo = min(len, sg_dma_len(src_sg));
-		v = (op->keymode << 20) | DESC_OWN | todo | (algt->blockmode << 26);
+		v = op->keymode | DESC_OWN | todo | algt->blockmode;
 		if (rctx->op_dir)
 			v |= DESC_ENCRYPTION;
 		len -= todo;
@@ -363,14 +363,14 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	struct meson_dev *mc = op->mc;
 
 	switch (keylen) {
-	case 128 / 8:
-		op->keymode = MODE_AES_128;
+	case AES_KEYSIZE_128:
+		op->keymode = DESC_MODE_AES_128;
 		break;
-	case 192 / 8:
-		op->keymode = MODE_AES_192;
+	case AES_KEYSIZE_192:
+		op->keymode = DESC_MODE_AES_192;
 		break;
-	case 256 / 8:
-		op->keymode = MODE_AES_256;
+	case AES_KEYSIZE_256:
+		op->keymode = DESC_MODE_AES_256;
 		break;
 	default:
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
@@ -388,7 +388,7 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 static struct meson_alg_template algs[] = {
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_CBC,
+	.blockmode = DESC_OPMODE_CBC,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "cbc(aes)",
@@ -417,7 +417,7 @@ static struct meson_alg_template algs[] = {
 },
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_ECB,
+	.blockmode = DESC_OPMODE_ECB,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "ecb(aes)",
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 608ce75f027a..15b4335942d5 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -11,19 +11,21 @@
 #include <linux/crypto.h>
 #include <linux/scatterlist.h>
 
-#define MODE_KEY 1
-#define MODE_AES_128 0x8
-#define MODE_AES_192 0x9
-#define MODE_AES_256 0xa
-
 #define MESON_DECRYPT 0
 #define MESON_ENCRYPT 1
 
-#define MESON_OPMODE_ECB 0
-#define MESON_OPMODE_CBC 1
+#define DESC_MODE_KEY (0x1 << 20)
+#define DESC_MODE_AES_128 (0x8 << 20)
+#define DESC_MODE_AES_192 (0x9 << 20)
+#define DESC_MODE_AES_256 (0xa << 20)
 
 #define MAXDESC 64
 
+#define DESC_OPMODE_ECB (0 << 26)
+#define DESC_OPMODE_CBC (1 << 26)
+
+#define DESC_MAXLEN GENMASK(16, 0)
+
 #define DESC_LAST BIT(18)
 #define DESC_ENCRYPTION BIT(28)
 #define DESC_OWN BIT(31)
-- 
2.47.3


