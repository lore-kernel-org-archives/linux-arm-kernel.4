Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B460A3838
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nd6cx53M;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=exJ4ph+D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nqa+nFQZC5Ig4zRO5uaG7pBGb9F4eWw8/n9HDHKsVu8=; b=Nd6cx53Mm5RUQw
	P23dz9Aik0Zv7vlP2cE9SvX8rfOcrYjq8q7fL3dBiaOjRBx4RFFHASRDclQgyKZkwlaFin3v8wQ2u
	l0IbXEsXNUVJvBHNjRc0uqD5ai4wc8sMd2WnbCP9bgNFU4vGFx6RWDzRC4dkchqKOMGlGekaNzK3t
	uNLPDL3yGkcKATcltGYa91zm6m+z5phGLlFxs0hfs0TYsygk2Y1JaR2182EVAWnzigHZdZF326nvh
	nhA81O1uYvm3D6TgTCBNa2NokOoEmgKpzJq+4rhN+2R95ylMA8q/CHQ9cdqIoNMnjUpULbopXbo8W
	E7CIGPJT0qzw3cvjTqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj52-00000009gZ3-2JD3;
	Wed, 18 Nov 2026 17:04:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj4z-00000009gYV-2eqO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:04:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 857D01477;
	Wed, 18 Nov 2026 09:04:13 -0800 (PST)
Received: from [10.57.62.206] (unknown [10.57.62.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B0093F632;
	Wed, 18 Nov 2026 09:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795021456; bh=I2MvshInrGGMMQbQbyG1/Vaqm9Vs7/yev/tVH+ZkcRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=exJ4ph+DI9p6YDddw/RbEaCWCdBiESakD24KDZaQ9BBVT5dMmLGeq0fitTFmMPs2F
	 YoJjhaCe+bldPIcJxHpqXATiIEHCRSVXyL092X7TKi/C/oYh8mvYTHEw8h8PUmqSNF
	 Mk8VyCfh1DGh8TNeIvdNpnHRUslG0h5hp2BhC6RA=
Message-ID: <8b90d6fc-8ddb-4173-9d05-3c8977b4ed5d@arm.com>
Date: Wed, 18 Nov 2026 17:04:11 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] KVM: arm64: Dispatch stage-2 destruction by VM
 flavor
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261116164358.142785-1-steven.price@arm.com>
 <20261116164358.142785-11-steven.price@arm.com>
 <CA+EHjTy-0k08Ukyo+4mmzqVn9UjRnvhy=BQT9kxSj7CBzzwO_Q@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+EHjTy-0k08Ukyo+4mmzqVn9UjRnvhy=BQT9kxSj7CBzzwO_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090417_746530_B37BE96D 
X-CRM114-Status: GOOD (  10.77  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 15:02, Fuad Tabba wrote:
> Hi Steven,
> 
> On Mon, 16 Nov 2026 16:43:56 +0000, Steven Price <steven.price@arm.com> wrote:
> [...]
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> [...]
>>  static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>>  {
>>          struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>> -        unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
>> -
>> -        /*
>> -         * Realm RTTs are inaccessible to the host and may contain stale data
>> -         * after the RMM has released them. The non-root RTTs are explicitly
>> -         * destroyed through RMI before the RD is destroyed; only the root PGD
>> -         * pages remain to be freed here.
>> -         */
>> -        if (!kvm_vm_is_realm(kvm))
>> -                stage2_destroy_range(pgt, 0, BIT(ia_bits));
> 
> Could this patch go before patch 4? Then patch 4 wouldn't need to add
> this check.

Yes, that's a good idea - I'll make that change.

Thanks,
Steve

