Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L9KaJ7XB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nfwAUSqD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=; b=L9KaJ7XBZvgRDjYbrILDUbWk69
	eLzIXUEyiFcxF2iGoZcXz2PmD2CDqk1BVe//xlW7jlgbJcfPB25Jehj32AwJYs1oocggaMEiIZlI/
	pDR5Qc6SJgTi1pNXL1pApulg5FVCoQSNdGZfeC8whxSVITpwwXOtw85lYbRU7t7u8HcNmqPUWqn1r
	CNgoJRM9Dscc8eh1xOsRRjEmwo3pbCTdiBIGOkyYmDNmAVMn94A6biYI7WlkUVxWZMZS1MePIjQ43
	mruT0wFeL5O8yd5OYs5TQe80NK9BzoY18XrJ3LId6NcrE1FvwvLgun6lGC51Akjgje8kSFdWiWR+1
	bp7b5Eog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUUe-00000003faT-1P5B;
	Mon, 23 Nov 2026 13:54:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUUa-00000003fZB-0rj7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:54:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2f048bc09d7so98375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795442039; x=1796046839; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=;
        b=nfwAUSqDnj4I4UXxAk+aTAC2XkxxgLmuYRJ1CFDx0jETmhQGgpkn2a96pVPC/bb8+/
         24wn5+QNXDoNCdFIGXFvxzphjiKGNDayKx4uDPv5HMdsMMDejaadXS2uFP9BohWtHxcD
         ogvjKigy66CTWmHLw8KxfliS56U2R+CBPBzJ5MEWfTnxM8IGKHj3eILb3mohQWzl3AC8
         f95feNu0adrAr/sy1J6aT/7ZjBioTe/p5YnfKDjdh7xYrYdFyKQZsCgrb/LokHr/FF9/
         c6VI1eyEzaug09Y24sJW3VL6TlScG3B8XKt0okHTa2j/iY0VZtiDmZ1Y3mxzbkhKivgD
         o+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442039; x=1796046839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=;
        b=eMoE0f9Wr+thj+AiUkNbLsHE1nCK6xfLk+KzscrmbJt+hGjMsw+qjvP2Vq9O0AwX6P
         xPLudmNOil/TLk8lbyqnhHRD7TWLtcUulw/FJvv63se0hig8E5s9nqrsPVDgdf1n1t5C
         7tPJ1lC+26qgqotnVvnTL/NMjQYsDSXcfHW1U52ArAa5zbuyIkoE1r2nYeLtZ0CNew3L
         6Xn8ffcGY4DnNMIoLTTEIinswtMyjwLBcr0o3/028sAULLJjMn4bWPQ8+aQsDYbHe6vA
         SxntxzUvbOUPcQv2ZR4jrIrqtWlNL+BdmPWjrIWv+K4X4Zy1fVolvSTndL83xwUnYUw8
         T3Aw==
X-Forwarded-Encrypted: i=1; AL+hErEi0p02ak8lFFTo0l8bCd4slOCfKyibvD5OxQkXjsM+KhJdy7MM8V4V5CD3jFvA8IXbkz8Go5F28vWxU6I7YNsi@lists.infradead.org
X-Gm-Message-State: APuU4Z88XNgFlX2uRWq08offV2tYRNJDeIUsdCjP5BMoNET/keriG1vx
	aU44eHlbRMNGbZlL1aGIsE/zjBgUtoisDPkaMTTUNimbOFBkNwUNEB+i7GiTeNit6p9iABVn/aN
	+0WS35w==
X-Gm-Gg: AZFdTZc+K0zSPbiF8qSWmzIwpKavyPWJ+jHKf5qTj/HIjlzCGt2j/h64l+Np5l99W3q
	QEhEY75dRY3aP+/8VA6Si67wBSegrsp/EVKUg4sC75FVZH01joxlcuN0aF8urzzg5R+I9oIIrn/
	Jrer2k7uwICWu66viP61NX6eULakCOtzYb/VviYNh9sLGP2plMpC0kt/KFwCcFvqneESjHr/pY1
	6BibBheJq/kJVcNCC8zNcQz9SnqzSgmbTCISWgfQgpPcvRvqKmPs3UgIZ0hVA8rCpiEslu9V8jI
	UvOQlDDeY7Dxt4WTCesti7By6/X1t9uOoX+ujq6D8+cNvR1cu4+1cTRjSGfNShwFv5WW0Els8cw
	kLxGhMc/NWeTFv0ZPBVml4ScomkD6E8lXXuo2dNUKb2LMql/EuisjF+mS5IpSTTYSCenvpetgOz
	AAH6981n83hX8IB5XJAsomFG4+4/riX+C5IC+DqAHYgfa1XJ1cbSIIzQnVv1sBcWBIouX/lmnzn
	1794Datg2ezthCei8Eo1fZRLvWRTWzmtqERyKPERW6KtLWdG7OdmGX4P7iuWyGamJ3lMliN1Q55
	kKNLxRlRSTdJwcjzt3+Fl7gy5+gMg50FonpnJYCWPQEqQCL+94L0gtkiHcehsSZJZLE=
X-Received: by 2002:a17:903:3c6b:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2f062bd72b9mr7103195ad.5.1795442038751;
        Mon, 23 Nov 2026 05:53:58 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm7836326a91.2.2026.11.23.05.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:53:58 -0800 (PST)
Date: Mon, 23 Nov 2026 13:53:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <awRFb6Q6WW1Ys0vq@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck>
 <atXTtaxz0z-U-XSJ@google.com>
 <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055400_944641_5FC8AFF2 
X-CRM114-Status: GOOD (  41.88  )
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 12:27:58PM -0800, Daniel Mentz wrote:
> On Mon, Oct 19, 2026 at 1:24 AM Pranjal Shrivastava <praan@google.com> wrote:
> >
> > On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> > > On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > index deefb17e31eb..794b258550dd 100644
> > > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
> > > >  #define CMDQ_ERR_CERROR_ATC_INV_IDX        3
> > > >
> > > >  #define CMDQ_PROD_OWNED_FLAG               Q_OVERFLOW_FLAG
> > > > +#define CMDQ_PROD_STOP_FLAG                (1U << 30)
> > >
> > > I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it's
> > > plausible that the architecture allocates that bit for something in future.
> > > For example, if the index field was extended, then I think that would
> > > cause problems for the driver.
> 
> Let's cross that bridge when we come to it. I think that for the
> driver's internal llq.prod, we can deviate from the layout that the
> architecture defines for SMMU_CMDQ_PROD, and as Pranjal pointed out,
> we are already doing that. If the architecture eventually consumes the
> current RES0 bits, we could save them in a separate variable and only
> overlay them when writing to SMMU_CMDQ_PROD. If the index field is
> extended, we could artificially limit the index width in this driver
> or transition to a 64-bit type for llq.prod. Also, it appears unlikely
> for the index field to be extended beyond 24 bits, because
> SMMU_CMDQ_CONS allocates bits [30:24] for SMMU_CMDQ_CONS.ERR
> 

Agreed. Thanks for pointing out the CONS.ERR part, it does make
extending index beyond bit 24 less likely, although I think non-index
fields can still use it?

I like the idea of extending to 64-bits with an overlay thought.

> > >
> > > Do we have to put the stop flag in the producer value, or can it just be
> > > a flag elsewhere in memory?
> > >
> >
> > Fair point, but the flag is SW-only, i.e. it's always stripped via
> > CMDQ_PROD_IDX_MASK before anything reaches the HW and only ever tested
> > via Q_STOP(). It's the same deal as CMDQ_PROD_OWNED_FLAG, which already
> > uses bit 31 (also RES0 in SMMU_CMDQ_PROD, IHI0070 section 6.3.27) as a
> > SW-only marker in llq.prod.
> >
> > Keeping it in prod is what makes the check + slot reservation atomic in
> > the cmpxchg.. with a separate flag, a CPU could check it, then suspend
> > sets it and samples the target, and the CPU would still reserve slots
> > beyond that target.
> 
> I think that the suspend thread needs to ensure that potential users
> of the command queue either (a) observe the stop flag (or some variant
> of it) or (b) are accounted for such that the suspend thread can wait
> for them to conclude their command queue operations. For this type of
> synchronization, I believe we do need some variable that both the
> suspend thread and the command queue users access with cmpxchg or a
> similar operation. I guess that in some alternative design, we could
> use a combination of refcount_inc_not_zero in the command queue user
> threads and refcount_dec_if_one in the suspend thread, and I believe
> one of Pranjal's earlier patches used a similar method. The beauty of
> the current proposal is that we re-use existing synchronization
> primitives and don't introduce any new variables that we need to
> access using cmpxchg.

Agreed, and that also matters for the perf concern John raised.. a
refcount based approach would add two extra atomic RMWs on a shared
cache line to every command submission, whereas with the flag in prod,
the hot path only gains a bit test on the llq copy it has already
loaded, right before the cmpxchg it was doing anyway.

Thanks,
Praan

