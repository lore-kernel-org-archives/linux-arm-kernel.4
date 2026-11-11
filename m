Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97837606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 23:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H2fo775S;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ev3vVVLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yQjKNXoDon76Ssw1IpfiyfUtDBeNTptP/9FUZ13/vxE=; b=H2fo775Sclgifi
	TUbTYQLcCAtxgxBE+xhot9Z3Jxvd2jwH9GLHoH1pM7WfI1rvXxAENMrubZozS+iwHBcZls6bsYan7
	z6q2rG79yns7kWbQQGri1EK81p+jYd0664xsNjpNTjCIrQIf5VR+0d3sDoh0BE9QdxQ64UB/TK17L
	Tdxeg1x5quD/Wq2vrJTsDfYHxDWs89Py94sEHvukBCL/RumPjUi8H9SYUWsiXWC83g+4zQEbgvOyk
	9QzUjrXF7Yxq8SGvnbGxbQ0j4fX9U/aLibxRLcFCK/OZmc4u5zpb/eSCZC3bgj4rS/3DCjfUwfh25
	Jy3ktxBmrUMp6z73y33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHbz-000000087Ra-2kxb;
	Wed, 11 Nov 2026 23:20:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHby-000000087RR-2Lqg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 23:20:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 980C363BD7;
	Wed, 11 Nov 2026 23:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6EA1F00A05;
	Wed, 11 Nov 2026 23:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439213;
	bh=yQjKNXoDon76Ssw1IpfiyfUtDBeNTptP/9FUZ13/vxE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ev3vVVLSrdc8640RaxbsrKw/kjFMH3DSEjlw5uuzEqmSILi6omR2iQaOV9VnvDdfG
	 ALFjB3KBzAT0SRd9XmKYbHcyIvk8UD82o01Icvjopm5tSpGTBJR6uvTi/MH3cZXITx
	 ZRg2b/rx3BJiGkxzoU14C5PU4LtDUeWzR4OszLncGgV/dL2GoPlXN1qFlmTAXIZEdr
	 lhlSTVpNRDVuvdDtZNCXJT6BvrUZsPNBeAwTXyXZg1f5OKD2xK4I+5IOy3sSnFp9M6
	 ZBfX75zlSHo1191lf8iZhkicL4PBkl5Qj4fzn3qBDdaXB+a2TnblFzT0s6sLh0o7Dt
	 CSltpnCkIJzHA==
Date: Wed, 11 Nov 2026 15:20:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sinfo@kernel.org
Cc: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com, rohan.g.thomas@altera.com,
 rmk+kernel@armlinux.org.uk, o.rempel@pengutronix.de,
 wojciech.drewek@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v10 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
Message-ID: <20261111152012.3506cf35@kernel.org>
In-Reply-To: <179423231463.488859.16977464890948797360@kernel.org>
References: <20261109134506.2794160-1-zxyan0222@gmail.com>
	<179423231463.488859.16977464890948797360@kernel.org>
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

On Mon, 09 Nov 2026 13:51:54 +0000 netdev-bot+sinfo@kernel.org wrote:
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.

You are at v10 and still getting these automated emails.
What's going on?

