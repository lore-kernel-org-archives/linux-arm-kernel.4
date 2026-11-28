Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DOSqt2Dv;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dVSwslg7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d6BkAp7ECdk7km8IXzswx291+eDVbqVT1bK4nfJre9c=; b=DOSqt2Dv2Papdx6Wiyp6biBwJS
	JweS9rA04Vwr1nwYvdQI4nKczKeIEDvvssQmz5XsoZLm9D6K+Ed+42Hw4ierOFe/UDW0/OINrqJTO
	SLUtcRz/kgLBg5BZo2o1mwrqRFw5sEWWsKY1XrPbqBlGJ5oMA5JvoAzG/i7zL9mcHYVNxd7hvEixV
	FqtfsfmlvTw8nJ3e/EZdse/4fKTOYOfEr9eHvfcrWVzP/oDRfUJIEttgwIFinulzZOnCVPnmqE2+Y
	DKI85GM/d3QmT9dp5YUcOMeDpzZdGowl2UDoQsVbY9FQU1TsoIdKFSwl7bHHdUA/wUQoUqrGrCTdv
	jTjnDpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXI2a-00000000lnc-37tQ;
	Sat, 28 Nov 2026 13:00:32 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXI2X-00000000lmX-0HaW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:00:30 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c429d9d05f0so840000066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 05:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795870826; x=1796475626; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6BkAp7ECdk7km8IXzswx291+eDVbqVT1bK4nfJre9c=;
        b=dVSwslg75RlyqmlZWA2+2KqfbNCNdkIyfd2AjGPLYSC6aw0AOcOmTBVMBjIohA3pk5
         4BzzMnZhyssYmSYBOTawcU8d6cqaI2IBYgeHoz7xnSx25NCIY5IZP9lTGXYO6iEDvrPt
         BbsgcYpDprTwgvC2+vIhiBdmTjAlVpFsWri97gy7imsUG3DDl295P9hhb0FMnY3jWSvb
         i8FNGwNwh0XLo5jCCeH+Xv2Et7miICorUZbCF+LTY9wvx4FLKgPJOfoa/aZXz2qMQNU1
         UH5/k2hlRR9+ZuY8B+DfxLAJpavIHYS3m/ydSEZbO6T4jJH6xugERP4O8LsApRZumMck
         cNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795870826; x=1796475626;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6BkAp7ECdk7km8IXzswx291+eDVbqVT1bK4nfJre9c=;
        b=wOWVeDovZXcK/f4McZYLrelGXzyS0JP/ZQImCddimWCsoFk0+B2HOuFvlUrczSWRl0
         r/ElYKVv35XKSE0wcXLO51zTQDmWm0XSqBvxxkw1Ib2KaVn6XKr+29xyvMCiphNKmhL/
         MQD64MRSF3TW96dS0VULTNema84hWCL5WzRMZrFNBaikOxp1FyAIYJeDmPb5+DmVxVI+
         m9bganTxROnX/Amsyn3y/u5+3U84P37Uql+XZOXEymacqPhPTxgsvoRWXAmL+9tCuh5L
         SY7S/G4j5PR0cVa/iUNZkHeIT3Ii6z6ZcaMKbOkSGaHEwJke5bBWnVgiuD8JJuobyLsj
         +dsw==
X-Forwarded-Encrypted: i=1; AL+hErFXGuHnlhCci4NrZAnWwZcX5AGBDDa5208WX06nU1QqtyQ/fFOoQM09zXwmOIAT/AXxdBXZoJ/amqcKNjw3TACv@lists.infradead.org
X-Gm-Message-State: APuU4Z+YFcq2/ZE1/zuOT6Tu1NCMn2HalVDf0NOMelX9Vtyk+r9VU+Gl
	npd576VEXqrDIVZzd/oKbwrKv6UFyrHRabrhjAC83IcYqBR82RuAqfNTS2vst95Ks8kUehH4qtz
	u5sQ17/qhlfrM0SaJjw==
X-Received: from ejtf9.prod.google.com ([2002:a17:906:4949:b0:c31:8840:5c0c])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:3d21:b0:c51:24a4:1dfb with SMTP id a640c23a62f3a-c513ac7edecmr1624478866b.40.1795870826056;
 Sat, 28 Nov 2026 05:00:26 -0800 (PST)
Date: Sat, 28 Nov 2026 13:00:25 +0000
In-Reply-To: <avnuP7SWE2BdBFBL@kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com> <20261110050202.529473-3-tarunsahu@google.com>
 <avnuP7SWE2BdBFBL@kernel.org>
Message-ID: <9huzpkvpglg6.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 02/19] kho: block: Record the entry size in the block header
From: tarunsahu@google.com
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, robin.murphy@arm.com, maz@kernel.org, 
	will@kernel.org, David Matlack <dmatlack@google.com>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, jgg@nvidia.com, loganodell@google.com, arnd@arndb.de, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org, 
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_050029_144428_DCE76479 
X-CRM114-Status: GOOD (  18.81  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mike Rapoport <rppt@kernel.org> writes:

> On Tue, Nov 10, 2026 at 05:01:45AM +0000, Tarun Sahu wrote:
>> Subsystems using the KHO Serialization Blocks framework currently do
>> not record the serialized entry size in the block header. The entry size
>> is only known to individual callers, which must track and store it in an
>> owning serialized data structure. If a newer source kernel adds fields
>> to an entry, the changed entry size breaks the stride when an older
>> target kernel iterates over blocks.
>> 
>> Add an entry_size field to struct kho_block_header_ser. On the outgoing
>> side, record bs->entry_size into every block header during allocation.
>> During restoration, derive the entry stride directly from the block
>> header instead of relying on caller-supplied dimensions. The
>> kho_block_set_init() interface remains unchanged. A zero entry size,
>> or one that differs between blocks of a set, is rejected during
>> restoration.
>> 
>> This change modifies the serialized layout of struct kho_block_header_ser
>
> Imperative voice please.


Okay, Will take care of that everywhere. Thanks
>
>> and shifts the offset of serialized entries within preserved blocks.
>> Bump KHO_FDT_COMPATIBLE from kho-v4 to kho-v5 so that pre-v5 and post-v5
>> kernels cleanly reject mismatched handover state during boot. Also
>> update the stale compatible string example in the documentation.
>> 
>> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> ---
>>  include/linux/kho/abi/block.h          | 10 ++++----
>>  include/linux/kho/abi/kexec_handover.h |  6 ++---
>>  kernel/liveupdate/kho_block.c          | 32 +++++++++++++++++++++++---
>>  3 files changed, 38 insertions(+), 10 deletions(-)
>> 
>> @@ -264,8 +274,21 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa)
>>  	}
>>  
>>  	while (next_pa) {
>> +		u64 capacity;
>> +
>>  		ser = phys_to_virt(next_pa);
>> -		if (!ser->count || ser->count > bs->count_per_block) {
>> +		if (!ser->entry_size || (entry_size && ser->entry_size != entry_size)) {
>> +			pr_warn("Block contains invalid entry size: %llu\n",
>> +				ser->entry_size);
>> +			err = -EINVAL;
>> +			goto err_destroy;
>> +		}
>> +		entry_size = ser->entry_size;
>> +		bs->entry_size = entry_size;
>> +		capacity = (KHO_BLOCK_SIZE - sizeof(*ser)) / bs->entry_size;
>> +		bs->count_per_block = capacity;
>
> Nit: can't we just initialize bs->count_per_block directly and drop
> 'capacity' and the change of the following line?
>
> We are not very strict with 80-chars limit in kho/luo anyway.
>
Sounds good. I will update it.

~Tarun
>> +
>> +		if (!ser->count || ser->count > capacity) {
>>  			pr_warn("Block contains invalid entry count: %llu\n",
>>  				ser->count);
>>  			err = -EINVAL;
>
> -- 
> Sincerely yours,
> Mike.

