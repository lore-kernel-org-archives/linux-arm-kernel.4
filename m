Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vL0UFxT1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHefbZEO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WqzI2P0ubLVIWtFBMZak1suctx0ODmadmSDnzYGG298=; b=vL0UFxT1kK5Eg14w97wmbECSWH
	WrMBDopgU5UEhbciMos7CLjbbSyYP5WVfOdXeZ24SQAF9kCGp3LLWEnWbwSaLBf3wri1Lgu+L30ky
	e3SUM8mytM9YhW7gY06jgSyDmM628+9msDmHjVdmVWLBXKLrTZgGzyBeZkjJjX586LnRRnk7YMDqZ
	0REOL84DNH/XsDMYAvYpbw1aZinmm/8jXw3qieVMM2K8tBqLxzWSyGDItxnAadyQyZP0Je3nc6PQX
	/lN5yUYfxtbIlpwhp8TueXL5gDBG7pcWU9+lAMsO+nHo4Rp+5CrUDAnY6D5l188SrCTQ+lQnZXwDq
	sQKrFlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNiE-00000000Yb7-2NMm;
	Mon, 09 Nov 2026 11:38:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNiB-00000000YZR-1AKW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:38:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so907443a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224333; x=1794829133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqzI2P0ubLVIWtFBMZak1suctx0ODmadmSDnzYGG298=;
        b=GHefbZEOc1LIxV2RJ+4mGUUJDxABSvXR79uMTYMQPwunp/y8FMUiYUA8U3+cWE+a93
         Ho8P72DKabXQjwcGHt1coZBlilHnJjuQ09ypouldhcw023kWCLIeqqC4BxYSQo5FLKt/
         To7yG5PPFJB4dCE/4hOvdhQDciF7Slpg8R9PmpipSbJ7+gA89M5TIvYnPYwXCEN9c5EE
         9iflh1yOs5ru0yXo26eRCcksyn+EghlCNWttnRE0cY4yR6ss1z97mh5d5ZXu7WifTiZb
         niS50qm1o7Z5FgUQ2+Bd5p+vof5iP1XPKHT2ZHLTIlVNE3hIGdemcijGoeTiloixjJhE
         XB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224333; x=1794829133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqzI2P0ubLVIWtFBMZak1suctx0ODmadmSDnzYGG298=;
        b=nujNm5tlHef6XVSYAdFncMFU1VA1c9hmiPWxOgWxVsWSN7LYF5Yxrfk3X3fjKBQmCA
         z1chdPfDHZa33KDdlC6EKiPPvOoZqLqrlaQHBUs6zJfodlLuEejmoVME2HLtbgQ+balO
         qBtakf1ILaUVYxjInsA0bcCvbpG7dC4ZWWQZrbR5J3ZK1d3QhhD+85b4J4obEniokYxf
         5QCXDiXQYSdZtZIbe6FCSpcUO68RBGxWap6Eqn+AEpLWZSLFFOzTYhIbrayKQugLvhSy
         r0gtUFzG54I2v6yNaD4WoVTJQfQ9kzPQVrV9I0c49GY1C6MsyX8hJA1IcLn2F79qs6c0
         M5mA==
X-Forwarded-Encrypted: i=1; AL+hErFvMHKLV+/Gg07+NTLxKyRpevkIOLrlamWtES2ulpBblygMAqdAOio6IU60f+82oIUN1eF96P1yXVEHmVvd0tdf@lists.infradead.org
X-Gm-Message-State: APuU4Z9bIRUlJkJzw3TEaJ0+vLsiGHuvJFaxuBeIGQouv/T9xlMD8+8R
	GXz/AzQsy8IEhVAMVQmZ53w+kaSGX4L2ielH/huiecIoJ8feYx7R6rs+
X-Gm-Gg: AYBFou1XbdZRCBnZVIOfZ+x9s9OR/2ro0Wk8UuBfPq78pBsUu53VU5Uox0WLzq6i1/C
	G4dV+sU8i1qRE0BYwwkC8nrJX3fma1EnOVUQpUWoacOZF2qRX4vedvtslWI5HcgJvByJvLEi4gb
	0KlVxW4BdbHzjFWyqleJJA6ZSfXBr6hW4SSu8+51Y6SfV4pXglwR/l4EIjgX80PEvCcfbpMscqf
	ZDQd/Y3go4g31kmw9icNcrvrDeS+j9jKLvBukRjenRrRNZ2saD2rBhU0wtG0bkccUz6tNSef6g6
	lSWsHFJ+BA7uoFKkQCbkhtWodfud59DsBderuDydZwhQxPeJRwRo66sPjohO98S6bC7ZXqs7fTE
	0EOG/MLZoF2XR3sfgUvNTo7ytL9lpqIby1cZRC7THQH9egzAPUii07b22V82F4lgmT1rV9nJMUp
	bVUHYtIzTRh/H/Q38BDlNRQ98dhB+w0DUIGZ7AP0jznJRODoyIiCHTmR4mTXM5x3fwNt6eAAran
	0KSSTJFUs4wkAUBOxExp5QfOEN2PGH7PHlF7pD/JaZkL8a4mfe8suw6EOY1e5CtHnXh
X-Received: by 2002:a05:6402:3604:b0:6b5:9714:dea8 with SMTP id 4fb4d7f45d1cf-6b72249b331mr2626989a12.45.1794224332902;
        Mon, 09 Nov 2026 03:38:52 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm1479837a12.8.2026.11.09.03.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:38:52 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 9 Nov 2026 12:38:49 +0100
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, catalin.marinas@arm.com,
	will@kernel.org, urezki@gmail.com, linux-mm@kvack.org,
	baohua@kernel.org, dev.jain@arm.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, david@kernel.org, rppt@kernel.org,
	leo.yan@arm.com, xueyuan.chen21@gmail.com, chleroy@kernel.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	ajd@linux.ibm.com, jiangwen6@xiaomi.com,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-ID: <avGwySHgt3qCmvIG@milan>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
 <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
 <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_033855_488913_57D9ABDD 
X-CRM114-Status: GOOD (  18.22  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 07:07:23PM +0800, Wen Jiang wrote:
> On Mon, 9 Nov 2026 at 15:08, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Sat,  7 Nov 2026 21:49:43 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> >
> > > This patchset accelerates ioremap, vmalloc, and vmap when the memory is
> > > physically fully or partially contiguous.
> >
> > Thanks.  This looks pretty mature and reviewed.  I'll add it to the
> > pipeline for linux-next testing.
> >
> > Sashiko likes it.  I'm working on a different AI review setup which
> > finds different things.  Very slowly.  I'll let you know if anything
> > interesting pops out.
> >
> > Do we have sufficient ARM review?
> >
> 
> Thanks for picking this up.
> 
> On ARM review: Dev reviewed the earlier revision in detail and
> his suggestions are folded in. Leo Yan tested the large vmap() path
> on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
> and others.
> 
It took a while but i think it is more or less ready. All patches have
been reviewed in the v12.

--
Uladzislau Rezki

