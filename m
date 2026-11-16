Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kpQvbeAI;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eLtxxtnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dhpNbptHtWGeqwtJDxxu+ZKON7t1aC1UAEhp1vp/RvQ=; b=kpQvbeAINTFYdV
	VZLVtLskzb2m9mFbhAeQkrFNcz59HTMhjKcOEBUbMOlmrkTmYsH+pJBbfFLRKsY4IUIBoOA+6SWLI
	vwzooL5Fzcol2PVsSonsm4/GoZEoILgtZdEokgVi5Dhbd6fwE7M9x6GR+a9X+P5ZPxQOoFPUzFGva
	HVsG22XPprm40UnYa3G856w4WZy5OotgQ7p2tU/YusZ2YEptbmOONmZPhPMTd42/8JAHAS2Fc/qML
	1J349idxgCbZW6cXpoEW86giixswKbhzn+l+d6keLjsYKOd0pCJNJ1z4sqbgMokUf3ixVUPGW+gqJ
	DEvWQMQEwUBxQTVYrkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy7A-00000002x2G-08YH;
	Mon, 16 Nov 2026 14:55:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy77-00000002x1d-1sIo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:55:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B49EA1684;
	Mon, 16 Nov 2026 06:55:16 -0800 (PST)
Received: from [10.57.63.54] (unknown [10.57.63.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351C43F763;
	Mon, 16 Nov 2026 06:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794840919; bh=Sp7fVwBe+QVG0GBjjUXT43r55ZA8pJUJowv4qnMKltM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eLtxxtnB3kbyPyVxz0I8NYvtZyDlTDjTDBxvVHLHHHSer6CfjCy71wmNwusyXm3sW
	 I6Xhgyi7yKx3n2aBaQxgdY5YDOYZowsl0TAnNIlNChL33P8ExyUXU87DGiZ89ibCxr
	 1Hg/6UdnY43fIPXvNlhhfH4Eig/Ve+4kgTyQ/IGA=
Message-ID: <7446568c-d794-4177-aac5-49746e2f05c9@arm.com>
Date: Mon, 16 Nov 2026 14:55:12 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] KVM: arm64: CCA: Add Realm stage-2 MMU
 operations
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
References: <20261111145758.217946-1-steven.price@arm.com>
 <20261111145758.217946-13-steven.price@arm.com>
 <37a57d36-a516-4312-9e4e-fc151ab77c8b@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <37a57d36-a516-4312-9e4e-fc151ab77c8b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_065521_608488_F46E6E4B 
X-CRM114-Status: UNSURE (   8.67  )
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

On 16/11/2026 11:46, Suzuki K Poulose wrote:
> On 11/11/2026 14:57, Steven Price wrote:
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> Register the Realm stage-2 MMU operations now that the RMM mapping
>> and unmapping helpers are available. Route unmapping through the
>> RMM, and use the existing fault handler for Realm memory faults.
>>
>> The RMM handles TLB invalidation when stage-2 mappings change, so
>> the host has no separate TLB flush to perform. Realm stage-2 does
>> not support access flags, including for shared IPAs.
>>
>> Dispatch stage-2 destruction according to the VM flavor. Realm
>> teardown destroys non-root RTTs through RMI, so the host frees
>> only the root RTT pages.
> 
> Minor nit: It may be worth splitting the destroy abstraction as a
> separate patch. Otherwise looks good to me.

Good point - I can split that out.

Thanks,
Steve

>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>>


