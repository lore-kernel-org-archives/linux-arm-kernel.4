Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56557606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m18QOsgH;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a/CjEp/l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y2Daclv3pL9H+Z77v1N/YFpOGh7HbXy37WIqhvkcADA=; b=m18QOsgHJrxC6V+Y68aO2FwJu5
	3x02A7WAoPe550OC7IZfuiQbnjYY6XsCOASrGZpymtWO1+OxfmSNWjwj+TEX1rIeHqswagr1dZs3E
	sw67VbHUCla8Fr10mfGHGyXUEN0sM6H/nJMfPubS5WBU3gRUzOnj23HwZzogeUzD6SvVwTyzG37dt
	4RPQ1bK7xWpQeIpbjBPDqg7X+HwWo4wwJfjB+L4ha8aO2/s7O80rji50UY2Lqexn22HO+H2TLE+YL
	8563IAKbCG+OTpmHehPXvzGTkJPiZPPu4+/x/a6hZQFiJWY6HTR2tuiwqAIr/uqhM80BnQ1/eYOEN
	BUxco/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThRd-00000009EW1-0hZt;
	Wed, 18 Nov 2026 15:19:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThQp-00000009Dvn-1VoE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:18:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A28B21655;
	Wed, 18 Nov 2026 07:18:39 -0800 (PST)
Received: from [10.57.62.206] (unknown [10.57.62.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9A9D3F632;
	Wed, 18 Nov 2026 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795015122; bh=w8XDtw7u6zTGcD/Dwtz8Nec/j+mFGkTq9Cwd9QWx4y0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a/CjEp/lWJU4QLjpelP/JTZv2ruOnbBbt+JLSbKpYAP4VCqrHHdtlgkcAWih3sdxj
	 WYJKvmin5k2Qjivd13tyo7baEd5InyOwxPHvleh83xiTrhEYXBsYsilr0DlLJongQ1
	 fQ7iiucy60FJx40w9DUaxvWafVfHMCNzI7k8LEzc=
Content-Type: multipart/mixed; boundary="------------DUFNbHBbvPDY00EhsT6K87G7"
Message-ID: <cc27e6a8-6bfa-4c82-92a7-33175baf6803@arm.com>
Date: Wed, 18 Nov 2026 15:18:35 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Fuad Tabba <tabba@google.com>
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
 <6bb490cd-ebbe-41d7-adf3-d6eaf0e53478@arm.com>
 <b1ef7241-54b0-4a17-83b6-0008e722f2f6@arm.com>
 <8a095a42-662a-416d-a5d7-79e10161201c@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <8a095a42-662a-416d-a5d7-79e10161201c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_071843_546416_B6AB9C7D 
X-CRM114-Status: GOOD (  13.57  )
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

This is a multi-part message in MIME format.
--------------DUFNbHBbvPDY00EhsT6K87G7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2026 12:04, Suzuki K Poulose wrote:
> On 18/11/2026 11:14, Steven Price wrote:
>> On 18/11/2026 10:34, Suzuki K Poulose wrote:
>>> Hi Steven
>>>
>>> On 17/11/2026 14:05, Fuad Tabba wrote:
>>>> Hi Steven,
>>>>
>>>> On Mon, 16 Nov 2026 16:43:47 +0000, Steven Price
>>>> <steven.price@arm.com> wrote:
>>>>> Check the guest_memfd backing file when deciding whether an arm64
>>>>> memslot has mappable memory rather than checking whether the slot is
>>>>> gmem only. A public helper function is added to be able to reuse the
>>>>> static kvm_gmem_supports_mmap() function.
>>>>
>>>> nit: could the message say why this is needed? It's a no-op until
>>>> patch 8 defines kvm_arch_has_private_mem(), which makes every
>>>> guest_memfd slot gmem-only.
>>>
>>> I still don't understand why this is needed. For arm64 we have always
>>> prevented guest_memfd without MMAP, in kvm_arch_prepare_memory_region().
>>
>> Fuad is correct, this isn't really needed until patch 8. Patch 8 defines
>> kvm_arch_has_private_mem() - that means that gmem_in_place_conversion
>> becomes true (see include/linux/kvm_host.h). That in turn means that
> 
>> every guest_memfd slot is KVM_MEMSLOT_GMEM_ONLY including slots backed
>> by a file without mmap support.
> 
> But we dont support slots without MMAP anyways even without this series.
>  So, does it really matter for arm64 ?

So ChatGPT produced the attached test. It creates a non-mappable gmem
and tries to add it to a normal (non-realm/non-pkvm) VM. With v7.4-rc1
it is rejected. However without this patch it succeeds.

The issue is that gmem_in_place_conversion changes the behaviour for
normal VMs.

Thanks,
Steve


--------------DUFNbHBbvPDY00EhsT6K87G7
Content-Type: text/x-csrc; charset=UTF-8; name="guest_memfd_nommap_repro.c"
Content-Disposition: attachment; filename="guest_memfd_nommap_repro.c"
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQovKgogKiBSZXByb2R1
Y2UgdGhlIG5vbi1SZWFsbSBndWVzdF9tZW1mZCBtZW1zbG90IHJlZ3Jlc3Npb24uCiAqIEJ1
aWxkIGZyb20gdGhlIGtlcm5lbCByb290IHdpdGg6CiAqIGNjIC1XYWxsIC1XZXh0cmEgLU8y
IC1JdG9vbHMvaW5jbHVkZSAtSXRvb2xzL2luY2x1ZGUvdWFwaSBcCiAqICAgIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9hcm02NC9ndWVzdF9tZW1mZF9ub21tYXBfcmVwcm8uYyAt
byAvdG1wL2dtZW0tcmVwcm8KICovCiNpbmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8ZmNu
dGwuaD4KI2luY2x1ZGUgPGxpbnV4L2t2bS5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNs
dWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDxzeXMvbW1h
bi5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgppbnQgbWFpbih2b2lkKQp7Cglsb25nIHNpemUg
PSBzeXNjb25mKF9TQ19QQUdFU0laRSk7CglzdHJ1Y3Qga3ZtX2NyZWF0ZV9ndWVzdF9tZW1m
ZCBnbWVtID0geyAuc2l6ZSA9IHNpemUgfTsKCXN0cnVjdCBrdm1fdXNlcnNwYWNlX21lbW9y
eV9yZWdpb24yIHJlZ2lvbiA9IHsKCQkuZmxhZ3MgPSBLVk1fTUVNX0dVRVNUX01FTUZELAoJ
CS5tZW1vcnlfc2l6ZSA9IHNpemUsCgl9OwoJaW50IGt2bSwgdm0sIGZkLCByZXQsIGVycm9y
OwoJdm9pZCAqaHZhOwoKCWlmIChzaXplIDw9IDApCgkJcmV0dXJuIDE7Cglrdm0gPSBvcGVu
KCIvZGV2L2t2bSIsIE9fUkRXUiB8IE9fQ0xPRVhFQyk7CglpZiAoa3ZtIDwgMCkgewoJCXBl
cnJvcigib3BlbiAvZGV2L2t2bSIpOwoJCXJldHVybiAxOwoJfQoJdm0gPSBpb2N0bChrdm0s
IEtWTV9DUkVBVEVfVk0sIDApOwoJaWYgKHZtIDwgMCkgewoJCXBlcnJvcigiS1ZNX0NSRUFU
RV9WTSIpOwoJCXJldHVybiAxOwoJfQoJZmQgPSBpb2N0bCh2bSwgS1ZNX0NSRUFURV9HVUVT
VF9NRU1GRCwgJmdtZW0pOwoJaWYgKGZkIDwgMCkgewoJCXBlcnJvcigiS1ZNX0NSRUFURV9H
VUVTVF9NRU1GRCIpOwoJCXJldHVybiAxOwoJfQoJaHZhID0gbW1hcChOVUxMLCBzaXplLCBQ
Uk9UX1JFQUQgfCBQUk9UX1dSSVRFLAoJCSAgIE1BUF9QUklWQVRFIHwgTUFQX0FOT05ZTU9V
UywgLTEsIDApOwoJaWYgKGh2YSA9PSBNQVBfRkFJTEVEKSB7CgkJcGVycm9yKCJtbWFwIik7
CgkJcmV0dXJuIDE7Cgl9CglyZWdpb24udXNlcnNwYWNlX2FkZHIgPSAodWludHB0cl90KWh2
YTsKCXJlZ2lvbi5ndWVzdF9tZW1mZCA9IGZkOwoJcmV0ID0gaW9jdGwodm0sIEtWTV9TRVRf
VVNFUl9NRU1PUllfUkVHSU9OMiwgJnJlZ2lvbik7CgllcnJvciA9IGVycm5vOwoJaWYgKHJl
dCA9PSAtMSAmJiBlcnJvciA9PSBFSU5WQUwpIHsKCQlwdXRzKCJQQVNTOiBub24tbWFwcGFi
bGUgZ3Vlc3RfbWVtZmQgbWVtc2xvdCByZWplY3RlZCIpOwoJCXJldHVybiAwOwoJfQoJZnBy
aW50ZihzdGRlcnIsICJGQUlMOiBLVk1fU0VUX1VTRVJfTUVNT1JZX1JFR0lPTjIgcmV0dXJu
ZWQgJWQgKGVycm5vICVkKVxuIiwKCQlyZXQsIHJldCA8IDAgPyBlcnJvciA6IDApOwoJcmV0
dXJuIDE7Cn0K

--------------DUFNbHBbvPDY00EhsT6K87G7--

