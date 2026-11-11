Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35CD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQ6cuTCD;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=o8LQq9ub
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IHAJ9cUkaGN2FveJz7xOzh7H5WecsPhTKQF1RWuJHWA=; b=aQ6cuTCD6qB6C/
	CUvnkFcQyWMdP5UPEgpBTdZQPPkLtEEs1Pb48VXeuIwf2zKfdp+FN4WqluJplSEEehkRtjzI5knFc
	dSyAU3o/KHNET9xKBplhNRWNQG4NrDlrNfMF9nA7/9ocp2UJCT5o5G2KHVwgdof7t65UJ2fbEdvb+
	fBEdDJe0hQNErnQdTEe357Tq0pB9htxzYmTsa6RzBBS4h46GmTC39VI+lx+kd05tkeOL1U/DPpoem
	Rv+e337MsL8hR2/EEvFYUCNbfc4CImmz80W4Hqbk94oSkWX89ly7lJuRbd9o1aLl1BTaweODhu0zI
	KRnilKIQIhNW5vlrlUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5So-00000006Kqk-3FKc;
	Wed, 11 Nov 2026 10:21:58 +0000
Received: from mail-24416.protonmail.ch ([109.224.244.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Sl-00000006Kpx-1zcy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794392512; x=1794651712;
	bh=IHAJ9cUkaGN2FveJz7xOzh7H5WecsPhTKQF1RWuJHWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=o8LQq9ubpri/Y2Qjv1C1uK9ykuOfToXwAtssQ+VDqhP7mmgXzJwKy+DvDeHFS+42e
	 lIhP5uRzFZ61cl07qEbB2CmXBrHLWH7XVXyeQkokuwghPfxOzSH4WA0kBu1oJQygGK
	 whfFQmKBmz4bhmS9jeMaOr2Fuoe8MTTYOQUPqdYkX4DVw5FIC2kXL1XL0I4qCu+EpR
	 oP9lhE+uyWtukJBQA9uqUV7k3MaDX4+qFabOlxwC6EJVOOmOjlKuC0qPZ4Zq/b2kMI
	 5v3eAT7l+AwHtzkYpW3HRrhJCIEseLVgTrq/+wvv+rtGovzCKJ+SVl8FltuWf9Z0LF
	 JWZY0Txhrqkgw==
Date: Wed, 11 Nov 2026 10:21:48 +0000
To: Chen-Yu Tsai <wenst@chromium.org>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for domain creation
Message-ID: <20261111102143.16afb567@ben-desktop>
In-Reply-To: <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
References: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch> <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: 269b96da12c9779b1ea33301a5cd0b8c5acfc692
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_022155_677135_C1741B7A 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
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

Hi Chen-Yu,

Thanks for the review!

This v2 was sent by accident while I was testing my mail setup, which
is why the changelog was left unfilled. My follow-up saying so is still
stuck in the moderation queue on the mailing lists.

The patch itself is identical to v1, so I assume v2 can be applied
as-is with your tag. If a v3 is needed, I'll carry your tag over.

Best regards,
Ben Grisdale


