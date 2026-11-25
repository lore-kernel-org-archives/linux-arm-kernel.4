Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1D606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cvYonEBq;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M8wbD2Hr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nYycouvr6zOSJsdG8B1rvzwHCG0khxitcfoXgjaouMs=; b=cvYonEBqcA5rjs
	lIMFf83JOJ3Z7hExXWAyIHgMAyoEEsFU93m5yKFVwRV+/0UblhDvWX5nELmZmpgo/Yn9lDZepdXjC
	IMTCDwMdkiX0+IpMpVdcB/5fI0O4om7MpovWP/89eLbUoUxKapBpgpynSZKA+1QWcL3t6VJSrVnWk
	l/k3SzujagAVYC4/6eClFmZnuy8MAMB5MRxXWSat7kqFcbdFaCUs4f0gw/Y92DDElMS84+dli8Wet
	5nrNEFAOZWbgcbHuA94ZjyTUjUhJOgC6wqEimZQ+DP1H8J0/mP3+4PLj3CmFRR2I/ioC4VHkHrZye
	1qACj7ZiOXXFqpoOPt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGzZ-0000000AljT-3vaQ;
	Wed, 25 Nov 2026 17:41:13 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGzC-0000000AldV-230v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:40:56 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cdb2893531bso3211233a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 09:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795628450; x=1796233250; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nYycouvr6zOSJsdG8B1rvzwHCG0khxitcfoXgjaouMs=;
        b=M8wbD2HrNZk+6zOz/FdifdAfAxxRPGXSrpFQgAmeFz53fw+PMvW1fQ0lgp8RPW8NAK
         061CKePMzzH8OHUcfvmCqfb3mYOSOusBvgpEMq3ll9Laqi6+C+EN18xIfPeX9tm56jMI
         uB3ec2ut6C2S6REKwE60mSxynY1L3rF+PnPTVhZ/4Xa28RaNgpzgsUE4iF29JsegwU95
         l4ztfLvXFQ6XnldF7OWOOjNp/3OTm0KSpG8Ie4PvliqF+jYrknljr9w7fp6Aven+ax2i
         lvz/Wr1k+UU+YvPm4cyYR1neXOkaKsbw7pm7K0niEHjIQo8iBoStyrq6m7y7KVC8lgJn
         3mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795628450; x=1796233250;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYycouvr6zOSJsdG8B1rvzwHCG0khxitcfoXgjaouMs=;
        b=XlJbH06N/PJEKVvkapVEQlGPWf3OGMpK07siQ29/13OIHivLbGiQZBnXxKusUuAOgJ
         XJmamECvXfNOUfSbCtdEzZQGzQPnoEogTGOZuj4typoFuQdIwtUm3qDyLaX5VoOzTnLv
         tHVuX1stOD1yBfKJf9gKmhqPK6XNNrqDxlKfxXQlV7n5zfYnsYRU6TDmtxPuvl/ZQ5ic
         LWrsUqaXPuTUfUQiHYMEQyFOH96AexPU112fZwdrcGj42g37TZHKPb6coV627IxTEnJt
         P4qqrCngsWiMxA4qRsPOGy5uDjBpHGurl25XT+jpwXQJZ9x/3/Z1a4j5Oma90gMnS+as
         1LqQ==
X-Forwarded-Encrypted: i=1; AL+hErEcdaj8Zc1fcVbPhqW2El97ppFAHjMRXxBxaqE8/9YMLHYU8jJ5gCqBwKxtvQKbfFCseL/9z895PHbXJ9lW+kaq@lists.infradead.org
X-Gm-Message-State: APuU4Z/2sOpdKaNtQkrwNrC/GT7auNGCTbkLA8NL58XgZNMhoNNZ2xXK
	T71akhQZ9yw56hjXRjumPhGLAybVzIkypblNPJ1zx8BHssxBTaAKroRmh58tkr28qg==
X-Gm-Gg: AZFdTZcUYWXNZhOvkRfweqVtYuUu8j5ujHjmFebmbUeFqCPgtIl53LMlMKY22ACooN3
	Utl/ZO2PdlFqPD5zZrF05vfxI9bEk9UTIS0ERLR7okDQvKnBAKXv9pxdHpVGfHthDXNP+Tkl/7f
	SgkcrY0x1SKpH/9ci4SFuNeNsg71rKpzvLJXHrAh6ztsuv9e332QS9OGfAAx5L2vPBh51g+rcJY
	TJBhatZFH6527qS7yGN/oUoHoWKWVs6Z+r5UMsnfkJCo5OvJmeU5s/vXcyMnsl0A9apG0hl8e1E
	gRHz6v5MaerWRSE15lXSsaRIEY2vB/dy+BGX0oDvsSmVn/SqnyNLQ9KUxrXZ33EO+stRtk9VxRa
	mULhPXYW8/u2zSmcAkmqAFD5np4uKn0P5glEqKw1xKC1nz3n54xXuoIzBKjeOPbSqCaQYPUwdNt
	ObwxH0owgOJcF2qlkzJuikHvRoT849d1Z/zXcFR2nT3x2LvbrCgKP7xNGlS2z3TMbTXQlpdfW3c
	V3E5KWFgeFwPuh8L5aw95JvNbJuPH/MHdildQ1WrSNFJuWDXTL8RI0ghXiUsSKOJvaQGCitj4V7
	J/+ur5yryZBcL4i1vFjXTlN37CZvf+zwRk8zhSD60xaqqfmt9CqFhuY6GU4oYHZL
X-Received: by 2002:a17:90b:390b:b0:3b3:fe22:2745 with SMTP id 98e67ed59e1d1-3b41c933edamr18216503a91.45.1795628448898;
        Wed, 25 Nov 2026 09:40:48 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm31676002a91.15.2026.11.25.09.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:40:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 09:40:47 -0800
Message-Id: <DN4H5ST3X9L1.3IUEC1CA5QI8H@google.com>
Cc: "Tarun Sahu" <tarunsahu@google.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>,
 <robin.murphy@arm.com>, <maz@kernel.org>, <will@kernel.org>, "Alexander
 Graf" <graf@amazon.com>, <seanjc@google.com>, <jgg@nvidia.com>,
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
Subject: Re: [PATCH v4 03/19] kho, memfd_luo: Reference struct kho_vmalloc
 via serialized pointer
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-4-tarunsahu@google.com>
 <2vxz4idb1i2w.fsf@kernel.org> <DN3VG4JCILOO.YN40XHHSWRPH@google.com>
 <2vxzld6hx97g.fsf@kernel.org>
In-Reply-To: <2vxzld6hx97g.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_094055_553702_2E3A5E75 
X-CRM114-Status: GOOD (  11.02  )
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

On Wed Nov 25, 2026 at 6:43 AM PST, Pratyush Yadav wrote:
[...]

> So I wouldn't want to support slab until we have file handlers that
> churn through a lot of preserved objects.

Makes sense. If KHO slab isn't coming, then I'm fine with the arena.

One thing I realized is that the choice between the two is visible to
the incoming kernel. With separate allocations, the incoming kernel has
to free struct kho_vmalloc and struct memfd_luo_ser separately. With
the arena, it must only free the top-level allocation. So we should
pick one now (while memfd is bumping its compatible string anyway)
rather than switching later.

Separate allocations leaves the door open to KHO slab but wastes memory
in the short term. It's not obvious to me which direction to go :)

