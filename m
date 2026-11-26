Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4146606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2N8qFZis;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzsTzCif
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=; b=2N8qFZisTOBNvJ
	PfMr9ptNrXUWYXPt0SnR9q7+1rKX1rixIInSkNHFQEOmAUkLxHZbL1DyDfhmho6dfhsZHncrIjdlF
	R5IcDW+a/2+h8Fm1sTkLdGI2dsV3YuuggWFwf/sAg0bdoZ9a/puRHpxBkslYJ8S2JldOC7Y27j+mf
	qi8cI80nThayk/ubvnVrNoEofLLuW/gbxuVtCCwu2PHl9nZnFHw//LMOYyw7zeG5mDm+6b7du+pPb
	4xAi9dGRAt8vBDLe8DC2yQtMzh5GQ2GDlDfTP8aDBkQAntX1hBtNF6ChGExVOP8dMFyvx2+RcwAbo
	p/6gJ2QzkvV69KlHBjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfET-0000000ELBG-3kSK;
	Thu, 26 Nov 2026 19:34:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDl-0000000EJo6-1apj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b467581b98so71735695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721608; x=1796326408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=YzsTzCifGll4mJy0Yr763fIeIbFtGFtSdptp/r+F9GoggfP/UjneoT2wW1S89ux1BC
         72JbyZttfKTG3B8bWPbWCSAlI/tydcJwd+2FfzJaUBe9r0heJp/36THZZsiqMKeqPhSo
         3D8hCMTzDhYdXtalp79oadeJWd5MbaHIO+YMptQfzmZoed0fdSY5iZLzgAtuDsv83Giy
         mBIV2PnMNeej9zVDhj7GkRTtvG9xw/sALSA0TDlTvmo8pMQXiTlxbValHp6L0FXWVLzX
         VNJ/Wbx4+fNnu4w95Di1xDbyKFsGkR+7gbx26zNsJylVmuqX3aPwVe/rMD4TOQHvtRu8
         X0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721608; x=1796326408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=VEHIHY724+zDsEsza7rWhpSvfdRQ+VcM0TgqaomCXVlz6Rb3SnaXOcFND73eard6bW
         RxUn/iChbj1wIpud/m1U9qJFMxRsNSFR67F27GetAwnh0EVFrB4XRC5CjaS1rMq3M1YE
         TFnIRfxZXQ+MHyXCocXk7J8cdODN0jGTYMhMmrj89FH4cooLfQ4SVYsViP0J//liblom
         trVLdXRMWYOGcOH/keu6kLC3mq3F1gJhVX9/DfLAqlrgXAPn4f2cxjycoXEx+HybU1qF
         pDOxOlZw9zXmhGebUqUKqHjzeH8Qc0970Ob8/oMGEy2fbQjJIM4N+h2i02AvbrWxV89t
         cA0w==
X-Forwarded-Encrypted: i=1; AL+hErEpVqZyfNHEq7UZZryyrCr4cuEo7TW/Txm2A3RCGVaIc9DCfN5PDlU15dzD17RcecY00An1VlO8mwlGEmZkF2nl@lists.infradead.org
X-Gm-Message-State: APuU4Z+u2Ly/+cFTA3cVtYNgnTksFbxU1JjN+DXRx1u2tErn5a59MVzc
	tOCbVfdNVCoE43YJBuudz5ZFp4NB3mcMa5lVlmWht72m5mVafYMu7BDv
X-Gm-Gg: AZFdTZdp6o6+W8EDmi/+lHgJf1meA4HruMRRxUl+Z4tzlHmXwMFqKdpaCTodMH4/+27
	Z3JndP2487SJsPj92i0SMzrb5HJTj/e4J+vJAJnzp4tuVInNtE1Xfdv3Ot2GSZn74OY6W63HlTK
	1MRzMU/BYTT8bIr+fEv49LCgraqNXGBkEyoc2kTY62ZPzkRznwNC5x67/7BDnCIp0yW3h91AvRA
	4C0nujWYc9KsO5m1q++gaHuaBrVtEe2HbrntbZ+WSIKm+2fozw2gTPnLrXnlp2wP+uoo4411/Y9
	m4AL0tFZr1QW6dirQHzJMSeRBoXstJ+9AppH2I9xbzCmdz3NCYbYqxTWZxY3TfRh9T9mbPEIlPd
	aOwm4+zkNdICUAhoZyFI5b1io/URfJHVRFo35lMn/xvu39zCyvlI5kJwlcnftxtEBEWkCIznc3s
	iDrBsG3w6NKfPCbtDdawDAFVqdvr7TKqeWvvfj7ulggpGvqLHQEkIgrZKHeaPPX45fPUI+9y3Sq
	aYUE56uRvPVYeQz+MfjD6otdiLo2srhquiQQRTF8kxa4L+gtOdDEaDQAE2HwmLXtpQcJDyO21Y2
	ZRs9IMSQ5/uuYdEpI2wMACkFL3GaLYjlkRfRo3DF09RsIw==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr465544385e9.6.1795721607669;
        Thu, 26 Nov 2026 11:33:27 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:26 -0800 (PST)
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
Subject: [PATCH v13 17/25] crypto: amlogic - Add support for A1-series
Date: Thu, 26 Nov 2026 20:32:33 +0100
Message-ID: <20261126193241.1471372-18-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113329_512173_D17AA8A7 
X-CRM114-Status: GOOD (  11.64  )
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

This platform data also can be used for S4 as fallback.
Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 08d89db14788..3a6bac10bb04 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -298,6 +298,14 @@ static const struct meson_pdata meson_axg_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_a1_pdata = {
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
@@ -311,6 +319,14 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,axg-crypto",
 		.data = &meson_axg_pdata,
 	},
+	{
+		.compatible = "amlogic,a1-crypto",
+		.data = &meson_a1_pdata,
+	},
+	{
+		.compatible = "amlogic,s4-crypto",
+		.data = &meson_a1_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3


