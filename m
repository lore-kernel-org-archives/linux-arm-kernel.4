Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325FC606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vhv+r0XM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MKY2zM2T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a/yPvsuyQKidDGPeEKJxrugs2SOnd4NXe099F4lVUCE=; b=Vhv+r0XMyQTYMpGE2kJOaQiA4c
	LpHYb8eypUG7xLaZx/fmhAGBnTqEVmZe6QYtKSxRYpEdR2L4b34k4YUAZYltYnl+zja1/PMpc/Ta7
	7mTZMoVQ/cZ9pmesgm5ehn7hqtJKP/Wo6IkkCGZw1tE7ie9TNVN1l7WkgsXjh2IkMxJ1YBYFof7Ym
	LfGFGyUmz4oxYeAUcMf0IZCIWaK/N6v5ypeXYTQVcBjoYYRF+l99rdKONNGfQnEw2/AJd0w1OChnM
	XdDboB190OUveyixbEjdVxArUpwCV1idOBPsOsJAV7t3mwaxHkrlVSDGD31nOT2RD7VmVnirfc/EG
	aOqx89jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULYI-0000000EZjL-1Osc;
	Fri, 20 Nov 2026 10:09:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULYB-0000000EZhS-2plN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:09:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3883B1477;
	Fri, 20 Nov 2026 02:08:55 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 940733F632;
	Fri, 20 Nov 2026 02:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795169338; bh=smHjf+1WZoiuJVQZvV/DEHqRPCzJJYdPwysB/bAQ1zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKY2zM2TUN5Q+pNCTCxoFwyfgg26V5F5lkzPVsLWwQHx/8ZXd9xvPclM2IvabwAS2
	 mfFfTxd8N/pcAB4ky49bECNwb6SZBYu1hpKE7S0p81QPf3DndprYgWPQ+dLv1J21h6
	 y7QEi5I7IniNAmFdsGDAsqQLz5eOMJrOUmTD+0rs=
Date: Fri, 20 Nov 2026 10:08:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb+git@google.com>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: (subset) [PATCH 0/4] Get rid of all NEON intrinsics stdint.h
 type hacks
Message-ID: <awAcNlbDwM6xmLjH@arm.com>
References: <20261029135020.272082-6-ardb+git@google.com>
 <179508547602.2557572.9682726373932810888.b4-ty@b4>
 <81ddf2f1-faec-47ec-b3b1-7210b4e7712b@app.fastmail.com>
 <20261119192848.GB875856@ax162>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119192848.GB875856@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_020859_762692_45892A0B 
X-CRM114-Status: GOOD (  13.80  )
X-Spam-Score: -4.4 (----)
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

On Thu, Nov 19, 2026 at 12:28:48PM -0700, Nathan Chancellor wrote:
> On Thu, Nov 19, 2026 at 01:08:51PM +0100, Ard Biesheuvel wrote:
> > On Thu, 19 Nov 2026, at 11:51, Catalin Marinas wrote:
> > > I left the last patch out, IIUC it's just clean-up rather
> > > than fixing a problem on arm32 and can go separately via Russell's tree
> > > during the next merge window (let me know if you think otherwise).
> > 
> > I'll let Nathan respond to that.
> 
> Yeah, as far as I am aware, we only need the arm64 bits. arm builds are
> fine right now. Russell's tree would need to have the first two patches
> to apply the arm change if I understand correctly so it could either go
> to 7.5 with a backmerge or 7.6 with a base of 7.5-rc1.

I plan to send the first three patches as fixes for -rc, so they'll be
in 7.4. Russell can merge the other one for 7.5-rcX (well, Ard still
needs to cc him; copied now).

-- 
Catalin

