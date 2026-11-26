Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AED606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AcrkHs8r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmniaB5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FomIFRqNcDYe4Uif/pDykgM4WPczRC7lkjTQd1DRayU=; b=AcrkHs8rMLPwEhMNZj1wqJUoZ6
	4NTEJ0siuRz1o3iLnJ7gnVZmKRkY49NcxMRFjGFIoIeldm4JS4WcO/dmSzqJ4v2spiGu1YscHGQW4
	m5onHoU9sBF/zPRou8nYb0ZCN5d2/hyHucNSmiJPziSBxs8H5Hz0aWuaY/mitQzzM54cej6qiuXjo
	uZRrIMIiFdyaZR0KAxWP1YcCohj3dS868wzCdA2UCJqpClXwk3iIyiDFt0+RvXZp1utabBFEni8TJ
	mYmj52FEAdB3WDFTaG/RwqRxxRmgFvg/J5SWjgU+TAKqsBEqqHx5r+bBVQdRjM1UBu+J5tKDYen+u
	AZkoaI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVah-0000000CVh6-0QSG;
	Thu, 26 Nov 2026 09:16:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVab-0000000CVgn-2b4N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1398D4602B;
	Thu, 26 Nov 2026 09:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639B41F000C4;
	Thu, 26 Nov 2026 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795684585;
	bh=FomIFRqNcDYe4Uif/pDykgM4WPczRC7lkjTQd1DRayU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JmniaB5V7A0mveMIagrKxgCcQ8uJ0ii87tekcvPqPkPhYBIH5BH3XgkekYNep/4LI
	 BLxXyp1WNtGnta7c7Av13In9YwMH0XQHyStVt/FLEehaBuWzd2y1lVgLpxqq3oq47N
	 FhCwPcMSwUtC6M+4nLJdHkLPFKuH/N6l/QXalKshvAODAqA3Iuz/fSUjSqhzQ+WLuu
	 uy8Iy8CV1Y41DTWm42KXwyWqfVn/y7E17Mb5pBFlpVzKf+SPR156CYD1uJTeH+sNQ9
	 22VN0nwHrVL2ZcVsSlVfOS1lnbpoqav8Jdah77zZZPtyBrpfvhp0upGJoNPNcZ6VxL
	 JCvFYNE9QAO/Q==
Date: Thu, 26 Nov 2026 09:16:19 +0000
From: Lee Jones <lee@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 05/10] remoteproc: imx_rproc: Avoid stale mailbox
 pointers on request failure
Message-ID: <20261126091619.GD38590@joneslee-macbookpro.roam.internal>
References: <20261123172140.3547896-6-lee@kernel.org>
 <20261124032344.5314-1-peng.fan@oss.nxp.com>
 <awZ-XC1efo5QQvNI@bombadil>
 <awZ_HjrhS3Uiyssd@bombadil>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awZ_HjrhS3Uiyssd@bombadil>
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

On Wed, 25 Nov 2026, Richard Leitner wrote:

> On Wed, Nov 25, 2026 at 07:23:37AM +0100, Richard Leitner wrote:
> > Hi Lee, Hi Peng,
> > 
> > On Tue, Nov 24, 2026 at 11:23:41AM +0800, Peng Fan (OSS) wrote:
> > > Hi Lee,
> > > On Mon, 23 Nov 2026 17:20:49 +0000 Lee Jones <lee@kernel.org> wrote:
> > > 
> > > > imx_rproc_xtr_mbox_init() stores the result of
> > > > mbox_request_channel_byname() directly into priv->tx_ch and priv->rx_ch.
> > > > Because mailbox channels are freed on stop() and detach() and
> > > > re-requested on start(), attach(), and system shutdown, a failure while
> > > > requesting "tx" leaves an ERR_PTR in priv->tx_ch, which is later
> > > > dereferenced by imx_rproc_kick() and imx_rproc_free_mbox().  If "rx"
> > > > fails after "tx" succeeds, priv->tx_ch is freed without being cleared
> > > > while priv->rx_ch retains an ERR_PTR, causing subsequent calls to see
> > > > both pointers as non-NULL and skip initialisation, leading to a
> > > > use-after-free on priv->tx_ch and an ERR_PTR dereference on priv->rx_ch.
> > > > 
> > > > Request both channels into local variables and assign priv->tx_ch and
> > > > priv->rx_ch only after both requests succeed.
> > > 
> > > I think Richard Leitner <richard.leitner@linux.dev> is working on this.
> > > 
> > > https://lore.kernel.org/linux-remoteproc/CANLsYkx=M_TXN10qAcQC0be065TYnzfOae6E8ss-9DTj9MzogA@mail.gmail.com/T/#ma2f8e4c332d47e5bdd1787f82f4dd2feeafc67d6
> > 
> > AFAICT my series fixes a similar, but other problem. Mine is about the
> > free'ing order and a possible race when a kick occurs during
> > cleanup/close. This one is targeted towards the setup/initialisation.
> > Therefore IMHO this is a valid, fix for a different problem than mine.
> > 
> > What's your opinion on this Lee?
> 
> Sorry, was too quick with answering and messed up things, as this fixes the
> sashiko finding, not the "my" initial bug. So for me it's fine if we keep
> this one, as I have not sended mine yet. ;-)
> 
> Therefore please feel free to add:
> 
> Reviewed-by: Richard Leitner <richard.leitner@linux.dev>

Thank you Richard.

-- 
Lee Jones

