Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37578606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oxPKgAmp;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KIxWPlqw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tb7xdtovrUiu0U2PtVOgt58uhZRmxutl3MY7Wj6Buy8=; b=oxPKgAmpdFNGIe5+4w0MBNqYbu
	vPBFcD6aKot0kivq0HJJnYtcQMXS9qnBPO/cHZHr9RHuDRC/bw1jPddWmKcMyj/6lsDAK1KThsnc3
	sge95jO0uWF6BmHQZyvH4qpWRPktb7Hq6bT+oeXNj2+YcG489epCrjKOF7Dmhp3PaaGktH8klHuW1
	s94A24nyAjPggx4onWPj1YERFHDrjf24xBk4fGByzdfLUqopoeIEHb0nDejXjbbsa7E9IEvMCP36r
	8iX0k8K0G7GSw91e0kFMEFKEpvMaiiHv59HrIctYDrvBEKT6eOVoyiozlMDxVnITYobALeiTsGqub
	4yPwAiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPd6-00000008yi8-3ITB;
	Thu, 12 Nov 2026 07:53:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPd3-00000008yh5-3FLh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:53:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-497614c95f0so2180514f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794470025; x=1795074825; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tb7xdtovrUiu0U2PtVOgt58uhZRmxutl3MY7Wj6Buy8=;
        b=KIxWPlqwZONGHAj/AKyZv0VIA9gZsnUd3vOkDZy/LmdP9gvlmsXkehKE6vJEpQyKmc
         6/Izvi9ibps/rsO7FYqdbF/9gRfHC0+J9WWrt2IMaWn5l5SuCr19uwBMkiRrph76cRFB
         3YqmUPFF7LVwgbH1EtFzbnwPOl/iicanKtwl/OjUoMOvWK5q26jSeoW5KNJJsq9N6fR1
         8gOLWZ4sGrGt1qbtlTieKhgRhGDAmKvyh4Jrt1MEdzODswZbgdZxxpGBDND6EmhVp+oi
         XWjBLLGdZV9HbLQZjVJH7vKEYptCVXTaN1ngb/M074eVsuikCraTDS0isMqn+IPE8SnD
         KFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470025; x=1795074825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tb7xdtovrUiu0U2PtVOgt58uhZRmxutl3MY7Wj6Buy8=;
        b=PjXa/4e49SkU+wVINF3qcMuFDsVh0zZn44AFargPCblcZgWhWxESDzUI5lEsB5w3Jr
         De+WVdqg7/SZ30VnJLgcGAH9F5i0t2fAP5R0RWnIM4S6r9oF/QrKZUU4IdoR6ojvwA/a
         DlChE+4Tv00XFNQBhuAUVPnVqULrjlSQJgkIndu/+RoalbMKsAasUaSvpK0+DFccmjgF
         kjR1zItFoxnF6XD8PgWxBY7/5bm67Cd0uflz6yFdXo6n6Vh1zvPEaY72iFniWpx2LwVT
         1+aCz4ZCWil480tFBuZHjRzu0hhxa2t1fa7npn2RzKW6QDWn9KK2Bbkc8YENhHePAA6a
         F5+w==
X-Forwarded-Encrypted: i=1; AL+hErGe/4kET2GRyw90ICzvCcXzCj+FRTYqrh3K/h+esypyrdK5e7VoKb4ocZJi+4JMx+cc6kKuHh87iaVhFcLdyzRZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/GjX1JD5B45ZALn/Ip1e5EqJ6aYzGc++v490J/PLvqeu7fE7SY
	wjzrh1+6xWxwyFMmHVzzq6sJk4uHHoqPQf2RrmjnPWo4+pPps6Kdrok040hPVoXzOw==
X-Gm-Gg: AYBFou0G+rBogWdBvGxCz1lskEWEWBYAkIqiNtSqA1tTHgIsywOtb/S9zSTNuwly9xl
	L3SlKlihABHdqyMclsX89oERsFuX1wgqg4LvyDMWkyik/RqTY3CDaYWst+q0UmG5QilgbmNpTfi
	qOABzKfhv42i1L4ipAtnS//4eeNQ7UNGezrN90ItfONOH6ztyFFvRerXIC0yZpzt9DpKc/ZX70Y
	bVqXuNmFsKlwL5qlWDSgjQlFUoNQZAa0NIXoRgs9+TFGLOK0JWMLzp6ZuPg3Nz92264cqg3Skoe
	p6QhXbLOOJk9elni9NJpjkwd/btgLdk+5tQFp4yruPqBQg2I+N0cBYimJ6yVY4eaT6DoggB2USx
	4qS3ybfKWCtveTVWs8CGj+ye+MJQn0iiLLV6v53f4p7sSsV/lLxbMCCc7o/87aMZHxu7pvlQF/L
	s76nfLFzPGrqvNqWNcr92O0up7FfShloTQU7Po9g+h3w/D2pdwJElqhAQnE4FhVOqsciAoJ2wtZ
	W9ZunswZcJs3qAE6O06VG3UgHg4N0UmMcKVk8A+faBges5IkKX+ewVN6KQ164+j+Md+r+TLb9cY
	VDly7cj8236Jh7lLFzOA9QXsvQHF+QswU6h+7h7zt92W9tA36gOn9t4Eu3SQ01PyBQ==
X-Received: by 2002:a05:6000:26c8:b0:487:40d:af29 with SMTP id ffacd0b85a97d-499c84b52admr8993973f8f.36.1794470023947;
        Wed, 11 Nov 2026 23:53:43 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm15541519f8f.10.2026.11.11.23.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:53:42 -0800 (PST)
Date: Thu, 12 Nov 2026 07:53:38 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, ljs@kernel.org, ryan.roberts@arm.com
Subject: Re: [PATCH v1] KVM: arm64: Fast path transparent_hugepage_adjust()
 for non-PMD folios
Message-ID: <avVwgiUduRV3xQQ1@google.com>
References: <20261102211900.504192-1-vdonnefort@google.com>
 <867biu2ujs.wl-maz@kernel.org>
 <aunvGQb--3Lp6kQp@google.com>
 <86pkwb202x.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86pkwb202x.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_235353_854887_B36D1C18 
X-CRM114-Status: GOOD (  42.18  )
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

On Wed, Nov 11, 2026 at 09:23:34AM +0000, Marc Zyngier wrote:
> On Tue, 03 Nov 2026 14:26:33 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > On Tue, Nov 03, 2026 at 08:22:47AM +0000, Marc Zyngier wrote:
> > > On Mon, 02 Nov 2026 21:19:00 +0000,
> > > Vincent Donnefort <vdonnefort@google.com> wrote:
> > > > 
> > > > transparent_hugepage_adjust() must walk the userspace stage-1 to detect
> > > > if a PMD-level mapping is installed. If it is, then a stage-2 block
> > > > mapping can be installed. Even though this stage-1 walk is most likely
> > > > cache hot (in most cases, the mapping has just been installed), walking
> > > > a page-table is still costly. This walks accounts for ~5% of the
> > > > user_mem_abort() execution time on an Apple M2 big core. This makes a
> > > > fast path interesting.
> > > 
> > > This raises a few questions:
> > > 
> > > - Isn't this a "fast fail" rather than a fast path? You don't make the
> > >   S1 walk faster, but you instead avoid cases where it would have
> > >   returned an level-3 size.
> > > 
> > >   If anything, you make transparent_hugepage_adjust() slower for the
> > >   case that succeeds. I don't think this invalidates the approach, but
> > >   it feels that the commit message is just wrong.
> > 
> > Yes, "fast fail" would be a far better description.
> > 
> > > 
> > > - How do you measure this? 5% feels like a huge amount for something
> > >   that should be 3 loads. Isn't this more an indication that the page
> > >   table walker is overly complicated because it was designed for
> > >   something else? In any case, It'd be good to verify your findings,
> > >   so please provide a minimal reproducer.
> > 
> > I have booted with qemu a L1 guest. Pinned to the biggest CPUs of the Mac M2 and
> > set the performance governor.
> > 
> > Then in the L1 guest, I disabled completely THPs and enabled the tracing
> > function_graph to measure user_mem_abort() and get_user_mapping_size(), before
> > booting a L2 guest with a single vCPU.
> 
> Oh crap, this is *nested*! No wonder things take ages, as you end-up
> going via S2 (and any miss in a TLB is pretty taxing). This really
> should be captured in the commit message...
> 
> What is the impact on a non-NV setup?

I do all the testing with nested: it works great, and it makes sure I don't
break the machine :) 

I have tried on an Ampere Altra machine and the results are actually
interesting: get_user_mapping() seems on average taking just as much time
(0.26us). However the whole user_mem_abort() is also shorter (2.3us) so the
percentage is actually higher: 13% on average.

-- 
Vincent

> 
> > That gave me something like ...
> > 
> >  0)               |  user_mem_abort() {
> >  0)   0.208 us    |    get_user_mapping_size();
> >  0)   5.958 us    |  }
> > 
> > I have skipped the outliers (the function_graph prefix them with '+', '$' ...)
> > which I believe are most likely related to interrupts.
> > 
> > Then for each pair, I got the percentage get_user_mapping_size() represents in
> > the user_mem_abort() execution time.
> > 
> > Now looking again at the results I have, I realised I gave the mean (5%) but
> > perhaps the median which is 2.7% is a better representation of the overall
> > improvement and is slightly less impressive.
> 
> Yeah, but still. Please respin this with an amended commit message,
> and we'll see how we route this.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

