Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4205606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZkT1lHeg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7qLUASh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=; b=ZkT1lHeglGn8rJ
	xdDlChmAcJLhR84EoOpT5qUWGK80FnT2kVw7ZA1BjYHtz5Zk/ZvxhW3K+odfsEcf/AGhk7LqaTxmN
	bus/N8S3vnwlBsHPZk1ZWKegCL11/UsdiqKIr1IssQKnEO0mWUKMjBb+1BG8lPGKymFhBuBHlcyKe
	fiQjJKNeP3f1FoVJK/iCnkDfMFXOhKXcSOaB4hehZSJnFIqwmqgQrurLJCG/TZvFeUfyOiDadAKfA
	NjVFkAZA5PJHALuKfCQ9yAlwDn0gPPYLFmhKvHmQ84WRT2x+ULO3OSfYosbas7IncAhxTN20juHYH
	9fyD3YLy7eof+YLoWibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkSG-0000000F7Mj-1RiE;
	Sat, 07 Nov 2026 17:43:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkSD-0000000F7L3-0yHQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 17:43:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so15264585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794073427; x=1794678227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
        b=T7qLUAShhJd0k3zQS9+k/8HH/3gnFHUd4YxqtYTsIHJipclrbK2Ovex932vhBmOaqv
         +u9ODhpbX1FFYMEVzuWzKtgI8BTIaHmvszocEBdwpKRizzCrx4ZaZufzyOUoP5BoOxZG
         3eumMoeYBxAAW1C+zx/dywPwyBOrexY1PXLQ78NV8skreH0D36F8CcXd0ThEtMMT7xre
         c9X/TOwPf3xgVCpPSv1aMM3azng45Vc96E1ykoSOlNye0PfBeMrJzFJlJKqHOatngIe/
         rY27QfXck/en6SzKADrS4fF2dR0/D89IaL22lu2QFh105DnNAYTaaN8czuhQjkXIs2em
         Q9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073427; x=1794678227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
        b=wfpJSlg0Es7FSmbUL9UA8ClZ6oaEu2DlGm+qF3eZrrJTPWTvv2T76z/2ybPUWMrJJa
         15Lj9o4UoV9TxM5oMdb2fepCa7z7cgRRjA9jrsCnokzZg4HTrCm3KXlDCGWJISDRe9ar
         KLdUlwyAOuGl0riGpnWtENjHXKAljNzkuAOdu3ktzHAbVN4b8zy0T6adV2g717HrY8mB
         6Sev+VvkKfIn/xDBz1wrqhVWIX369jp4tXWD3AEAiCV316GF2d+ILKpaYHC+ko5CIX9s
         zzJ4uUExavepaB2ezE6e647Xzgw1b9Is/kTk6qW7LXyUsixV1B+lGdWl1gAJ84HaLQTl
         rLTQ==
X-Forwarded-Encrypted: i=1; AKwUvBznI0l16GgEVPLc2NZKP9HFJOUmLDd43O+UPKd+Ykx+S4SS0lA0WykB90Y0ZMcN+CAuhDKweUORuusGLbB0E7qm@lists.infradead.org
X-Gm-Message-State: APuU4Z9Bz5hxcFQ6N5jmBBbV6iNkwKFRfWwbKQK+8D+W2tH/sIvEy+5z
	HVC9ohJaJ/gvmGO2k8AZcPNJIPg4wLnREUzrTO4+tc9SN+wfqpOM743TZMlIuoZ9
X-Gm-Gg: AYBFou3dOWy7qJ7qn6Mfb7Or6M9EFowOnqDrW44QjL9UhI+ao2E5Sj6+qqzo+9PAQdP
	q/wtyJH8oay45f9t8Q2HLCCFLcb+OaWI/jRtfEGMoW27ODqT8UKRnyTPZwoOXSBhjUdMtOPEWZn
	f4AyRkhtxGxkaUz8KGoLwmklrM+hR2PMEKkKnJkIUW4rdeRJqiAM5os7tea9V+AYDh5jSYLzcV0
	tLulHt6p7FcuaJYyNk50KvKIGP9EOmUgVQXqwzFbMfi2sjyLMUgqvhfGUtTpY1KXuPE+n38Exhb
	LnQL7v3J2HVIgL4lRuDh0apppUwGEB1IoEG8sd8TY6sg87faH8wrIcisv134WoC1xo0Bl/CBnFM
	I40FVGlk/cto/ZT9kCRmY5jOhgAcI1CzB+UYgiKiSjeT2aPxg9xnXPIYLVZ4JwYg85OnNkTEpvT
	/Sb8YvDBzIlgGNyKJ3hXfj5X2BCTi0WInUbqfHOMKrVfQIAVOBz4nRDFh6dek0f9GBVnGxWRHqA
	Ce8ua78gp62R87SQQlgvG6vsdclFCCrNO1cAUHxXAYgkcOGeVw7VGZqX8KyaZLETCqom+AC6K5m
	3MQLI9H44TeeJgwkPNv5cLCvBb0i/dGg/g==
X-Received: by 2002:a05:600c:6814:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4b6df4f2554mr125464935e9.31.1794073427028;
        Sat, 07 Nov 2026 09:43:47 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291526sm91814315e9.13.2026.11.07.09.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:43:46 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: sashiko-bot@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 18:43:23 +0100
Message-ID: <20261107174323.577410-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-203084@kernel.org>
References: <sashiko-outbox-203084@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_094349_403272_F69C0BD5 
X-CRM114-Status: GOOD (  13.03  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> What does "These three" refer to here?  Nothing earlier in the commit
> message names three stanzas, and this patch only updates
> SND_MESON_AXG_PDM while the other stanzas are updated in separate
> commits.

Correct, thanks.

The sentence is left over from an earlier three-patch version of this
series, where "these three" meant axg-pdm, axg-spdifin and axg-spdifout.
Its referent only ever lived in the cover letter, which git am drops, so
the commit message never stood on its own -- and the count is wrong now
as well, since the series became four patches when aiu was added.

It should read:

  Several stanzas in the same file already select REGMAP_MMIO,
  SND_MESON_G12A_TOACODEC among them.  SND_MESON_AXG_PDM does not.

That is accurate at v7.3: SND_MESON_AXG_FIFO,
SND_MESON_AXG_TDM_FORMATTER, SND_MESON_G12A_TOACODEC,
SND_MESON_G12A_TOHDMITX and SND_SOC_MESON_T9015 all select REGMAP_MMIO
already.

Only the commit message is affected; the one-line Kconfig change and the
other three patches are unchanged.  I would rather not respin for this
alone, so I will fix it in v2 -- please let me know if there is anything
else to roll in.

Thanks,
Jude

