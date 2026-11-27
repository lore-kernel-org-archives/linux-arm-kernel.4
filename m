Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GWr0wDu;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q1x9ig2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iUGcyMfD19/PP1wiChCcw/RYMLO+UZqeEGCaFbl4nkI=; b=1GWr0wDu20tBhBV05R8vBeqPda
	9AndZ+D+4tuGnoLe426sit51frsMPrcfsSCNa21dzWCCjPMuP+wwrQeU+Jpp0icseMqTKFvjt++OS
	K+Xz0xF9vfXK0X1w7ak/IYr2KxqR8FDHtIwsUuIXq2mM9xhPsCKsIPrVNwL2ThHm72C2ZzDVepaw/
	eW3SVJczzScxOdeHQYf5H8fkN0exuw7mMok2OlLImH6PLLKrDsuk/LqpH0CaYrGm9b68w+iwJzCCA
	PWKXtmCToL61E3+swL+GoF4/0Z+RmgSG35cAAfymUZdO9b6lARnabHJJjMdQSzxM/mnCriD0tEySs
	MUu/xV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy6j-0000000GtLN-1Ls4;
	Fri, 27 Nov 2026 15:43:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy6h-0000000GtKy-1tUp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:43:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B977A2F;
	Fri, 27 Nov 2026 07:43:23 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F07213F632;
	Fri, 27 Nov 2026 07:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795794206; bh=l48j5+xVhtpBW30PApGWL3ln8k0dE99HV1bHDBj1Dvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1x9ig2SlfIy5gBXSTvTUQ/E32fDvv/Sczl0uhGpTeuazQYrQOCIgQTa/SG034aSs
	 j4icBJYzIcwd2+rdPAs5bgd1Om1X+q9xqggLYbgY5fWOpNteq1Bg/UnMDhrKQwqZhg
	 rIarodHEEEvrb3Y6jns7jr/kYgaMHb6adPdTO1aw=
Date: Fri, 27 Nov 2026 15:43:23 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 16/23] coresight: trbe: Always classify TRBSR when
 updating buffer
Message-ID: <20261127154323.GF861809@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
 <4dfed719-5f62-4ea3-8685-5dc4426ad3c9@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dfed719-5f62-4ea3-8685-5dc4426ad3c9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_074327_548677_E1DCDB79 
X-CRM114-Status: GOOD (  14.24  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 03:00:46PM +0000, Suzuki K Poulose wrote:

> > With classification on the no-IRQ path, a normal software stop can
> > have TRBSR.S clear and an ignored detected trigger can set TRBSR.TRG.
> > Neither should warn or discard valid trace. Mark fatal status as
> > truncated and return zero.
> 
> > Use LIMIT for a filled WRAP and TRBPTR otherwise.
> 
> This is already the case, right. Please could we remove this bit ?

Yes, I'll drop it.

> > @@ -662,8 +662,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
> >   	int ec = get_trbe_ec(trbsr);
> >   	int bsc = get_trbe_bsc(trbsr);
> > -	WARN_ON(is_trbe_running(trbsr));
> > -
> 
> Why are we removing this ?  Do we expect to be called with TRBE running ?
> Both trbe_update_buffer and the irq_handler stops the trbe. So this
> must be held valid ?

Both paths disable the TRBE by clearing TRBLIMITR_EL1.E. With this patch,
arm_trbe_update_buffer() can call trbe_get_fault_act() when no
maintenance IRQ is pending. If no management event stopped collection,
TRBSR_EL1.S can still be clear.

Arm ARM DDI 0487 M.c, section D6.2, Table D6-1 shows:

  TRBLIMITR_EL1.E = 0, TRBSR_EL1.S = X, and Running = False.
  (X means either value of S bit)
 
Since is_trbe_running() tests only TRBSR_EL1.S, the warning would fire
on a software stop.

Thanks,
Leo

