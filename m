Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5122F606A6CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IG3QRMBo;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h698WeW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=; b=IG3QRMBowN0jvMRdYcGlG0h227
	ejoGjxwJJeQeOXzyeJzaElmXEkrFU96XwwV5UIp5fZPGYL7b0jL+LOlVmmG75/w7dZGnTfCE7+kAv
	oYbVRy7lJjMS3iizJqoPYwl+oWI9ntM7ZImWKHK2Pe7lREvedOXYLDCYhZlc6QQD/Q/CMs+HH5+iB
	xB2eI7wjuXNwGzp3NT1wfKubp5ccjIbxJY9AtDr37beoWiATW0ECVurfveNIWJYiaerQkbN+OWnjX
	DZGij5IUnWkNqUVys15n8Jh8ZBjOlCzkpv401lv7O2yU/hAnjjhUS9g3q9noB6ttAeThlExLZu77Y
	K+sf6cmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUDR-0000000G4ms-2MsI;
	Fri, 20 Nov 2026 19:24:09 +0000
Received: from mail-dl1-x1247.google.com ([2607:f8b0:4864:20::1247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUDM-0000000G4kQ-3YOW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:24:05 +0000
Received: by mail-dl1-x1247.google.com with SMTP id a92af1059eb24-1a71dd190b0so3646302c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202643; x=1795807443; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=h698WeW84YwVu2mvFkW/MGMrD7+4YaxjFyztKjcNeMIMad0rcU+ke6Qrq8fTBoHXzv
         As9YWeh5yiW/HylV9ybgW5TXGJsPZDHBYZfd1rCof/9T2l/wqSOem6xmPp5f/Qra1jnv
         BUWh1gtVtmL4PVdinoHQ68lld/53XcvxUjpYKFYhwbNfjmD0jP3jYxK3tBtJiUkuf9JC
         Q564wrcSo8yNKLjIVI6Hv/CIaTVRlH3dVWesh5P/YkYny3+q1A9Mdde0A7u4ls129pPJ
         GvMx36YxJ5UzGPTlLZvUZIq96W40bUbHkmF6GU3vqmxwHAcGP9tNTGl8zLlyVrO8WZzH
         ETow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202643; x=1795807443;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=m7MPBCqcUgUUN0Ifx2Fn3gkmu/qTipLtRslZw4X2pzprLrR6vUPolS82mLNTpJdsqw
         N8CcaWI8N6IlAaLsfWhCST3tUZj6gng2geePxi6AgDY1mFX2ntPWFP+XrCD/dC2a9ia6
         IQi21uI+OZe5lqvhYXIKWuhV62T9ONpzCYIZZe9jySiSO0gVByLvaWQiEk8DpOcFFFg1
         CZFq5WopxLllNsMvfZrGH2Nr4U6R83favuFI8kuVut8sBgRLxo37P/DKDkLzxsH0kFV0
         zxjM7l+wF9O66WK+EG/bwMnd+TUrTGl9I5KYdVXlLRsTdZhtjgnz1dkAaEpZjnL0vPVc
         J23Q==
X-Forwarded-Encrypted: i=1; AL+hErF/iqUU3/aEGjHjcNd6UTh8hcSzZ117rd9NT+AlNMufc8md8pJHN8kTS/wo4mdytoJpd537/o695bg5aOgn8y1q@lists.infradead.org
X-Gm-Message-State: APuU4Z8LPc8uVYQblnYrKyRdkHuJFe0V87PozN17nmOIjtDncZHFNSIS
	/GYJcDUoxzT5ibNwRx9yvRB7jFcISjIW2Hzc9ii6TSeZVSLhmDzodQsJtrnstb3TIZ75WkP7HZ1
	YHg==
X-Received: from dybmh16.prod.google.com ([2002:a05:7301:f10:b0:386:33c7:a7cb])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1715:b0:144:f089:b189
 with SMTP id a92af1059eb24-1b55691a623mr3662644c88.36.1795202642255; Fri, 20
 Nov 2026 11:24:02 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:36 +0000
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261120192237.2870582-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-2-elkin@google.com>
Subject: [PATCH 1/2] ASoC: mediatek: mt8196: clear afe->regmap on
 devm_regmap_init_mmio() error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112404_887194_5DEBA44E 
X-CRM114-Status: GOOD (  11.59  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When devm_regmap_init_mmio() fails in mt8196_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8196_afe_runtime_suspend().
Because mt8196_afe_runtime_suspend() only guards if (!afe->regmap), it
passes the error pointer into regcache_cache_only() and crashes.

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: e38353138a09 ("ASoC: mediatek: mt8196: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 82b5ae91751a..3028aa82c4a8 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2450,6 +2450,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8196_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog


