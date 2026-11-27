Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 21:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jtzUgn7L;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JBAGojIu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fZMajTFIhsk6u/dtLRxzX7CEIFWa9wuGr8CAmQQaGNw=; b=jtzUgn7L921AbjjhhKd5iYsotA
	2G2roVYPj4HP1tlz2KjIOZ7Kac4+Leu3q7MoMTelHNE9Sn4/XiHj6VI3wNiVyC2gJhqR/73wV3ToN
	6kOp0KFTIcXfCcjp+keOCY5PEubRFXaJl3npF6LjVP2guAMAAYdec2yWD2Z11fekcfaOVS8TPuhxR
	1WEBrvy1OZTqrG/Pli4QnO3R/RcE66cUvdrentnqj8AQHP2yDSW6j8mfThArLcwh4fXFGRhKkdj8h
	Td9sIGH7r+1cbAH/bzcoczAkr2CZQ6rA3u580MzCIBkEmDC90OE9dB82O6n/21yuap7eYRkXCP2gr
	ijPUBtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3Gx-000000006W0-1qbE;
	Fri, 27 Nov 2026 21:14:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3Gt-000000006VZ-39vo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 21:14:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFFE01575;
	Fri, 27 Nov 2026 13:14:12 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69F803F632;
	Fri, 27 Nov 2026 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795814055; bh=BvU5Ac6daDVpu8nVwZeldQF9W8KjlMmjXd6m7m9X1Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBAGojIux5rPsLXNCqTettd2ISRAQC7rD3tYF0Dvejdu3fznJ9SKFdDgWsjgEOLm1
	 O/wxUNyTne+/0q80rgMwPXbgKa/1kjFG+wVKnranHikRG+FtpGO6alIKwyE7kURAM0
	 SlAg2ZzKd4H8tiPTpD3barAL+1wZ4hdwygFK80TQ=
Date: Fri, 27 Nov 2026 21:14:13 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH 1/2] perf: arm_spe: Order padding before publishing AUX
 head
Message-ID: <20261127211413.GH861809@e132581.arm.com>
References: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
 <20261015-add_barriers_for_perf_aux_output_skip-v1-1-5847d0578859@arm.com>
 <awnPG6QADpRAgEzx@willie-the-truck>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awnPG6QADpRAgEzx@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_131419_934719_BC890CAE 
X-CRM114-Status: GOOD (  16.42  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 06:42:35PM +0000, Will Deacon wrote:

> > @@ -487,8 +487,11 @@ static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
> >  	u64 head = PERF_IDX2OFF(handle->head, buf);
> >  
> >  	memset(buf->base + head, ARM_SPE_BUF_PAD_BYTE, len);
> > -	if (!buf->snapshot)
> > +	if (!buf->snapshot) {
> > +		/* Order the padding stores before publishing the new aux_head. */
> > +		smp_wmb();
> >  		perf_aux_output_skip(handle, len);
> > +	}
> 
> This looks correct to me, but I wonder if it should be handled by
> perf_aux_output_skip() instead? arm_spe_pmu_pad_buf() is called from a
> bunch of places in the driver, including in conjunction with
> perf_aux_output_end(), which looks like it already has the necessary
> memory barrier. So doing it here seems weird inconsistent to me.

As I mentioned in the cover letter, the choice of barrier depends on the
CPU memory model and the trace hardware. Perf deliberately leaves that
choice to the AUX driver [1].

SPE driver implicitly relies on the dsb(nsh) in
arm_spe_pmu_disable_and_drain_local() to make trace writes visible
before calling perf_aux_output_end(). I kept the barrier in the driver
for perf_aux_output_skip() to follow the same convention.

Thanks,
Leo

[1] https://lore.kernel.org/all/YLUFMzxin1PpgIdZ@hirez.programming.kicks-ass.net/

