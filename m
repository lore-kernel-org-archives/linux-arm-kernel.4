Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C7A606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nN53ORMd;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gDVe0Coa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k6TybH554OLm55RdRjQIliLzitxsqvzSoXpVsCso3cQ=; b=nN53ORMdJ9LBur
	SASjCo1JO/2152urikius2YsAwmEH7Rsrv+GsfOzAT8P3JpElOcVhHvaGt/aXF++TR1se5tHS8Lz8
	5pdCOucw8cGDcY/XfzNvJJ8hm04K13UGqXj15wbr3m/F136iYAYQHT9yTI+Uur754Nnxa0lmkg4CI
	Mmk3FOLDks8dz/J3Pu5HXKzBO9PYL/h7zNizi9E6MxiewIuTHgsEUDeB5MzpHvhOivUYmVlIwmtzX
	XNiUCHCWhQD4L8Mjd5wI/iEJI4ZbLD+jTfySjz9JL8KtH6gsqRBsq61XLNiFsRigwp6I/dJBnScKB
	3tSfRo2jaBdapad5j68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQFp-00000000vr6-1bN5;
	Mon, 09 Nov 2026 14:21:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQFm-00000000vqW-0ykw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:21:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 546E21516;
	Mon,  9 Nov 2026 06:21:41 -0800 (PST)
Received: from [10.0.128.239] (Suzukis-MBP.cambridge.arm.com [10.0.128.239])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB5D23F85F;
	Mon,  9 Nov 2026 06:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794234104; bh=TpZUDzpw/Fkw5pr4KuKhr8vO1civAMoJmulkZhsrH8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gDVe0CoaFdmP7T8+kQjLhtHWBzE50ygSdtVsjHEgcIyqL3A15q3DvXe7Fftqoaztv
	 /sPSztIgv/wTcpBQst51giL9MBRdKjSqzjzZOzIM/DO67jnwblQxNh6KU7jJpXL8C8
	 zxt7rLEMJKjgDeK1EYEZgieMmfZGIn5P49ihW/Jo=
Message-ID: <567f2b66-d59f-4248-92fe-47d1d861e04c@arm.com>
Date: Mon, 9 Nov 2026 14:21:39 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-11-steven.price@arm.com>
 <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com>
 <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
 <06e52c9c-9026-4279-b8c0-53a54a667dad@arm.com>
 <CA+EHjTzJ1O8=q0rL5CkLKN3CBDr=TkujEw_M-W0H=BJfmrTEzg@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTzJ1O8=q0rL5CkLKN3CBDr=TkujEw_M-W0H=BJfmrTEzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_062146_323227_A7837505 
X-CRM114-Status: GOOD (  14.41  )
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

On 09/11/2026 13:11, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Mon, 09 Nov 2026 11:35:31 +0000, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>>> applies as is. Only how the expected state is computed differs: for a
>>> pVM it comes from the per-page share state rather than an IPA bit.
>>
>> When you say, per-page, you mean per-IPA or per "backing page" ? i.e.,
>> can pKVM do something like :
>>
>>      kvm_ipa_is_private(kvm, ipa) ?
>>
>> (similar to Realm) or does it need the struct page backing the "ipa" ?
> 
> Per IPA, so kvm_ipa_is_private(kvm, ipa) would work for pKVM too. A
> pVM's page is private unless the guest has shared it, and that state
> is in its stage-2 PTE at EL2, not in the struct page. The host kernel
> doesn't have a copy today, since EL2 handles the share and unshare
> hypercalls and the new state is only at EL2, so the pKVM side of the
> check, a hypercall or a host-side mirror, is part of pKVM's
> guest_memfd support when that lands.

Perfect, thanks for the clarification. If kvm_ipa_is_private() works for
you, thats good. I was wondering if the host-side mirrors the data
and KVM would only use that (with EL2 enforcing the checks).

I think we could go with that construct and make progress.

Cheers
Suzuki


> 
> Cheers,
> /fuad


