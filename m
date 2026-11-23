Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C66606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MXKi0nfq;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JhGBw1bG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0bvStAAxeZ8Gkfe5Tw5hh4wU3B/vHxdCM1DeCTbELao=; b=MXKi0nfqNece+y
	2Y4IYLwMTFaUl17QbT5sXmht6Ym5gl7StyfplWI+aEkGZZ2alwL8TcoEh1NANOrTP9hbNKZIlOxZi
	/+i5Gyp9cDDBMHNR9ymjhU1cRJ5LbxXdYIZhMbWylgG65P3sCqT9jN9Ur+HCBVqDC+q7fzY3CF9v6
	6tsd4XRArfbwYSjOPoNYzO14wk9Y8EaJkA/hd3Kt8/HUrZJqxJmjAdz4dq3t9QEEi2uMgxv+0VLvN
	qE+FzPR9KEX4S2zRV3pbhlo9JIvGzQ+z3tl0+1Rk5l+U0bQoKx+42j1XFqha3YHcg2Nt4oStay79u
	/Tn+kITZ4ufl7qgG87Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVU9g-00000003aNQ-0Mod;
	Mon, 23 Nov 2026 13:32:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVU9d-00000003aMh-3bj4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:32:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E63DA143D;
	Mon, 23 Nov 2026 05:32:17 -0800 (PST)
Received: from [10.0.129.12] (Suzukis-MBP.cambridge.arm.com [10.0.129.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 258BF3F86F;
	Mon, 23 Nov 2026 05:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795440740; bh=o6hmJo//5wX2bOXoad+z4zz40/4XRN6NpGXUmq6iWS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JhGBw1bGfH7RhQ7jNe1Smx3D+gZlG+FUW1byFCfFuf6p6ojgIrqzytv1khguy8lQC
	 k9St/nUgNMFcrNzz+9t6s9WV5Y7fZKu9n6pUkwCGY26ICJ+aKcOSO6xgai0x/e2Whe
	 tzoWgRShMgYtuRSC29OBsisHnBm8nPoJPCy7Qoo0=
Message-ID: <d332948e-48ac-4f84-b620-d39d36992c55@arm.com>
Date: Mon, 23 Nov 2026 13:32:15 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] KVM: arm64: CCA: Add Realm RTT mapping and
 invalidation helpers
Content-Language: en-GB
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
References: <20261123104233.95710-1-steven.price@arm.com>
 <20261123104233.95710-8-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261123104233.95710-8-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_053222_017354_9C1DA042 
X-CRM114-Status: UNSURE (   8.92  )
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

On 23/11/2026 10:42, Steven Price wrote:
> Add the RMI RTT creation and unmap helpers needed by CCA Realm stage-2
> memory operations. REC exit handling and guest requested RIPAS changes
> follow in the vCPU series.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> 
...



--8>--

>   static int realm_destroy_rtts(struct kvm *kvm)
>   {
>   	struct realm *realm = &kvm->arch.realm;
>   	unsigned int ia_bits = realm->ia_bits;
>   
>   	lockdep_assert_held(&kvm->arch.config_lock);
> +	if (WARN_ON_ONCE(!realm->stage2_unmapped))
> +		return -EINVAL;

minor nit: Does this hunk belong to the previous patch ?

Suzuki

