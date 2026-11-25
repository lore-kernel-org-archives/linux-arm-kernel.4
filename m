Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60571606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z3dP+Qbp;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MYu8Ffnc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hrdNgf41OVOvk7Q8wssfV4Th9fs8mNrOwxABB5Eu2AY=; b=Z3dP+QbpteZnq7
	AFGanOjL/ZbGouasQvmoXaKJDSYnJfanYKBD7PFUnYyTqu6uyyYzrRKeYp1n+EhrxztnBP7vZ2wBX
	7EgoEk5Dh240UP7gde41+UW/g4rg5kNwBWGmePAhCVCP6RVrcDbAyKfJlQTpRp7h9fnZ2pa450Uw9
	d9eZWUqp32+7cmq2LlztfMhigsJ9JqUEKOM6YmON5yn0iPD1LEHxlyPp4VrP9t9q3rPkE8s6E45vw
	8eHxqGO7weNivezQelnDzDOdl5AKxhLTH3TDSYZG2E61QdK1ZtksrxDH+eHnizSMwRnoldOoJ69ND
	b2yVy3W51LpzNP/rXj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBaT-00000009jpn-0O7a;
	Wed, 25 Nov 2026 11:54:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBaN-00000009joM-2UBM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:54:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D288F2F;
	Wed, 25 Nov 2026 03:54:47 -0800 (PST)
Received: from [10.57.32.107] (unknown [10.57.32.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98C6B3F86F;
	Wed, 25 Nov 2026 03:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795607690; bh=FdD752s2MbSn6Ah8b6CmNxJRAfCF8aNL4kgILGt8wZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MYu8Ffnc3RGgD74p37RZXJvnnXfG5ts2YdgdjMBhWpnabINb8oEcmFb7ELLqTmRIW
	 eNJ7Td43l6iZ9cO4MJBNv2gqBN+Mv2DNWHDa8x6+6qJM7KSnp1iMNNWty8iFEK6uKW
	 xTiuOraJkQ9+2AjE8dY/X/GInMjx2xB4moNQrAi4=
Message-ID: <8b3c107f-9f33-40e0-82ae-7d0373465acb@arm.com>
Date: Wed, 25 Nov 2026 11:54:43 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] KVM: arm64: CCA: Prepare Realm memory management
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20261123104233.95710-1-steven.price@arm.com>
 <awVZ0UrEKN9gLHIZ@FCCLS0092175.localdomain>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <awVZ0UrEKN9gLHIZ@FCCLS0092175.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_035451_712613_FC2E7D5B 
X-CRM114-Status: GOOD (  14.25  )
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

On 24/11/2026 09:47, Kohei Enju wrote:
> On 11/23 10:42, Steven Price wrote:
>> This series adds the memory management plumbing for CCA, building on the
>> basic RMM support [1]. Thanks to everyone who reviewed and tested the
>> earlier versions.
>>
>> The patches introduce internal Realm VM state, prepare Realm stage-2
>> setup and teardown, and provide RTT mapping and invalidation helpers.
>> Realm memslots are restricted to the lower half of the IPA space because
>> the protected and shared halves alias each other. The final patch
>> connects the helpers to KVM's stage-2 MMU operations.
>>
>> This is the memory management portion of the larger Realm host series.
>> Realm descriptor creation, REC entry and exit, activation, and the new
>> uAPI follow in the integration stack. This series alone does not enable
>> Realm creation.
>>
>> The integration branch [2] includes Realm creation, REC entry and exit,
>> and the remaining host support on top of this series. The MM branch [3]
>> contains just this series.
> 
> Hi Steve,

Hi Kohei,

> I tested the v4 integration branch in the same way as described in the
> following thread, and I haven't seen any issues so far:
>   https://lore.kernel.org/all/avV-P2_fOkFWQVnM@FCCLS0092175.localdomain/
> 
> For the series:
> Tested-by: Kohei Enju <enju.kohei@fujitsu.com>

Thanks as always for the testing!

Regards,
Steve

> Thanks,
> Kohei


