Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quU4Nnhs;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=MLR3zfAX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kj91ruAXFWtpquSVovP4UbrV+4Yba9A/2t3iM/rZHdc=; b=quU4Nnhst248ue
	XtsFZ6o9MsgAgnsjOI9X1YwQ63g2wke7k+G2YIRcEBoNFxCDdDs5iaEhgjy3u71uldKMRmLmgz0Ip
	VUy06QMlzMiYWAykFshBesrgHc4QMqewvE5E5IXfY+jFK9bADUgTnf9ADI+pK3qSC1mWo9tTKArYS
	zKbSsUYwAUR6GdbZ0XMeMULxYPQEZz9CDwWD4FRUskin1BCg6m5c69DDWZjNA8igahNrH3h+F+fCB
	gqKt340/yFrrJ87en5sBKwL6OUnuXFNltaCXcPGpbYFfbrzy94UgYJQq7m5BggRBfB+5Sk2exUzvq
	HyWwRuH1AcaM4IXriWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2t4-00000005vcy-1JVF;
	Wed, 11 Nov 2026 07:36:54 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2t1-00000005vcY-1PUk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=kj91ruAXFWtpquSVovP4UbrV+4Yba9A/2t3iM/rZHdc=; t=1794382611; x=1795592211; 
	b=MLR3zfAXGTFq+KJMmTowpKS0bRUkMj3xV12f5PRM1qZxgDTKyJlfM7OJUMReoXQYfHsdOvEDX25
	FhZLhAKxbOAmDhKRn7C4FK2BMZLGQZh4nTKpda8iOkFCa058Wl0RVdwgy4nWDnY6c+8LAHA3mlZoB
	RyLvu4el/BZ5QmNn/rXboOF+x+JcoZPanUSSyCp5n52RhJMiYnhJi1w6/34PtKDMPbrV8xpgY7cO1
	d9F4uiWwFP4VMMLHn5u9pVMf2RVHlgIKAP9P1sGBXNAzfU/CeOxA1ML2JntjF3FgXTLXoauwPRka/
	uyqAvDq6/HaGicXPFyxfqRUKwpHGViRfOVPw==;
Date: Wed, 11 Nov 2026 08:35:23 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>
Cc: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com,
 linux@armlinux.org.uk, andi.shyti@kernel.org, thomas.richard@bootlin.com,
 wsa+renesas@sang-engineering.com, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: OMAP2+: fix omap_device with noirq_suspend
Message-ID: <20261111083523.657cb7a6@kemnade.info>
In-Reply-To: <7hwlqktdww.fsf@baylibre.com>
References: <20261110211531.679943-1-andreas@kemnade.info>
	<7hwlqktdww.fsf@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_233651_403037_77BC9526 
X-CRM114-Status: GOOD (  16.45  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 16:22:39 -0800
Kevin Hilman <khilman@baylibre.com> wrote:

> Andreas Kemnade <andreas@kemnade.info> writes:
> 
> > Fixes cases where device runtime gets resumed in _suspend but then
> > pm_runtime_force_suspend is used.  So the device is disabled, but runtime
> > active in _noirq_suspend leading to duplicate runtime_suspend calls. So
> > rather check for the device state directly to indicate if changes are
> > needed.
> > This relies on pm_runtime_force_resume being used in a balanced way.
> >
> > Fixes: 7da7fd7e66ac9 ("i2c: omap: wakeup the controller during suspend() callback")
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > This really needs intensive scrutiny but might be a less invasive patch
> > solution better suited for stable and paves the way to get out of the
> > omap_device theatre without too much hurry.  
> 
> This looks & feels correct to me.
> 
> I also tested this (along with my WIP patch for that NEON count
> mismatch) and I have a very stable suspend/resume on OMAP3.
> 
> I tested on omap3-beagle (retention) and omap3-beagle-xm (off-mode) and
> both are now reliable across multiple suspend/resume sequences with
> these two patches.
> 
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> 
Then feel free to ignore the RFC and apply this one.

Regards,
Andreas

