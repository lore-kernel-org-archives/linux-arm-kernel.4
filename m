Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFF9606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gi+1JGS9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YZGqvnmh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=smElB+v5YZUprs+9gXaadARMhHFqAhYG7NdRwP6D9JM=; b=gi+1JGS9kfTHe8Gsul8KBB60nX
	k64+Yiie9rgmqVwtVWGW04o/2DVQvByXmgQkbdABNM3YI7sduF8/9XupIA7IPOiwmXn8KaJxuml4K
	yUEKOwgkLP/xagTbQouzJMMRIaK5JYQMYJrBCj2MzY4A8/rM/hkKkJMObkNx05As9MKdt3SUVk73f
	5h1BzJxh7GLk0mlc9+7tdt9od5CQeiSKqvi+Sk0Wuc3Xvbrd7TwkvPorfSpIkX9GtfP8V7OXiv+y7
	DLWWdI3GrkPcL4tP2iO3Iaine4FUlOtbHyq13VT3PP94CGzCjMZ1jRa0ndfCWFsdaChMIYktydM0x
	6xs8wOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhCR-000000037Ie-2Wbi;
	Tue, 10 Nov 2026 08:27:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhCP-000000037I8-33Z9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:27:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 654211516;
	Tue, 10 Nov 2026 00:27:21 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02C0D3F85F;
	Tue, 10 Nov 2026 00:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794299244; bh=OiH4/fPjG8Ry4ZmCXdz4mAOVD/Wuev+W0DjPiniPLjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZGqvnmhoFCwQhy0c9nOmLxhT29f6xcSqYFGrcvUvJ+aNNy0Wc5Uapq9jKkKI2kBv
	 Z1GAkY0rVUvArwXYlOJqYTLZIjNRqOhssYXnylCVcT+UWkeuPJxfjnhBr/ow80O8A0
	 zY7cd96ZltCtjHRj6sxN8POR22ktrv1YfLdhvB9Y=
Date: Tue, 10 Nov 2026 08:27:18 +0000
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
Subject: Re: [PATCH v15 04/35] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <avLVZg-jqC5jXgY2@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-5-cristian.marussi@arm.com>
 <20261109140736.00007915@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109140736.00007915@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_002725_854986_13ABD6DA 
X-CRM114-Status: GOOD (  25.77  )
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

On Mon, Nov 09, 2026 at 02:07:36PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:50 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Allow protocols to register events with build-time unknown sizes: such
> > events can be declared zero-sized and let the core SCMI stack perform the
> > needed safe-net boundary checks based on the configured transport size.
> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v14 --> v15
> >  - better commenting
> 
> A few bits of feedback on the comments.
> 
> > v12 --> v13
> >  - improve variable naming
> > v10 --> v11
> >  - account for ktime_t field when checking boundary
> > v2 --> v3
> >  - split out of previous patch on protocol notifier
> >  - use max() instead of max_t()
> > ---
> >  drivers/firmware/arm_scmi/notify.c | 28 +++++++++++++++++++++++-----
> >  drivers/firmware/arm_scmi/notify.h |  8 ++++++--
> >  2 files changed, 29 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> > index bc046f2f83a6..a30589c9b377 100644
> > --- a/drivers/firmware/arm_scmi/notify.c
> > +++ b/drivers/firmware/arm_scmi/notify.c
> > @@ -595,7 +595,16 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
> >  	if (!r_evt)
> >  		return -EINVAL;
> >  
> > -	if (len > r_evt->evt->max_payld_sz) {
> > +	/*
> > +	 * Events with a zero max_payld_sz are sized to be of the maximum
> > +	 * size allowed by the transport: no need to be size-checked here
> > +	 * since the transport layer would have already dropped such
> > +	 * over-sized messages.
> 
> 'such' here to me refers to the first bit. That is, those that are "
> sized to be the maxim size allowed by the transport.
> 
> I'd just drop 'such' and have
> 	 * since the transport layer would have already dropped over-sized
> 	 * messages.
> 
> as that avoids this potential confusion.
> 
> > +	 * Note that, though, while this protects from buffer overruns, it is
> 
> Drop 'though'. Doesn't add anything and leads to odd flow to the sentence
> 
> > +	 * no more possible at this layer of the stack to detect zero-sized
> 
> 'not possible at this layer ..'
> 
> The 'no more' refers to code that isn't here if someone reads this code
> once the patch is merged.  So if you want to refer to what changed, keep
> it in the patch description not a comment.
> 

Thanks...it seems like the more I try to write clear and meaningful
sentences in English the more I mess up :D

Cristian

