Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CXSSllSj;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AeCeLXmq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VcGX3S/ok2ofcwS3uJdO8rQXnNkquiVnumUqc1g1VFE=; b=CXSSllSjWTLdon67UsA6q3gukz
	i5AIm+uaMgkkSkNPhVRjHQn0WA1VGUWvPWC+vRUvSHvgyD1a525sT2m0k8YKSdroVEa0FUoUeKo5N
	ZlLHE9HaLVJNpUmuRZY7Xr/WMsyMs5DUV2l8vZe5t4T7cA1RyMLzKQeHr8SBqYuNFPviZTX4x72td
	22r5RWStux3ZBxcHIva8OSRKbiZY6PJ6lzKMsMFOylOouinXG2YpJ2XQI5ZBn2SOBpc4N0qV2OVHf
	0Z3HHXlbKJ1xrcf2rTvND9h8JXhNkmtp/9VJIBYFxHQzjcipeRBodwgTyjdU/R9TqH2hkqmdCP2C9
	ltm2HuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPAp-00000000m0J-3D5I;
	Mon, 09 Nov 2026 13:12:35 +0000
Received: from out-11.mta1.migadu.com ([95.215.58.11] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPAn-00000000lzn-0XM9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:12:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9ZfmGyDfW24qGm7656Xt3E7F30kmlnVfQdHu0DS+Udo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794229950; v=1; x=1794834750;
 b=AeCeLXmqwuN/Q6W3BKOINf2cfM+mDvKf9zPCwJiE45/0eWc9aCigvMdALjx8fl3cp2ZwFQj7
 rAOXJnw2qu7TR7dnyRKP686VKUJvxzxyoxwmQ4sAwqTugc6DaAWGwRIUEoz6+AC84uhoMA+3BuU
 2x1td0Bok34R1ZhHsRskL1N4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b91274233a3beffa;
	Mon, 09 Nov 2026 13:12:30 +0000
X-Mizu-Trace-ID: b91274233a3beffa
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so3408e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:12:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH4eZhJ6X8S0nW4NTUuto4rs9o8+3khajHj7KP/VZ6cqt9aQeByuRHWmllLV4AGSWVxouY16w6fmkcVj/cJicSG@lists.infradead.org
X-Gm-Message-State: APuU4Z9HFi2u7DJOY5AqmbnyQKkbLMf1FyZGZWGNlNgnue3TzaHDKkKi
	b+8RvyaItoGDoqEvpKHiC2Y5umVr5p0Xi2U2JfbR4Q73MMaYbxWctJpEfkQgT+r7FPB+gPy8ux8
	UrnRCj+IQ4arK80ZIYteDhuITMWsU2/0ZHr6rbUAM
X-Received: by 2002:a05:6512:1109:b0:5bf:c3e1:532b with SMTP id
 2adb3069b0e04-5c00b60a427mr195461e87.5.1794229945777; Mon, 09 Nov 2026
 05:12:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102141304.126883-1-steven.price@arm.com> <20261102141304.126883-11-steven.price@arm.com>
 <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com> <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
 <06e52c9c-9026-4279-b8c0-53a54a667dad@arm.com>
In-Reply-To: <06e52c9c-9026-4279-b8c0-53a54a667dad@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 9 Nov 2026 13:11:49 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzJ1O8=q0rL5CkLKN3CBDr=TkujEw_M-W0H=BJfmrTEzg@mail.gmail.com>
X-Gm-Features: AclHuK9lv_i4f5zskQj2LbWryVS8Q4D5sdKCijE4VdtfsoeeW5x-cT5K6pQCDgo
Message-ID: <CA+EHjTzJ1O8=q0rL5CkLKN3CBDr=TkujEw_M-W0H=BJfmrTEzg@mail.gmail.com>
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_051233_334948_56B94614 
X-CRM114-Status: GOOD (  11.36  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Suzuki,

On Mon, 09 Nov 2026 11:35:31 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
>> applies as is. Only how the expected state is computed differs: for a
>> pVM it comes from the per-page share state rather than an IPA bit.
>
> When you say, per-page, you mean per-IPA or per "backing page" ? i.e.,
> can pKVM do something like :
>
>     kvm_ipa_is_private(kvm, ipa) ?
>
> (similar to Realm) or does it need the struct page backing the "ipa" ?

Per IPA, so kvm_ipa_is_private(kvm, ipa) would work for pKVM too. A
pVM's page is private unless the guest has shared it, and that state
is in its stage-2 PTE at EL2, not in the struct page. The host kernel
doesn't have a copy today, since EL2 handles the share and unshare
hypercalls and the new state is only at EL2, so the pKVM side of the
check, a hypercall or a host-side mirror, is part of pKVM's
guest_memfd support when that lands.

Cheers,
/fuad

