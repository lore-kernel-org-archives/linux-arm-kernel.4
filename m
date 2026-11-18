Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABEB606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xcKGkSB6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1XCocHm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VIqubSxa6chp+PQfAvvw0Nq36rRNM/+XIF5m2rPT+yM=; b=xcKGkSB6OD+vJz
	uF9R5c2hBdSM4NQn42fXY1gmsj/Y6KGf9zIHgtSL2uYuJSJ6Mm0Ik1BoeRz33zxypD8um6Busyw48
	lVlX7LTxYFi50JCDKq42/1YaQtlzgKOWbuphmdQ97RBp68aJb1gSQLlINwOHpA6wAThmVA/en2Mvb
	Z5O7BQ7rXveXT2CR6QmTMWhiMJfhX60kfEjoneZx9xR5w0eKUUhcMJ0yM0nqynFKz+3r0wo1ay9Ji
	O133Jy7+fnaVkv1onwr2oQ1L+zd8fjTyeO5vTJrj0iViDGw5z1UwnT+ewNiHBy/Q27UR92ybWvtRX
	UR1NfGR4HJu04enKKl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTm80-0000000ACQG-0gOz;
	Wed, 18 Nov 2026 20:19:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTm7y-0000000ACQ6-2dwp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:19:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7BA642DB1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 20:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5791F000C7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033173;
	bh=VIqubSxa6chp+PQfAvvw0Nq36rRNM/+XIF5m2rPT+yM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O1XCocHmC1uEbbj94W+sS5HN2aQj/aTWDgTaCJnorv60lbj1qrFLyAyz435tV64SD
	 hjiTpKQP1aBE5Xqtu5DiEyl6PUEt+xKRZPmPy8EcRVZ/gD+TO2QbbYVuo+tY5i/rc7
	 s7yKP/GovMGVe42SGHjiOot1t609AFaWZPHF4bm/5spD5boP/9q0vZOCG5uHrXy7z5
	 FNbVyGMdlFzI39I1E6Wu1jFhLAOzqUm8/3ZPdWX2oD48S9sxkvJ+IWf6g9VQODhygK
	 SYXFlpG6zoGOx49CIleiayWZZt/gXd6lgejMByp6jAVfvl9TaG8rjf7EAA8Yav0ee4
	 ohzqEJK5/qgmw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1783493e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:19:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHd47GQFpQWpcdbRo2HWNeJhI2Bfd1s6RxvwmVHgITXZJKG4uI00qGaPWDxXuLH+aHUbol5XPqp7tjdUJ4muSgh@lists.infradead.org
X-Gm-Message-State: APuU4Z8KNRf0mEGCAa7qX07ozvPCIxgRji7Ix6nKx2J85fP7woPO05o5
	fBaVDXEM8tSOOSfQ39qdmOCjklCPV62h2f7HrJGL+Q18F5A61q50EAkQSUpZIarNka/euD+0+nY
	pFcsCT07JjKAtAkq2F5mtEAcNGVaavPE=
X-Received: by 2002:a05:6512:3e19:b0:5bf:a592:1d6b with SMTP id
 2adb3069b0e04-5c1aa2b7054mr1382701e87.62.1795033172582; Wed, 18 Nov 2026
 12:19:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-ux500-dma40-powerdomain-v1-1-da8b6e1a0376@kernel.org> <av4CJkri6LQO9FxG@SMW015318>
In-Reply-To: <av4CJkri6LQO9FxG@SMW015318>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 21:19:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ZFJFTV6zY=SA+aHMQyjw4MQ8zFgWmUUBEoH6vKDLTsA@mail.gmail.com>
X-Gm-Features: Aa3M54pwwb9o1bjEenCJbSQCJmUNEtUd6VLIE0RDxP1yOLbxmTezi19Q1Oe1J4s
Message-ID: <CAD++jL=ZFJFTV6zY=SA+aHMQyjw4MQ8zFgWmUUBEoH6vKDLTsA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org
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

On Wed, Nov 18, 2026 at 8:53=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:

> On Sun, Nov 15, 2026 at 10:26:27PM +0100, Linus Walleij wrote:

> > Replace the LCLA ESRAM regulator with runtime PM of the SRAM device
> > owning the ESRAM34 power domain.
(...)
> > -     /* If lcla has to be located in ESRAM we don't need to allocate *=
/
> > -     if (base->plat_data->use_esram_lcla) {
>
> Does it break old dts's back compatiblity?

It would if they were using LCLA SRAM but there are no
DTS:es that actually define the LCLA SRAM, so we are fine,
all existing deployments put the linked lists in common RAM.
It was an oversight or "fix later", "technical debt" that was
introduced 15 years ago.

After this is fixed properly with power domains I want to turn it on.

Yours,
Linus Walleij

