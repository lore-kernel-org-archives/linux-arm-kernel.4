Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BE6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 00:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oDOq5wjw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flsXT5+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iV+es/fp+vyxHucc03Dfn1TU20M5SwM8Ekj9KO5fn7I=; b=oDOq5wjwKGvU1N
	pK4ZPQQq+NcseDIFTq8UDmpr1PYtWyAdunhIkSavcpl4/d0OU65GnvxVrUjDvthvFzOE+0tIDjxsb
	/sL0wqEJIuXWlqUtAD0USaCseeWGQ8yJiOenovsAeuZQTSrRwkDeGPdjqDVFpEDMjRiY1wRicS1yk
	VqGTv1SME9nJi26JOFFVs8Qb8DYk6ROyYhQ7HNFwTSBKhdSIa2axwqaSp32ScMI4d4yF4SAr9Uehm
	UoyQUoa3CRu+AEp44vKFyH1tDOaBf4wdws6Z7bd9buAY4tXGEb1yLu0QfpoRUYYBa3bo3EhtpIf5p
	XTr6rlN/OwRiJ+aEr7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRInv-00000008GG2-05TZ;
	Thu, 12 Nov 2026 00:36:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRInu-00000008GFZ-0G6C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 00:36:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63FCF60052;
	Thu, 12 Nov 2026 00:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDEE1F00A05;
	Thu, 12 Nov 2026 00:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794443797;
	bh=iV+es/fp+vyxHucc03Dfn1TU20M5SwM8Ekj9KO5fn7I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=flsXT5+tcmj//681j+iBaPwWWx0hanIAZykaBz+rgOLLDtZ1xxZXmSt3dB5qM/SPs
	 wdpCgLiAom8akYYjG0liOHd7gU+7fRdZ+oihZdhx1pGYQcFoN3/bcFcRvYxsP/hpun
	 0iswwTIY1P9x5NS5ItKQ1ht9jC6WbAavlvJ1OKew5LxrAl9rlLLPfZ2HZ81qWj+o87
	 6+tm2ylVXkowdAOPZM0p+5gDOJyq1wKGUtlrh/J3YIKWZ7YKsqyQ/HDL/h3nYGJYqn
	 aEr3hCtDmMDNKsvq52WuSx+pJq7kOtOGRgyeDc/NdmwjHRT2uYNo/x06q7FKJrAdX9
	 ytbLjEzdrzP6Q==
Date: Wed, 11 Nov 2026 16:36:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ding Hui <dinghui1111@163.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org (open list:STMMAC
 ETHERNET DRIVER), linux-stm32@st-md-mailman.stormreply.com (moderated
 list:ARM/STM32 ARCHITECTURE), linux-arm-kernel@lists.infradead.org
 (moderated list:ARM/STM32 ARCHITECTURE), linux-kernel@vger.kernel.org (open
 list), dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
Subject: Re: [PATCH net-next v6 RESEND 3/4] net: stmmac: release descriptor
 resources through priv->dma_conf on open failure
Message-ID: <20261111163635.042fc7ec@kernel.org>
In-Reply-To: <20261106090507.1020751-4-dinghui1111@163.com>
References: <20261106090507.1020751-1-dinghui1111@163.com>
	<20261106090507.1020751-4-dinghui1111@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  6 Nov 2026 17:05:05 +0800 Ding Hui wrote:
> __stmmac_open() copies the temporary dma_conf passed by its callers
> into the long-lived priv->dma_conf before setting up the hardware.
> When the open fails after this copy, the descriptor resources now
> belong to priv->dma_conf, but the error path returns without
> releasing them and leaves stale pointers behind. The callers then
> free the already-copied resources through the temporary dma_conf,
> which aliases priv->dma_conf after the memcpy.

This patch is not sufficient, as AI points out.
The duplicated error path on failure of __stmmac_open() indicates 
the state transitions need a lot of work.

We need someone who knows what they're doing to look at it.
You can't even read what the series info bot is asking you.
Please *DO NOT* send any more patches for stmmac.

