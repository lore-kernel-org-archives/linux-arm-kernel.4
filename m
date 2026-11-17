Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5CD606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=en8ku/Ui;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCoFj8Md
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ivv/HLtWZDGXndFoIoonS7iWYOytgA6TsI5iBjC2yfA=; b=en8ku/UiEVKr1z
	AUiaOgBHHVgfjY0Gq0m6Jb5ymzn0mlMrTQ+JfmYvgDYGHMVsYpKiteD97UeI/qgT9USvlRA/13KtZ
	Q8rpVYqrhOS2UOu/GHAcqTxXCEcrQ6cMAoq3+hZGLt0A+LFsGCAJn6RO7xIipUKWIi+A18hcFQm+I
	yf62Ak8HdeTKbbeHUBFLiDt0NF/go/4Ihz7awzmK5EobD10x1qT6DWCDrYz9yufHQ6qK9FjREG/1W
	qm5+/ZJIkwuLhMtwEiX/2nz0dOM4ayycUl0084LZVrM5S8miIkBrDlAOiVaRtngslQaYwfrjSdwZO
	8jCg0eQZkL243TFtYd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQdy-000000076u5-08XQ;
	Tue, 17 Nov 2026 21:23:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQdx-000000076tv-2DeF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:23:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD54F611FA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4F51F000D1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950588;
	bh=Ivv/HLtWZDGXndFoIoonS7iWYOytgA6TsI5iBjC2yfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VCoFj8MdgqdEFCHkQ1FLZUjelaP5AG6aHLrJ7d5hOiWCxD263k3m9KlBhNNw+9c9L
	 RBp9xLGFz/7nkx1DObXHq0L4eOpIH7E1XpTlFd/pAuY418HFGbuYfy3daAvXULnRfQ
	 nB0MxepBtz3QipkhKvZCnD2DBjDpZnljIi9tkSJ4ws4QIYzUNcz6jIrEKDa7l+m96c
	 iHGx3r72BiV/XTciukTjTCdn/R9Oy1+VNDXw1Oxf5AcdGjnTgaAkMGMZMUGIs6C7/C
	 wH4q1fNg7dsM5Ywi8Fxdks60KQu8vSyc7AHieXzPA4P2/CaBZ9aCdxj6SWUCNh7D5/
	 OL9zkM2OEsR2Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be4fea434bso1266141e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:23:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEV9agsezwLjH61FrOtqRZdkqcG3RX1wsBQH5lPbk6W2rliIWktujjgpldevq+aB2bdx1axTaPYsicJEnBuW8uc@lists.infradead.org
X-Gm-Message-State: APuU4Z8FNZEItvhXpvRaicn/0ZGRv52Oz1DP96wPhJSLH8epzhgF1A+8
	gAd3SxcfktRGMnBwLBwibEpv7EFSAFs/TD3FW3Oo9Ylr/daFX7ZLofeqZPq81P9h2GOv6icndpt
	vmuJDwN3F28cU4soJ49qnaTg/AlDsYeY=
X-Received: by 2002:a05:6512:3f2a:b0:5c0:b5f9:2f2a with SMTP id
 2adb3069b0e04-5c1a0ef7bc3mr1357421e87.13.1794950587167; Tue, 17 Nov 2026
 13:23:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com> <20261110070803.1099-2-zhaofeng2@cmss.chinamobile.com>
In-Reply-To: <20261110070803.1099-2-zhaofeng2@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:22:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLn665uHMJ7FqWvdpvrmV+6swhrNpc-yLx20+ADtzJpKUg@mail.gmail.com>
X-Gm-Features: Aa3M54o44UuunTchrwBVQk0gW-Li5wccYbCfQryWhAr0YYMlTOz7y3tpa_12JhU
Message-ID: <CAD++jLn665uHMJ7FqWvdpvrmV+6swhrNpc-yLx20+ADtzJpKUg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: ethernet: ixp4xx: fix OF node leaks in ixp4xx_of_get_platdata()
To: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Imre Kaloz <kaloz@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Tue, Nov 10, 2026 at 8:08=E2=80=AFAM zhaofeng2
<zhaofeng2@cmss.chinamobile.com> wrote:

> From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
>
> ixp4xx_of_get_platdata() resolves the NPE and the RX/TX-ready queue
> phandles with of_parse_phandle_with_fixed_args(), which takes a
> reference on the resolved device node, but the references are never
> dropped, so the NPE and queue manager device nodes are leaked on every
> probe.  Since the DT parsing happens before the -EPROBE_DEFER check
> for the MDIO bus instance, the leak also repeats on every probe
> deferral.
>
> Drop the references with of_node_put() once the phandle argument has
> been consumed.
>
> Fixes: 95aafe911db6 ("net: ethernet: ixp4xx: Support device tree probing"=
)
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

