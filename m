Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C05606A405
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KTZhM+ar;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YkdDtHy+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0LtJx1KBdKZ3ZI9o+1o9OL4PdjTAWomKB8/BPDT/SD0=; b=KTZhM+ar8uOan4XjBItbxzVfkk
	DOA4qnwlhTKSf6aaHAu1BoRHPO5tu9d/T4jubtjTNLl9tDaxZ+Z9YndCC7gvGWfkIHzJlV6p6YXq0
	ObLWPGbiP7GN1MHtJkyc1FIX/q7MC7vtKkZmHm/lLVeh/QJwXQpP+UpvUEsuIDKE7VEuyjnS3g6s1
	/jWyhhOaRCxYS2y2n7o3w1jNR5yrq4S7fosPINEzNpsn1JiNPnKxw1KqcDK8OaW3mfs3gstCOJuoj
	bTibyrXt8L5WwyZqvrg7+vNh8npvBM3byWgVXO/D7FxIr2s7Th1t24SY3w4A59pmGZ5EPKyshbtRm
	8DzaBbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSi7-00000001HYN-0k6m;
	Mon, 09 Nov 2026 16:59:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSi3-00000001HXn-3K9k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:59:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F4CA43BF8;
	Mon,  9 Nov 2026 16:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206DA1F0089F;
	Mon,  9 Nov 2026 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243547;
	bh=0LtJx1KBdKZ3ZI9o+1o9OL4PdjTAWomKB8/BPDT/SD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YkdDtHy+qUXMzro+ShPKwWhd+3eoje6rcc8REtdlq+GzPlEKx/FX1XLP8HJIzjnCS
	 LBzu6hM+FMkCAkNgSRLhp9l6Pv5At6OagWFMo5D0n7dMk1bcXI/PAyvNiqkbro8AS5
	 22gVeGaFzTTOufvA9GvJQlafIp3J+EYshbU4T8AcT6v2WBoy6NgFBf+/Yy5uNgpc9A
	 qDPeOCMd52uH0/k32oJlx86dZWI6wimi5fyp3QaiPWHuoqjtpWHyHGTxd1jkQ+bQYn
	 SRWwmnAdKIO1wFUtG33y5asWMHolyYpQH1ImqXgZ2of5Nc/J7z40oXXsJFC33OBD0j
	 krQH/VG9PHmwA==
Date: Mon, 9 Nov 2026 16:59:02 +0000
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
Message-ID: <20261109165902.GS18859@horms.kernel.org>
References: <20261030085651.1944-1-laixiangwu@cmss.chinamobile.com>
 <20261109165235.GR18859@horms.kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109165235.GR18859@horms.kernel.org>
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

On Mon, Nov 09, 2026 at 04:52:35PM +0000, Simon Horman wrote:
> On Fri, Oct 30, 2026 at 04:56:51PM +0800, laixiangwu wrote:
> > prueth_probe() takes references on the eth0_node/eth1_node device nodes
> > with of_node_get() and stores them in prueth->eth_node[]. If either of
> > the "ti,mii-g-rt" or "ti,mii-rt" syscon regmap lookups fails, probe()
> > returns -ENODEV without dropping those references, leaking the device
> > nodes.
> > 
> > Jump to the existing put_cores label so the error path releases the
> > eth0_node/eth1_node references like all the other failure paths in the
> > function do.
> > 
> > Fixes: 128d5874c082 ("net: ti: icssg-prueth: Add ICSSG ethernet driver")
> > Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
> > ---
> >  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> > index 591be5c80..9b971d1df 100644
> > --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> > +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> > @@ -2258,13 +2258,15 @@ static int prueth_probe(struct platform_device *pdev)
> >  	prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
> >  	if (IS_ERR(prueth->miig_rt)) {
> >  		dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
> > -		return -ENODEV;
> > +		ret = -ENODEV;
> > +		goto put_cores;
> >  	}
> >  
> >  	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
> >  	if (IS_ERR(prueth->mii_rt)) {
> >  		dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
> > -		return -ENODEV;
> > +		ret = -ENODEV;
> > +		goto put_cores;
> >  	}
> >  
> >  	prueth->pa_stats = syscon_regmap_lookup_by_phandle(np, "ti,pa-stats");
> 
> Hi Laixianwu,
> 
> Thanks, this patch looks correct to me.
> And I appreciate your feedback to the AI bots.
> 
> But I wonder if this nearby check also leaks a reference,
> because while it drops one, wouldn't there be two if the
> condition is met?
> 
>         if (eth0_node == eth1_node) {
>                 dev_err(dev, "port0 and port1 can't have same reg\n");
>                 of_node_put(eth0_node);
>                 return -ENODEV;
>         }

Sorry, one more thing. Which is not strictly related.  But as we're on the
topic of error paths in this function, I am not convinced of the validity
of the value of reg being used even when the call to of_property_read_u32
fails in this loop:

        for_each_child_of_node(eth_ports_node, eth_node) {
                u32 reg;

                if (strcmp(eth_node->name, "port"))
                        continue;
                ret = of_property_read_u32(eth_node, "reg", &reg);
                if (ret < 0) {
                        dev_err(dev, "%pOF error reading port_id %d\n",         
                                eth_node, ret);
                }

                of_node_get(eth_node);

                if (reg == 0) {
                        eth0_node = eth_node;
                        if (!of_device_is_available(eth0_node)) {
                                of_node_put(eth0_node);
                                eth0_node = NULL;
                        }
                } else if (reg == 1) {
                        eth1_node = eth_node;
                        if (!of_device_is_available(eth1_node)) {
                                of_node_put(eth1_node);
                                eth1_node = NULL;
                        }
                } else {
                        dev_err(dev, "port reg should be 0 or 1\n");
                }
        }

> 
> Also, for future reference, it would probably be better to put
> two similar fixes for related drivers in a two-patch patch-set,
> rather than posting them separately.

