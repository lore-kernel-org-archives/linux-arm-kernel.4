Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2339E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IWEfwgoR;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jky6L6vz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=952yiB3XKkKJx2jlcE2T9cBcHOdTpffUYRnjcZrOm9g=; b=IWEfwgoRICKWY9u7fgYKkdXTs1
	yxT/bygem2IZ6H04lzQZuTXsg14r02KlNi1Cgq+J41/WXT5MWtmCXd5jPz2X4rNLax3L3oSLsV78Q
	En8IhFCOB1Wqjw10cEGaR+P1cxOPcCpIaE9IJ3+/GPwIQkAfDUP7ZmBcyXvl/9iv4V/OguceheexX
	Fj90QqpeaX/+X10D7N/hCutGJG7dYfmmnfgWtB9kxkEIjsoZQ9lawVtlgFfmp3wYDCXc6JmcemRiX
	n2KolxU5wAB4YspMea2Y1vDF6yoaBVoGqEETQtgpZA6Yk3qNWmCerr3RViDltCcqt7D1LST6A1eOr
	qfnADsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtIT-0000000FcQ3-1RRw;
	Fri, 27 Nov 2026 10:35:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtIQ-0000000FcPi-2rmB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:35:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1CA31756;
	Fri, 27 Nov 2026 02:35:10 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3570A3F86C;
	Fri, 27 Nov 2026 02:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795775713; bh=+viwC7r5nVf1JXawcduVmmgm0qbQG3S33zlJBCPnFiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jky6L6vzghiEMhFKHHd5yU67Vr0X5oRfMhikFrwX0Wt0vtfvZvBS4TvR+HVfA0olM
	 alltWBqxSOw0cH1itYcRnd/9jAy2h7DfSn8CiL0obkWJxUs9ecoNGlmLJhrUi7zcx3
	 AQpDkyyMjlEZ3PbmjW+wwOYBYl+rdAWZH6YsFRQ0=
Date: Fri, 27 Nov 2026 10:35:11 +0000
From: Leo Yan <leo.yan@arm.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: will@kernel.org, mark.rutland@arm.com, robh@kernel.org,
	james.clark@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Probe PMSNEVFR and PMSDSFR filter bits
 independently
Message-ID: <20261127103511.GA861809@e132581.arm.com>
References: <20261123073719.3190149-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123073719.3190149-1-leeonion.muyu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_023514_856552_D824FC67 
X-CRM114-Status: GOOD (  25.72  )
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

On Mon, Nov 23, 2026 at 03:37:19PM +0800, Ping Li wrote:

>   * The inverse event filter is written verbatim to PMSNEVFR_EL1, so
>     if PMSNEVFR_EL1 implements a different set of bits to PMSEVFR_EL1
>     then a filter using bits that are RAZ/WI is accepted and silently
>     has no effect, while a filter using bits that are writable in
>     PMSNEVFR_EL1 but not PMSEVFR_EL1 is wrongly rejected with
>     -EOPNOTSUPP.

I don't worry "PMSNEVFR_EL1 implements a different set of bits to
PMSEVFR_EL1", I would expect both have the same res bits in
implementation.

A possible case is FEAT_INV_FILT_EVT is not implemented, current code
uses pmsevfr_res0 to validate invert event filter, it can silently pass
check and start event, so it miss the chance to report error in the
first place.

>   * PMSDSFR_EL1 holds an inclusion mask which the driver exposes
>     inverted, so a set config4 bit requests that a data source is
>     excluded and a cleared bit requests that it is included. Bits
>     that are RAZ/WI are stuck at 0, so their data sources cannot be
>     included while the data source filter is active: exclusion
>     requests are always honoured, but inclusion requests for such
>     sources are silently dropped.

Arm ARM DDI 0487 M.b, D24.7.10 says unsupported data source bits are
RAZ/WI, so probing PMSDSFR_EL1 separately makes sense.

> Discover the supported filter bits of PMSNEVFR_EL1 and PMSDSFR_EL1
> separately, probing each register only when the corresponding feature
> (FnE / FDS) is implemented. Validate the inverse event filter against
> the PMSNEVFR_EL1 mask, and reject data source filter configs which
> ask to include a data source whose PMSDSFR_EL1 bit is not implemented.
> For missing features, keep a full mask so that filter requests are
> still rejected alongside the pre-existing feature checks.
> 
> Runtime-tested on Cortex-A78AE (SPEv1.0, which implements neither
> FnE nor FDS) and on an SPEv1.2 CPU implementing FnE (but not FDS):
> the PMU probes cleanly with the per-register discovery in place,
> event filter configs are validated per-bit against the probed masks
> with unimplemented bits rejected using -EOPNOTSUPP, and sampling is
> unaffected. The PMSNEVFR_EL1 probe path itself is exercised on the
> SPEv1.2 CPU, where the register happens to implement the same bits
> as PMSEVFR_EL1. Only the FDS path lacks coverage on hardware
> implementing the feature.
> 
> Fixes: 8d9190f00a975 ("perf: arm_spe: Add support for SPEv1.2 inverted event filtering")
> Fixes: e6a27290d800 ("perf: arm_spe: Add support for filtering on data source")

Please split the two fixes so each can be backported independently.

> Tested-by: Ping Li <leeonion.muyu@gmail.com>

Drop your own Tested-by tag.

> @@ -818,13 +820,22 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>  	if (arm_spe_event_to_pmsevfr(event) & spe_pmu->pmsevfr_res0)
>  		return -EOPNOTSUPP;
>  
> -	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
> +	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsnevfr_res0)
>  		return -EOPNOTSUPP;
>  
>  	if (arm_spe_event_to_pmsdsfr(event) != U64_MAX &&
>  	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
>  		return -EOPNOTSUPP;
>  
> +	/*
> +	 * The data source filter is exposed inverted, so validate the
> +	 * value written to PMSDSFR_EL1 (~config4) rather than config4
> +	 * itself.
> +	 */
> +	if (ATTR_CFG_GET_FLD(attr, inv_data_src_filter) &&
> +	    (arm_spe_event_to_pmsdsfr(event) & spe_pmu->pmsdsfr_res0))
> +		return -EOPNOTSUPP;

Could we group it with the FDS check?

  reg = arm_spe_event_to_pmsdsfr(event);
  if (reg != U64_MAX) {
          if (!(spe_pmu->features & SPE_PMU_FEAT_FDS))
                  return -EOPNOTSUPP;

          if (reg & spe_pmu->pmsdsfr_res0)
                  return -EOPNOTSUPP;
  }

Thanks,
Leo

