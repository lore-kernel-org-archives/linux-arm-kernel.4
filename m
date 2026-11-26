Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56006606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KTaiRzgB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yctRHugk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=; b=KTaiRzgBpcqGUSXGwWSEt9TMtD
	iY8Vr9hUmL+YbOQJ989iFsA9jOW0nX1F/ZHEEzJh5QoIOYu+IHSuIRu8LAJ0UrI5Bmvki65qQIffh
	99X+aynPsNwD05zoRWY9EZSBk1KOChpYV9IguCXy1rGP65VPOG+efQffz3pgBSG8tIzzybBVjUphO
	CCnLtlRDvLBFQwWRIrT19nFEc+O6iA/i8HClaIgj98N/2UT/rVfPFKBGGSL3cu5JYAAa1fQPs5hP2
	4T3h3zCmS9gQ+aziBeO5KHMPHiggtj7n07Od1VpheGxgZZDBHOzkIoBeWQR5MzHbG0O4GuLC7lLd2
	/Xl7baFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVrC-0000000CZfD-0Imc;
	Thu, 26 Nov 2026 09:33:34 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVr9-0000000CZdZ-0bMr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:33:33 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso8085753a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 01:33:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795685608; cv=none;
        d=google.com; s=arc-20260327;
        b=AjK3sZJnNFmX2Um97yWaIq4UlfPZ7SWrqlKzpVGskjTcIGYqXDH5HZ1GXFMAQ3T9Ml
         vaHIQHN/oCiOaehg0yb613OFEse2FYb6ReYhWuc+GDtuwfhGL1GZE5h+Ke/c5dxtqP5c
         iUxc53v0tvbPNfzfYcgtrHVHEu8b8G2IjzDgU1+rJnHug1AeFwIggWVNZM/M/nSxVV/2
         tt2rxJ37Y5viXzimC6Ekt6rpNf1PqNJxkac1zdvknH19AsNZqgMWb0UdILUS2aWFh0Wn
         IsCeA2JH3OMSnzivBuZmU8O0J+z5IdrsQx0v/yW+sG2Riyrz4JR6mC7/wSWS0SbwBnMD
         yS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        fh=bwSpONT3tVEajFQH2D3CHKPSpUe8rqqJZyVmjndN9GY=;
        b=D5PHw/7m0YRWFk8/p6Hka6rUkGD8vbroglONskeTmNJvWPxuuHGttPtlCO8IRt+lFb
         nMNTe6tPvxo90F8LOIEa+rNUF7OwjcAWp5xr1tu0NRIX0fMwpLatEvY5M3rpYmaQa52w
         x62q/JYdWRLCTKyrXeMEkOGOiCCe7mZM+dwB9wlW7wFiXpQJr+O3s6PvxXBcjof2/mec
         qqdAZFtiODNsjMS7q8e7jR4DS/7+aXfG4tfwllIOi1qdLcCFx2L19CqNVbVsXXa1bVSR
         7sW5OsW+ArX3jradIaUGGcspISxi/Z18RKrD9bKrU8RUUHqziOsQiaZ4S2MvT5+ugxvS
         KMPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685608; x=1796290408; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        b=yctRHugkuxuIadvoZTCsNqbhTkiuJHxh9cHZCQoc0mD4Izy0AbRM8tXdTBQMTTYKv0
         gaVTjN9nM0HbelkgLxInbd7/cdl/Dw7PsjKdeT41gJ/N1OdLo0bD2eN13UQJA/CxA7Ej
         fl3X6uysKFod0eplfNo7yD7mrslIb23+EVEyVzAAGxyN155c3y3hxJ2RaL0iJ8nUhHya
         Buzd7OFEE9HaaRLOGP9AMYf34ZOS7dKkpAaBc3PJC6Wb8auAEpatql+6xMEFwWO9Ek45
         pREUKf/mUCd4hL6D2F1wzdszRJ4jpcCDRLtRPRuWUEmf7g5M+Bueud/hB5AsZ+retzQ4
         mEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685608; x=1796290408;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        b=FvgnEr2hVjvirH81cjkVREsrpHb7gGQ3+UCq0mmIloWQxaehfDvPJrC5SBHQPOxGCN
         JFk8JJSG+aS4YqbCsevkrgNrHMS+WadZflYdTZNKrIaURQBUXpmp8LTjENIWsHGTm/mF
         6RuCqZtFTcWMChm/bkCb+pQuNbg01MF3GYqMpTmdB+l5p0aXhZLloNBU1G3fJ3WoHh0G
         keXyuuo10U5otlnmABpZZuVOSuWDM0YObWSvz8rw6B1Aon8/Fn2YPej1ssmfhfzvLSQ9
         mUQOJDil/v5H2byPqDNPTac8TLc7m7Uy+mLXcB8ITPUpUo5fFqZauA1iWR0y9duhZ6b3
         6DmQ==
X-Forwarded-Encrypted: i=1; AL+hErFMPGblK2rVbgG8Lkfc7jSBAkbYJUrshrZ+IJ1/Vb0Ye7I4CqUTeBTyNPMkMHLy3RiWp+sPH1i7tQCNjPGKwWvj@lists.infradead.org
X-Gm-Message-State: APuU4Z/k26mgxuH07QVaxyuP0Wv+YqHM6XrW9Ns9pxbE33v06mspW0lD
	SanS+Mq3yZElx49kmSejwd87aWXMMQWtEcbq0ECQcgKg3G3b4T+zFwnXoR37dh7Mp8U+99ugzPf
	dI0zu+GgvVQjZqry/Qp8BB+XmAlNCztI=
X-Gm-Gg: AZFdTZco1ulZYwh2JOTUlZpsSPiBEKu2mG0+JLklJ0Ek2Gy7YN4TMHcAFQpRHQuJ88M
	WWRXUsP5VTEeMkpA7BJrGYhxTIyaXhADUeiKT2DDo8pRTlK6XJ9+3Qolh48KKiAwYqe9R3FFS2I
	R4rws9owhJdMt9QK87UYnU7HhR+w6Ixm6r8BMEoiSiQbhVjd3/Nx1rFXCpQWigU2zI4bIY4m+61
	a9i0Oz6+GX5/RjBHnLewPan3Ej1ee9oQTlOUmpy63TWrsVlgHtNHdjQO3wwCsTPFL02H9NA14nC
	0+BchMUoJYCvo6hLyUElqxC9YCEyz+K7orQM18qJ0agglvnr5x9Afy+XuMUAWhSiqkygwxav+cQ
	oLQCYYwSEStgmKOcs9WoBA7fY5O4MQCysvq4=
X-Received: by 2002:a05:6402:400d:b0:6b3:f891:c2d4 with SMTP id
 4fb4d7f45d1cf-6ba37ea5360mr13616725a12.29.1795685607957; Thu, 26 Nov 2026
 01:33:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 26 Nov 2026 10:33:16 +0100
X-Gm-Features: Aa3M54pI24nQZXDlYenmTwMKyRI5daIxAw0Ak8m40BV3tPU-M9NeeIVYIMbKRNc
Message-ID: <CAORyz2LXi4vpwb2dEiq8R8t7x6nUk-DBUNs9t-cCrP7rUodbHw@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_013331_190707_FCEB1AE4 
X-CRM114-Status: GOOD (  11.09  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up. With the bit set, the timer that
> mtk_gpt_setup() leaves running could latch an interrupt that
> registration doesn't acknowledge, the kind of pending interrupt that
> commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
> leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
> timer before enabling the interrupt, until the core programs an event.

Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # MT8167 Sony PSC Mini
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

