Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4EF606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OV8H6Rgy;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kw1DNwAq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=; b=OV8H6RgyadutdDu9jN2EX2ojci
	LpN9FOwpI7njGGVnXaNsLNo4LgpSDkn3sqVbsFMulvADSuxS0ZvG1LhDr8Wb76Y3eeJkPcXljrgCt
	ypVVuItpXQY1DxHB9Fa4AvC6JXZsMIAmXEzws9ZKeY1Tv7YmkD5wc3RfKamFcgwRim8yFLpXUIakv
	Ytt37hRt2K5FoKFFPUTJZANpvjF1awTtZ1TYVnVlMcgBgv+1KviMTZ6/KLkZmjoStUq5qokLh8s2V
	9N+QFhNsXXCPMKGten/2i5a0ud6nqtfkPbW4acVkt8EoJLkofZWm/eOlaU3CVTlKE6sAKrJi95B9R
	v2c7cl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsLI-0000000FSMz-15Ta;
	Fri, 27 Nov 2026 09:34:08 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsLD-0000000FSLL-2vnd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:34:06 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so10439514a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795772042; x=1796376842; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=kw1DNwAqvKPcm9EHAFVid2zlPD15dBG/vO85Uj7kYAqCixFZRUJkXB0ku4+RB6SpXQ
         y9G3oD4VtkvWIBH812HAXZEJry8nECg+5cuJJbFp7zd8ziKvW0GEYFCBeEosW9LfH5jL
         IydPg4c2veb4LzRqeytQv+17HTX+ZMfUIy1ZRWo2a+xbONe9+shCFvFN8+tzfYNa3uBS
         L1tzwoF/g6EfaqgM/TPW1opDcQOH9L3mwtvV6coYwhAyn9GfwU9m9luki75YzBw+2Kk+
         jdq6IOjbkSpDN+bkBD9Byepe7/9rHjD6xJUpsyZ0rm9+oy8BezzYtpcEo5JV5R/KEoAg
         EZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772042; x=1796376842;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=gK2eM0VjvcZJrP6ixacxt22pMD9XUsxuSA9QU921QaFnSWP0wkNVFkJe20eaP9m2KV
         4tQdMGoHqDCFzfyDBKfGv6UcfEOYILtgKdf5Yra7DIn59Qy/KrzITZbx5KN0hBI0//KZ
         e5ctj5p1pyiVXcv3bsw/WrEAFnyhJWtPlXgPX5Ap8h5ZYtbKWDbNdTeEH1jKjUhl/+Id
         +nM7BZ5a72KN4tZO1rZahf5QN2afUTylKZoJJHA5Scipe2JUWVaqwGpyHc/U/kmLYWKD
         UQsYusVFMU5VAnixfTU59uSQjL/6XYY17tsAyRc7GnogUGliwnVhKv7CRtvP9J1Ts/JC
         gg/A==
X-Forwarded-Encrypted: i=1; AL+hErFtsIQRihzsHhma3n7XyOGhuwArGAW2rsL32FA6TBtO7Sbb2XRNpoM/SUPMgFrqwIHxABWT4fa2Ln8FKYmwWRhZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8ED9CyV0Lv7hwD8QkXSBv74gpOIEci7tlIbunKSo3hGCHF9pf6
	7LrvKC4dFbHWR5un2M15q+Hbb4aP/uL/ip0Gd9EolGSXciXiOHHN8zK6FrQGh7PSy5k=
X-Gm-Gg: AZFdTZeUY7jLcmrvqC3/0KDIHokE767gHS5ZHxi3/OWflOagnHCTwxIqM6TEOC7LbTU
	b4j9BTptkh5wXDjfpeZY8KyJ3X3r+LEWnFVJxdWYgfd95AeDEruyo0vCTsECMdGReYTeFXep1jR
	dYLyfDGRN2dVLQz/NoQw/ycLgeilNsIgdpF7aH4E+ekHiBaiqkNQTzOSl4/zjoG0MsGVAZt/c4N
	GjgOykEANpwDJxVmljYV+ApFR6QOWPQzjuQf2z7ZgofexvGFFKy3LUqkTsFE78bu/A560CbwqNp
	Z2AvK0pXiO/5b9ulboD3UCQGat5VwebRCgFIgiwufKdE9ABuQTYFa7xlUnZ1nlsT29W1VK9PoKP
	46/5miXu2WyFmZwga0lPsGwgRCa0dbzMoj4ig6/jKfw/QbofVYW0qF++QxbkJzr68DvyY9Pt0Pz
	vj6NGJryHWdW5sonTXBmZPsCOfq8N/MGg5Z796P+4Oi3qDp0vkeMVGpLwq1VuLuFZSw5c4HRdCz
	7mRBtNahrwHeUhZzi842OzSyIbWTOYA2XxKRLLj7toGkZGGCJsIrzs2s6EhPOVMnklQ9KqJfHdg
	xxp9PIi+E1ADrdI4jmIavGMSYQ0JJZ2AvgEMzzR3VO5/9dsVP54NYbDANETLImrDmJ16dg==
X-Received: by 2002:a05:6402:2403:b0:6bb:aaf:5d94 with SMTP id 4fb4d7f45d1cf-6bb0aaf5f7emr8353882a12.25.1795772041771;
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm10607522a12.25.2026.11.27.01.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jiebing Chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH 0/2] Add Amlogic S4 audio clock controller support.
In-Reply-To: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
Date: Fri, 27 Nov 2026 10:33:59 +0100
Message-ID: <1jmrquwrco.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_013403_768352_8AA635D3 
X-CRM114-Status: GOOD (  15.92  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On ven. 27 nov. 2026 at 17:11, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> S4 uses the existing AXG audio clock driver and reuses the SM1 and
> G12A clock hardware. Pad clock and data selection is done by pinmux,
> so those pad clocks are not registered. The controller has an internal
> reset line, like G12A and SM1, and an audio power domain that must be
> enabled before use. The new compatible is amlogic,s4-audio-clkc;
> power-domains is required for S4 and forbidden for the other
> compatibles.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
> Jiebing Chen (2):
>       clk: meson: axg_audio: add S4 support
>       ASoC:dt-bindings:clock: Add audio power domain for S4 soc

This title is messed up - Remove ASoC and proper spacing please.
Also you did not collect the trailer given on the v8 by Krzysztof.

Next time you send something like this, keep the series numbering
please. This could either be a v8 RESEND or v9. Like this, it looks
brand new, which it isn't.

>
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  17 +++
>  drivers/clk/meson/axg-audio.c                      | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+)
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20261127-clock_audio-76eed7ee7ca2
>
> Best regards,
> --  
> Jiebing Chen <jiebing.chen@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

