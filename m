Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB56C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gqxLPsNR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPZ3SN0M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d1OT518H4ki16FAaDWhpo7G6vnPaZ/w9V0TjOKp530E=; b=gqxLPsNRkDmp/n
	Tszbiyp7rIpZJ/MQdu8XypYiq9JJkryGXtTpwoCWEJXzjE0ivXLSXxw0wBc2aS8W6bxqmzxGZS9be
	ob9ITlyRB1pPeThZnBW1BlAu2AkJkjlpJJc0n38HkDmxM+MJXOwQCAUK304bCWjHNEkNRn6PM5A9D
	kXp5q0yQBfyFZ+CjRDJfRx2Rk4Q1GpyhFS4kSHYR9OQaglExlwzzFIKlnq5W3aZ64VzQTnk8NNge9
	cav6SXeggwyJwIITpdpxRy+KkjyVuY6zmqD1Wzc2JhDFs1zZmxBZBkRhHs6Q9ecL5d0IJPjCoOE6F
	Kwbg5jW2yl7Vm8EJJQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDQ5-0000000A3i6-1iQG;
	Wed, 25 Nov 2026 13:52:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDQ4-0000000A3hK-0MNI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:52:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24AAE61F5A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BD31F000CF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795614738;
	bh=d1OT518H4ki16FAaDWhpo7G6vnPaZ/w9V0TjOKp530E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BPZ3SN0Mc7yfYD+EH1mBtJFptnm0a2EM4MlUxsZ1vmepJ0UzHsPu3S7Qrlm5cJsyC
	 agcTerqVohBFSD1ywknuv+fFOLUEim9g4Gj5fefAjlOPLXiBmr9Qj3PNVYgnh3KxiK
	 EA7GTFovKjx8jLqDsoDO18OHiC40biTwroqgRoWbyInvJbvxC3HyMIQE/ZNE+vqofD
	 afS/XAvVL93bPUH7rUtImU3an32EIsvWAcsKAoarOwXbpbDvRSDtvI7yOYQiANuy/B
	 NBzwvVSKeK6PSO0qmZwRDsvZ5Gl0XNcKgaz7WbRzxgSRVFkcRyZjxbhC3HuiNp+SwH
	 HckkFb/HfC0uQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso8070632e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:52:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHskA3DvTM9aTA1EwfBmNxL9wG9IdSWeQW0AELYiWr99rnqPiGKCPtgQd56I9uuRIGihdLtqCP+qYcRXADCTq9E@lists.infradead.org
X-Gm-Message-State: APuU4Z+GvDIgie9XcnQup91oS89UDZjqvfhs48yxE6ygelQAFUS2yK4L
	UCluBFqE5YpyVTp0AG3RoyDSZvp/LozNFUsKIf88vfsbafGPsnmkQixst8BxBFk3JUxa1jQt0k5
	o19FBa3kJRwZO0dzTVpM1cnt3QKtTWy4=
X-Received: by 2002:a05:6512:114d:b0:5bf:b93e:89f0 with SMTP id
 2adb3069b0e04-5c1bc85f0c4mr4585226e87.62.1795614737267; Wed, 25 Nov 2026
 05:52:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:52:05 +0100
X-Gmail-Original-Message-ID: <CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com>
X-Gm-Features: Aa3M54rgkY6kl63K6RGx-SAGV9m-zKLuuASbiq7hoLrao3O7E8ZmBvChRlc02Pw
Message-ID: <CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ lines
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: linux-gpio@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Pablo Mazzini <pmazzini@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 2:02=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:

> The A733 description sets irq_read_needs_mux. When a GPIO used as an
> interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
> input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
> interrupt function is 14, so after the first read the pin is left on
> function 6 and its interrupt no longer fires.
>
> On my board this breaks microSD card detection: the PF6
> card-detect line is read at probe, and after that neither removal nor
> insertion of the card is noticed.
>
> The A733 data register reports the pin level while the pin is muxed
> to the interrupt function, so the switch is not needed. The A523 and
> D1 descriptions do not set this flag either. Drop it.
>
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733"=
)
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Patch applied for fixes, sorry for the delay.

Yours,
Linus Walleij

