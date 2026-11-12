Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1C3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xaTI4Mix;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eP3Lmg48
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dy7J2cqt4EEbhgyUkhhB/eUew1aRMhzOU6Itpm1/KVM=; b=xaTI4MixyIkf/81yxahrIP5jCW
	s1BaQOIAYV9OkaSi7+z8JtNnSONYLtLf8d8YeDtfzmMuOJE9TklCEmnDJUtCYdwedkm5DSODHY6lf
	YA+aGxkkjN8HaLYJ2bxZr1f/2EPJTMLGbzmjrVj/J7GW/0sqYS2L7ZdbssKM2obR1/0og60rTKWeb
	/7PzbGb90HilLu0ujw18VIk8r++SvvOOmcJtdZEIKi0AMoyiKekLZclP7V27Tbnbe3lGpotT42ME/
	Im6xYZYRTWg/fS4t9xZ/WtpfqjpkamjOWkwN5odDHcJEgbVc2pmLv1DnwxV8gnsHzixPQtyvsX7XJ
	14WLYTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRauS-0000000AyhM-2BOs;
	Thu, 12 Nov 2026 19:56:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRauJ-0000000AygQ-20AH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:56:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A540A339;
	Thu, 12 Nov 2026 11:56:18 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4216A3F632;
	Thu, 12 Nov 2026 11:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513381; bh=MSLq4lZa+23a127MIJrZJzb7fcJCl4lsinfpBlFpp+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eP3Lmg48Ypld/7C31ui42awQpCJDOfAsfarhWTq9s+PV9zm8lGkhvmKby+wskzJXX
	 lsrCENHkmeQWPeCvlsYrMdy89v5MHnw5d6yo9On8UMikdy6OPQ2m4oOuYSPZSfhiPU
	 Bv9EX+f7Z/nU1dSAWXE7IziRUbNBJ2QxyGl+vt6k=
Date: Thu, 12 Nov 2026 19:56:10 +0000
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
Message-ID: <avYZ2t_GoT7BN2nU@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-11-cristian.marussi@arm.com>
 <20261112100145.00000560@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112100145.00000560@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_115633_483833_1EEE2941 
X-CRM114-Status: GOOD (  26.93  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 10:01:45AM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:56 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add basic Telemetry allocation and initialization routines, introducing and
> > wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> > optionally using a lazy on-demand scheme: this approach factors in the
> > flexibility needed to minimize the amount of initialization work based on
> > the effective access pattern used by the upper layer ABI.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Hi Cristian,
> 
> This stretches across the patch set but first elements related to it are
> in this patch.  How do we handle larger values of de_data_sz?
> 

We dont. This was somethig that was on my todo list initially, but then
I realized that there was NO FW-side plan to actually implement anything
larger than 64bit.

> The spec allows (and it's useful for things like histograms)
> DEs to have an integer multiple of 64 bits for a single element.
> In the shared memory buffer that just ends up with a bunch of matching
> IDs with discovery via the parsing done in this patch.

And I know that the spec allows it, but supporting this possible, but
currently NON-implemented, feature would have added some non trivial
complexity across all the stack to the benefit of no one.

When someone will implement for real such big DE FW-side, the change
will follow and of course there will need to be an ABI change.

Given that I am currently in fact shedding a lot of already supported
and tested features (groups/single_sample/notifs etc etc) to slim down
the series dropping stuff that is indeed not implemented FW side (as we
discussed), and would never be used, I would put this kind of support
for big-data DEs in the same category of future possible work...

This remind me, though, that I wanted to place a check on de_data_sz
so as to bailout with -ENOTSUPP when such data appears with the current
implementation...

> 
> The only (I think) today to dump that from this patch set is
> to use the shmti dump interface.  That's not exactly nice!
> 
> I messed around with (well chatted with an LLM about) a couple of
> options.
> 
> 1. Make the whole stack aware of multi line DEs. So all the requests
>    get to return more data.
> 2. Adding indexing so you can get a multi line DE in multiple calls.
>    That makes the interface for a bulk read a bit odd.  Userspace will
>    have to be cleverer given variable sized elements.
> 
> Given this is a ABI related aspect, needs figuring out sooner rather
> than later I think.
> 

Talking about the ABI, since you mentioned in the other patches:

As of now only the ABI_VERSION IOCTL is 'size-versioned' and there are
flags to indicate supported features (both HW and ABI feats) AND fields
with reserved spare space scattered all around IOCTLs so that it should
be possible to add minor features using spare space and flags without
changing ABI version, up to a certain point of course: if the changes
are too radical a new ABI needs to be introduced and  ABI VERSION will
be bumped.

This seemed an acceptable middle ground to me to avoid the complexity of
having all the IOCTL structs 'size-versioned' and related flexibility that
maybe is unneeded in this case...but I could be wrong (maybe the delayed
future possible work to support >64bit DEs is a good reason to have an
ABI that is more flexibile without the new of breaking changes...)

Beside this I did not find really so many examples of ABIs using full
per-IOCTL size versioning, and given my relative small experience on
this and the lack of feedback till now (beside a lot of chats witth LLMs
:P) I stick with this easier ABI layout.

Thanks,
Cristian


