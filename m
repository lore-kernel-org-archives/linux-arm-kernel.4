Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AB1606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QnZoJrWU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SR2OhTzv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YuNI/z8e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=; b=QnZoJrWUL2vy/c
	6YdLVcTy8mygv13YtvukSUf5dHRXv1W467ThxSwHhAq94xOZGWGwNn0WlSplDzAEZIKaUKQykXvBn
	fyC6ntQ75maSlx/Z8pZE7KsnhHw+CFM29KToBteH4MCD4GajWhFsNnJJ4NMXzGpjGu+Uc9Mz6AF88
	Ex+AT3Ix/EaZTalz7Niz7x/OfwOWW1UeQDkTXC7AGdTxpWUrlxsVIOEDgM95UyudEBMXjwrMO1XEb
	a0vWWC0Fmgo6R36OsY/OTGKu6/1Qr4BQoFFOqJwlVvOAcbmSDQBxcXCRYc9bEPhneD0YMD6UK5IPF
	iO9b0+PpSSoB418PozLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhF-0000000Fz4b-1bQd;
	Fri, 27 Nov 2026 12:04:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuee-0000000Fx7y-1yEZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=; b=SR2OhTzv5yO3L0OenRUqfgb4R6
	f7y2X8HxrD4BLNlGYJjCvDRsAvmCesm2wBTxpUxAGU0MtV//DSRWccHNkGRJYkGXgfGaLliKMG3Lh
	95ZTljq9ukC3EaNP6aeEKj0ZwbwBjwRXN+d3IAbHrIBzszMlUVa4mmba3tfWbqsam9wYn9edf9c2p
	6YTNKvvClDyF/BT6wIP9s1g+G7gBAwWEUBddtLptLIcbET58fh2186iuzMmSZyI8Udy7ZtYJSCfyz
	tUfIunBFo9tC4sc2gW/nQur3TQxb4WDhVb0ox2ardpeWTUW9t0lfQ2fwRjmvhUEVrxv8CbgS4FaJm
	Z9DeLqSg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fkd-2QdI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so81295365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780931; x=1796385731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=;
        b=YuNI/z8eEi4RvGbJ+12MAdYYP7fvsiWNdv9NZZ876onQXUdfzy48DGXgAnupaWde1y
         iZDgb1+a2T3uRfo8+ATMZEvcne+Cm1vmU67b/otNPAskPEzYYtk4iC6rz3jg3X+FGOAA
         Q6IunxTp3kMdPrgjay1YElqmaST3jtvZ8M6ArSiw3O9wUbn5dlLsuK3iFEr0TL9z1tlY
         +GuXokEwt4Oqedw2gODW8qeaP9jgiYibuSGRZyJqZ3/9sahpX8nNp11ctIYO3fPZU/0o
         /k4v74k+ZsX0oOfhZhF6ekOoD5cnnYkLHDRj1GRabCwvqjYHKu8xpCP2kcB8GZZFUXh5
         42Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780932; x=1796385732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=;
        b=dPXIh4Y+TpuyNjm4GGsrjcpXbPLHrlfgR5IKQzOYgOO4pfT89BavSOEcu97UpB2WGI
         vp4tyyjPWM2vP0TCatuycCKWxd34ytFF47dRj1Qr4GtgQcoGDAFSUUT9cNLtI9Ka8UiU
         3HPdZwNrogn13/vToua14ToBe7psf3aTZrZmGu3+UsFVKerDIwtONOkS4jW2Hzyzn2zf
         +/B2j9kArPRn2YMQxrMjaGduBxLxyVCynlUVbpy/aYtFuFwzcLfbcq0RhcBRiabXoEtG
         jaRgosieVA4KIrmBzkmt33GacwIk691Zi5QwgTzbO8INVX+8KAqdFFRxcP2Ip7vIHWu9
         r2nw==
X-Forwarded-Encrypted: i=1; AL+hErFv3tEGVgJKE/+CQwYZXNmcR+j3ecg2ykksqYv3rSROf6alkxiTpMfE/gd02oZ5dz99s01yOcywm8ryrptoYac7@lists.infradead.org
X-Gm-Message-State: APuU4Z+ig2Sm6MNr+3k446hSW3jJPdx1GzkVe9f5Uywpwp76KyLpC4We
	5xB1jJULGbCMyNbVRHkRJjdkSpB3QPHZWYqRwE17nd5QhVu4lbpNFqaA
X-Gm-Gg: AZFdTZdOMlllA+uQWnjZmHmA5TZLPj4/zxp0DMItPbnHxFMiJo1GKuE+mOub+4cDWJU
	URqN1jakU/K06bxwKCgOH220Scdt+riiFKEHWSOY1LPg/b9R6tmJ5iLkT5Ddg6Pvx2THVP5nhjk
	toynAhrDvmlZ8kWLwRH2IUsK9DRt3tZDE7cHtRJfMHzCrOmtnzNgzacbzBQKvhzwEjENGz08Uqc
	3WotxTAwrcd0LHfiL9kka6+mYCwHqWzNXRvw6wLXO/r0mhQOYWTNjQbUY2jZPoEH6dOi6H6dJDW
	plSTrnvNkgFvHC1ODQhf0YG+zi857OtaN8VpAzCkWGnXlp/6dRFBRfEZXV2vmlQS+w+4UNrxNRE
	2CLZzNUBLZ4pVoCPR2Bx3A7GnotwUMVCvoFDi+hPgH3+gHONrMq+r5qph6XiU1Usrb8t4BBPs8N
	xFgEp2jgpWIeuKymYFZbDMHjJxe8CgyXbZ2idljqoarFZmhCoPxwdaltaQ1d12GEWyUNSQIr2dQ
	/ejAbvFlnctliPU+IKoCcqk1KnwCacfEqfl6PDtWg15x7k6/QqZ74vptbaGNwKLSVpjayYWQvOS
	pv5hemO5IZRkFy9z+F9xvsejywapfrIwQ+szwbGnDqz/QpNy6q4Tc/etAe8lNtyDhVuw
X-Received: by 2002:a05:600c:c173:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb88800134mr467671145e9.11.1795780931338;
        Fri, 27 Nov 2026 04:02:11 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:10 -0800 (PST)
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
Subject: [PATCH v14 29/30] crypto: amlogic: drop redundant A1 platform data
Date: Fri, 27 Nov 2026 13:01:02 +0100
Message-ID: <20261127120103.1532882-30-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_536418_B1BD4916 
X-CRM114-Status: GOOD (  11.95  )
X-Spam-Score: -0.2 (/)
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

meson_a1_pdata is identical to meson_g12a_pdata; drop the duplicate and
reuse
meson_g12a_pdata for the A1 and S4 match entries.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index c11d7d8250ea..d11319425d5f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -305,14 +305,6 @@ static const struct meson_pdata meson_axg_pdata = {
 	.support_192bit_key = true,
 };
 
-static const struct meson_pdata meson_a1_pdata = {
-	.descs_reg = 0x0,
-	.status_reg = 0x8,
-	.setup_desc_cnt = 1,
-	.hasher_supported = true,
-	.support_192bit_key = false,
-};
-
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -328,11 +320,11 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 	},
 	{
 		.compatible = "amlogic,a1-crypto",
-		.data = &meson_a1_pdata,
+		.data = &meson_g12a_pdata,
 	},
 	{
 		.compatible = "amlogic,s4-crypto",
-		.data = &meson_a1_pdata,
+		.data = &meson_g12a_pdata,
 	},
 	{},
 };
-- 
2.47.3


