Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D27606C6D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qxh/2l7i;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVWxhP1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=; b=qxh/2l7iHjPRXE
	bOuTF94mS4oC1IPZA02LM9Qb6VfwCiHQY3PjVgLT6c4dI96cjoBHfT4IEZmzjmQX9KKA+PPOjA3p3
	3kihaDhdDQeqmvtnhhcdRZ7TsWgauZ0BmUCgJnFADeJlib/lq6EjoVuQYquRer7netb4Tm+c78dO0
	Ru0rr7MxgiKw5rihg1HYjRhQ3k1Tg78OWLASkoiAAIZ2AGxvYnFhMuwDPAJlraREIRouWvqzJaxo5
	P76rT+of7Fr6dJ0JHfc6b5kUIpmaTq9zq3kfm8Pp+J9wdrxDKQ7etjLcawDBXk7wyW60we62ViYep
	ef8yl7r7iW6/TBLqphlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqmu-00000004ozv-44W0;
	Tue, 10 Nov 2026 18:41:44 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqmr-00000004ozM-0P3f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:41:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5c14e307f29so2493037e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336099; cv=none;
        d=google.com; s=arc-20260327;
        b=Qoz8lJ9YxINaW0SXxMp/H94VAIP3337Fb4fKOpLtTVmnIxn6Pa4gJ0FX+7x6T6KvK4
         V5SpdfjDK69kPbcH4BGFlvxNd1u6XWP45kWg12m0q3sgUZaYKmWyy06iwC45OATh7CLH
         jwlB4vqW8nDhTBdrmKREuZu4qiCprhyXJeMfHhmxN8P0uMBwlY5arz881AyFL5A2xV8O
         t5hZy3Ge0eW5a4+5mPJREGetH9g2SUgX3oVRWdxBzjc1E6KuYcCKaR2COpajgnyXBpY3
         Q7eO/SXV28ySDHw0HaJblNJbJkN00WYTaTLET5Uv+2h+/GdgYfIdlZi5y8N7TRTtZB3F
         F3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        fh=sPtcFL/ow+9XH2qZJlGfSZ3+UhR0TfayBSnvOc2WI8U=;
        b=Cjvcq2k7CzZUeODE2+l+BFqeKtWCob02wcbD94SiP2XltmeG8tOuPHVAcGkyMKT7Ob
         QmFLHr8J6Vampt6vKkeHk816kYnXwBhbM3Uei2Yj6tYtKc1FYE3l7Ab36Y3d+9gMwRgd
         Z/Ck/CsL+HbwQe8a+N6INRHIeS4RMOQG6FUyD+4N7kvuQXbFjuLEx3LTA4i1HUtHqIa0
         epPQt+f30igAcx0T3oPzGzLMOzCC76qYOOX2y5Tm0KC5aPtZxPHEmbz1ICKEnv51i8Zn
         Ps4nFZ/zGGGS0ziQ+bGaQpKI2EUOdFdvHyaXgBf9xLVT3Zi2JX4ebrgE5JFUFvaHTUAa
         ElBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336099; x=1794940899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        b=LVWxhP1XEHI4mbppEbaaJT8bScm06LDa9c46jG6bhm9iNHIC0ipMhiAKXxqu3SGHtb
         4h3UsV8KKEkJVcYPNm+7K6ENmAxXQsMPDt6jsO7GHcxfsInx/3WaxzXMIX4sNW5pYwUk
         m6TjwAUjvc/5CaFgpVUJZRvEJY3Qmj4+1/3eDOA0CHbxxEosN4AQskZJ+w6LDleIrjf4
         bDWleC7p8pRepbXU0HXWjoFAw8cRRPscxEbVAhbYDt9W0WP0VkB0+ZrQbdZflxoIII9x
         jtURGT/ArWG0kgEzkLIOGR+jVI6B9BT+mEoO2ShvEo5kiim+Jtx3HtpIY4Kl69H5q6Gn
         /vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336099; x=1794940899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        b=ffQxpReQkkKg4O3LpHueJYVPlciXS8gPHkSpXzAIf2Onszy7JeTBFCYOgKNvLXWNq/
         gUhvnDqmkZxNS6QIMNzEnEIIa2xbrOvj2Zb8c8U/M2MrPS3y7JLh9k1cjsyWaKyO09gG
         Eugv/omeQmokB8S2qNLuXhb6DzkfzmY3jiJcYOHi7/IwTG0jUGWEQbN4IOvlCLrgAQER
         oJ8fPocrBbKCdhIUTWGC3gAGZH2QyQqR+3RoivcOKdRs4gUNozGUxp5bxzu/26h8C7Fh
         pnA6o9kDovZeaFgW+5bw0v5RJvQfXOJhmoiw+m8gAjlBLnqG/zRVpdcrOtRA52sNvOdK
         fTdQ==
X-Forwarded-Encrypted: i=1; AL+hErFDPhvzIK8OLRUnERi0Mx/aprF/jBDbLRRKkVq4aYtbWrFTzN1lSCk186BMacikEsYlF1bSpQXdsx2yFdE+T1UK@lists.infradead.org
X-Gm-Message-State: APuU4Z/UWXpwMvqEHi2L2jEWM6dCr34msLxWgdj1A5B+BLjWwTDcXbHX
	DItf9mxCh+TcRG69N9s2jrM37STJjpQnB2cz7041RqntSwhQG31rMGStLqhddNV164FkxzHYWUh
	iNyWoiuuxZjntYwoDTwsKwY3S8iwGzs8=
X-Gm-Gg: AYBFou13owyFaLgV288uqR9YC6QgAF35SmjkDC5vgQLwHv3M5Lgz+cFxqsitnLOJdE/
	7LxHDLsa1eoPrQYo3bFsF0AeTQ94vKIdWaplIS/9nop/Xbl5MvidLLcdNxwssF97R8Y2xtU6j0V
	ZEyf+aW368WXmIW5fD/Mn3fZFvZ/pJ9gO3NHOsfVlxZKkgXv3mOOKdpZd7xf4elR0/hv7mVrtyq
	x4B5ptMhQW9+aNCmwRl+vOZoVr10d0LwZiFA415Bck91IVbGlsrLjiIu1EBYpH0o9Bqk5Iq67Q8
	mS2RFb/T5a1aYr3SrUlp9ANEnb+BSnr74VbdsroJZMKWS8bqQyVEqgrdVHjIg+4w7l2JNS4dpN9
	OctxnPjYlYsSd9DUZtiBUFWZYW+T+4NeuJ/8gUfOwEdG6k1snFwF4oPiobQyPrWczJed0SQ9cK+
	h54sh6g0ssxI4vgAVDbL8yyxIN2A==
X-Received: by 2002:a05:6512:2506:b0:5c1:5b62:8bc8 with SMTP id
 2adb3069b0e04-5c15b628e54mr429046e87.35.1794336098639; Tue, 10 Nov 2026
 10:41:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110150546.1535950-1-lukma@nabladev.com>
In-Reply-To: <20261110150546.1535950-1-lukma@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 15:41:27 -0300
X-Gm-Features: AclHuK-B10Ha5eqEFsmLjifrfjCOeHNDcssKsSt9aMG-Ic6xnxgK7qKCRscUdio
Message-ID: <CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: Add device tree definition for
 Cloos CBASE with i.MX8MM
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_104141_149210_5271ED6A 
X-CRM114-Status: GOOD (  11.94  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lukasz,

On Tue, Nov 10, 2026 at 12:06=E2=80=AFPM Lukasz Majewski <lukma@nabladev.co=
m> wrote:
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQM=
L
> module.
>
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
>  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 577 ++++++++++++++++++

You also need to document the board in
Documentation/devicetree/bindings/arm/fsl.yaml

Make sure you run 'make dtbs_check' and that your patch does not
introduce any warnings.

