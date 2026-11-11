Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BxTKncxX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m6QWUogq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rK3zf3WORu1ZXVGJG2PmksRY90fhsQibZT0nyfHuenc=; b=BxTKncxXLwzRLHV3hUS4LP0TZt
	RNpkGpbwfOzLfJY7Egd7lwnQ0Zv6e+R7vxSJUYWIZnNvtBDotqaJPvmPzhQ+pRUjYKp+FZQeHN2d6
	pTR78YHztunVrYpOjSkO2yW3SIGhjC7kq422jRWQ1vT198u/udUBsbVGxUIdlaESN80QKLe5UqeBo
	rLNj2K75WnTkMfxMmMO/8NAQUJxcbpwtqC3zOPfHBCS9Q2IY5aKSXJLmYrU1L0VuOjB+5K62J96F7
	oTW7LgBbn9T2kcFHsBEqsGkUaYTxs7uUrpbcw83AyRsOACGmQAgy1b9wGBML+WBut6b4c5w5jVC5P
	x1XjMnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5MY-00000006K7L-25qc;
	Wed, 11 Nov 2026 10:15:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5MV-00000006K6q-3Kyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:15:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B40C1576;
	Wed, 11 Nov 2026 02:15:23 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05E4D3F632;
	Wed, 11 Nov 2026 02:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794392126; bh=0HlfkY9hnP7PkFvX7q+xnImD2I72F3eSwZqnjsju5x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6QWUogqmrU+D+IusNfo+7RENCrkzi092lTtwXoEamRlM3gUAzdE8G1Qn8+BaU0YB
	 Y7+7Vtlp8e4gNTg95tt1c+SdkaATlzyXhf3KwPqDtoCW8dFAWhW/xZ64dHQSE1Vnvw
	 B7eSrwp1R6DsvMI8m//gQ58HEZkuUvxuazb5VwNQ=
Date: Wed, 11 Nov 2026 10:15:16 +0000
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
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <avRANKPwp-r-QSR4@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261110163809.000070d6@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110163809.000070d6@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021527_972738_6C4B67F0 
X-CRM114-Status: GOOD (  36.23  )
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

On Tue, Nov 10, 2026 at 04:38:09PM -0800, Jonathan Cameron wrote:
> > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > dedicated to System Telemetry.
> > 
> 
> Hi Cristian,

Hi Jonathan,

thanks for your time...I sincerely hope you're travelling abroad on some
remote timezone given the time these reviews came in :D

> 
> So, the main issue here is pretty much summarized by:
> 
>  28 files changed, 12801 insertions(+), 99 deletions(-)
> (obviously there are tests etc, but it's still > 10k lines)
>

Usually I try to implement the complete set of features of a new protocol
but indeed this new Telemetry thing is huge by itself so it became quickly
overwhelming to review...imagine to code and test it.

> There are relatively few reviewers who would even consider taking that on.
> I foolishly thought it wouldn't be too bad (and I review a lot of code).
> By about 3/4 of the way though, probably much earlier, I know the quality
> of review went down considerably. Honestly it was probably a waste of
> time continuing but I'm stubborn like that.
> 
> So, unless you have a path to bribing or sweet talking various folk to
> deal with reviewing this with each having to set aside multiple days
> to do it, likely repeating for a couple of versions yet, I think you've
> got to figure out out how to make the first patch set more manageable.
> Probably don't split it up as much as the mpam or CCA folk have had to,
> but you have a lot of colleagues who are experiencing the same problem
> at the moment. They may be able to advise.
> 
> So it would be nice if what was in that first patch set was 'functional'
> but I don't think it needs to function on every systems or support more
> than an absolutely minimal feature set.  Just fail to probe when you see
> something that isn't supported by that minimal set if that means
> the thing won't be functional.
> 
> Once that's in place, over a couple of additional patch sets you can
> get to everything you have here.
> 
> So what if you choose one data path (shmti perhaps), no notifications,
> events, maybe even simplify to one of the readback paths.
> Maybe even drop event groups initially. 

Based on our real world initial customer of this I can certainly drop a
few features that are not supported anyway by the real FW and move it to
a later patchset, stuff like groups, notifications and single sample
reads, but all of the rest is hardly removable while keeping the system
functional and usable.

> Possibly even drop timestamps.  Definitely drop things like boot-on
> support and debugfs (unless you are using that as a cheeky 'functional'
> test ahead of the main userspace interface.

Not sure what you mean by drop timestamps, definitelly cannot drop
boot-on (it is how systems are configured indeed) neither debugfs used
for bring-up and FW debug.

> 
> How much would that slim things down?  It doesn't even have to be
> useful, just testable.  Realistically I think the hope of getting
> enough review doubles if you can halve the size of what you are asking
> people to look at.

I am not sure how many lines I can shed with the above features drops but
I'll give it a go anyway at slimming down the series after I have gone
through this round of Sashiko pains.

> 
> Anyhow, gut feeling only but the code felt like it was in a much
> better state than some of the versions I've looked at in the past,
> so I think the game is now how to get it over the line!
> 

From the testing/functional/performance standpoints the series has
definitely improved especially, but still some road to go.

Thanks,
Cristian

