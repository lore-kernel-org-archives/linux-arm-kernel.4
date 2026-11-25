Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19437606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sK2rhQof;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B/A7/pdu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eHsoi+0RuIsOwYDrm4lJh1qS5ZzfodjXVxY1o2URryM=; b=sK2rhQofOC3FhOikHQnY1B2bo7
	caoJ4ieC5eF7ky9stl1DKwV2kxyIcN5R66cyKgdhC0nnTVQGoGIwm+3FH5+NEuULjGx/Rntma6bZ0
	Sz/C1TC1RyLytzteGuPZ8wdZ7+fFm3FGYo34AP3WbIlBOdteJbbr1ASBLj7CyMNYM01yvxtQ3Dpe1
	t9SoI+tck1VcsYOzykFrAOf8s5jKDaYy/PL9/T1mAACkfOWTz+ScGDoVArkuK6Nz2WN/CiFsym19S
	ugSo7w0pYF5npSi6UI+v/uTzweTnKyq/vK2u1jXAoya9PA/8iI2McPTCFNTB27lQUYS0Wn9mV1tvP
	3MI1VBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC08-00000009ne2-35qn;
	Wed, 25 Nov 2026 12:21:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC07-00000009ndY-0wYv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:21:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A67E36015B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F76A1F000C6;
	Wed, 25 Nov 2026 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609286;
	bh=eHsoi+0RuIsOwYDrm4lJh1qS5ZzfodjXVxY1o2URryM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B/A7/pduFevS+EDAXTfLd0ryOsu0GdCM/9NTpqcUJrMCsIH2M46VAG6evrahYf3pJ
	 94o/yZI1VnTqFJjgY7UMiueCu8sgfm02lcnvjXv+LFMgymzGLgo2IMWSBzIA+hHB0V
	 ciu1PosgwPh9Fez9YTcKEUD0amsraY7WhrU40yzNrZhrwiMWWBVA4k+anTKjkC6C4R
	 +FcyRRCLdYWTXMd0IupLQC/VSFf9iUrETAKOSMV3JvdhLWhRcnSC9DGli36sbQnB/D
	 yvul1n3Rrk+89Ll7fPZ/mBeX742BE8SkYOHGh+eAhPUpWIs6jR9SNXuwY6cFEyWrN1
	 EaAgELpMWDqIg==
Date: Wed, 25 Nov 2026 13:21:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 Powerdomain DTS changes for v7.5
Message-ID: <20261125-smooth-miraculous-eagle-ae81f4@quoll>
References: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 07:18:55PM +0100, Linus Walleij wrote:
> Hi SoC maintainers,
> 
> these are the power domain changes for Ux500 for this kernel cycle.
> 
> I'm especially happy about this one because it pays of a huge piece
> of technical debt as we started doing things wrong in ~2010-2011
> and then have tried to back out of it for 15 years. Related changes
> to powerdomains, mfd, regulators, clocks, (also bindings) etc etc
> are merged into each respective subtree.
> 
> I also have a large set of DT fixes that I might send for this kernel
> as well, on top of these.
> 
> Please pull it in!
> 
> Yours,
> Linus Walleij
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> tags/ux500-pd-v7.5

I think I commented last time. Please, please fix your mailer. You keep
stopping me from simple line selection and pasting.

I applied this one.

Best regards,
Krzysztof


