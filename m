Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G1Kof2G4;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=njf/bY16
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iEnnEuXg2bne+5suSb+pfcSIa1VRJlTnH+FEq31HwCc=; b=G1Kof2G4PaSG1u
	5Rl8WSNwKbJQOFdqYTk3DMpXrz/lbHY/AbCnLZRczPxpuihJxvnTkcSkkBZPccJ2uIDp9o6yD8son
	ucURJBRJv06bONpOViUnNOzVpmE+plybKW7cue3MsTJXb9HfB9826XmmlfbfoIz1144cexm3Hs7pn
	j4V2OYZCJpm3N85FBF1hn4VGM5NuLaDxuuLVtNzgCkFkzGpaZlk00jx+gZ2JYbJR1V28MJryK0yxb
	89AQ4H5a+yxlLXOD1v7tliolidUWZfrdIyff1RjAikIsRibDWQxeYXZGp6FQM16xw0JM30vTsB76Y
	Y4HDNRkj6Z4UlHQBXwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTczo-00000008ZRh-2XZx;
	Wed, 18 Nov 2026 10:34:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTczj-00000008ZNP-0Arf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:34:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 316311596;
	Wed, 18 Nov 2026 02:34:21 -0800 (PST)
Received: from [10.57.70.68] (unknown [10.57.70.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 255DD3F632;
	Wed, 18 Nov 2026 02:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794998064; bh=882HlCJQp1tJ2yoxf93aeqGXZo2OFfU4ZGyzNDdoa9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=njf/bY16PsTTY3pbwuNM0wNOkujnHH5iwftPdKTgBLyhU3zjZcPZWSIVqm0vrsef5
	 2PWeZ3MpAG33IWM+IpnDCgnVCHsSPStO25enry1jwlTwH5gd2N7RI1QPSHakbhu+E2
	 YT0U7VYMJMuAaeESA31deIn37yxmuAa4LcjWoXJM=
Message-ID: <6bb490cd-ebbe-41d7-adf3-d6eaf0e53478@arm.com>
Date: Wed, 18 Nov 2026 10:34:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>, Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
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
 <20261116164358.142785-2-steven.price@arm.com>
 <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_023427_203155_2BD970BF 
X-CRM114-Status: UNSURE (   8.86  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Steven

On 17/11/2026 14:05, Fuad Tabba wrote:
> Hi Steven,
> 
> On Mon, 16 Nov 2026 16:43:47 +0000, Steven Price <steven.price@arm.com> wrote:
>> Check the guest_memfd backing file when deciding whether an arm64
>> memslot has mappable memory rather than checking whether the slot is
>> gmem only. A public helper function is added to be able to reuse the
>> static kvm_gmem_supports_mmap() function.
> 
> nit: could the message say why this is needed? It's a no-op until
> patch 8 defines kvm_arch_has_private_mem(), which makes every
> guest_memfd slot gmem-only.

I still don't understand why this is needed. For arm64 we have always
prevented guest_memfd without MMAP, in kvm_arch_prepare_memory_region().


Suzuki



> 
> Cheers,
> /fuad


