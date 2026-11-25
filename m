Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107B4606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qj4k5Qp3;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAHfkZqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=; b=Qj4k5Qp3QZCovz9QGfoe4hYa3d
	IEE/NHk/Ri0AlaXP4bS8Uqk3WCaRSCSk1raQhSFn8GHcE12gmR4uhsfkJyR96YKwRnrWjytKKN+H2
	RpVs6puc4WPtnKtrVuRKm05b66ft10mVBCTEr0FhFQlXj4rXOLDtWB0JFFtKZMky/YQsdpw75B6B/
	VWc8NbrkGnWNsf/hv+WVriYAJM3fCXWzDKgoER+R480CYsIDQV2Nw0Aay2jlfiq4cxmyLrdFnWQ0R
	s5tAeTmQS5iXXse4NdvOTapm4PEkJ515EdBDMRtqwHBqZvOfrfD1RsIiVWwznEAYV4NWiPk8qEBQE
	UDBRvr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDGR-0000000A1ph-0f1v;
	Wed, 25 Nov 2026 13:42:23 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDGN-0000000A1p5-3c2F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:42:21 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1b0739d31b9so13117c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795614138; x=1796218938; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=;
        b=AAHfkZqpRqkRBBI586/M2APz5iU/dKJfvYu7Zdqq09KSN68qHCuRAMaYp5Htsa7tbN
         FxzuCxWRM5+14E98TnEo1avBzpsaNVNjgDiAozqekPYrmZRKYAtXNh5ZJO4hP3nNQFuB
         yRlGZ6XFrkgecDUITGU8IAMzoTcih0QyjAUwwBmvAJSILzjFdUfGxXmFoMC53Nbl+/4g
         bO/mvf27YnI6Py3ZXMDKhYHBHvxM0azRVEvisqmjKJLMGe1o/NnegzjlH8ExotGf5+gP
         ogFsTEffwDw2aYfC8xVKFIl6MKuQiFHa4+3YENdaxx5tGGyN5Dh5JQopZif2h9L9Qh18
         GuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614138; x=1796218938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=;
        b=sLaYuBv3ZsRS0ZefQeHUwl/tbKqFIVRDNPWPOZHyVf8x6w/WsnTH1y9IzuZDEtpoxH
         HxUj9expMTBW4+/mtGkZwpAXKX6x7t+bmF762/Y81OwNKxD93x0q5Y0hM+XOJJ9USUQB
         h0fuoVWfVHr9GPJU+RYk3EZWTW/Xuxkz1h4v+6yY+iw8opZ8mNvkZ4mNS0T5fiUHJE40
         FExMgTWLQwGnEv/atn/58reHrFQBB9jmqQRhqLi9CPlHDv7zE5CmZErdbKnKBjo8tT/p
         qAJRRz3XYyiFZU1pXZyPSFw2bnivrpauXF/vHWm+OpDI1htZfH542v6YXFLIhgZGqrRH
         A87Q==
X-Forwarded-Encrypted: i=1; AL+hErH1wIcVjpJ7S3uWB2bObuUTP4LL4+7Ni8/AaTxnMXqmgk/2cEg83atIQKkFmlqUqDp1n+6vty7FXN4Tw5MbLHoE@lists.infradead.org
X-Gm-Message-State: APuU4Z89D9q4tLdmkANBStkfJRza2so18hPTq4vapYadJC5dZE0mmlCe
	HdoO6yW1dm04Mfs1EXGQf0Pz8Jil68emH8TTE1SzteeHQ9tH2Di6/0WskGACdZb3iA==
X-Gm-Gg: AZFdTZe6LVw3Up7//Em4UPFlMzuRn3tYSlIAp3UCtPgmrK+dDdPmfkiDt2R2l0uaxta
	91m7iKpvX2LpW0YpWXgxZPHKs0gSl5JhHIGXz3IXaqXLATmzlnOiDo6MwrZEPlo4+Jn4AlqnlYW
	HyLCTNrDY1THzW41HZ8YAETSapNk53mXSP+32DWcZopu+hQG5JNFK8VjLZxqyz7VZVGrbXAqgvS
	sPj7LOZPcUpiWZAfp3TcIZhzASH9i2XANwhOETNraAJzrLG2UHpCru1/JKRPFQmXMA7C1PidCOJ
	xiyEhzn2CYznpdVp82nchJmlON/Vy6NGMRKaMgr0V4NtV4KSD919XGjcJ9XawJnOZK2D5cYW2PP
	fuduPUVTWS5UkpA9h24AfYSNZNuW8q1pk3b9VwVqgiN74H/rXJnW+l+Xs5U8XimldU4kAAHZbuq
	vi/avTE/WCwDJBjo6NrhBb+CVxO3ND4xIIfZud8idvqw2Qi6Vt9YwRkmYzg0WtpuNMZxxR8CWAR
	nhHUKxclCUGK49GVUj7THqTDWFj0COFGIEUPJtqUMpre6UHn/HdD/PKFiT+obiUFl7lUIqBVxcI
	kXQKzwa0RocfHVUzJHnBxCXKP2+3wHIuQ33+6N7PUGrDSSeC62gyeKqXGWVVeIPkgmI=
X-Received: by 2002:a05:701a:cca2:20b0:1b3:c4ba:8e0b with SMTP id a92af1059eb24-1b56338d12dmr4008785c88.2.1795614137046;
        Wed, 25 Nov 2026 05:42:17 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm61787393eec.26.2026.11.25.05.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:42:16 -0800 (PST)
Date: Wed, 25 Nov 2026 13:42:08 +0000
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
Message-ID: <awblsA9PMu4jwd3P@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <0fe0d909-a01b-4f4f-9faa-c533b8925f25@arm.com>
 <awRDwxkrZjouy9b9@google.com>
 <f0cc8236-d06a-4f2d-a9fd-e60977017979@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0cc8236-d06a-4f2d-a9fd-e60977017979@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_054219_929255_8C9EB22B 
X-CRM114-Status: GOOD (  29.80  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 09:37:02AM +0000, John Garry wrote:
> > 
> > > And it would be nice to not add extra logic in this loop. It is very timing
> > > sensitive, and adding extra checks can increase the chance that the cmpxchg
> > > fails (bad for performance).
> > > 
> > That's a fair concern. A couple of things here:
> > 
> >       - The check is on our local llq copy, which we've already loaded, so
> >         it's a bit test + a (not-taken) branch, with no extra memory access
> >         before the cmpxchg.
> > 
> >       - Per Will's suggestion, I'm making arm_smmu_cmdq_poll_until_not_full()
> >         bail out on the STOP flag, which lets me drop the check at the top of
> >         the loop and the extra READ_ONCE(), leaving a single unlikely() check
> >         right before the cmpxchg.
> > 
> > It does need to stay in the loop though, since the cmpxchg is the only
> > point where checking the flag and reserving the slots is atomic.. a
> > check any earlier (e.g. in arm_smmu_get_cmdq()) could race with the
> > suspend path setting it.
> 
> I just find it odd that we try to elide commands here (at the point of
> command submission). I would assume that any commands would not get this far
> - or even be submitted to the queue - if at the point of entering sleep.
> 

They never actually reach the queue: the check is right before we
reserve any slots, so nothing gets submitted.

As for why the check sits here and not further up, we did try that in
the earlier versions and have converged on the current design:

 - v1/v2 [1] elided at the call sites (TLBI/CFGI) using
   pm_runtime_get_if_active(). That raced with the RPM state bouncing,
   i.e. a caller could see the SMMU active and the suspend could kick in
   before it actually submitted (as Daniel pointed out).
 - v3 [2] tried to fix that with a new pm_runtime_get_if_not_suspended()
   API, and v4/v5 [3] replaced it with a driver-side biased counter
   (nr_cmdq_users). That worked, but it meant an extra atomic on a shared
   cache line in every command submission, which isn't great on high
   core count.
 - v6 [4] replaced the counter with the STOP flag in prod, and v7-v9
   [5] dropped the call-site checks entirely, leaving the CMDQ as the
   single place that decides.

The callers themselves legitimately run while the SMMU is suspended,
e.g. a client unmapping (or a deferred unmap) while it's off, and we
don't want to wake the SMMU up just to invalidate TLBs that'll be fully
invalidated on resume anyway. So these commands do get this far, and the
only point where "is the SMMU on?" can be answered atomically with "I'm
committing commands" is the slot reservation itself.. any earlier check
is racy against the suspend path.

[1] https://lore.kernel.org/all/20250418233409.3926715-1-praan@google.com/
[2] https://lore.kernel.org/all/20250616203149.2649118-1-praan@google.com/
[3] https://lore.kernel.org/all/20251117191433.3360130-1-praan@google.com/
[4] https://lore.kernel.org/all/20260414194702.1229094-1-praan@google.com/
[5] https://lore.kernel.org/all/20260527221407.1756491-1-praan@google.com/

Thanks,
Praan

