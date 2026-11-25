Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE134606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wLCkjNxE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oAmEQ77U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oqOBHQAMaG6pHcHSw0q+p1A4YAB/8zxddwRDBAU9nY0=; b=wLCkjNxEf9vDG+
	IDWaPuzDHlntdBayZJJfneql5ANsP5whqjyton7HbDJSaH5nOlDOqGRPLQ/Bl6xGcuVhmbo0SNiuW
	sPK8FzYUnkxL6oH+UChEYEacMIDkxb46vNAU6ogFOEQ7z2N3wcK+bkRtgZ99+EDgAw2LPyKe9U83s
	dDxxyovfx84ATEiL4lHdeee42JEm5LYKm3apHh+b8bJtGmbWdW5JEG41ofKNgslzdxrlQfj5JrqLx
	m0QOWZLEmwysiJmBzyCLGXg7XotJMKObzuE3+SyvqkgS1PWYOuhAIyQmjDLer74oRt7TsalTY96t9
	iFdnjnsm4GFuoQvHDxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHxc-0000000B2c1-2bTE;
	Wed, 25 Nov 2026 18:43:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHxc-0000000B2bt-0AYS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:43:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A148C43D22
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2364E1F000CF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632194;
	bh=oqOBHQAMaG6pHcHSw0q+p1A4YAB/8zxddwRDBAU9nY0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oAmEQ77UCImqHEHBg33dv8f6I2Vf08Qs4fjLSahSoa3J0+ub+hsXzX5YE8eyZj9bx
	 uvm5EcR73t8OaaTKxS/U+jKVq9CkRbwaF3zLtaSFBBtkWyUQiseatIx4sht2d+oK1u
	 HWZXZ+MxnXazBHEQBhAtYDS6l7LTEk93ljZflFVkgTg7l+IAj8LAzQ5L2RY4cQ92R9
	 apBA0Txbo/7SsNGu5Ux6zExoBNqdqqK2GEK8r7aYCgPu5Q1A1HzLgSMygKaFyd3PtK
	 MhQ7QD+ackQ/5pbk5pcId0MjcYLxbhA8q7Yle/Cviskvt+ALPNoqZAv/R7NAdwF/CV
	 vrRmEfvQ9sWMg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adfed9a887so56261521fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:43:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFntVWaJjRBI5Pz5919F2UzZkwIyobJL6hOOF4FRIEPB6Ar5kjhg9g0VnmbtFMuFU0MKZ8qrY17lhAdpdHccFXy@lists.infradead.org
X-Gm-Message-State: APuU4Z9mSK3B5khviRilRA2nAKLIiHczpYV9U2cBCvJN/zLTS0DG2Y3h
	XnnLZctdNOEvTQbwPy8UaigvcNTyBccmtkKPHzUkCdT6sW4HpaTvOENJB7JMu0shbSMWBOd54I0
	XlgjWjQ42MqEXJY7gjiJLWX5PP3vOIuk=
X-Received: by 2002:a05:6512:1393:b0:5c0:b5c:4044 with SMTP id
 2adb3069b0e04-5c1bc690966mr5243804e87.1.1795632192950; Wed, 25 Nov 2026
 10:43:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112083600.1550204-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20261112083600.1550204-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:43:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLkEC5eDjLGRCAfv4gQWO-f2WQQ18QThU2_QpWAvSdVi7A@mail.gmail.com>
X-Gm-Features: Aa3M54rH77em81M0iBD_Hhp5Cbppm4obv6tBVRQL2-ACfZFH3vS9jio4K6cbORE
Message-ID: <CAD++jLkEC5eDjLGRCAfv4gQWO-f2WQQ18QThU2_QpWAvSdVi7A@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, linux-gpio@vger.kernel.org, 
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 9:36=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 pin controller provides the pin muxing used by peripherals on
> the supported S32G boards: the S32G2-based S32G274A-EVB and
> S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
> some peripherals never finish probing and a defconfig kernel cannot
> boot to rootfs on these boards.
>
> As the driver is required by every supported S32G board, make
> PINCTRL_S32G2 default to ARCH_S32 so it is enabled out of the box,
> while keeping the prompt so it can still be disabled on ARCH_S32
> platforms that do not need it.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

This doesn't apply to my "devel" branch (or -next)
maybe I already merged an older version of the patch?

In that case send an incremental patch instead, thanks!

Yours,
Linus Walleij

