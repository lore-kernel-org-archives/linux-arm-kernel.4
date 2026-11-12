Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E93606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w5CsCNOn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZK4sQ/V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pZyA3EpLAz0HwtOG8dc+2ffMftVNufhrgpMkSG6Hj+k=; b=w5CsCNOnWkwq2f
	8/04NOH1KUI5PmXVyDcNTL1IKTnTcQbjkFOwncjTVnjnYNz1QtX59zShTjBYZVbj10Ul5XBCvSbnG
	yaAhvg3uJg/8H/vrHKoE3sCOQc8d+PVxLpvHrw9NDFHVkE445/azGp74/FALtsg7TIgfXkVxMTmRk
	zKgjuLOU7XrqnEgr0eOE32uScWrM6cjd8y1WcIpaU5hxYpbJUeXd+L2u83No15/u5hm6mjr3WZhcm
	7Ck/LRActlOOSufJHg+8sP44ViYAWIt1O+SxrypZVjFSH0CPLKSVLeEvRE3+uBJK6b5opjQN4PpN7
	eJh2iOnwXJH6q49eq+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYjY-0000000AmDi-14Dx;
	Thu, 12 Nov 2026 17:37:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYjT-0000000AmD1-2PJj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:37:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 523FB401CA;
	Thu, 12 Nov 2026 17:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1D71F000CA;
	Thu, 12 Nov 2026 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794505027;
	bh=pZyA3EpLAz0HwtOG8dc+2ffMftVNufhrgpMkSG6Hj+k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mZK4sQ/V61IBTdDb/xUTCzQeB8Ui+G8oORNL0r//144FNjWK3EMCM/Gfnt0KhgZr7
	 mP912F0KK44EoxEL9WS+cG9JUxy87cF5EMWYmYfo4jJBTMtxard1iTBFyAF0a16ZBd
	 2l1QVVb6zj5xSERDw9/g1cXjUxgsBynF25Fyqnq7T8jkjaicCd66yP7S32oq9k+rQD
	 sJZxX84VsJJtArLnhyVkeNn9d/auOrnsnvOQGSzL/a3JmX0rIAfOjNEj3Hbuyh6n0c
	 GoTaBS4geV+PxRVOSF85VHrgmcjx/h5k/ZVGk4Rhg9OOUR4iZ2js5xsLTJUXkI99nH
	 NnUlxmeGCSZYg==
Date: Thu, 12 Nov 2026 09:37:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 jan.kiszka@siemens.com, diogo.ivo@siemens.com, haokexin@gmail.com,
 horms@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net 0/4] net: ti: icssg: Fix device_node handling in
 prueth_probe()
Message-ID: <20261112093706.55e00f17@kernel.org>
In-Reply-To: <20261110150500.3142-laixiangwu@cmss.chinamobile.com>
References: <179429318364.488859.2256720144223130993@kernel.org>
	<20261110150500.3142-laixiangwu@cmss.chinamobile.com>
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

On Tue, 10 Nov 2026 15:31:38 +0800 Xiangwu Lai wrote:
> The same information was provided for the v1 postings of
> patches 1 and 2 here:

If only you read the message the bot sent you would would know that
you're supposed to add this to the cover letter when respinning.

