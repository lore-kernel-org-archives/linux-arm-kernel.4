Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362A5606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dYvwgcV+;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CgLIQfBc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FNcC9m18UoMJxRcJEPoSUxoKZdU2fxVY/XU8PXnrjcA=; b=dYvwgcV+YESqdc
	sidNJ0ix8YSmbJ2dS8+1Zk8RsfljpkeNu4k9Z7mi1E5ZgDoFlZ/tPiEFRdd5yeis4ISQFrc9RSuIs
	JsLPeiEsR1lmWY7jh5NrbYdDv/NB9NU3900y5P1ZAkKOK5eClXplF8LcyoSXd1OmILVSeA3oxfN5H
	3obgRYGylDhRoFiIFuhGShgWko8yKfZAk1ysA9Rjo3cFB63f9UkLlDTFvkyryYNFG6UCgYdBn8qYM
	SB5kg9UkvhHCT/QOQeyKwvMwjtG9tG6jSKm3L8lC4hDU5Lkz0ItxbumCc/QGx06cJkmBSxbexdN5W
	B3vwoU4UkZORAsa9Je6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpJg-00000004d0p-2NKT;
	Tue, 10 Nov 2026 17:07:28 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpJe-00000004czn-1s3g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 17:07:27 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1198931a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794330445; x=1794935245; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNcC9m18UoMJxRcJEPoSUxoKZdU2fxVY/XU8PXnrjcA=;
        b=CgLIQfBcWorczUVQQ6iNeoA88wLFgdUG9oqQS+AjTwv6m+69ROyfyk8OMt34/EcJnP
         UDiJx+YJbUBe+4BWtLSHLiFlfRvC0ChPIKAUnySZqrQrR56kxMWmd0hE3+HJXUvmIJjA
         oyF5sBKK9HVn1bkSaMz+CBrbBZELvVB1dPqENQz1FLYm+KfZdhI8WpZCdwXcrhb8hbtw
         mOCHI/myPJt4DZIDmR1KEbfABgNRQjsj9YYu1pUGMiLo5H3x2Dg+f54Zbe41oo2HA9BK
         oTuwNz55XodXsht8SWkBA/jupHnu5sXY4c5wknXYRhX3ffypDmuIOWW0HJWObzE/tmxb
         O9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330445; x=1794935245;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNcC9m18UoMJxRcJEPoSUxoKZdU2fxVY/XU8PXnrjcA=;
        b=tzUt2+Ahw9HqommQ9sP4ZRZ10kXQVwUaAfK4D4/XlXvWp4K11Ic1qd00f8zpCU6Pj3
         pdTaeF5qisBFmERYfz3cwHf5jj8IgiQJQMsvNcCSEAZoAU8RL4YIQi5SBk85u52e/rJq
         qZTSHLEyUS4qORlY0SG1md6Iy/UoAK8O7iZELuSxFiCIIOoUDW74hJ2/slyjeEUS0lMr
         tV/Jem3lG37G/nnHjHgaRTykNV8hmW/9TdS9FoYKIRAoWUSxTi48MYEM+T3AdVaDzkFp
         ceypd1jB2hF0995/I+ubDE7QATIsvIVQyKtLHFSabyjvO6OSlrXgBKIBug7AEbHuimkE
         xTNQ==
X-Forwarded-Encrypted: i=1; AL+hErEgi4fV8Oj7F3SUPFS+usGXXzE0XfeJhRQna7eA8nlbPTbjZlKTDHC2QFf2T2FzATl7L02PkEBKpi46zmsR2RGR@lists.infradead.org
X-Gm-Message-State: APuU4Z+5gznDcSg8BFZKLfEMkNqmn5L0PgBHscjQTcXpewOkcdsA0+R9
	zDyxAR/TDLoHFBifUu3zDrMTePH5TvFgx48NqIsVRyWz+e2AHd2+tugeCZGJ9YguPg==
X-Gm-Gg: AYBFou1aLhOpzmm2BkT2zVvjUUF660aVMGDqZYZBHg2zueTPzwh9JxQBvs47iXJT8nJ
	mRSXWvpfnPo+8hs1+xjx38S1GslNLNkGUXGLeRVM6nA+g+3JL2mdgVCV8AtpvUwssCygMaK4D7B
	D5ldujQvVRLboE3geSVczPXk/Tg+zrhhNzDSsKred+n1rutTg9y1Jz7de1FVNXo728v2pRyVX2N
	CAePpLTBHP/MgbOAKhJPEa+D9ZIRPb3Ih6Kf8iqVopN2zcQSbwNcWMV4XDfv20MmB2VKuG6huOZ
	BOmkW5GPERVg4JDuMx68PsYR1feKwIdtbGy9ugoYKOHawMkD44iaO38nlbqnZ6b1JOBu4OYk6/o
	IkzCWPXaOg88IYJ/S9epzPC3OIyYAD3f1zr7JLJuEbvC3s29WBH6h78SWialAfqn2qKSr8AnlmG
	2bIhkwWTvwAkp/z1IokX8rC1CDNJD5uLcObinN7NCeSz0NLB7OYrlJJKWEhp0zKvjIjADW78y0t
	DsiuNTkKukLN/6jg1dvVA9a4UvBNAuMut+ZeIw2GE8uLpFIbJL2jzM1ABuZ/w4EiOS5+WsNnDkG
	FXMfvSqPM/4BS7SvsBqLntAcF4+liwdXOwGZPjapOI9G4vSj21pHpMTIfSnpGmcP
X-Received: by 2002:a17:90a:e7c1:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3b166cdb54amr3659496a91.46.1794330444574;
        Tue, 10 Nov 2026 09:07:24 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db56c7esm499973a91.8.2026.11.10.09.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:07:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 17:07:22 +0000
Message-Id: <DMRP21FATCC0.ARAURXWV85JP@google.com>
Cc: <kvmarm@lists.linux.dev>, <linux-pci@vger.kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <kexec@lists.infradead.org>, <kvm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <skhawaja@google.com>, <sagis@google.com>, <linux-arch@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 08/19] kho: block: Add the feature header to blocks
From: "David Matlack" <dmatlack@google.com>
To: "Tarun Sahu" <tarunsahu@google.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>,
 <robin.murphy@arm.com>, <maz@kernel.org>, <will@kernel.org>, "David
 Matlack" <dmatlack@google.com>, "Alexander Graf" <graf@amazon.com>,
 <seanjc@google.com>, <jgg@nvidia.com>, <loganodell@google.com>,
 <arnd@arndb.de>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, <oupton@kernel.org>, <alex@shazbot.org>,
 <gle.com@google.com>, <pbonzini@redhat.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <kevin.tian@intel.com>, <joro@8bytes.org>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-9-tarunsahu@google.com>
In-Reply-To: <20261110050202.529473-9-tarunsahu@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_090726_485264_E114486F 
X-CRM114-Status: GOOD (  13.69  )
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

On Tue Nov 10, 2026 at 5:01 AM UTC, Tarun Sahu wrote:
> Precede struct kho_block_header_ser with struct kho_ser_hdr using
> DECLARE_KHO_SER. Each block in a block set starts with struct
> kho_ser_hdr followed by struct kho_block_header_ser. Serialized entries
> start immediately after the header payload at offset fhdr->size.

This adds a feature header to every block in the set, but the layout it
describes is a property of the whole set: all blocks are written by the
same kernel with the same header.

Blocks are only ever added and removed at the tail, so the head block
is stable for the lifetime of the set. I'd put a single set-wide
header in the first block only, e.g. a struct kho_block_set_ser with
its own feature header, and keep the per-block header to next and
count.

entry_size (added in patch 2) is another set-wide property that belongs
there. All blocks in a set have the same entry size, so recording it in
every block is redundant, and restore has to check that the copies
agree.

[...]

>  		entry_size =3D ser->entry_size;
>  		bs->entry_size =3D entry_size;
> -		capacity =3D (KHO_BLOCK_SIZE - sizeof(*ser)) / bs->entry_size;
> +		capacity =3D (KHO_BLOCK_SIZE - fhdr->size) / bs->entry_size;
>  		bs->count_per_block =3D capacity;

Nothing checks that the blocks agree. Each block's entries start at its
own fhdr->size, and count_per_block ends up being whatever the last
block implies. With a single set-wide header this can't happen.

