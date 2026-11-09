Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1CD60A263A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UoV+Fym9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RiDATvMr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WBEAXWn/Gapt4KuRgUjdXuXmF6aQgvDHYaPeKeySe5M=; b=UoV+Fym9s3oCQBNeQM0RuzW1TQ
	DYSugG80Fhwqjz2AUs88SG6Ag6v0gZX8+nNP1iN51mx2Qee+7GEYjxdsmhxvuhb95Vkx9xEG2Py7W
	ajwYhz1dgx/GZlIMs1EPILJs2hNRhApKdayNw044f1RmKcUEl1flKQsd/mNWu6O52rTxpOUcyzHZr
	MMsED/x8Ywy5PH951P3vMVm1BSjcCXdqgEuTbukkDtsQACQ9NTN89NsYouFkIld4S/6T3cwTiCde3
	fCEO0nUhhKPBVlWb6E7WnA6sAefANCe7ivU291av0SkTqdOcKHU6PAttIU3Vmfhl/dsJCR2pFRU9j
	KktPBlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSbq-00000001GPT-3aIa;
	Mon, 09 Nov 2026 16:52:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSbo-00000001GN9-1o8G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:52:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C076F45AF9;
	Mon,  9 Nov 2026 16:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF7A1F008A4;
	Mon,  9 Nov 2026 16:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243159;
	bh=WBEAXWn/Gapt4KuRgUjdXuXmF6aQgvDHYaPeKeySe5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RiDATvMr5i+6a+a/3TSoFjEem7mY9e+KGFYsasZ3YUc+Rw8yN0EuQeD1kXOWu9fXW
	 cExmFrfntUc2ac0z86BKSjvl7FmL+KvI4boWTfTT8zUjyai0stzJkOFJF5pTvCeqZf
	 rMvx4g3ZqxyuP0hAqN5gY80niOdZ10INxgte3pm9I3kDedKTsG1NLgbGZUsII0RjJj
	 koCeqz1+qPnmOvFjAfal+mId6Ct8lT6dhBmMaOdHpA9MgKdLHsDz1iRy0OMTkXZrtb
	 83/gp2GuHwViHaPHJlXOENgaxxUULz++FZwv35N13/g8Pl7rU74mVtgit2y38IlUsS
	 1LmUTEwg6z9Qw==
Date: Mon, 9 Nov 2026 16:52:35 +0000
From: Simon Horman <horms@kernel.org>
To: laixiangwu <laixiangwu@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ti: icssg-prueth: Fix device_node refcount leak in
 prueth_probe()
Message-ID: <20261109165235.GR18859@horms.kernel.org>
References: <20261030085651.1944-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030085651.1944-1-laixiangwu@cmss.chinamobile.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:56:51PM +0800, laixiangwu wrote:
> prueth_probe() takes references on the eth0_node/eth1_node device nodes
> with of_node_get() and stores them in prueth->eth_node[]. If either of
> the "ti,mii-g-rt" or "ti,mii-rt" syscon regmap lookups fails, probe()
> returns -ENODEV without dropping those references, leaking the device
> nodes.
> 
> Jump to the existing put_cores label so the error path releases the
> eth0_node/eth1_node references like all the other failure paths in the
> function do.
> 
> Fixes: 128d5874c082 ("net: ti: icssg-prueth: Add ICSSG ethernet driver")
> Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 591be5c80..9b971d1df 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -2258,13 +2258,15 @@ static int prueth_probe(struct platform_device *pdev)
>  	prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
>  	if (IS_ERR(prueth->miig_rt)) {
>  		dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto put_cores;
>  	}
>  
>  	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
>  	if (IS_ERR(prueth->mii_rt)) {
>  		dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto put_cores;
>  	}
>  
>  	prueth->pa_stats = syscon_regmap_lookup_by_phandle(np, "ti,pa-stats");

Hi Laixianwu,

Thanks, this patch looks correct to me.
And I appreciate your feedback to the AI bots.

But I wonder if this nearby check also leaks a reference,
because while it drops one, wouldn't there be two if the
condition is met?

        if (eth0_node == eth1_node) {
                dev_err(dev, "port0 and port1 can't have same reg\n");
                of_node_put(eth0_node);
                return -ENODEV;
        }

Also, for future reference, it would probably be better to put
two similar fixes for related drivers in a two-patch patch-set,
rather than posting them separately.

