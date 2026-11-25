Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VXTZpNjd;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qx5nr7x9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YKxHcqUXjQp/1J5J8B8/Kkrmh8UptW8ucEK7buHNuos=; b=VXTZpNjdu5btmq
	fTCEfDxPVfeAb0eDcNxwkUBo78jvjHQomh2xeHxVpQm1qaYVZ9yh1rqNyj3IwJrMsr8zZJTNabVpN
	RdXFdJFawpMNP5eIFXe4ToWyachb6NnfoLWM3cdU8cKZZBfDRVn6Kijp7eEnRrKYMKSK5vSVuqwbc
	Zrokd8WvuNzH0xuP15ofgRluwyvu9v6ruCIOacIRAlOYJIbtZOn/evbu0Su5yxMDleIquUMwwFnIj
	yzIobX7gZxPktsf3i+Kud6tFYuHeraVKjzceKCvv4FeYQ0karH7LSQbrTHhdEQDnK/8GN8S613AeC
	w7DwTtcEFeWpNX14spYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW13E-000000089n0-3E2V;
	Wed, 25 Nov 2026 00:39:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW13C-000000089m6-3LAj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:39:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f03920c4a0so32664525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567194; x=1796171994; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YKxHcqUXjQp/1J5J8B8/Kkrmh8UptW8ucEK7buHNuos=;
        b=Qx5nr7x99qqffU8G0syxmxT7zLvtObe4+TBYQz3LhfdtVMPThrtDcW5HBTLbclFprV
         fmUbpJLBwP/oTb4OmiC8w9xlK6GduNWuv9z8SX7+jOxoak2VyWq4xgyX40p6lVsxp8tQ
         PjUGR8B6cjynL7nAAIMerk4384S8gZ8gntcO2kxLJ2kzaBY6I1K9QmUQ8XejTm0Eql/b
         gCmIBSEo+bjNGjYD+M74gzRQpb0UHSReTQKdHZ9pwsgFxUfhXC/IouXnIq4sbO2YsHxr
         x6KNg1ICU86Nm5dpwqWZmFp3kb3pqILU1rh7n8+RcMsvxRrcHrx3deO6x3duBgQTeE/f
         r5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567194; x=1796171994;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKxHcqUXjQp/1J5J8B8/Kkrmh8UptW8ucEK7buHNuos=;
        b=ub52jy1JD5RmSLiFGwPb8ZEG60StAQYr4InXpZ7egVBnMk7ZE0UraKdFsiDT61YDPl
         E+TcX2bzxr9ww0p6GPQ6D2CpzmhnQ8J2i0y7epaKAvP/9WPuaZ8eNiE3kZ0lwGh/6HPx
         L/V4C7jkLXLvMKo7lzVVwOlFGKDYfJ68oxBmEsrTf8PTJLS3wxr3ko8+3XfhdMIxFj5r
         TV3lHcpFRsBwTiMs4DQfy0g0o9C1N3E7AdVBh2A+/Hhk2iqYuPy1kTKNwlruPZxsFldt
         Vj6J+XXrBgWxS/3TUV2EfdSyFYUx0grHr5BlliFmh85/2+RpXPM2zS6y7Bzp4ySZBLLT
         GvPQ==
X-Forwarded-Encrypted: i=1; AL+hErFY7Rq9VYD9UjwP32LoEWuoVy4UN7avbTEXUP5gekqWSGCOrUtVZaAqzdKX7E2o0Jtpo8GRiMuk13PrsnnY753o@lists.infradead.org
X-Gm-Message-State: APuU4Z8mE2DcAZGEnnUWihU+kLzj0TVnNZN1V7Nr6nnmlPK9QtP3s972
	EhsrCY1oyleSdGuh4gEVsiRkAdkQsy4l1NK1GjrQoXdennoYgc8XdwbBUqnjlSTJPQ==
X-Gm-Gg: AZFdTZdcmR4neWYMyU8QlzhVYgC+76DVCvG/WUatbRpt9Wh2kWPTahyzHrtAZRxLHtN
	0faM3cl9v10kgapccOYxjG+rK4KiqNnzxPy3xDkEvmTo5KBYlAyRzmm80NFpvOpHY3dZ1En2duG
	feDTGUf61vTy46p8TBbTXWzEpkWl8IPnLJ2lSpmOokaH5VCZ0FOLnyflfprEPV6bkBDuaPWcKuw
	LjMSNDlxpCRAM6b9/80eve3cDuWszhCat/XVyiXcQh22NgssD/ehCJDL+Zo+uXErDSF1y/lFiOj
	lIyDznelxnO/Fsy06lVJ5iouQ/jUl2xWJGFFgkMPGy61PznUdtgejJrmO3/MY2oJVcyA9px909j
	Lqw8Gz7T8vbANCy+2gDzOBumIrBJ/UyRspeZtCZK7fwAU/3ZfOB1EEHjle4BthJ8ILLETmo96p8
	K6NJPNwz+2XE9sPF2A7Ny23iMsLxiYUzzde1J3chn3oVhEpe2TodwVCZ7yjSch6MikQeUNw7k72
	mYputKnvnHneh2y8YtjGpgAYJrftmlqvCB91tN/yTBgELzNIspV9m/1bvon9ueBizP6UmJfLNEV
	Sq3aXbgFcQlkQJHV1K+ZTh2AplR8djH7yrWrKZCSKo/CTntJ5YEkRw6n3QQrGJIq
X-Received: by 2002:a17:902:eccf:b0:2f0:25ea:8fa8 with SMTP id d9443c01a7336-2f03f176abamr169618335ad.19.1795567193320;
        Tue, 24 Nov 2026 16:39:53 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm75603595ad.10.2026.11.24.16.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:39:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 16:39:52 -0800
Message-Id: <DN3VG4JCILOO.YN40XHHSWRPH@google.com>
Subject: Re: [PATCH v4 03/19] kho, memfd_luo: Reference struct kho_vmalloc
 via serialized pointer
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Tarun Sahu"
 <tarunsahu@google.com>
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport"
 <rppt@kernel.org>, <robin.murphy@arm.com>, <maz@kernel.org>,
 <will@kernel.org>, "David Matlack" <dmatlack@google.com>, "Alexander Graf"
 <graf@amazon.com>, <seanjc@google.com>, <jgg@nvidia.com>,
 <loganodell@google.com>, <arnd@arndb.de>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <oupton@kernel.org>, <alex@shazbot.org>, <gle.com@google.com>,
 <pbonzini@redhat.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 <kevin.tian@intel.com>, <joro@8bytes.org>, <kvmarm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <kexec@lists.infradead.org>,
 <kvm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <skhawaja@google.com>,
 <sagis@google.com>, <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-4-tarunsahu@google.com>
 <2vxz4idb1i2w.fsf@kernel.org>
In-Reply-To: <2vxz4idb1i2w.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_163954_867266_9E88DFEC 
X-CRM114-Status: GOOD (  17.98  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri Nov 20, 2026 at 10:19 AM PST, Pratyush Yadav wrote:
[...]

>> +static size_t memfd_luo_ser_size(void)
>> +{
>> +	return sizeof(struct memfd_luo_ser) + sizeof(struct kho_vmalloc);
>> +}
>> +
>> +static struct memfd_luo_ser *memfd_luo_ser_init(void *mem)
>> +{
>> +	struct kho_vmalloc *kho_vmalloc =3D mem + sizeof(struct memfd_luo_ser)=
;
>> +	struct memfd_luo_ser *ser =3D mem;
>> +
>> +	KHOSER_STORE_PTR(ser->folios, kho_vmalloc);
>> +	return ser;
>> +}
>> +
>
> Hmm, I am not a huge fan of this. This makes doing such allocations
> quite annoying, and I reckon we will be seeing a fair bit of them in
> many places.
>
> The key observation here is that most file handlers need to allocate a
> bunch of preserved memory, but they usually can free it all at once. So
> we can get away with a very simple allocator that hands out memory
> linearly.
>
> I have sketched out some code for this, take a look at the patch below.
> Note that it is only compile tested.
>
> Perhaps give it a try and see if it does the job better.

I agree the manual packing in memfd_luo_ser_init() isn't great, but I'm
not sure we need an arena. This seems like something KHO slab support
will solve properly, and since kho_alloc_preserve() already takes a
size, KHO slab can be dropped in underneath it later without changing
any callers.

Until then, maybe we should just allocate struct kho_vmalloc separately
with kho_alloc_preserve() and accept wasting a folio per object. For
memfd that's one extra page per preserved file.

