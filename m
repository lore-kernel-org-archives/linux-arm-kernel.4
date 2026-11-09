Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B2606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CzKNPadA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P00gMXnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yST6EV0KWAnwiiwzVHXcXJaNi9Dne4qI6KCjCJnlp2M=; b=CzKNPadAuIKrwnhKd1zK0B8Ugs
	RhrBAGfCoMiJglc0Z+KOiEJoGCdR2TQdQ7eTspvjMdpBxC4KLjirRRzef8lRGQ3n8DxSmG4SRzSXt
	BJWfx2//nYK6tQ2MqlZfsRj77kUpBRXKPiWjIZn/PWux+kxeYZo6oCwGRxbt5L2Wgr8Z7VizZP+Ft
	JDsFqWG1H4SFR7Oz/247jXoUGs3jcOdjoUU2g7U6Fy442YOuFH/DowacbTNzYwfscgTdaCz9BryOQ
	2ed4NvhCcGEMMyV8moy1tSUCBZwee0WH9E4/H5stPXggJSm7LbXzV1BpAorASHcq6Ss+mwzbwExfk
	w8xjbWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSjb-00000001HoO-302m;
	Mon, 09 Nov 2026 17:00:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSjZ-00000001Ho4-3NjD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E429D63468;
	Mon,  9 Nov 2026 17:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0ADE1F008A1;
	Mon,  9 Nov 2026 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243640;
	bh=yST6EV0KWAnwiiwzVHXcXJaNi9Dne4qI6KCjCJnlp2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P00gMXnB194lgNZ/pOpAfEFBJxSH2rLwbV+pXfvvxV0AucuFEJ3PSVpP8VQNTD9tp
	 T8isWPRxyShgAMH2h6Jbasy/doRUWkR6Suck3AuxoIpK2W4KmMKnPn759rGEp+wMsw
	 9FmxTlgUuSDQigYQTurrFtbZbmnU9dr9Pnr4pofz6V+4+VFjfCRSjpeLZaH7+mOXLE
	 2Q7QCy3EGLCFv5mimODtseBM4vmfFy5LM5rB+pc51RTGsv3NLx7n900ydF3d52GH0l
	 KjZEcLvAgwn1SuXBwtRxId8AjqR6vTrajxDBMEPbuMhZTewTmcGHDb3UhggwVHyB61
	 4JvSrW78OpkZA==
Date: Mon, 9 Nov 2026 17:00:36 +0000
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
Subject: Re: [PATCH] net: ti: icssg-prueth-sr1: Fix device_node refcount leak
 in prueth_probe()
Message-ID: <20261109170036.GT18859@horms.kernel.org>
References: <20261030085851.2019-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030085851.2019-1-laixiangwu@cmss.chinamobile.com>
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

On Fri, Oct 30, 2026 at 04:58:51PM +0800, laixiangwu wrote:
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
> Fixes: e654b85a693e ("net: ti: icssg-prueth: Add ICSSG Ethernet driver for AM65x SR1.0 platforms")
> Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>

Same feedback as for

- [PATCH] net: ti: icssg-prueth: Fix device_node refcount leak in prueth_probe()
  https://lore.kernel.org/all/20261030085651.1944-1-laixiangwu@cmss.chinamobile.com/

-- 
pw-bot: cr

