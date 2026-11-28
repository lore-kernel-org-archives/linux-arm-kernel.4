Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NzyPj7mp;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=RpxQR/X4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bjLdsgpYe9mamn5E+YpR666RCqIy1t1bYWOxM+a7YQk=; b=NzyPj7mp5QKUIK
	1e7ghrPOjNLC6bsX4yKeeFQdbvZnKIa8QvF8gOvTWeZNAKi0YH6oWOaCzv/4HEYl9q8EHS1OdKTXn
	Q158LzJM6m1xYKUld6ZXjKOwubJyPFVNdI3XF6TFyYGDWNNMHmjaReILop+rMjF1ViUPP8WiPneBH
	zUhG5AAuhfAedbCvYK8cTvma3s+TlkYWAhWtbFo508YT13HFxdRB1G3MUMulMEYN76owM29tn/EXB
	CxjAwdfPJT+L8zbO5ULQx9mxv76mPRIHDydqQgZDXFHk6XPCgT/VQyU1oafo1JiPVyRCMAX4Ye1cm
	lr1Ai13YUAunXUQsHM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIqT-00000000o24-3Wkb;
	Sat, 28 Nov 2026 13:52:05 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIqB-00000000nvB-1GB3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:51:48 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jcBXd1x9QzMlkn;
	Sat, 28 Nov 2026 14:51:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjLdsgpYe9mamn5E+YpR666RCqIy1t1bYWOxM+a7YQk=;
	b=RpxQR/X40AzCemX4SlNOJSgjjbrffVVRlG//M02SmrPg1UIP6Fki+tfvj2g8LZvJQt55Ft
	gThhNWwTfcrqRQT1B2KIRrmhCyPa055gsKMe9nI08nZFmkhQ7O13TIhoiMl4TOLgEtFyj2
	nJ4TnfqEHwfnCrlJUFPnzXCb2650xD1Ox/fVLUQt8sUFKMPPctW+zhC44EmV6EGcPfjt7g
	6nVT63d175U9VXtcZw3ZFrQ7MOSQC1CB0Luw/2+sDlibye6Qfb/M7L1E9dZwM6uIwsiOlX
	dZo2XatjwSfZjiHh8nLeyua63Z0aukZ3vIPvpQS79Kg7SVTJGusHL9Pnm41D4g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:34 +0100
Subject: [PATCH v2 7/7] MAINTAINERS: add entry for Samsung S6SY761
 touchscreen driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-7-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXd1x9QzMlkn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_055147_494646_83DFA78C 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a MAINTAINERS entry for the S6SY761 driver and its binding, which
currently have no entry.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..9de472b68ea9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24430,6 +24430,13 @@ F:	Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 F:	Documentation/devicetree/bindings/media/samsung,fimc.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
+SAMSUNG S6SY761 TOUCHSCREEN DRIVER
+M:	Lukas Timmermann <foss@timmermann.space>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
+F:	drivers/input/touchscreen/s6sy761*
+
 SAMSUNG SOC CLOCK DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
2.56.1


