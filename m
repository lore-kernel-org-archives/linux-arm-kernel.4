Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fNWhXm+r;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WwFnfJ7L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ej3rFQntXuPoH8vhrYecOGevuw9dr5POrf+y7c/G9Zk=; b=fNWhXm+r6HforJ
	vLHF3mZiJsOa8R66J8uP5Ux3xaqIT05BIMAeVvYEFl0FHW29yvPFo4Wiyac8HodNhRssObDQ/lpvk
	rjhNEY+nT8i8tI5NeGlR1jhJ1rsdjVdw4frJsmbH9j/ftriynx4IU0+idw8o4wKXGt0DAB03wgOFZ
	sMSP7dBPE16hs/+ExYFSxwYmd/c25FBpv/pyxvp4qpQwvO4+hrGy6bDDwejACsJnSqqaVRLISyk3X
	Bx1mXUKEnFcdbrAPJgfLqQM6a8LeZGdEHTYlw2zMrDnRJXbql0QE4+/5Z/0H02AuxbJAr6mSu/IM7
	bXxO3V3y120/FpPeRAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG4d-0000000Abms-1xtP;
	Wed, 25 Nov 2026 16:42:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG4b-0000000Abl5-2uXW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:42:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD3932F;
	Wed, 25 Nov 2026 08:42:17 -0800 (PST)
Received: from [10.57.32.107] (unknown [10.57.32.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E83383F632;
	Wed, 25 Nov 2026 08:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624940; bh=SKTswPHzr8rBc1/6nMKHnghgefBWUWYQqZrixcwzN+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WwFnfJ7LsvuDHGrf9RJkXT6gKAm+PjLazrGgVKRy0f6czqlXxnoMkJnwnFt+tRIdU
	 Sc+BhhxOwDww78oXiF9cRnBSgYVehtI/C4D7BB6pTilTS8zWmSNpemsDJvRn10VU0z
	 V4xvRQmhVmlwI+nuVNknZUvN4NC9mhAuyMoBfwGI=
Message-ID: <19432d85-2923-4037-98fa-cffb664dc342@arm.com>
Date: Wed, 25 Nov 2026 16:42:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] KVM: arm64: CCA: Add Realm RTT mapping and
 invalidation helpers
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
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
 <d332948e-48ac-4f84-b620-d39d36992c55@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <d332948e-48ac-4f84-b620-d39d36992c55@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_084221_899781_CAEFDF82 
X-CRM114-Status: UNSURE (   9.74  )
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

On 23/11/2026 13:32, Suzuki K Poulose wrote:
> On 23/11/2026 10:42, Steven Price wrote:
>> Add the RMI RTT creation and unmap helpers needed by CCA Realm stage-2
>> memory operations. REC exit handling and guest requested RIPAS changes
>> follow in the vCPU series.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>>
> ...
> 
> 
> 
> --8>--
> 
>>   static int realm_destroy_rtts(struct kvm *kvm)
>>   {
>>       struct realm *realm = &kvm->arch.realm;
>>       unsigned int ia_bits = realm->ia_bits;
>>         lockdep_assert_held(&kvm->arch.config_lock);
>> +    if (WARN_ON_ONCE(!realm->stage2_unmapped))
>> +        return -EINVAL;
> 
> minor nit: Does this hunk belong to the previous patch ?

Yes, sorry about that!

Thanks,
Steve

