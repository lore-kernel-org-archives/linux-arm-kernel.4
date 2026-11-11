Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08073606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rmn+SNHq;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=khnIYuOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bk/xtUL0TQa1hkGHi57+F0vnkupo2qPX6iYJ2SnqDe4=; b=rmn+SNHqfB7P+1dIhlt4Up4i+M
	r/K2XOyP6S3O8otdqYbcHDL2TSN2jXNRe3WhZtqJ3m9Zy3v4jpGfAjjVr/dSOQY505+l+Uo9j9oT2
	mx6uN5zrbj0UPWMUh85Zt+rlanj1gx1M5ceU+E/VhMjQpEoDUFygvgTcXPvXvCKnMoI23xHQQDJLL
	dgTRHTKBLWlEKSK+byNvtLqh4rXLm59vmIL8Xysb29vfEfDcOpzGw91hR/cTlvSJ9h1Q59wGApFns
	8extVMuWUIZGq/pAw7pr9zHpfTOrENdbdEfEfoKQPANJQMF+3pxK9rJWBWC4gS3af/nilzpdCNJch
	Bk4s2mLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6ud-00000006Z5J-2Ivq;
	Wed, 11 Nov 2026 11:54:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6ub-00000006Z1R-06EW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bk/x
	tUL0TQa1hkGHi57+F0vnkupo2qPX6iYJ2SnqDe4=; b=khnIYuOLGFscxVwD2A2f
	Pikm3TGugPqReJTjPxxakdZ/vMxwRm0e24O3jzg+Y8IVMJUuZ9otGGzPmDn0xgDi
	ZWXNJ717x9IHhh7F2v4qAdVKxcH5h3w0ZFUNfXyWy/CcxhwaQB3LGg43rAnnP8zW
	bPHP88yr5UK7bDYDTSAKCh799LNYkKbrPd9vvZXGnbFKs24j441Ri0al+ZLjA60H
	sd4JKKk8LIGr/5hFNrzdNrJukUUgUFaLHXI1sNFsOcC0erynx/Q6paPZSsJEb18z
	nqy1MN+/IFAla5ELrJFgwRVi//R+D1TalBrTke2mVpsasBtT/wiMnPP5Fu8zpJmB
	9A==
Received: (qmail 598728 invoked from network); 11 Nov 2026 12:54:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2026 12:54:40 +0100
X-UD-Smtp-Session: l3s3148p1@Mi0k3P5f8Lsujnun
Date: Wed, 11 Nov 2026 12:54:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: BeaCox <0xbeac@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH] mmc: tmio: disable dma_issue work before releasing
 DMA
Message-ID: <avRXf6SJuXxslsbx@ninjato>
References: <20261101063739.89331-1-0xbeac@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101063739.89331-1-0xbeac@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035445_352480_61F54876 
X-CRM114-Status: GOOD (  11.79  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 02:37:39PM +0800, BeaCox wrote:
> tmio_mmc_host_remove() drains done and delayed_reset_work, but leaves
> dma_issue pending or running when it releases the DMA resources. Its
> backend callback accesses the host, controller registers and DMA state.
> 
> Disable dma_issue synchronously before releasing DMA. This also rejects
> late queue attempts from an interrupt handler that is still running;
> cancel_work_sync() alone does not provide that guarantee.
> 
> Some DMA backends fall back to PIO before initializing dma_issue. Move
> their work initialization ahead of the fallible setup so the work is
> always initialized when a DMA backend is present. Skip the disable call
> when no DMA backend is configured.
> 
> The analysis, patch and validation were assisted by OpenAI Codex.
> 
> Fixes: 85683fb39d9b ("mmc: sdhi: Convert from tasklet to BH workqueue")
> Cc: stable@vger.kernel.org
> Signed-off-by: BeaCox <0xbeac@gmail.com>

Real name, please.


