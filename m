Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B40606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i0BISrK3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S5fOQR+N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=; b=i0BISrK3pR2MFK
	4Zj6lEQtFIxhKRQeJzTmZzM3QWfPVuh01gG7Mx3DTdhCszwLYfMmWpVdpHeVqoNbyryqqrq6MmrF1
	qHaXfCy26mkJ22cQpnC/lUDv69M6N7R3lJR8eBoRaa1K/L4zAiiALbML7eYrPUKFg4u7yyH0UrlXZ
	3aMyIIec2SXnj3dvOrMtEoW2Bp7lUtBxTAtuu8/lOc7JC+m9qUk7ZZ7MjZmanr+o9hmhyfJ8kdPl/
	IDxgWZ4rFVVpk9Vlj5yUAV8XeDoKs1bDaz+4sbE8ng3gtwpACQwd32yTncgOnRVLNgnrKaTm+Fc4k
	HIbscjK1IFicRS6hQbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmSV-00000000wNU-2Dl8;
	Mon, 16 Nov 2026 02:28:39 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmSS-00000000wN9-3zmw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 02:28:38 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-9912c47367cso2753057241.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 18:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794796116; cv=none;
        d=google.com; s=arc-20260327;
        b=FEV5bi1ZqBAeMdIe/DPFVayA676xrucvjayxLKgoitX5nzeiC1IfNEWxjme1L36KQ5
         jw6CXFV7rOKcvwK7kHlBIvwh/PBZMYLZlxsjmiO02rnUYKLxxFs1fl18Dy9bvAUYYTvs
         oU6eNQO2btk2+xlTtQ6oNrwBz5fHKpY4qFPSq2URN4MBKmYX7NdSGxCeatPllVu5g6uC
         xauiE+62oNK7ptoyc5jIFxiTKyuujEXNw0eN8UePPpDIPOezmT3N2Y13MaNZieHb/Tdi
         z3t8iLXxu5Hz3DmgqtVV6HbkiPMZOcBnXKxTz1SNEbTenRE2Ody/NDfbWd5otN5sEYyb
         ijjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        fh=Q7MBGYSB8FMuNcRTOCcwCAzHzmTs1Gm34SONEV4Lfmc=;
        b=Y/TIPy9j0oQo6DhkNmstC3guFOKFu2iPI+qUyolZmhlMdxaiUNppB4OfgfHZNzt0Df
         zFZTSakGtzplhWj/DZRqjvb7+dBfXeyJw2gHnQ0lsBoX/g5+MpZ/MPWwWbdU4clvC0jX
         dJOo00wbqRJzcHcsNOcxKyFd1vSbdTJ3gYmMDgZOskWMcjCN5GZL8sLMWVRWwNBmEH1h
         m/9JWs/0aGs8C8ztkccNCD17qVbx+tG3dFeHBjPRIbjyfwVBDK/W7yhclG9n38LhaPzW
         GsbD2jSB5KvfO0B1mGow6cbZSn2e3t9OfeVDcQMT9otwrVFexYBvwwyUXL9Lg7W8Y95D
         lbRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796115; x=1795400915; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        b=S5fOQR+NJLao9nANIkJ5n2c+cO3Gj4zJKiQ4oN2WkuwR9RxNFjgotIJ4UqKpyRIDb1
         C2u4MFVcbXw/fHSVKekllUOpCQc7u5ucSjh6ZfpLby4pBMdsFsQ4Yn/67javXSnk0PyA
         lVYyKDuJgY9rbFrbxcgen1KdOvJxKCmOpAYmET8oQbPUsrsbnXZflzzidVrV6HtyoNyR
         magB9ho8ZywvBtpDGtuWNz5ZlWYgWe+olCH58lqzinkPl+EYzNY+wtYMIZmrThQSPZqT
         Ae1TfOUJXqLfnR5bNvyZYlbzIj1dWYwghb0EJPRilgCfvB6LOXdbivRs3o2N4EQTFpVE
         XzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796115; x=1795400915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        b=kASdq2ueuMhOwj+o3FO/6eQ637OFzGTYdvFgS+T1VZac70h+0HuKFSY5uWdz3r8yRs
         6CgT8eOXAz9/brpSG1971jw01VAz/w+7YAr3qQP8FnkkGKYad7vsn3wASkzi5n441jgY
         58ZusBkI/tsqYwHHiJazLto/DnMr1AMNNWmmgkWE6Y1znGn3hsR4SkM4Y0PtJXjcit0y
         Kop87XGxrM9iGKF/IoHjdkMIs8BtXb9a0JNOVYinbzRDyVyZK/l0QKcAHTCGJOOiTYve
         oxywR5K3LYaN7lw68/aUfXyo9x1P+tvA698tl+2mJJ2bN8zQFxYpJdHApqSffv/8/hEe
         0iWA==
X-Forwarded-Encrypted: i=1; AL+hErEn1D/B+I/yN1V3GEa0BMQrJ1D/xwBI0USuIhN3oD3s1YiNsNEFJhy0aoIJJnoAJyHsrmYG8VxkdsGaRZmvmYSt@lists.infradead.org
X-Gm-Message-State: APuU4Z89T23CKJRz9krlrdhteFDRG7Gz/CdnG7yJnadsjkrjlyxsXRxC
	hfA/BXrDLu1F1+H2tVHVQxZyNduYavMJEjzjyS+SHcuklCAzozH2Ot29r1+0bzyPfyCSx5K+QxJ
	9GtX9B3LK2KuiqMhqyteCnd4IHm1Ebag=
X-Gm-Gg: AYBFou2If/odrSSTxag7luRaeHcsFN+kYSNqMb/s8Pbxy6vUWc02So374rhN23Oz1E2
	vZhbgjTrlfvkaGfzeyEtK5na5yiAMl0TCF6QBP2bdCx7ZNuqc0YjPC+dkKYTSxqFjsUfuTcMRQ4
	OvSdqqshA4K4xTpsVifLNSO1S17txWgDJe6fSxlNVlm35dZx/nk7OKvVdAblRWuyLp+m3smjX2M
	xOBap7A8uaqUZJfScTAfKXSfk5YZtCiXf550ttyIi7rEV6ipHzQAj0rkV98K++fQHyH2WSvX62h
	u/FIq/poT7MHdYADFwzVR08xeQOOajUW4vmQ4GII20xYYI54Wg/5TbroPp4He6zg5c7Mmfaa/Kp
	dNB+ruuaieWwVc01Ro590KHu84mp3KWP9c4bcMvEWh0UPuIe3tjWPcNY3RE7/lxfWD0X6wh5889
	jisgoG2Yb8coll/JgTl1JfhALAIeNrq1Tn//SlO8pm4EkCYleLuQZpvjen7zSAsRDJJ7WHtblyv
	x0qSXSFvsN8c6HsycL0IFhl6az4D24uBKP2v+288cwLxtTLdvs=
X-Received: by 2002:a05:6102:6a92:b0:7c3:874d:60bb with SMTP id
 ada2fe7eead31-7d64d6c4928mr2278451137.5.1794796115630; Sun, 15 Nov 2026
 18:28:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179479100276.3291.7162632058743254408@kernel.org> <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
In-Reply-To: <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:28:24 -0700
X-Gm-Features: Aa3M54oIQfFIPxOH03SzX-2akhqZowcy4hsXJL6cGaB7t5DHcgJ3SVo0-C72FkU
Message-ID: <CADvTj4pV02w3pQeeVH11L-HOTaEbc-1jE+ErF+z4zU0QRfANUg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_182837_003171_0C7AECDA 
X-CRM114-Status: GOOD (  29.97  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 7:19=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 6:03=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wro=
te:
> >
> > Hi!
> >
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
>
> This was found while investigating RX checksum offload behavior on
> H616 and reviewing the shared setup and feature-filtering paths.
>
> >
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by LLM and not proven at runtime). If it was triggered
> >    please include the symptoms, like the stack trace or kernel messages=
.
>
> The capability loss was reproduced in a source-extracted test using the
> actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
> relevant setup and feature-filtering logic.

I mixed up the two threads. That explanation belongs to the
separate checksum-capability fix [0].

For this sun8i patch, the issue was found and reproduced during MAC/PHY
receive testing on an Allwinner H616 board with an AC200 PHY. Even after
ethtool reported RX checksumming disabled, EMAC_RX_DO_CRC remained set
and the hardware kept dropping packets with invalid IP or transport
checksums before they reached an RX descriptor.

With the fix, disabling offload cleared that bit. In steady-state tests,
those packets then reached the host and were rejected by software
checksum validation. Valid traffic continued to work, and Ethernet FCS
rejection remained active.

[0] https://lore.kernel.org/r/20261115-submit-stmmac-rx-checksum-capability=
-v1-v1-1-ea26fa3689be@gmail.com/

>
> With the original code, disabling offload and following the reopen path
> clears plat->rx_coe. The feature filter then prevents offload from being
> enabled again. With the patch, the saved capability survives that
> sequence. A requested enable that fails hardware readback still clears
> the capability.
>
> >
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
>
> Tested on an Allwinner H616 board with an AC200 PHY.
>
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account.
> >
> > *IMPORTANT*: If you do repost (for other reasons) - please include
> > the relevant info in the cover letter or commit messages.
> > --
> > The evaluation is done by an LLM so it may be wrong, if you think
> > that is the case please reply and explain.

