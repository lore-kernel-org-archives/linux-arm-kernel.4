Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0JLkMn2U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KABLy4Mb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eLIMWYK2tRuuSmcR411tVKpNv/NLLUeNfkrsrD+ZPRI=; b=0JLkMn2U7in6re
	vmget1ZW/AK1Qd69wpP4rJ2SSZi020EoktcPvMqdMzN5t5/vNR31B5yVhuX+prHz5OFgY3oDVfGIo
	tfcAMlY/h4LSjGbRFkDW+iJ79zy6oRA8PfBKYYwqSX8sHs1IvHt/iisnq+Lw4aH00eWHTwAqXdKZD
	XYWMR9s1rMkKkancKUWmF4u7qsMS+asfiJw44qT1eK09lpistaAGSaPBT4KRb5xhoz8aVT6tEME1K
	w7C3qbR4mxhrwfS00Wyi/diW1DZHS9rSRfZrePKeUwWQhPq9h/83Z01/2U7qPLIrse5g6arES0ViM
	eKJEadMycV/id1CDwrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZFF-0000000DIye-3ZVr;
	Thu, 26 Nov 2026 13:10:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZFE-0000000DIyN-2Cr4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:10:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1948448B5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53C71F000C4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698635;
	bh=eLIMWYK2tRuuSmcR411tVKpNv/NLLUeNfkrsrD+ZPRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KABLy4Mb7/8tRa4Rewu/+nZwIEk+I5x5MMMUaD/tmWvGce79i7HJc1HwOwbkbIsxC
	 1BYLKHEUtYVctJqn3fFgfafWnqhR57vgLBF4k/XcWVn4aCkhyOWH03b2Z3jof1ghcw
	 XFzZE4T1KfCYHRutsmAGupbU04tbN1xIy/uOvwJQ240ccGE5tBMZoxuFGyW3r00yUt
	 jQ1Tf40xK6wYyTN9GHzP5Zxe1s5ZCO4JELDhIV6NTWlo55GjBMMb3XCzdhWYsqkYFA
	 35dDUUZc94KuDJnFWNd6/oGLurHkMm2gqBHTuICOwqtKhPGWwIaieqEtVAOIfWaR9h
	 umMpbNJKlj5vw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso6239244e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:10:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGEtU81KhuEytOR7WJKiW92qQYh3uB9q7poiWQ8DcUgJl9NXw6PupuIeeA1xOhyCgiXBZkEiUJdPm4oXnmMsocK@lists.infradead.org
X-Gm-Message-State: APuU4Z9wJVuP00Ovf6c9wI1G5UIKlcn8xL2p6EV6vZL3Waj5jM9PdiAL
	8R57FYJK4Sz3HUrjs1/ZJmQYs5FgeyRIz5Vdjr7T0TMYe9XuhKvXQOofQnqscyq5m0Xu/yPFRaF
	G4k2f3sC+XNHU11yMxM1oO8z8LBAxNhw=
X-Received: by 2002:a05:6512:1394:b0:5bf:d004:a84d with SMTP id
 2adb3069b0e04-5c1bc6d11ebmr5767057e87.5.1795698634681; Thu, 26 Nov 2026
 05:10:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
 <20261119060924.675-1-laixiangwu@cmss.chinamobile.com> <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
In-Reply-To: <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:10:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLn0tuzo8gUmn0rOKRe1q58L=q7-P+iQNkSmtntk6zyJKQ@mail.gmail.com>
X-Gm-Features: Aa3M54oOoJ7amL-cGP1ok1LI-hGii4NmUQAyFDE4e8UOSHEPLef66fnvPCb_WOk
Message-ID: <CAD++jLn0tuzo8gUmn0rOKRe1q58L=q7-P+iQNkSmtntk6zyJKQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Antonio,

On Thu, Nov 19, 2026 at 12:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> The driver's "resets" property is not currently used by any upstream DT.
> Using it is also problematic, as asserting the reset affects all GPIOs in
> the bank, including those already configured by the bootloader or secure
> world. The current driver uses this only to deassert the reset during
> probe.
>
> As part of the cleanup following the planned removal of armv7m support,
> I was considering removing this unused property from both the binding and
> the driver. Although the ST reference manual documents a per-bank reset,
> I lean toward removing its support given the maintenance burden of unused
> code.
>
> I've added Krzysztof in copy to get his early feedback on whether removin=
g
> the "resets" property from the binding would be acceptable and appropriat=
e.

Why would you remove the property from the bindings?

The DT describes the hardware, the block has a reset, it should be in the
binding, end of story. Things such as boot loaders could be using the
same device tree and may need the property.

You might want to delete the *use* of that property from the Linux
kernel, so as to leave the hardware in the bring-up state. That is
a Linux concern and has nothing to do with the bindings.

We don't remove DT properties to protect people from themselves,
that's not what they are for.

Yours,
Linus Walleij

