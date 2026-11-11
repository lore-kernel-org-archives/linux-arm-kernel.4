Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7F606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bCuftQDj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N63M5iY7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=; b=bCuftQDjgVrn0L
	lU7VIplAwJ6Yz1x+4v+zmAo8X2yTZTX+9MzYdLMP+LWzc6Y4r3s7erUfyR+Cbrf9PnJRCeFt6yRgJ
	/PJo09b62zenxxiRuJFHY1l4hquF1HsNQCzaO4h9cgD5xjUf0UHpdYeZQJnArTx8qcCnuyhJCTG3B
	bCBIDMDVZSPrlcTDh/X2NgtAmE7mHeZSCaj8gYyXbeHmSWTXDiMR09n5zYwLPMxVszlDMCz0QZTkH
	gzA5ZtFKN48dMpanMFqM2KnK8Ai0gnTT5UtzaGGAtduWt8IfV00AQI6fqJtrM1h8hq7tGtL74W1xP
	3yiuGrDLmJCSJxW6TAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy38-00000005RVU-1uQk;
	Wed, 11 Nov 2026 02:26:58 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy36-00000005RUj-0Y8O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:26:57 +0000
Received: by mail-oo2-x06.google.com with SMTP id 46e09a7af769-8217177c5daso659659a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364015; x=1794968815; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=;
        b=N63M5iY7gn3WvUjALJUngkUWNGLWyc1v3jSPuK82eXdZbbm5gfCIY32VhqfkGXsz1/
         IkEWfrtBXmIexSN+scfctipnIlkD2cc7pOWNzCH8Ti8dsawkGPpGxLu6tCr94u7xZzxY
         4nc3/9mACeYj/kcBrT04ctBMCeWqsbTytnyVzXYhxYddOyiUqipugnRpmmOcKM7BYDjF
         wWBH/flWQjf3ttRzfKmRDdvFqhIHVhVCN3ZwaUyLmljfQhuVlzyHjrxq9gwnbAAJYAu/
         9NmHqSGyR0cjwZHzWR2pl8eEn/k7U0BresXumuMfGQRqxlct7n/WiocQjU3z07HoIoi1
         l7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364015; x=1794968815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=;
        b=1id60KPXuRJ/Bq2MMzo62CjPFpMfUzPF4YOrSwkQD7nXZDhRtX3xxFsIEtUHCwQSTn
         I+jRHagB/B1v0TvOAKwkQdGqcVedujjGby/pfZlkFCnO5cY+Qrzbl6Z9co0B4l0TRX6f
         rr5svSGaGplmT+bqrNOrP7EQLC5VzItx2LcatnMcHLgKC6o+z95rG8xDX7JlyFUA8hYW
         C6cOYYkgUBW9tut3UCXx92KbM6UaOf9kDAV5neChFEyxKW2IbUUcxvF4M+wMzwDN9x+Q
         bfPBzP2hT/PO+ECTX5KnmkQjqRdWWWvTG1ztxO9x/ZXlHW8Hbf1JgBB6Hwx5Dl3R6pxz
         nP/g==
X-Forwarded-Encrypted: i=1; AL+hErHEkrvmQaojP1TIM+7dQg6dKTusoeJfqFJoD41AHs71kJ6KYx/5ONssVpLcNZ+dLybHl63+HmRSCDPT0CtKrRYD@lists.infradead.org
X-Gm-Message-State: APuU4Z9oVJGhHFDhFq/uFr+1b+yWWsSz3Y2esiQ5yzK8wiQSveGBQYQP
	7o+dVwvKVCW3zK1FqQTyeKlQ1mpaEImkkb2rvM4GNi4Ek5kXCI6yWSFc
X-Gm-Gg: AYBFou0RX71JqI2w1yEqoYGUXR1MhsKtSqcIPPM0jrPOm1OcMQuxQgP5DuxrSKHbUwP
	HJRIrkt63Czgv1DGGlvXVK6Eod+fpO4LNvDzr3igZs1TEoTHvt7808al1X2PFjV4Az9rjlJjrY9
	JA9CHWRP2GaC/uq+N+V3k4nGFiI7a6LLqnI+XzWZrykWPKV96SbHuQXvYkUbSiphzm0/df1jbo3
	tuYj3HbLAmi7IR9CCHH+C8jPPkrsLmxhVrQnVbnKD4Cro0BUNBHjogrOqS73eAOSJscRHvlV82Y
	fyvBwpKdWAXLocG9ad88F/WVh2fedcoIITUBachSCzivOjITdALQoeIXvHIPKhXNInxlCgeJ64A
	t1kRogt/P4/YEqfhcWG/YtQcRb080kMreE9GuYSyljMpjYqgHOsSH2kA8yt494UIbxXknCliKtE
	8vEm4WSInnSjRW6NjokG/We+BJfutJswBGFRFMmEsgJeJPAy+0jNK9oE+F/4ccw6vv8srkaucrA
	RoFcV6hFQjMD3s0cCc6z6iJtMZ7rjMtZ92hg2skH3HohuQfxI4RAMD/2nluYvx+JlgOxYapLOWe
	TePXM8DV1AKB38V7FneifwmYfVsHxIIlMrRFc80nfAS7GQ==
X-Received: by 2002:a05:6870:1649:b0:48f:e0f6:c45c with SMTP id 586e51a60fabf-4ae46c42d59mr1213442fac.42.1794364015190;
        Tue, 10 Nov 2026 18:26:55 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22d1d541sm2789026fac.2.2026.11.10.18.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:26:53 -0800 (PST)
Message-ID: <8c8ff7e2-d1a4-45c8-aacf-bca93439a32d@gmail.com>
Date: Tue, 10 Nov 2026 20:26:51 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in
 mtk_dsi_poweron()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_182656_175892_D200297D 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chun-Kuang,

Gentle ping on this one for mediatek-drm-next now that 7.4-rc1 is out. 
It has CK's Reviewed-by and Roman's Acked-by, and it still applies 
cleanly to v7.4-rc2 and mediatek-drm-next. I can resend it with the tags 
if that's easier.

Thanks,
Ryan Brue

