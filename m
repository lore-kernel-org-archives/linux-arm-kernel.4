Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD571606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tqGec42z;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cbCdnlGL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=; b=tqGec42zufG4SG
	lukX8rXyzMZq4EfoQOxjEsAwrd2PvGwXSwm8vvcVSGyt7kyyDKpodf1aHanRk5OsVrarDgwmjJ5BJ
	XtQmgcTcA2Zq5cwiOWHJcVGHdOKBtVPeLkt73qpSdImITB8nqCOCsi24+Wem0mfy5CXbiFF3P5hGD
	7iEmebK9S+pTz3NJ7E5et1HcFbwp92xbLltTieEY3IHZzKHm3ILFnwJoZkbgKefUAZIQN0EV2Nyjm
	IrncyMkTfmt8wM/TdlNob7uVYe2gWFOh1wvz+VcdzGp/3AjoydDdGo8DfDPgR8JKe99f8AfqJvWrI
	/yEYb934bRO7O0cpA4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNlJ-00000002O7G-1BG1;
	Mon, 23 Nov 2026 06:42:49 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNlF-00000002O6X-2iU4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 06:42:47 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-8b4e246acc2so19726337b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 22:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795416164; cv=none;
        d=google.com; s=arc-20260327;
        b=A/i3OsNqMoSX91C7YThV2SmUI9P5BDoCSUmw1wmZjXVCBVXrQil0X3yfUTYzZaOEi3
         BWXPytzcR7hmc+OMuZ56cRGgh5LQwIcPJmsJU6Uzqjc55LwRUud7XP/cq8SGuFS/en3H
         xZ7YbOkJsCul2u8e5J6p6FZlXSgvd2XvZoXAwCWz3UvnOFyiRgJBy1HL7d1qfYcTsORk
         7S9hSJaALlES+EH4d/RWq99+xMMsnErhht7vI0ZD9gbcjbZhXF/gMg8nCwFw7pprc/y+
         OmNKh+xJ38wM2PsgAsEOXy8qTTy0A06Kz/glN8ECOViiCetgY7Sp79+7fz/rr6Cc5eyw
         S3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        fh=mpsFSkaK/m0kyU6t/IlcOo7uN6Efrsgm6nzls3jL7D8=;
        b=hOPwCiZs4MQpK4eID1hReSD0RVPCQHc+4XdMpk+RBRnanfBhtzU1kSgcKPZckw9/lb
         8YyWm8TON5LYTaLfSuZGHzg+CFkBrqSaoyTXGQ5CusEeVEr9V27XJENUevgff3UH1xPr
         F+5sO8tPYsN45GaEhqq5QxSFbKI4yvtaZXrcYaHls6jba/yTwKcp/VYVRMk3hhqnem+X
         twA+uHIkjHzt6k+yn6M9IsvouK72XqNs2NsNoG9+IMvWh2RvOVu5ZbaQn03MYOFs8jvp
         WAb+Cb167AR3jmCkrYn8VhhvHElXbJD52KbMNgcbdb7AwXd6oyaQrRsIVRS7b4IBnWos
         3S+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795416164; x=1796020964; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=cbCdnlGLRxfUfa7TuWeUjpB50F5lIpQnvb41SsWWxzuebc/Q270Gn30VwfipXBwzNA
         BELUWZw+QB5ql2ADKm9V32OWqaZP0gOoGsuBjJSJkQNyOQFi27rtlx/l7xNOXGqDpi8g
         3sbhzncWGu0R5pZv4GBEla4UzBc+u8OXC3Hso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416164; x=1796020964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=2f+0pvruwcYyh4MnziE8KTcUGN4SGTXKjVw09AR+e5gbnDCWUpggco3B0y98FtNBJB
         SsQFZHNmpvrXYgtFurqt6qTUE5FdE1rSK8hW7eUgm+I8vxC9DHE0oMpNCklm4YrGlLSf
         HApx/BcCAioZa4CwFLt6YgKoSq3FXomCx0LcUO7aXAtu5/BIB6WwWSYEfTsYA1ohZ9h9
         NNgvv9PfYpL815Km3tWVEFqTKUmvzkWFcmp2l0Y2KgD0bCKlXt49l9EB67RL0CpiiLGG
         iC2TIkSlDyCTAiWZEM7cuCu5yYU/+61kSptvEEopNH02ix5+WS8OzjE0stBMGc7f74np
         jzDw==
X-Forwarded-Encrypted: i=1; AL+hErGBat29pX8IfoC9rhqfCGviStH67dRdpGN70mE5jdtp5DEaE/ACOUiNkRqkvCVVSS+HOQHhMlPz5nxeZxSbGly1@lists.infradead.org
X-Gm-Message-State: APuU4Z/z4vzjXVyS+7Kk6vRMLf0TkdXkiY0MB/jLHZZzkJ5NqFjeGG9K
	GTYs/9GIi895Wdl5loWYVWOjQPysa25wFi0gRCk9beHxotjKFHbFUnakApDJuoM0SIvTDgKQc3x
	uetz7zP2XgrjrBBPc6w3xLy3BhUpyyqdTqfGD4tCk
X-Gm-Gg: AZFdTZdQKmbDacK3AFOl+ZUHRBmz+fxEn8EYhd8KwTjXrKNqUSp5Qiekeu2yfpj728N
	mwx8ImHSl9DSsUpOCtKwGHKYaDMPx1FVBPTnF2f1XI8Gc1sir/RBfwJR20+ge+TSQV7h7QwWA1U
	eLPX3JRf8hUR8Y9yzwkNk8KAgNG770AiVrIAEKEDzMIJeorBQnAXtn0wwmBykgn3ojbW3lapKlP
	6KvwXBV+pEvjHXW+vkW+4HSCLGrT0Wrgu6ExzTuF2mKD7tl25JF0KQcsfqT0u4gEGTJB+x9trrv
	srRuzKKGRRhU9DeCFmyf1XQMB5fezWlVHPUkyKzUAjDEmyyVMR+owXIR+oJvujx/vtkvsz2mg5j
	kDmFV3zoXVUZIjGlL0Ksj6bahYbVraVcb1NbeRJivuboNXQcKn7tNqTAM2ldZVlW7ZdA=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr41593057b3.35.1795416164019; Sun, 22 Nov 2026
 22:42:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <20261103043734.2179858-5-wenst@chromium.org>
 <avLw2AiqcnO9Blun@shikoro>
In-Reply-To: <avLw2AiqcnO9Blun@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Nov 2026 14:42:31 +0800
X-Gm-Features: Aa3M54qFQQaP0XRNtPCyFnaJIa2pdaKUHFg7uIqYmbd3iYo_i21tDqRJOm5IHRA
Message-ID: <CAGXv+5F5hf_8U6j6tJ1WcS6gUCiA82ny+6DXPv12g=vUjwYUhw@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if
 powered on sufficiently long
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_224245_713325_EF3F7694 
X-CRM114-Status: GOOD (  21.12  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andi,

On Tue, Nov 10, 2026 at 6:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Nov 03, 2026 at 12:37:28PM +0800, Chen-Yu Tsai wrote:
> > On some devices the I2C component is powered from an always-on power
> > rail, or the power rail has been left on by either POR defaults or
> > the bootloader. By the time the prober probes the device, the device
> > most certainly has finished initializing and can respond. There is no
> > need for the delay.
> >
> > In such designs, the system integrators tend to work around the delay
> > to avoid the boot time penalty by simply omitting it from the device
> > tree and the component prober. This is undesired, as the device tree
> > is not fully describing the hardware.
> >
> > Switch to the new regulator_enable_and_wait() function that makes sure
> > a certain amount of time has passed since the regulator supply was
> > actually enabled.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> @Andi: Chen-Yu is the maintainer of the of-prober, so I suggest these
> changes just go in together with this series.

For this series, you'll need to first merge in a tag from Mark's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
    tags/regulator-enable-wait

This tag provides the new regulator_enable_and_wait() function this patch
depends on.


Thanks
ChenYu

