Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03271606A69A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GBYVEqGH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWaVk1Ag
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PZ9yAwuYp38koYq9RCy2HQMtrR8Hqg4c34VB7omPkP8=; b=GBYVEqGHprKV2d
	o3C2vUm4zKtAholMnV9OJRlAdAI8z/rw1lcXX3BrhpTgUK461Qs37hg8AFrU83iMTsIIMRjojR3Ie
	ZY7Q2mjz3izCAAw3tJZrlg5gJo8MzaJ9go/WAnqlqomRMZjmm09ERFMAkwUTG/rR/28cKtRbu1HKo
	K72x2r3TwqvMdC8Edf8mX7ciZMHohYzwdhdrPt/X9T9AdaHTwkj76otDITonCEdQbJEQ8/hnydaXT
	wqJt8peMYKDJBmtQ9Zv0FWT/ikQ8jTnEf+OSNaNeiMOC/R2oLhcT0f8OTRR3/Yorb17WIo5QENvf6
	+ioUr47vl90UgmkKSIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYkm-0000000GUDE-3v0f;
	Sat, 21 Nov 2026 00:14:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYkm-0000000GUD8-0nDc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:14:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 53E256258F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 00:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF66D1F000EB
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 00:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220090;
	bh=PZ9yAwuYp38koYq9RCy2HQMtrR8Hqg4c34VB7omPkP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DWaVk1AgYX5aJsXOBhKeb1WSnDKKqVlQQXuMPu//iVws/5wISZjV/f0wWaHW2ALfJ
	 c04/68RkPhs6b5Y7sYJq0PgobwoWz1oQCH1tbh/JFj1fxvHcUOsi1prqx4Rb+8TGrk
	 Pis57zHBPJQghkA0n0APv3lS4ipYeMlfbgfucV3n5D92HI2PPMYgEYM5cxzGd1Q8xB
	 pg++G7kuj1X7Oj7ySRxgtSRDThdufqcp59B5u9lqyU0iZ3MHp+uqGIhE8Nmzpkk8F9
	 uqLaQ/H59OUmvlr8Ey4rYjgTkgROo/cpYUEad1d3wLkofiAOCMJFBRJZ87vjOIjmA6
	 1BqCT7ARUkhHw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1400122e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:14:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGt7wyU05zymZV0leSlowLYvB251jqte8x+RRDOYW0lI9/NLWklh40eNgcjL2PVAgNitFEi/8NdOgWCyYFFB+O4@lists.infradead.org
X-Gm-Message-State: APuU4Z/iUl/puwEca+XQlkvoljPmvTZwLtmb7XmfnlXvCAXnspocTTNn
	T0CT/M8K5JGyDEhehDktpmWg/SifY5vSGOUyZjiJokJH43OOjI0P3vI8IloxJg2NuhTssMzvFiM
	n+u4vcww1cqHSI7YQPU1EcCrFBHk/Gi4=
X-Received: by 2002:a05:6512:138d:b0:5c1:56f2:fdae with SMTP id
 2adb3069b0e04-5c1bc81fb65mr1484922e87.51.1795220089318; Fri, 20 Nov 2026
 16:14:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
 <20260912123827.3aa54e58@kemnade.info> <CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
 <20261120105659.16f48da2@kemnade.info>
In-Reply-To: <20261120105659.16f48da2@kemnade.info>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 01:14:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkGtLDrTwrYANBvoRHuSV-L1bALNygXSAr=UKUmvumbfg@mail.gmail.com>
X-Gm-Features: Aa3M54oYxLLeiIoar9C202engs6-8reJDb1b0ieFbWZCeVeyB2esuhPIJYUycmA
Message-ID: <CAD++jLkGtLDrTwrYANBvoRHuSV-L1bALNygXSAr=UKUmvumbfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM ZSTD boot compression
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, j.neuschaefer@gmx.net, f.fainelli@gmail.com, 
	Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, 
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 10:57=E2=80=AFAM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:

> > Please put them into Russell's patch tracker:
> > https://www.arm.linux.org.uk/developer/patches/
> >
> I have put them there.
> I constantly get this from emails:
>
>  linux@armlinux.org.uk
>     retry timeout exceeded
>
> So how to proceed here. Am I just feeding some kind of black hole here?

Try using the web interface and see if it works.

Yours,
Linus Walleij

