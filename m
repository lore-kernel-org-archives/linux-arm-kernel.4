Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B15606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i197htIM;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kBu5OW3r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oM3xVs7K0+cGhkDXcxAVD5yhKjuUtv/5wSCqKlsYXus=; b=i197htIMIgsNzTtCFMjyDM/pIg
	PqR+jK4l/c5FqnqNZbe4ZALZpdq8ffIgDGxItKGYAQ7CgAIV3NgelynRXTjG0pdDxz7nTaxMAGGIu
	GQb8ibfdYhmXYk5ut13McvHVn4YCa6oqvHrLbEJjdRD+GR9AyHf1hm1K1dRTYW6CN8dUBSrPNy43/
	alg3R8RXTeEKlA5qOx5P4WTNQK3d0Sv30pG6S6XC3lihEtkpyDvZo8MzdgH5rp9oyNxe3TgdomH2M
	oucXs4SDcca6vSQi+GqN4mxFXeGAyAa7K9Z8oJ7kTuP32mdg4up+yRwwiUJkvN/VzNjVZC7HOzwRB
	7rDvj9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUNm-00000003d5i-0eO9;
	Mon, 23 Nov 2026 13:46:58 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUNi-00000003d59-0z0Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:46:55 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-55be673e029so372611cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795441612; x=1796046412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oM3xVs7K0+cGhkDXcxAVD5yhKjuUtv/5wSCqKlsYXus=;
        b=kBu5OW3r635LnbAuzH6h6F9Xrh9yQTwKqrK3snW0mIE7qZgohwOPrS7wcJF3mGMgWg
         OidRrKtu3l+QeGYlZ59vLM3H6GiLXqLSBZJe0wnn6gjsA24oI7xQ0XrZKq0SmAMwB1lD
         TPejkaAMrPP/ntKIlTt5Lb+PQtv7rE9E7DIwSryLl4MbbR4Bhq8V4iYvRNr+puHMA4g2
         +kSij77TJk4ZWu0UYCHVXiK7Dz8dYIJs/yCcdGsTEYJEHRs4tZLNmSBxZ4OXCh4P3Vew
         M4IIAHSZiw1NgbRQzlJq7SHHCpJYk4riWxS4uPx1CY8ZQr2Z3YWUbzvxevHEehpaN5fz
         1k8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441612; x=1796046412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oM3xVs7K0+cGhkDXcxAVD5yhKjuUtv/5wSCqKlsYXus=;
        b=cxFFD29ACR6WqyfNCNm1p5rghV5zq/HlmqA7hSVeINVLxxDKNXgVlWrhb0AGxTTO/L
         6o5ewvXmoUiH0HPJhLlCFhVANnXqMWzY4OMnXAz2fFlcg/FTwxbx18B/OPgboUSW/ZBF
         ura4nyzu7AM1ljXA2DExtQJ1lugm7WL2UdL9/lHUxoC7bl6hUmRjVYnh2FQA1K0ywerC
         VMZCWl+he8oduvGmZeEb7QRNJn49uSuiO66dv3sLffR53dVJ3xRRWeLnwycvX8QKXoI3
         YRQ8TOWaPBKFcMJuyExnGo6ZLyhGDD729SAMYARdfpg9TVBfQM/sEOWVz23orLzCXa+a
         6JAw==
X-Forwarded-Encrypted: i=1; AL+hErFkajWnCIKVQAlYso1QcjRoM9CBHewTwCV3Axa1dPVRaXgH5b3WSysWfR5JGlmWJqhCPvPSKHEqEzs8Av3Hy6pb@lists.infradead.org
X-Gm-Message-State: APuU4Z/OPaA07y7nMmQw7yU4iysF55eRaLI877FFPWiz5wBoacR5nFBh
	SF9wz9X0X5+33OfEY6MRUIlIF6GIXAqHIzN8hQRoLtxTqshm7dY9+wJrrNG4xxJFlw==
X-Gm-Gg: AZFdTZe2n9AAUmJybYjWZMPvHHORKpTCj0USxusMwM/QmnJGjaxLeWFInXw7tbMf5Sz
	kY0VvOg2yaZhAQGFd7XEvAauJjd8XKoVbxvy5KWmQ4R3k8+Oe8Ahv30W5CZbdSvM+uBFAq8IaiN
	gZ4PEN9fQ3rA9/Xl0X+m1n8mAnQZwZAiCDoESTA8+BbTKH9NLNbrm8irhl1DkV1uaUwvqCddrJm
	qbYTF5uRhb4uYkGyTnUbfk7B87ZXSIRdUFiINPTtGZS8L49E93jIdxjJEqBLIb8ke7hV9vWHwkr
	jSOfDJmsgLO6OsnVxFo/MMzlSHRAQ3v2Cb+GQ1CsuCYH3lhUBJJk3rd2D66jUqF0f9PvpSMyx0u
	XZ60nwlBTnyV5IQ49r65A1HsD/gi+ZUD/arJBeDs2W6diIdjhWLY2OJKbIeK5c+MsmTeXN0wPCI
	VVl8Tt3bqA2uLO3c8S29/yJYxVLdAyGKXnukYzO7ai6mVnHzWlPbuMwZmF/LFEn7GdZ8eedvusB
	hLDfZchjMiiv9piFpYyUypwK7s4Xq/W3m8EMbYN3xsI7GBNGYIHlK4ulD/c7TnHs73pHCZx8aLz
	8jDh3Y+3XDYSNuyLCXBCgXS1bk4a0D/nGhKooOINLVoczbWaqzkOJ5WzRgjVymx98G6q
X-Received: by 2002:a05:622a:5817:b0:536:78de:775f with SMTP id d75a77b69052e-55d8909c85amr32019921cf.15.1795441611495;
        Mon, 23 Nov 2026 05:46:51 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35055486sm8586840b6e.12.2026.11.23.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:46:50 -0800 (PST)
Date: Mon, 23 Nov 2026 13:46:43 +0000
From: Pranjal Shrivastava <praan@google.com>
To: John Garry <john.garry@arm.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <awRDwxkrZjouy9b9@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <0fe0d909-a01b-4f4f-9faa-c533b8925f25@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fe0d909-a01b-4f4f-9faa-c533b8925f25@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054654_286634_9C68080B 
X-CRM114-Status: GOOD (  35.90  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 09:17:26AM +0100, John Garry wrote:

Hi John!

> On 9/29/26 04:45, Pranjal Shrivastava wrote:
> > Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> > queue's producer index to safely gate command submissions during device
> > suspension.
> > 
> > The flag embeds the suspend state directly into the existing global state
> > The flag is checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> > which acts as a Point of Commitment, ensuring that no indices are
> > reserved or committed once the SMMU begins suspending.
> > 
> > This prevents a situation of "abandoned batches" where indices are
> > incremented but commands are never written, which would otherwise
> > lead to timeout during the drain poll.
> > 
> > Update queue_inc_prod_n() to preserve this flag during index
> > calculations, ensuring that any in-flight commands that successfully
> > passed the point of commitment can proceed to completion while the
> > flag remains set.
> > 
> > Suggested-by: Daniel Mentz <danielmentz@google.com>
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 35 +++++++++++++++++++--
> >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  5 +++
> >   2 files changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index a123810fac57..7f89e2306942 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -218,7 +218,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
> >   static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
> >   {
> >   	u32 prod = Q_POS(q, q->prod) + n;
> > -	return Q_OVF(q->prod) | Q_POS(q, prod);
> > +
> > +	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_POS(q, prod);
> >   }
> >   static void queue_poll_init(struct arm_smmu_device *smmu,
> > @@ -726,13 +727,42 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> >   	do {
> >   		u64 old;
> > +		/*
> > +		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> > +		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> > +		 * our new indices yet, we can safely bail. Once the indices are
> > +		 * committed, we MUST write valid commands to those slots to
> > +		 * avoid indefinite polling in the drain function.
> > +		 */
> > +		if (Q_STOP(llq.prod)) {
> 
> I know that there has already been other comments on this "stop" flag and
> whether to use it in this way... but, if CONFIG_PM is unset, could Q_STOP()
> ever return true?
> 

No, the flag is only ever set from the suspend path. Since I'm moving
the PM bits under CONFIG_PM in v12 anyway (per Will's comment), I'll
make Q_STOP() evaluate to false at compile time when CONFIG_PM is unset,
i.e. IS_ENABLED(CONFIG_PM) && (p & CMDQ_PROD_STOP_FLAG), so all of these
checks (including the one in queue_inc_prod_n()) just compile away. Does
that sound good?

> And it would be nice to not add extra logic in this loop. It is very timing
> sensitive, and adding extra checks can increase the chance that the cmpxchg
> fails (bad for performance).
> 

That's a fair concern. A couple of things here:

     - The check is on our local llq copy, which we've already loaded, so
       it's a bit test + a (not-taken) branch, with no extra memory access
       before the cmpxchg.

     - Per Will's suggestion, I'm making arm_smmu_cmdq_poll_until_not_full()
       bail out on the STOP flag, which lets me drop the check at the top of
       the loop and the extra READ_ONCE(), leaving a single unlikely() check
       right before the cmpxchg.

It does need to stay in the loop though, since the cmpxchg is the only
point where checking the flag and reserving the slots is atomic.. a
check any earlier (e.g. in arm_smmu_get_cmdq()) could race with the
suspend path setting it.

Thanks,
Praan

