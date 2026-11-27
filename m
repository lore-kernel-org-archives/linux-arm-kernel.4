Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CAB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rK1YJgRH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S5STYB/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=; b=rK1YJgRHi+OuR3
	oRPub0FuXri955RFTJ2jdQ1JEUw26ptiQ/5e5Hqv6Fe2IHjQzz9R2E3KUKYgkyPmajJih5kmU4uUE
	4HMidYk+seNEpzQwzPvk/u3RMkiRfA3Xbx5//M5Kbqg5/sQ0smNsrGGoIfsgsLgGxzQCeqz/BWEXM
	YZUruJkUIogfyc131EafrTNBzTkbKDSnlrYtzK5r9LJSqia2f8dRZaPIufUPAgHHIiE7BGKKVVTFB
	7HAYwe5yvpwZM07yvTulzXWTsqi8JTTeWUok9r6jBiIJtvmSF6Gx3Y+vIz8dy9KS9fjUk8MEoJQ21
	stSURj1p4rcXigsj1ICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueq-0000000FxRM-3QA2;
	Fri, 27 Nov 2026 12:02:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueI-0000000FwVV-0Cvl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb606491faso42363145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780912; x=1796385712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=S5STYB/XKk2mjMZXkpQrCqe/0mf23s1eEy5E1PUTbLoMiovFJ9oj7PD+jDQIBMiWcq
         mbVAlZxXHuI/z29JV00VgJb74w1nmLAS9vV3FfMXQ4O72FmkL8cmuYncDMscJ74Fkxmz
         SuB2tzJptr3J4H3DQnYQHYpRryUt0mXgvMu87rFbSrO41w+eVaL+gVLHYAiNOBfAUdVW
         wRdjOnGXxyDyQk62RJdYi150XVXrNSdADUlVl9zlTCC3NydLxPMVMldPBl8NOiuiLQ7p
         byyYcdo5CgvTDx2n+C4KeRbdMksidBMIDrNyYo45dxnTltR5WDxid7FFLq5vMi99m09N
         Up4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780912; x=1796385712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=zNM1pYxEMunOGpDaZsUFkEU0l+TslPSGjU8/ySZmBFHtm4cAhaMQ8tfEGCKiOBj3yv
         QKxfhXzA3BaqYWTFr/wKKNb2rPKHd3rGKuIce+TL80hgL9PAXx1K6MQVl8X8V/6tt8Cc
         0m9h11KxNsksK3h8e0vwHwKOnmeDol3OS2KiZ9HnFyN0FGLcT77rtUgHZalfxz4Y4ALW
         BZLgyF4r5DsrOXuZU4D8itkx6V6qpBIf1dHIwgCQQ22wV28EIhNXG8Oja16KvbdtO+a4
         LPAwxNzbEMflttoN62L/vl2vGJm76G6jYKBPBpV+9pD0hqh/1KBh7chfJBpZIQashlyw
         dgLQ==
X-Forwarded-Encrypted: i=1; AL+hErEPG6KY1CCZC3hlGUVxOy7CgoXLpHUEn2VdcC3q4mCuQNhge/KWfLspykK1LjvH1LgYdWIxXIkZFPubbAnbTNZR@lists.infradead.org
X-Gm-Message-State: APuU4Z8HC0HO/hN+ch6P0jJP11xWT5U51NmlL5V7lD2YXqrVudaws/xt
	IB3c1DDDAuDGYHLtbArzWvRHek7Md9a+ockILTG5utr2ZNEVrR2oE9MX
X-Gm-Gg: AZFdTZeasD29JUtzXAp+QuUZQUazIE8ttdfE9opqMVQmcW6nWEe7rCsFWC2Rrau8oUG
	lZM0jb0L6UPORSRiZ/B9yHCfm5WilcY85ce7smMZY9jgGOF0VCsGimUa7alv+7Mq2onIWxtgFi7
	/Kt1p5miwuxJxRWJ+SIaiQaI8/1tMu80S6Za9iISXTqkwx+1x8KzZ2v3TsTCetwHZsIFw9KBndT
	PpPQJnzg5nSltKmvblOqDylQe620nF1pPLFGJWjo0zjalhnMK2xu1VYubBfbO3siTUwyj9C/2pH
	PlO/mBuII/JO1rIcEbMGasmbwVS8RHjxRdvhmK6Z6U+iVjZDCck1i5SZq2YUAh+lmy5TOMIywPI
	cMDthHMZm6U94UAwbu2RlRZWilt55O0izM2pzsLmniIsL/H2q7xxPWOO9X+UHGZm2aDGXvou386
	N+WhcWHEevNgT9lb8eIZV4OZyk5MKCkHpJ+T2RMLSax3sRZzQsTj0wEhyYGTz/Sio3hvkWSZ9tT
	GsVIh2nIYj9FqNL7+ziNTeZZIx+92hOyAbVDmm5TO9QU1GWBgh77lYtyCxj6g9erltaefy6EUFI
	R1l0KlNpdtR1BL3mcfqD6DQle7JLMZb7idGI+xf+7aUCMMfJ
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr483859845e9.25.1795780911905;
        Fri, 27 Nov 2026 04:01:51 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:51 -0800 (PST)
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
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 18/30] crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
Date: Fri, 27 Nov 2026 13:00:51 +0100
Message-ID: <20261127120103.1532882-19-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040154_160016_6AF14ABD 
X-CRM114-Status: GOOD (  12.53  )
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

The driver queues requests to a crypto_engine kthread and does not
allocate memory per request, so CRYPTO_ALG_ALLOCATES_MEMORY is stale.

dm-crypt allocates its skcipher with a mask that excludes
implementations carrying CRYPTO_ALG_ALLOCATES_MEMORY, which prevented
the hardware cipher from being selected.  Dropping the flag lets
dm-crypt bind to the engine.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 6070ee6b488e..72892fdcd55d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -498,7 +498,7 @@ static struct meson_alg_template algs[] = {
 			.cra_priority = 400,
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_ASYNC |
 				CRYPTO_ALG_NEED_FALLBACK,
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
@@ -526,7 +526,7 @@ static struct meson_alg_template algs[] = {
 			.cra_priority = 400,
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_ASYNC |
 				CRYPTO_ALG_NEED_FALLBACK,
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
-- 
2.47.3


