Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79881606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jm8Km2yB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LsE0t9C+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e3zPJLk1ySjBurHoSI4OkViSnLgnltmuyr0c6QjYQ7c=; b=jm8Km2yB0jJuoe
	+AM2CoBfz9ZZiA1CRg1zNW1BL0+nzGpawjzKascmLap6E8HxxOTs4FvLTkB3peADosZ+IWryIL4hV
	OCeGJDjr53kx8hP/rZyWyLP8NAEhcjUO/sw0uKu901HZCGKIziDQNftEjKIRUOzi+KLuNakXt2ql0
	gCTfrCHS/lzgn2n58wbfdVYCYrk+Yfj+TsFVPoWcQrDt9gc2Mb+sd1odcd05FRnt7qqXIBJlit/O3
	08naHN/BFDVxl0sAe0rYwpDGg8AvcovOc6UUm3cgPypnKzKnX7584q/0+1nGbNjFeYJuGOn5ejvVL
	eG8NqQKW9z02BaMVViDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTilk-00000009YsR-0Lcc;
	Wed, 18 Nov 2026 16:44:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTilg-00000009Yrj-3Ynr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:44:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CA9A143D;
	Wed, 18 Nov 2026 08:44:16 -0800 (PST)
Received: from [10.57.62.206] (unknown [10.57.62.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BCD93F673;
	Wed, 18 Nov 2026 08:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795020259; bh=M48qF4mwQ+N0oE4m3XylKiVT0MRA7C7bZCPmGFy5x4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LsE0t9C+ZgenEg2QddEfwdg5DGwi2dsfyO2JM9Q8d2HoHmUh/I//rbIFgVIvFVdw8
	 fTddz0NQOIZiIblOpZSsiIPI6DndtLdeWzM20S9urm05p/Mg1Hua+aVUhDWOs8CbSl
	 HlnkbZcOQ8GoKY4ub4fvi7ayLjgnmnwkTNfr81VY=
Message-ID: <ac61e062-6d33-4166-8ecc-a9648bbffc5b@arm.com>
Date: Wed, 18 Nov 2026 16:44:11 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] KVM: Allow architectures to reject memslot
 changes before invalidation
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261116164358.142785-1-steven.price@arm.com>
 <20261116164358.142785-8-steven.price@arm.com>
 <CA+EHjTwqYUBvhjF8dxqVA1mF_Qe1r2UZdwkZ+Zirgmm2um=skg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+EHjTwqYUBvhjF8dxqVA1mF_Qe1r2UZdwkZ+Zirgmm2um=skg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_084420_931781_2452E3BB 
X-CRM114-Status: GOOD (  11.62  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 14:31, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Mon, 16 Nov 2026 16:43:53 +0000, Steven Price <steven.price@arm.com> wrote:
> [...]
>> Architectures may need to reject deletion of a memory slot without
>> changing the guest's memory mappings. Currently, KVM invalidates the slot
>> and calls kvm_arch_flush_shadow_memslot() before
>> kvm_arch_prepare_memory_region() can reject the request. On arm64, this
>> unmaps the slot from stage-2. Restoring the old memslot on failure does not
>> restore those mappings, so even a rejected deletion has side effects.
> [...]
>> Move arm64's protected VM checks into the new hook so that unsupported
>> deletions and moves are rejected before stage-2 unmapping. Keep resource
>> preparation after invalidation, since invalidation drops slots_arch_lock
>> and allows concurrent updates to architecture-specific memslot metadata.
> 
> For pVMs the invalidation doesn't touch stage-2
> (protected_pkvm_vm_s2_ops uses no_stage2_unmap_range()), so the reason
> for the hook is the Realm case in the next patch. Can you change the
> message to say that?

Yes I'll clarify that.

Thanks,
Steve


