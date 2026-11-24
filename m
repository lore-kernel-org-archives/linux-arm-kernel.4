Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE2B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vk2sZ0pG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fn8y9Wtw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dXFaLZetJ8SRrPD7gq+eCxSdvOq4XyZytn0D86Q0n2Y=; b=vk2sZ0pG2pw7eJ4Gj/7LuwSrrw
	hRYirnU7Ds5MXmob9Xt9SZrbxd89K+GzX0yJxJovGyEY+2xWtIdPVKUI0wBSHtLkiwA3phkGsmKL7
	UullTcryNI9CqmlcxwsRyknis3T/l4GkzFgXjrNSbV4GcVFwIeE3epmDzCe5JXldl04qYQ35ZtQa/
	tmxA0bkaBpfodUVdYfHUHZ+80CuSJ9lxl32RhphMwhZ5806wqy9ZHC0CTCodZl/ZfSwKTI3/xOXXH
	A1vaKpsytGlb3/+WhzQEF1CGZoNjtNpX6XiYbsoWQKkaEXfeZebOxXDZwIePmrDPlvztLhbbEwd2S
	wakrO05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsY6-00000006uXS-1OfM;
	Tue, 24 Nov 2026 15:35:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsY3-00000006uWg-2CgP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:35:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 991C4339;
	Tue, 24 Nov 2026 07:35:07 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21DEA3F763;
	Tue, 24 Nov 2026 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795534510; bh=mW2BtmkAlIECVmLfUMdR7ew9cRxGXGwviSOU1SjuL8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fn8y9WtwvYt+9zItLgXBv0cDUCHw+2yj8AmRfwM28AvJ0hD+O/KtS7S5cij6XrtuJ
	 ETa1SEiqIdbBkwywxSjqr+vVWy4k7GaNV4oIVmjYGYOyPZLi3oOCwdyY/NsJb0r7wI
	 O5S9cwWfQ5Mo8Z7/TA3hgHbjHZHcljyyKAmo+pdM=
Date: Tue, 24 Nov 2026 15:35:08 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Vlad Poenaru <vlad.wing@gmail.com>, Amir Ayupov <aaupov@fb.com>,
	Suyash Mahar <smahar@meta.com>, Song Liu <song@kernel.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: perf: End AUX output when an event is
 throttled
Message-ID: <20261124153508.GA7209@e132581.arm.com>
References: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
 <09e172d0-3ef5-44ef-a966-7db3b8a4af9a@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09e172d0-3ef5-44ef-a966-7db3b8a4af9a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_073511_600892_F1C00BED 
X-CRM114-Status: GOOD (  19.15  )
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

On Tue, Nov 24, 2026 at 01:06:04PM +0000, Suzuki K Poulose wrote:

> > Check AUX handle ownership before updating the buffer or ending AUX
> > output. Drop the post-update check because the full stop runs with
> > local IRQs disabled, which prevents the TRBE IRQ from closing the
> > handle during the stop.

...

> > +	if (mode & PERF_EF_UPDATE) {
> >   		/* update trace information */
> > -		if (!sink_ops(sink)->update_buffer)
> > -			return;
> > -
> > -		size = sink_ops(sink)->update_buffer(sink, handle,
> > -					      event_data->snk_config);
> > -		/*
> > -		 * Make sure the handle is still valid as the
> > -		 * sink could have closed it from an IRQ.
> > -		 * The sink driver must handle the race with
> > -		 * update_buffer() and IRQ. Thus either we
> > -		 * should get a valid handle and valid size
> > -		 * (which may be 0).
> > -		 *
> > -		 * But we should never get a non-zero size with
> > -		 * an invalid handle.
> > -		 */
> > -		if (READ_ONCE(handle->event))
> > -			perf_aux_output_end(handle, size);
> > -		else
> > -			WARN_ON(size);
> > +		if (sink_ops(sink)->update_buffer)
> > +			size = sink_ops(sink)->update_buffer(sink, handle,
> > +							     event_data->snk_config);
> 
> Could we retain the READ_ONCE() check to handle the TRBE case here ? This
> looks like introducing a regression. Something like :
> 
> 		if (!READ_ONCE(handle->event)) {
> 			WARN_ON(size);
> 			goto out;
> 		}
> 
> 
> >   	}
> 
> 
> Otherwise looks good to me

etm_event_stop() runs with local IRQ disabled, so the TRBE IRQ handler
cannot close the AUX handle during the stop. If the handler closed it
earlier, the ownership check before update_buffer() catches that case.

The second READ_ONCE(handle->event) check is redundant and is safe to
be removed.

Thanks,
Leo

