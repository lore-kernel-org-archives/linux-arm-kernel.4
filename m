Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C95606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p8twqwJ5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeDIV6bs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OKIk6rnFZ6VmNTZhn1YkBpy13BJSr4y4E6v2+iMZxUI=; b=p8twqwJ5ZAZFnhuYOhSq7SKxQO
	byhcC9BoITsS18KpiHSNgW1C7eh3PftRms0e05uHl4GKXD/xEbkdI+iixk4z4XoyRJBae+KxJToLv
	SPFHtTxL3BN8Ii7iBiB54fnd14la846+VHWZfBp3vTq28/x2y83WeaOcITnIy/o6vy6ozHKRbh1fR
	bJmQoBRJVlsA+hCOc39sEiB8mU3nwbGOSHCa7yj2QveEElFC+1QUjI7Ixz4X5z8j11FPf8zO+qyGf
	JlvQWTSr45QILsQ+m7aepE/0IJxBmbuI3DG8ye3hObCrgSTpAOat+U8XdSMI0JCEjJb7N4dLvmNWg
	O6kUwTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWSR-00000001iEJ-1Vu3;
	Mon, 09 Nov 2026 20:59:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWSP-00000001iDy-3ltK;
	Mon, 09 Nov 2026 20:59:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C47660F2F;
	Mon,  9 Nov 2026 20:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878741F0089F;
	Mon,  9 Nov 2026 20:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257952;
	bh=OKIk6rnFZ6VmNTZhn1YkBpy13BJSr4y4E6v2+iMZxUI=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=EeDIV6bseeGWOEYh7Znh4Kj8Zq8ivM4dw9jyixYC9Xos0t6GtWEMpY2uV6MzziW9s
	 bIk/BUTpKRhLcRwesJmKQ8a9WrqxuoWL4kig82NAIqXZ/hPbAu5iQPzwlAcF5Fn/i0
	 GjrMWYmyIy4Hddv0PSM0HVrqHfGV4MDg86b7KrT+we5f3LX+rfot199K5+eLwNdXKj
	 ljDlYfOBgFYxiFM7GwouzusMmJz6eu4QZxN316/1fistBQhgNZa1YRWYobJMynxU02
	 2JFIqLc7tSWBLm/b5lhmPEdEz7Vwtai3Pp2eysShu9dXkFo7+GExsCtyiVFU4PC8ch
	 pq53+t1iZ99qw==
Date: Mon, 9 Nov 2026 14:59:11 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rockchip-host: Enable async probe by default
Message-ID: <20261109205911.GA292554@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109204122.async-probe-reply@iav.lv>
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

On Mon, Nov 09, 2026 at 10:47:39PM +0200, Igor Velkov wrote:
> On Mon, Nov 09, 2026 at 02:22:02PM -0600, Bjorn Helgaas wrote:
> > I don't know what the SD card has to do with PCIe.  Seems like there's
> > some SD issue, and making PCIe async happens to avoid it?  Sounds
> > fragile to me.
> >
> > Other changes like c0e1eb441b1d justify it by allowing other drivers
> > to load in parallel to reduce boot time, which is a good reason.  But
> > apparently here it makes a functional difference as well, which feels
> > sketchy.  E.g., what other drivers need to use async probe to avoid
> > similar issues?
> 
> You're right that the real problem is ordering: nothing makes dw_mmc wait
> for the RK3399 io-domain driver, which sets the 1.8 V level of the SD
> pins. [1] tried to add that dependency and was not merged. Async probe
> only stops this driver from holding the deferred-probe worker for ~0.7 s;
> any other slow probe in that window breaks UHS the same way.
> 
> Is there a way to express this dependency that you would accept?
> 
> [1] https://lore.kernel.org/all/20230904115816.1237684-1-s.hauer@pengutronix.de/

Mani's already applied it, so I think it's fine.  I'm just trying to
understand the commit message and figure out what the merge commit log
and the eventual pull request should say.  It sounds like "this makes
SD cards work better" is somehow part of it, but it just feels kind of
hand-wavey.

