Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uN/zWmN9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5wVIiro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=; b=uN/zWmN9wdgsLN
	UbdWVJTa3o2SsGSQYSNLJ79ttGD/wbgvY0ajvy7FNcYa5wXWL/DciX1CnabSky//CtlOaRKWORygX
	4AgexHZ0KHbkFBN3lkQAwjT4umO9ZK2dkiwmTek9NbmmQyaKmn3rTM0YImEoOiT1HRcdfPgivIpOi
	F4s/ahudv6n90sD7e88sa0kvjxTBkyI6hDS6Eb9pffFGK0TFGFnBJF06hCLMDvPOpACNtwAYdWT3o
	hQZA4drqr/uKS21dnyjKvBxwPLRxHggidxpv/HhgxZ04ZsZZHEI0qByebZBYzikA3QoyhqxIbysiH
	Oy6HkSIf9/Vztx8ONP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEU-0000000ELCy-40Wf;
	Thu, 26 Nov 2026 19:34:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDn-0000000EJsc-3Zzl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so63242115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721610; x=1796326410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=r5wVIiroWzifwWNlrfKbDiaGW3E/JXngCnAorfxkFpb3HwKDA4OfRy3u17K2F21lUf
         p0MgUKIF3BEgDgYmqj2OX/fEZgkHabeWCE3QxvDaahj7OoiADFD3v7THr9F6YBzSKFtn
         tZulA9aiugz4wwj1LBu+q9b0nabd7JEdNZesRiRoe9/SqD9kuT20pC4kpP+6ArDXbXI2
         IN1QCh/K05m8Pg/iGACdz8gLxHHp5CDFYBvLcZGgNw60Tl+Hw5TdZIA6wlVOGG6sDklB
         T97Rt+O/dbMv056Vbqg5R/0EFIQLRrTMdQBLhVudpSf3MYXQYRbBy2DSAXQtZ4YoWOlD
         83cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721610; x=1796326410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=nf3j9e/phMC9cnsghElZF5Iph99ikwFC1Y6egc8WZd8ocL5HxtK/7nOuvfS0JrMmnn
         N37yE9xmj2DXTf9T3hf8oGZf/Xj1K7SgOkhwLJfgpPAe/PWaWU+/pF+2L6LeMZlng3sF
         hF/J9ffQZ+MLDhMD1ROPoN0F/GoMFYjtk7teKDHtmsXhrXdI7A62arAPnFf29Q5PsV92
         WlkHDDYiC0kbKSXrBaM4+wUwUJO8GSgCm79sUph1mDckAV5+5sg1n3BNF8nb3o4F1jJG
         UWbBRUXZ1A4PDQDwMiEIQWIvuvvQ1GXcgBwUmVc5GF34alRB6PyOyZqN7bFuuI1utpwb
         y6BQ==
X-Forwarded-Encrypted: i=1; AL+hErH4lQ1e2KBXEPVaSJF5Auq3fHqQQbXZJePXPRChhRahO/6SB//TXLOA2SGKMrXmNQJ3vFJCBrxq6I6iEvU1CQKL@lists.infradead.org
X-Gm-Message-State: APuU4Z8T1P6DqLCFnTHzjy6FVSs3Z44eWkTNEErmrphvFVfWGB2D2ieo
	+D42r/bAjAGh8FBZIdosv6gtHaqRd0p4ORAoGud7WFWfFhuhWF3/EV7k
X-Gm-Gg: AZFdTZfJtMuUb96qtZFXiCK7Zi7YGki06SsFz4lcwk94weBvxqdrg5Vevq3ByJcCCBu
	Kn9iHCQdELkKDITnKTQD/x+TbdwJiks9SxpmJ4p+liV1KMrwJ2Dlvzsm1jWTWMj3tEJRnZRbhlD
	1tbcIQs/jp4+NDHti7L/wVmI07U+wAPjSIRhkX0+TK0Ts0N1ZWqMywZftOC74ZumHM0FtFqLpr1
	PkGNeN2FDjlU14qEasHHsZ/eS2Rynrq24dAbXmxGO+2s4CHAzbZtEKIFsp5VAOw7bmyHQ3ZrsRX
	DzGQv1XcR5/wol2TyxS58wbFqz/gVaqkC/ZBZmBZ+kpuGYieiSRrZtaVZd5ND9MvQwFy69cbdcc
	24YcEI987kyHlo1EnMaCmDUkB9mX1TKFcmfT1IbazS6AJEQD3873zork82bSnSrd2D+WSF0oXYf
	A4FDLlioZNs2E0yEEsYgz2EeUU3sab/22aOkwssdZntov87DLhv4EOBuUnEZAyIMm4axCtXSSEn
	5ClOP3oa4hCNSpXD7C3C9KcYw9dSNbWT3IdZK4oCgGeMtZlFDNcadz5YfcRZGye2rZJTWqcE28A
	b1sdavo/ts6nqKANs3j0yX9saAwGC9vhntI03wyvy1RhQA==
X-Received: by 2002:a05:600c:4504:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb888284d7mr463782755e9.31.1795721610174;
        Thu, 26 Nov 2026 11:33:30 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:28 -0800 (PST)
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
Subject: [PATCH v13 18/25] crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
Date: Thu, 26 Nov 2026 20:32:34 +0100
Message-ID: <20261126193241.1471372-19-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113333_089938_E0D14197 
X-CRM114-Status: GOOD (  12.60  )
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


