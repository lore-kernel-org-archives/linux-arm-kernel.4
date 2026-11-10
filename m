Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ziwU6G5d;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HxUdNS7v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y036tnkZvOptnlPqeztBIgk/DHIDknwaKKSH2dCYLg8=; b=ziwU6G5dtyvOTWKCgfWc2ewCF6
	mzXi79kZWZzlk7AozOGDzx1H9iGEnKXRvrGnVxYFByVcuo3rTZza60E08AB9CXIsY5S++qqJ0FBXn
	o8XtMDGdr4r3RMSF0uj5MLKnUapDd6X6njL0T3AKcEyW19I9PAY5TnzFxIAtY+ldvhbzuwDIK+S5Y
	l3fYqcxU/3Vcd91I7I8AUI40k7JeTC65mPj2BgvMkhkH2+Y/lgH37FSDBpnTjNTn/U4iyb1d6HYoP
	UnZoU+MTESlG8471wk5aNWX9vzKfk5ZPdvNtt7CkOiiGWgg8krFKnkc6ek6Aomu9Yy/vffKuUoUUl
	u3i/ta0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnqb-00000004OWW-04D9;
	Tue, 10 Nov 2026 15:33:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnqW-00000004OTQ-3QQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:33:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CEA914BF;
	Tue, 10 Nov 2026 07:33:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90BAB3F85F;
	Tue, 10 Nov 2026 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794324795; bh=nBUxhmvA0ecyPPwlBOt9fU9SaSIGMd2Zc1jhwGnIkjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxUdNS7vTci/GNxuiU+PL6sIw8vYWgYQQ2j9oD3St9Q/dGQHoIwmUTRpuTsyb0nEz
	 dkDtQ71ZVpWmbsEXtAXUCzdNc9kVvrJHxFiSGuzPDYc8SYBopwf/yUn2UA5itaFKBa
	 mXuD+KbpVmW4I7LeD8HyNfqqXDYFp5svFesO5ZCI=
Date: Tue, 10 Nov 2026 15:33:10 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <avM5No4YdYbQ968p@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-11-cristian.marussi@arm.com>
 <20261109173641.00005289@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109173641.00005289@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073317_003925_2B5AC6A7 
X-CRM114-Status: GOOD (  25.96  )
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

On Mon, Nov 09, 2026 at 05:36:41PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:56 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 

Just one eply down below, I will address and reply more in depth next
days while addressing the usual zillion Sashiko issues (tiny now at
least)

> > Add basic Telemetry allocation and initialization routines, introducing and
> > wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> > optionally using a lazy on-demand scheme: this approach factors in the
> > flexibility needed to minimize the amount of initialization work based on
> > the effective access pattern used by the upper layer ABI.
> > 

[snip]

 
> > +
> > +/**
> > + * scmi_telemetry_resources_enumerate  - Enumeration helper
> > + * @ti: A reference to the telemetry info descriptor for this instance
> > + *
> > + * This helper is configured to be called once on the first enumeration
> > + * attempt, when triggered by invoking ti->res_get() from somewhere else.
> > + *
> > + * Once run it substitues itself in ti->res_get() with the simple accessor
> > + * __scmi_telemetry_resources_get, which returns a descriptor to the resources
> > + * that were possibly discovered.
> > + *
> > + * Note that, while it attempts to fully enumerate Data Events and Groups, it
> > + * does NOT fail when such enumerations fail, instead it simply gives up with
> > + * the end result that only a partially populated, but consistent, resources
> > + * descriptor will be returned; in such a case the incomplete descriptor will
> > + * be marked as NOT fully_enumerated: this design enables the kernel to deal
> > + * with badly implemented out-of-spec firmware support while keep on providing
> > + * a minimal sane, albeit possibly incomplete, set of telemetry respources.
> 
> I'm curious about this. What's the motivation for being nice to people who
> write buggy firmware?  I'd kind of prefer an opt in quirk for any that show
> up where a fix is impractical rather than a paper over the bad from the start.
>

Trust me it was never about being nice to FW guys :P

The reasoning, which I am indeed myself questioning these days, was to
be able to carry on and boot a minimal Telemetry working system even
without all of the detailed description retrieved by this command
enumeration process since all of that data descriptors are NOT strictly
needed, unless yout system defines groups or FastChannels.

Because on one side it is true thet DE_DESCRIPTION is a mandatory
command BUT on the other side it is also true that the spec does really
delegate any further detailed description of the Telemetry data to some
external JSON-like file: so you can really carry on without all of this
informational and topological data.

As an example if userspace does not want to use kernel mediated access
to the Telemetry data (most of the IOCTL ABI later on) but instead it
decides to grab and parse directly the RAW mmaped data from the SHMTI/TDCF,
in that case you just need the fds to the areas to mmap and its fully
comprehensive (hopefully) JSON file.

Another possible scenario is bring-up with a limited features FW.

This is also the reasoning behind having the lazy resource enumeration:
you can boot, get the SHMTIs fds and mmap those areas and that's it:
you're good to go without doing any enumeration at all.

There were more FW issues indeed that I used to 'survive' early in this
series that I stop being graceful about it, and even in this case, despite
surviving in a degraded state I printout a FW_BUG.

Now the bad side of the story is that keeping half-initialized stuff
in a degraded system lead to an increasing number of possible issues
flagged by Sashiko, mostly rare errors on path conditions to fix, but
I am starting to wonder if all of this is worth...

Thanks,
Cristian

