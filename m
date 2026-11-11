Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081E606A897
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f3pPJxZx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Aw+jlCWu;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JzGhvG7G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=; b=f3pPJxZxE24sAX
	cBLmBUVoPUuYt7JcJvizse5F9vGKXJ4Eqg0czCIIL/vc1P0DL89NgDG0bEtaLXNvI8kCK7LzK1TP1
	VEzMFaodcDZEHSzGRa5mZOm+E30qC4NTZ3JLVII9+heJssa/R1GsNu2BWa2W7zXIDznyVAJfLqFmR
	4AA6Ujt/MSwGAgLMJhGEaDwpkG7Djyit0Np07jvzyvA3BkNS1bSSDrsVINKi/0CUhHeDpw6JdMwLS
	HemV+O7OZvISoS+FxzL6XehtE+Jxqf1zQGwSo0cBnPoNjtOr9zBTTXAx+gp6zaXB+Zq6aIyzlE6e8
	Uf1hDE/K934DPY0XxoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5KD-00000006JOW-1MAo;
	Wed, 11 Nov 2026 10:13:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5K8-00000006JLB-2iUd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Nov 2026 10:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=; b=Aw+jlCWupgEBBrZyw7Y512i/Rc
	IEHBZ6+xyYlZ+Br3KFSoqSx8XECvJzcgI4YnlJY0XSldaOkPrOi+ssOdkSVtZRwi6+9iHgSk7HcYV
	FVvcMLskwlacFIW/1hmx3tyVCYizthIYWzifvtCDig+W4YHDjcCZGJDPj6LEe7g4rnR3Eci4i9lj0
	NqdCI4xLtFseV7jGVoSYbx8n2Yp8Nbktu1Q7ixFkJgFkKA19lAvPhUw23ZYav3Z5QMj/mk/bZT7PF
	hSwQkLuersNeOhL7BF+/1Kxoy3h4CE32Glv/MbFwAetCYZHcz52pUxKf5Vx/Pq6Jmc2XWglYyw3+G
	MyF82jRg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5K5-000000090e7-3bng
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:12:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso21665515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391976; x=1794996776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=;
        b=JzGhvG7G77uiKi+zcpZzXr/Tz4OGTCgXitZfxPOyAAJZkMaAQKJ+wRRXbHzFgXdMwY
         WTLUvGad3tfNBHftfUeFvE74j0pdKc/OpGYu5rq69YLqpusrkgaPWNma/cw1gAcQM0Qn
         fbOjk8uXuqScgNXFNXH4tQKxeoQYICmFGG5d+AesR2FwqCOjoA7vRq3mKvVGW/I0p25j
         SyHHQKk0JCGDV0bH2BPPUwu766rWAu6Lc59hscwJvuKFL14Ftl08MTD4FPwrk6oFPCiP
         fnouRt82CYn8I0wm8LnqqccpEB/aeloIFcWnloiiGFeeRpayyMYdZPsR8dFmLT3A49AH
         pJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391976; x=1794996776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=;
        b=bp/TtQsFlNMpDxaLbDI2xUy45lZeSgxZP/Fxwa/TYfxv4eFtUfS8y4JC2rjmQdpNFE
         BHmB8U2lOSBrmoQtASjNEIU1lxssivmbggtrfRbX2IKBD6jKuBOaJjAN0z0EuyhEwMHe
         +xRaFCD5IKH85UjFfQrA0y3yoMkd+RfK830CO7URCn/QPlBMhGkQ9FGaqimXJ6Vjhsvy
         1Mwp44ljOd8BhAeZmdL+3xBayavu9R3ks8cMKqQi+pGvS9vqDD2IoBz3nnKfNTz/0CeI
         6BplAuTTKMww98DMNahT4IN8CQtSMXMNLMGUfR1rh1TTY23chaU89fyzup4c+v2WynGA
         QIPQ==
X-Forwarded-Encrypted: i=1; AL+hErFC3oNQCzAKkgQdELyA4wHY4SVDmyI/i3l3zhthknmvzQaIn+cI4GyexkHoNv/J0UbrfRe02umBoiCttJ992lYd@lists.infradead.org
X-Gm-Message-State: APuU4Z+96nUt7C7SQjUOgDNW3tEXGknvKy9CPaeFmG5JxcnHup7S96H5
	spsvs+2f1x9at8QyY9WcnVft8TMNOh6XtaH0x7bNYjS1FSb5+Nf/wsi2ErkiOBSI5nM=
X-Gm-Gg: AYBFou1q+ygoiWpY7N7epvTvNmW5wK5jWJvHlXuCMghrIcIZeqoGu7BuKgEnJrzlR/y
	FpSfz14/HqICx2xBMthrHNZk4qhoblbnUcuebrrbQtYoEB7DR3nFrAknnfg+Wwj5IFrwTByqt6E
	LYz8/Bb/y/pTcjdjW4AzsXyv1PO3f5SJvD6spxrz2WBq29fEjsnAvyeO5bZUskoIsi0Y4/xF6MH
	XhppvpxDeLaL0KJF75MDf5vYqN9vUl7ST2lmvb6wjlh4GViMrSpHl+SB4JG691TxslKDhqPN4x0
	omlo4iZWdsUBuZwJZ7KdIWGDVxkasiIIdIAcGj/vsacTXGPWWnlB93mXl3IjHQSHJF0ci36LIGj
	N3BDUOR3yIVY6Gi15tmWVAxEc+f9VACrMXpsRMS9edrTsxa9E0Q3+I+wqR3JK7S9ZZhS4F9pPD8
	Tu1WUpjTXpPK3HdrEkVMifXaRjpdYsd9lHHOCnUZ5k4sbvPOZybWPKeb3o6XAZOHAMyB8yIOWXC
	cfLmIOP9NM5eZyZPRPo5Qc970JCx55P0FS1ghbZ2gVaNIEj46SZWbz5zmbxfNNWlw+Y2WR4FN76
	QqGPhcjXriVdUwO0u4Hh3+fK/9o=
X-Received: by 2002:a05:600c:888d:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4ba495c2fe5mr18878685e9.9.1794391975803;
        Wed, 11 Nov 2026 02:12:55 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:55 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:12:49 +0100
Subject: [PATCH v2 2/2] ASoC: meson: gx-formatter: add lockdep_assert_held
 check
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vZUPcnmxkAiby0ImBP4p7xGG24J8BAgjSTNkADYSIMA=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7Jd0Ttd0+Gv7UCOveuLGBfyZezWL16bIlh+c8LR+d
 v+dqRrpHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIXAOG/1mGURtdjiyrbC57
 s7r5XsGPhnn+m40Dlt9qvtLML16S/4CR4Wq+vt6UL3Nrmtf+C/zyRbZZdreH3MHvwXftHDpvXHz
 zgxMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_101257_856824_9EDE03D6 
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The documentation of 'struct gx_formatter_ops' states that
formatter's callbacks for enable/disable/prepare are called with the
spinlock held. Validate this by adding 'lockdep_assert_held()' in
'gx_formatter_enable'/'gx_formatter_disable'.

Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-formatter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index d3bc0c6c81cd..46efe34e84e1 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -22,6 +22,8 @@ static int gx_formatter_enable(struct gx_formatter *formatter)
 {
 	int ret;
 
+	lockdep_assert_held(&formatter->stream->lock);
+
 	/* Do nothing if the formatter is already enabled */
 	if (formatter->enabled)
 		return 0;
@@ -46,6 +48,8 @@ static int gx_formatter_enable(struct gx_formatter *formatter)
 
 static void gx_formatter_disable(struct gx_formatter *formatter)
 {
+	lockdep_assert_held(&formatter->stream->lock);
+
 	/* Do nothing if the formatter is already disabled */
 	if (!formatter->enabled)
 		return;

-- 
2.47.3


