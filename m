Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD42606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EIpJPeZA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ju8FC3nu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7FCAHSMlIJagIxDM1Al7KCUaNaZ/IrEvhQVcqS28GKE=; b=EIpJPeZAGGmHtK
	h7Svv2mMSdSTn5wBbaJR8qBSkK5HNlSIXvMEBYa+s7LRDYEZXyLLS3I1fCDiRoqlHJ1BmsaUbXQP/
	xQnyCGQFCs7r3Lt5CZwnXUl2AfOkhbE2Wc1D87a2nhJT6ntreIYU858eXtbo0MVY5cCuHJsWy6/IG
	o+ANzAybZY7kGplNU4Sx2qjif8bhVmfK4ccZJZVBBMjQyKgPKkb71oy1whYhZCRcMLQCSjkpZcT6T
	7ZRdwrXHRa/D5WiHc5KIuhXJrQmzUI8dAeHICTwC6LhqCEMvaV0iI3GdBSunxAArkBfxTTrl6Rglq
	so0kTgnpoeFNV5AoVPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvAW-00000002EJD-1trp;
	Mon, 16 Nov 2026 11:46:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvAU-00000002EIs-1fMe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:46:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88C041713;
	Mon, 16 Nov 2026 03:46:34 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E36413F632;
	Mon, 16 Nov 2026 03:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794829597; bh=wXM3hUJrXDy5hrAEupSn/9LmBSDLTT18BTQMQ+4PEks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ju8FC3nuLWXhWC7WxZGAzcQ4/3trBymnrVn3+i6W5Kz1adJ1BhYg3C+gzVotAyQ0k
	 xkDPaOs5WRM1VAkpmoyDoJqLHgGqzbu0CkJKl/sju45wadsDFjq/vsDTpMCETn3dgt
	 1S4s233KeJBhyneVq0OG+uhwPaqC3jMRxLsY0Wvo=
Message-ID: <37a57d36-a516-4312-9e4e-fc151ab77c8b@arm.com>
Date: Mon, 16 Nov 2026 11:46:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] KVM: arm64: CCA: Add Realm stage-2 MMU
 operations
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261111145758.217946-1-steven.price@arm.com>
 <20261111145758.217946-13-steven.price@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261111145758.217946-13-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_034638_479950_85B5716C 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 14:57, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Register the Realm stage-2 MMU operations now that the RMM mapping
> and unmapping helpers are available. Route unmapping through the
> RMM, and use the existing fault handler for Realm memory faults.
> 
> The RMM handles TLB invalidation when stage-2 mappings change, so
> the host has no separate TLB flush to perform. Realm stage-2 does
> not support access flags, including for shared IPAs.
> 
> Dispatch stage-2 destruction according to the VM flavor. Realm
> teardown destroys non-root RTTs through RMI, so the host frees
> only the root RTT pages.

Minor nit: It may be worth splitting the destroy abstraction as a
separate patch. Otherwise looks good to me.


> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> 

