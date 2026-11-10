Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F09606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MFn0XQk4;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jBkSM0dF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gdWtCqOrHd/hpqiy5fnAanl9VNsFsqG9lG1bU+R/JFU=; b=MFn0XQk4AABsWrd9ydMycQNFcO
	g74W1sWlte0axC0T54rFsGIZmTvpaTK3vmDunRe7mxUnuCBgTh5pitOnr5bP0xH0sVyejXKNhamW3
	cP+xjf7B5RNqbACLcY9jhygs0AYx+xgkd3U08zSSN9mrKLcEGXRbJeuNuT1+8Qs9dyzw4grOy4hKm
	gdRrEWvf+1ACLEYIrotUlQ5qLQRbtPnZvGsLP/KBQdigQU53oJvTv6U2ORODv0eV2aQUBoXz8Sq0e
	7qFxl0FCMj2UistXajF4LVzHgqS4nMFa6LL8ucaSyMwjx9NEA8kdZbG7c+1LnnYSTM8ay76eoG27L
	MK4Hd2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhWT-00000003AHV-1QUg;
	Tue, 10 Nov 2026 08:48:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhWR-00000003AGf-2JUY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:48:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4E0E1516;
	Tue, 10 Nov 2026 00:48:03 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5451F3F85F;
	Tue, 10 Nov 2026 00:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794300486; bh=D6cpUVH7ysCqLH5BEhpKUszzrMl4AwrMKiUXrthyWfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBkSM0dFRGyhVC5aY24nwEDz041CoShYhuFpHaOy8BQgFV4TR3I+JGFH7gUorBGnl
	 IyQhDj6NMKfailh30sFCTRZ7tUJhDQ3fsi0A8/wWulVqhmMZJytmNOOIOfI8+oNHP7
	 E3q0Zo8f7Knm9CkrDCZce6DWTj3SNYNWOBVi865M=
Date: Tue, 10 Nov 2026 08:48:04 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
Message-ID: <20261110084804.GZ9176@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
 <a79a52db-2361-4303-9d43-87837f349f48@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a79a52db-2361-4303-9d43-87837f349f48@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_004807_663042_E79B5769 
X-CRM114-Status: GOOD (  19.39  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 10:51:30PM +0000, Suzuki K Poulose wrote:
> On 16/10/2026 17:55, Leo Yan wrote:
> > TRBSR_EL1 records the status of the buffer that just stopped. Clearing
> > it in trbe_enable_hw() postpones cleanup until another run starts. If
> > AUX output cannot restart, for example when AUX space is exhausted,
> > that clear never executes. Clear the status in arm_trbe_disable()
> > after disabling TRBE instead.
> > 
> > trbe_handle_overflow() can start the next run without calling
> > arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
> > while TRBE is disabled, before attempting the AUX restart. This also
> > leaves the status clean when the restart fails.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> > index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
> > --- a/drivers/hwtracing/coresight/coresight-trbe.c
> > +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> > @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
> >   	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
> >   	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
> >   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> > -	clr_trbe_status();
> 
> TRBSR_ELx is UNKNOWN at reset and if we don't clear it at probe time, we
> endup running the first session with unknown values. It is safer to
> clear this at enable_hw.

This is incorrect. trbe_reset_local() is called locally on each CPU to
clear TRBSR_ELx, it has been guaranteed when the first session starts.

Thanks,
Leo

