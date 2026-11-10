Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E06070B24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4TeOdv7f;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=mh7NxzFT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LWR9vxDpfyJAKF5RgruZrTkh8ttPuorehv2eynfAWfY=; b=4TeOdv7fEWQ+R3038We0BuVU9w
	p6wSeX+hrgKg6T9qHMlE2YtDPKbzFW6xtSYPCRhU1PtYV2rTUozNt//vc1hMDQI4rsQ+RJxGQUo+D
	lvZAt7O1WgZ6PkJ8ImCztJwSELV9O766jdLhSwqRetbzZPXOALBcRymAShJTMM7za97pwj7LzJy10
	9kCRVZM+cMCkR3w4JkjbOOYXuKo567RJ1QvBgR6HAPGVsUjo6i99QylPPRTeotx8dGK+uFvP0w/Nt
	8dZqoNtF3YTb8m42xtOAPEZ3DwXVj6mRlZnBkJONqPmg7V2Gfg+L2BnSh52uwbnVs9TzG/ZPIrBSy
	FUNlY2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi5i-00000003Fqd-3fIm;
	Tue, 10 Nov 2026 09:24:34 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi5f-00000003Foz-1VQc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1794302671; x=1825838671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tAn9etkH1K72b0If4iL3ZP13Ct439bRX2/j7e7dhMuk=;
  b=mh7NxzFTnLSXFNaupOFdxw7nGrQV7FNZ7GO5g1/RTR+mqkp5SUM2XBAK
   ea7CGenXgFCebPAsv0SvBqBxbMWaAxxdaLe3+KI1mFlbMFwFNIwAjQcik
   Jzfdha9Vs2K91SvYE2w0J/+hOWLuqayC0TfAQJleaXOqM9JlpwWNPCTku
   KP164phMpEBpZ/n8bOTnVwLAHXgNOmnKO45+KQ3yBUXN8IkQnmi9BHe67
   ZrlVBYtRcvvkdX8TCC1ZnGMgI2SIs9leYwsGeuz7dgCbmhaij0IuENZ9d
   /zlBh6Eh1WSKKCkczg082IdB2khbQqjg/M5f43vE2Py2gTPO1yFzZrwQC
   w==;
X-CSE-ConnectionGUID: SvzleX5hQHKCFak8fmAGsQ==
X-CSE-MsgGUID: JeRTTcIASbGWawy6Rf++4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="238997109"
X-IronPort-AV: E=Sophos;i="6.27,205,1786978800"; 
   d="scan'208";a="238997109"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 18:24:28 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 09FC1C01AED
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:24:28 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AE6B718000CE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:24:27 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.61.34])
	by az2nlsmom3.fujitsu.com (Postfix) with SMTP id 3ABC11019053;
	Tue, 10 Nov 2026 09:24:18 +0000 (UTC)
Date: Tue, 10 Nov 2026 18:24:17 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 00/11] KVM: arm64: CCA: Prepare Realm memory management
Message-ID: <avLgdqlfUPMAI-r9@FCCLS0092175.localdomain>
References: <20261102141304.126883-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102141304.126883-1-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_012431_693165_7FEB8688 
X-CRM114-Status: GOOD (  15.58  )
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

On 11/02 14:12, Steven Price wrote:
> This series adds the memory plumbing for CCA building on the basic
> plumbing[1] that has just been merged.
> 
> These patches add the internal realm VM state and RMM feature checks,
> prepare realm stage-2 setup and teardown, and provide RTT mapping and
> invalidation helpers. Realm memslots are now contrained to the lower
> half of the IPA space, because faults treat the protected and shared
> halves as aliasing. The final patch then connects these helpers to the
> KVM stage-2 MMU operations.
> 
> There's also an integration branch[2] that builds on this series and
> includes the realm descriptor creation, REC entry/exit, activation and
> the new uAPI. This series by itself is also available as a git
> branch[3]. However the new code isn't generally active without the full
> integration branch.
> 
> [1] https://lore.kernel.org/all/20261007073537.2454351-1-suzuki.poulose@arm.com/
> [2] https://gitlab.arm.com/linux-arm/linux-cca
>     branch: cca-host-mm/v1/integration

Hi Steve, thanks for your work on CCA upstreaming.

For testing purposes, could you clarify which TF-RMM revision (or commit
hash) you tested with? Although this MM series itself doesn't seem to be
particularly sensitive to changes in TF-RMM, testing the integration
branch could be affected by subtle changes in the RMM.

It would also be useful to know the TF-A revision, if possible.

Thanks,
Kohei

