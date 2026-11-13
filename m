Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14B1606A897
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EtRjU6td;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B2TlxH4r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QkN+1eF8Y/XADWpxlJCNMdoZN2CgphaWq6d8zvGa81w=; b=EtRjU6tdFyyl/o
	EhVg36pE1RZukNVIteS77WATNuOkjZN+zPKPdVmn66OWdWw4l1IvdqrO6qmiwoMKSm6rPm0v/2WDc
	YavFWGx+McPSIsSV1WYTbSly/GTdSl+8HAFZSf/Qh/i1lIdFwvUMvAlnqq9vS1OSnPR6QAtCkJWVA
	mceIeKw/2HgrqBrCFSjjYbmEdE7w8GYwfmRFqVqRBiVIp3dXlXhLckGWiP6MaecdFMFs1/PJ0X1Ry
	VollWbosCCzsW7OH1O9jnjGWdrzv/Afg0VBEIN0ABYnGI6q74V2UIrEmm4JjsIVXLejqSLJYpBpdH
	KzozrxSpMlKyZpuaRUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoSA-0000000CLsS-27DM;
	Fri, 13 Nov 2026 10:24:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoS7-0000000CLri-2qxS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:24:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 024B245A05
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB69D1F000CF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565454;
	bh=QkN+1eF8Y/XADWpxlJCNMdoZN2CgphaWq6d8zvGa81w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B2TlxH4rUxqu1No4etPUv6yp9T9MCAPSpTPrnvC9TSm6lyJhImV4nK1ZwJTrgxYB4
	 rd/Heek1KzjtLhGE4uyhADwLxZw+prNnlbugMgeTShae8z33A5C5RHz2+CVO1K6Z0D
	 LvvLJ5NJMF4TzFZHlR98IreXMaBusEu/Hd4Wbu86DpUMMN3ow4/XtxAHvfq8f5C4GZ
	 MHLPzYfGYZz4XEKLAjAji9ktzGa7gCbr4OS2Uzy8Ldlb2oCIfaJzYXBKYySx466vbE
	 8gqF0rrEluaPC+BNmi7iKA6F6P3zPSzBeprseH2NSQa8XVxomjw483iqOV2oOmPWV9
	 kksYyqvPA18bw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso720968fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:24:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFjkxL5X9GIYdsY3aYnBzVvVyzjApMmrmPrJMbcuUSqKehrHsM/LFDmXX91Vdk3eVXZbvgqJptuvJooBFKpDZgX@lists.infradead.org
X-Gm-Message-State: APuU4Z/gKhEBx6mQcOgMeQASNpPzKOFKauPZSznJnmskG8K78o4fgiVl
	Huna6dvP8kJmvA5+GFlTSwXmZ1csy1Yxq0Y4JgSEcZogNhLBEZ0GmoED3I8mxgZumdm3eFzfIj1
	nnYsV4R0tBPlGY5cdp3KqA/q7bhi4mt8=
X-Received: by 2002:a05:6871:7426:b0:48f:e3f5:c419 with SMTP id
 586e51a60fabf-4afdf7ccd7fmr2000857fac.58.1794565454219; Fri, 13 Nov 2026
 02:24:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
In-Reply-To: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:23:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKJGDM5woHn5UXGmToS0g6N55=T=+8Zy+F6X92N0zW2w@mail.gmail.com>
X-Gm-Features: AclHuK9SuxGHNdL_y83hLe0FJC4k4ytk2FDVH3qE4U10O6Iw68MpttghD3THgNo
Message-ID: <CAD++jLnKJGDM5woHn5UXGmToS0g6N55=T=+8Zy+F6X92N0zW2w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amlogic: a4: Allow functions without groups
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
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

On Fri, Nov 6, 2026 at 8:09=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Allow function nodes without child groups during device tree
> parsing instead of returning an error.
>
> Only count and parse nodes with the "func-" prefix as pinctrl
> functions, ignoring other non-GPIO child nodes.
>
> Also handle zero-sized allocations when no groups are defined
> by checking for ZERO_SIZE_PTR in addition to NULL.
>
> This allows the driver to support function nodes without
> groups and avoid treating unrelated device tree nodes as
> pinctrl functions.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Add debugging information for error dts and Error pinctrl config not affe=
ct normal pin work.

The way I read Sashikos bug report the behaviour it is complaining
about is exactly what you want?

Patch applied.

If there is something to Sashikos report, follow up with more
patches.

Yours,
Linus Walleij

