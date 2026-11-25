Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5229F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d2ylK1aF;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AzK+A4ac
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=; b=d2ylK1aF4hwFrN
	1k+SvWWPXCfmXDPJPC7n/EnaaDUVAz6pJywcTutaJJYHooVXliCWg/ZjIYwfjVX4Irr20thVOZ4np
	AIn/melQImoZyPEEBH/24GHqtKnXWCqEI1eJJNCijpgudUpxHFVho7lC6FtYduQJIVABO6cD8PXab
	O2i9MSzVp2HGdUMDFOg2m0ht2OHb79Qr9mvrjfDmzP6ofqMIRtNm26L0BgJnYYz6d0yL+hH8wp7NE
	tXbOV7pc582fqvZ7iRyGdcUUCJ/m4G/6C+RllO9pLCvfSOmYjrT1UNPiXCcdkwfEpVWx0rD4Z+dfY
	AKl1S/Z5mW1eEulehftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCq0-00000009xSH-2Amb;
	Wed, 25 Nov 2026 13:15:05 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCpr-00000009xPA-0mTi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:14:56 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c506a231b88so782151866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612493; cv=none;
        d=google.com; s=arc-20260327;
        b=IfZlCIXxEXMYNN8VmPF75tsslU4yylnwmIexY5fb8WRVIF6Do0RUahyW8bT03eFtDM
         XvpW00RPfkfqFMWpE31rRakUL5dEbFtH9hI3VxkT7pmSiNRlPHSSoUSFevESTYaJAHhO
         ylSnMD21ONIAFyzs8EG04DC2l5EGGMl0CY99IVMd1eTYUrrIMfasyaplIJK62SbbMf6A
         R0IefOEsjiRTISvAuX8UxdnDtI2sF75QnC2nRrYSbExYaSjd4cVRvu0ykRImMFeP4pWG
         gQTDTJbUGhtyzFIHR1GOREniBM+hsuCWIEKoyzrGSLpXyy9Ql3+Ore4eeAXd3Tf4TXVu
         xi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        fh=Zw8bUx8zdP8eBwh51XatC+8wgkcxEFK6CUmgA1nRlW0=;
        b=syiiJTXsPNi5Pz3doBCu4zTZBh4h1VTgb+BaPx4WzuIPQ1gXmv+JBQtBL6BHh3qFA+
         njnNB09rpmJ0ozLYjdw2T1ul8+eDNcdu5iBugrrDkkJigUY2+8W/i0E6zPK1p84U299j
         hlrfxUy32sa1tVFYQrX8jqE45n9muxdtVEF1kujLHLNWHuEa9cHZPwPHOFLgVyUXoaFz
         00Xp1V6JwzHh+rRmn5MjJ79U5zjVFUPyODVg9e2kcMQhNvEou3QXCIyWbBQRUip6C6yi
         jpOWO7Fz2RMUagEfYaUOiQSqtWTimrW3IAIB+QSubLvKL8GHSReWHcDhZfoKRoNtmCjz
         0WBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795612493; x=1796217293; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        b=AzK+A4acCZTwwjGLVAc2fwKgyBiJWyZVz9sBA1iI5tQCVI6G6irUtzQpquBPf1Ly1f
         Ez++bUwqI8NX70Z5+pH8FbkWUDIcqP76YND61RaQlghWzwr7Ehi7OA2FW2y0uK1xgM1R
         wYpCq5QBMoAos/dsbJHysqUaGTRF5ftnb7uvSnV6fvVKBBAtY9f/J91v9fyUXQssKcbN
         LM2srwuPnSdhPBvI5LKriVwabAJAACRvDTInEDAWwMzhwcZaZDic3xvcMnaWDx18z6Q2
         7xhZHnmJYXz/QxTzm8F1JvmrvaEDubvdBSSRnV5J6KWxMcTU2fwyh0+/iTxu2HD1VdwD
         bBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612493; x=1796217293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        b=ednnxWbeEHRISYV4IF17J8PCBlktKOeVOxfYgxLR6lwkcV/QT6VQvAr0O6MzinUw0P
         b4zTKUww680skrhlaoF0kK4a1OS/vR9+/hHukMXVV7Pp+a0ZSUshAgCSoqqqyVGi7hhQ
         Hq49uy5qIT98Y+LP5YayASHCbWLcAftb/EuiTizdej3MgILOrbc8mBijF3xVnskxn3J1
         HDKe+Fyxln3+yQssVCMUg/KlfMxlN1baeMkSIyJWm2PyGur7ZwJucWFNVZjc831p7luL
         1KJrZ6e33k7Ky8K+VmQ+hme3Ir609Tk8BOCwNkfvEFMqghM4NEnCZDhMmRtUUyNzZM2i
         eknw==
X-Forwarded-Encrypted: i=1; AL+hErF//gX8DDrGiYUIdcAKakNJlwF4hg9XaQANC4veY5jxgbCuT8EGVhKbYqykjVz4ihuk0xiuZsoNDQnwdcHLFEOR@lists.infradead.org
X-Gm-Message-State: APuU4Z/X62c//d+w2eQ78lsTsZK4phL0zkvHvYojSjmRyeRqh51U3JWg
	KandHFcDpW1RbEALDGTPxN9xGzI8207pksCOFCaFYRlDtWoqjcntbK/8na1FZm9hMVxBqtw23Eq
	nLjH8QbgrdDcN/Y5OLhMgXpWGBuRH2E1xJ4YnyLFynA==
X-Gm-Gg: AZFdTZcKL6Knx3//IT9pjc7zyvFZUPdhEbr7Gn4FbUMXfpnRz6ik2+xljzNiFfTFKT/
	cwGB70UbfH/3/BkwEfuz9s0MyHdLqF9tNAsZDHLn8IdWabOr7xVFrkL+9oHxZYTNsgSCfPHvGQy
	7lTH626DasZUonNcck3yA2gwA/hEGR9/Gu65u7zydpooJVVZ70pyDtU79Hl0Stp9/F/hTiGC/y7
	VGfFIm9HNmHZiPUAH8AduwTcYmxUbg98bOl2PB7ox7Ukj56nDxG5H4Uow9A4mc3zuON1qVYVuof
	SrwsFr4OjbpXfY9lpt/C/oLXGN/jMOTMabnGwmNxvxaaYR/iZ6M2d9Lx6vBQxZON8++z3IxXOOY
	T9r6WLazcsMd7Kvw0SMNMObPsJqufimLF7rohSPfz3/Zp40h6qKlZLVqEsHsoHpHkF/ZRhGY=
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id
 a640c23a62f3a-c513a5da8d0mr1423705266b.12.1795612492588; Wed, 25 Nov 2026
 05:14:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118184729.2302130-1-m-malladi@ti.com> <20261118184729.2302130-3-m-malladi@ti.com>
 <CAAofZF4XYd5z8X56DRARMxbu3t7QX48T7V69MPBw9TW1BQAmKg@mail.gmail.com> <20261125113634.GT31322@horms.kernel.org>
In-Reply-To: <20261125113634.GT31322@horms.kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 25 Nov 2026 14:14:41 +0100
X-Gm-Features: Aa3M54q0E3DE8nTpapJpm6hmEWKXKOUeQTw9rDRWi3Vp2mEG2fUlO9gFRZDhhqk
Message-ID: <CAAofZF7tvsfkjjZY6e8Y7P-ddNnR=XQfLAGysrpq1yp0rRGrjA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ti: icssg-prueth: Add ethtool RX flow
 classification support
To: Simon Horman <horms@kernel.org>
Cc: Meghana Malladi <m-malladi@ti.com>, kees+treewide@kernel.org, 
	laixiangwu@cmss.chinamobile.com, philippe.schenker@impulsing.ch, 
	haokexin@gmail.com, devnexen@gmail.com, jacob.e.keller@intel.com, 
	sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org, 
	daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org, 
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com, 
	Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_051455_241777_3EDC7D71 
X-CRM114-Status: GOOD (  13.12  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 12:36=E2=80=AFPM Simon Horman <horms@kernel.org> wr=
ote:
> [...]
> Thanks Marco,
>
> That may be good general advice.
> But for networking code the explicit approach taken by this patch
> is still preferred.
>
>   Using device-managed and cleanup.h constructs
>
>   Netdev remains skeptical about promises of all =E2=80=9Cauto-cleanup=E2=
=80=9D APIs,
>   including even devm_ helpers, historically. They are not the preferred
>   style of implementation, merely an acceptable one.
>
>   Use of guard() is discouraged within any function longer than 20 lines,
>   scoped_guard() is considered more readable. Using normal lock/unlock is
>   still (weakly) preferred.
>
>   Low level cleanup constructs (such as __free()) can be used when buildi=
ng
>   APIs and helpers, especially scoped iterators. However, direct use of
>   __free() within networking core and drivers is discouraged. Similar
>   guidance applies to declaring variables mid-function.
>
>   Link: https://docs.kernel.org/process/maintainer-netdev.html#using-devi=
ce-managed-and-cleanup-h-constructs

Ah, thanks for making me note that!

--=20

Marco Crivellari

SUSE Labs

