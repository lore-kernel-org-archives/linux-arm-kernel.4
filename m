Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DDF606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4bvFqDg2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFN9BpFR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SEZ09rfl3fC0bB/J62YE+Ly+ABzQkNWTxD/3Oq9VKPw=; b=4bvFqDg2ug2o/pyKfuk5OBJjWI
	IV8CsCpgIc6f8FFE7QpL+L3iVrSMykULZoIPUFzsse8boZdabaWNMj09Iw7L5aMiXK+4/4CjX1HGz
	x2EBcM3bEcSi56u6jiNoGBKqDwd0zn+L9FajiPWwMCuwLrJmNmCTptd7Hgzd5p6DD7jBiz6rCgzUT
	TZUTjUoL0CgMWY+6Y08OLLsUVJlBlrCIBRI8ZAy/XUmDM+5xZn/IkHGuKWCHA+mKuJH9gJlmOhZI9
	qWqWTWKWXbSugleOy+g2YSgJXbktbmnCcsGLyVEf//gIiR1QMEJO3geEzetHDAss3jL/0+rB39s9k
	T1PCg/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx8t-0000000GbQC-1yQE;
	Fri, 27 Nov 2026 14:41:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx8q-0000000GbOX-1eaV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:41:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9958262560;
	Fri, 27 Nov 2026 14:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEACE1F0089A;
	Fri, 27 Nov 2026 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790494;
	bh=SEZ09rfl3fC0bB/J62YE+Ly+ABzQkNWTxD/3Oq9VKPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZFN9BpFRdcam3nQN+YC9gJUadLUJyPbAHGj5vHiSMl2hRmquxwkHHswm1KUV1nDw8
	 Ryc5rhe3uxYayqClsir87oxZMyA1LGyzryFu2i0zVypaR4sAFgvSg3kzIitZFPD54/
	 X22onnRQa17fpWANidA7z4Pd8oIVmh5rBZ2DCLuRKqW4+oG1JutcQuTF67T9YdD5Eq
	 rrq6ntIlQvf7/97N4rQZowYmVBwzsV4gCZJk26g9ZehinrTdEbcTQwIZy9MKhCXBl6
	 0rqf+le5aeW7YflkQrlkZIkOqeu0WqKyfSlBEKy/aeXe946juFlDRxNp02cF0DkxI6
	 EZ6dVBRsKJD0g==
Date: Fri, 27 Nov 2026 14:41:29 +0000
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: julien.thierry.kdev@gmail.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
	alexandru.elisei@arm.com, andre.przywara@arm.com
Subject: Re: [PATCH kvmtool] arm64: THPs for systems with pages bigger than 4K
Message-ID: <awmWmb8uiDY1QYC-@willie-the-truck>
References: <20261019145949.1922019-1-vdonnefort@google.com>
 <awhZk3NrkqeGvQxC@willie-the-truck>
 <awiX9cEDByf7d40x@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awiX9cEDByf7d40x@google.com>
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

On Thu, Nov 26, 2026 at 08:35:01PM +0000, Vincent Donnefort wrote:
> On Thu, Nov 26, 2026 at 04:08:51PM +0000, Will Deacon wrote:
> > On Mon, Oct 19, 2026 at 03:59:49PM +0100, Vincent Donnefort wrote:
> > > The THP support imposes an alignment of the memslot userspace address to
> > > the size of a THP (PMD_SIZE). To do so, kvmtool overallocates the RAM
> > > size and aligns it. However it assumes PMD_SIZE is 2MiB, which is only
> > > true on 4KiB page systems.
> > > 
> > > Use a huge-page size, based on the system page size. This value can be
> > > massive for a 64KiB page system, so skip the alignment if we couldn't
> > > even install one THP.
> > > 
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > > 
> > > diff --git a/arm64/kvm.c b/arm64/kvm.c
> > > index 36b3284e4a92..2c01dc32fa9a 100644
> > > --- a/arm64/kvm.c
> > > +++ b/arm64/kvm.c
> > > @@ -18,6 +18,8 @@
> > >  
> > >  #include <asm/image.h>
> > >  
> > > +#define HUGEPAGE_SIZE (PAGE_SIZE * (PAGE_SIZE / 8UL))
> > 
> > Does this invoke sysconf() twice per invocation?
> > 
> > Will
> 
> It does. 
> 
> How about I use for PAGE_SIZE a memoized version of the existing
> host_page_size() function?
> 
> kvm/util.h:
> 
>    unsigned long host_page_size(void);
>    
>    #define PAGE_SIZE host_page_size()
> 
> 
> util.c:
> 
>   unsigned long host_page_size(void)
>   {
>   	static unsigned long page_size;
> 
> 	if (!page_size)
> 		page_size = sysconf(_SC_PAGE_SIZE);
> 
> 	return page_size;
>   }

Yes, that looks much better to me, thanks!

Will

