Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66E606A9AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MGHXAxjD;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ITjlHVP6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xpa/lg9njdRQQ0b6uyNUAGO+MuLiJ9/osTOM3IJ8JTE=; b=MGHXAxjDNDoarA
	6RNnheZZlpNDPODwEIonQe6yWLUISSsG2v3YxoSwuqVsAcD19aLWtnYZEFJdTAA3uRbRwPZ7YJR7q
	wx8Q31QCm3AP/meCkt0PFdMucZuEcsnkVKlwUItvssEqt6gmKIbpU7zT/HjFO6UqDXyfjloa3DB1T
	wZSfK3itq4WKrdQ0zlXmQV+VRITYl6sqznrBmzioymxdv28e0OFRHBpRO8zexT2AC0wHBEMeyIxdg
	BgwwoKP0LOu0fiiOmyLZtb+jQ+xSRMbKCW3FN64bBEvkOjWjF7I0R2Y4w3f4ojLRe8ePTGjV5UKro
	Vcc2YOKFELPMWjfirMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkQk-00000003iMm-06Q5;
	Tue, 10 Nov 2026 11:54:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkQh-00000003iM2-07h4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:54:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35E8A14BF;
	Tue, 10 Nov 2026 03:54:19 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B54D43F632;
	Tue, 10 Nov 2026 03:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794311662; bh=7Pp0tIVrm11vJlC7ulH2AYa6UOT1xWrcSbC9dxxfAhk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ITjlHVP6O2P61WozfihQOEfxkHjfXrATDkC42kjSKChCmKg2q0nUsHR3oxlVJY3cN
	 LLUdsVldsb//VjfcccwBi4m+wiy47PufgMctazzoNNB8ZVR7+yT8oCQq92ibtztQcM
	 0AheKLHynihg17TZo6MF95c97MHoJPUoKOm+qIbU=
Message-ID: <e9bc3885-4e29-44a0-a186-463337f57d9e@arm.com>
Date: Tue, 10 Nov 2026 11:54:17 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] KVM: arm64: CCA: Prepare Realm memory management
To: Kohei Enju <enju.kohei@fujitsu.com>, Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20261102141304.126883-1-steven.price@arm.com>
 <avLgdqlfUPMAI-r9@FCCLS0092175.localdomain>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <avLgdqlfUPMAI-r9@FCCLS0092175.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_035423_127489_95F122FF 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Kohei

On 10/11/2026 09:24, Kohei Enju wrote:
> On 11/02 14:12, Steven Price wrote:
>> This series adds the memory plumbing for CCA building on the basic
>> plumbing[1] that has just been merged.
>>
>> These patches add the internal realm VM state and RMM feature checks,
>> prepare realm stage-2 setup and teardown, and provide RTT mapping and
>> invalidation helpers. Realm memslots are now contrained to the lower
>> half of the IPA space, because faults treat the protected and shared
>> halves as aliasing. The final patch then connects these helpers to the
>> KVM stage-2 MMU operations.
>>
>> There's also an integration branch[2] that builds on this series and
>> includes the realm descriptor creation, REC entry/exit, activation and
>> the new uAPI. This series by itself is also available as a git
>> branch[3]. However the new code isn't generally active without the full
>> integration branch.
>>
>> [1] https://lore.kernel.org/all/20261007073537.2454351-1-suzuki.poulose@arm.com/
>> [2] https://gitlab.arm.com/linux-arm/linux-cca
>>      branch: cca-host-mm/v1/integration
> 
> Hi Steve, thanks for your work on CCA upstreaming.
> 
> For testing purposes, could you clarify which TF-RMM revision (or commit
> hash) you tested with? Although this MM series itself doesn't seem to be
> particularly sensitive to changes in TF-RMM, testing the integration
> branch could be affected by subtle changes in the RMM.

Tip of both the repositories should work (tf-a and tf-rmm).

Cheers
Suzuki


> 
> It would also be useful to know the TF-A revision, if possible.
> 
> Thanks,
> Kohei


