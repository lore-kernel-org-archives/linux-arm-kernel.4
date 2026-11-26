Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA34606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dv9m0UGW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aG3K1lbx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6YNUCBOxZzbaaIa80epVPWrKGpoBdiWN4H2qUJKH3bg=; b=dv9m0UGWIpfk8qjglhF88Yzgps
	iiamSk4Zsz487lUM5flFgVI07n5u+hK9W584qsMl831Nc5301K8Yt8kP9phCiH0aVoWMvU5Ug96Ua
	mYhocZ2uB9EH6kllnWWXgaObeoMBfTO1mginLE9LEFWWGHA3GcijCU5yKDMVByp9uQIv7WaQUtmYZ
	20EBLRw5QoluHafiLgVBGeL8SochcBxnX6SejQreRL+RntyZEBFRb/HFYY2RIeNGmTFGXKf62F1VA
	Mp96t1llFQvtFSdTCPVT1LKmCFPAKatQd52Wm6B0kSKC2LgDU2TGps1JsFm7Sge7thR17USh+e3x/
	wd2cgDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbKi-0000000Dinp-44Ma;
	Thu, 26 Nov 2026 15:24:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbKf-0000000DinQ-3P3H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:24:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BF4F402B3;
	Thu, 26 Nov 2026 15:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2836A1F000C0;
	Thu, 26 Nov 2026 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795706660;
	bh=6YNUCBOxZzbaaIa80epVPWrKGpoBdiWN4H2qUJKH3bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aG3K1lbxJdNQGkoZwOuncDLk8MpFaN5wA8+RFmzyJ+5N+Ed9vr8n80WbRwTAvDGBi
	 3rq9sd1ripHtNaJjPbKsVp+i9nxZQ5jalECZQiEk2h1KgrcimxIR/BjdIyT1TEhj4R
	 O9+LAkHzts53apA71G6ZGEqvQHghuozgFbLmH32klpQGcyLEMJiHzgkYFMDT56qq1H
	 avGbhO8UaQFFJweFRkLGWevka2hsie7oZ6snAA2GVNaB9aOenGDeveZfWZef71+41h
	 ApaInbo/yVwhIjUECptCRrxh8vtb3MB9JEEa3jbZRDwGDIQhm6u4Hqc13DY9pzkMJE
	 fqKJl+t5ZbKiw==
Date: Thu, 26 Nov 2026 15:24:14 +0000
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
Message-ID: <awhPHldqbDgiVH8A@willie-the-truck>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
 <dfea6dc5-6a2f-4006-8bbd-37844b6b5986@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfea6dc5-6a2f-4006-8bbd-37844b6b5986@arm.com>
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

On Thu, Nov 26, 2026 at 10:24:17AM +0000, Suzuki K Poulose wrote:
> Catalin, Will,
> 
> 
> On 16/10/2026 17:54, Leo Yan wrote:
> > TRBSR_EL1.EC identifies the cause of a trace buffer management event,
> > but the sysreg description does not name its architected values. Define
> > the five encodings as an unsigned enum so TRBE status handling can
> > refer to each cause by name.
> > 
> > The values cover other events, Granule Protection Check faults,
> > implementation-defined events, and stage 1 and stage 2 Data Aborts on
> > writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> Are you ok with me taking this via the coresight tree ?

The sysregs file gets updated quite regularly, so let me stick this patch
on a shared branch for you.

Will

