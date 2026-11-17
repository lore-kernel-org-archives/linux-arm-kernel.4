Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C515606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b8QDNJvq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftnvz5rg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=955rSHytw353+kX4GJ/2ppKhYBxbDLqQad9xzhWOC6M=; b=b8QDNJvqADzw6adeN5lvknxL9Y
	KyTVXMoW7Wo2x+cPP4vq99Q9HmezV3YjkRmYdKJMu3y6nwYqgx9WL26jrTe4pWrOKMZpH/xdAxDNH
	B64FL6CWCVKqEppRY6G6tLmyRYueMbiW79IbQTaKMqP0bm8APuzXDoGXKIJSANlGp9kSkRVYu9M2y
	84HxkMZnwQqepOkmJPH6LxOu+v6UGzxULDAIqpgw+6dauVaB9R8beHnmOWypjidRxdGF2F054XMNj
	QTzeLhMzu/nPmauqKe2UoqAduG8rtWmd2p6ZaVdMO8ZYZt8DnT/WcjiwjwQVQ4o4OKxsZmsWNTAge
	Eo+4R6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJfu-000000061hF-0ayL;
	Tue, 17 Nov 2026 13:56:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJfs-000000061h7-21uw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:56:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E505140D88;
	Tue, 17 Nov 2026 13:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8331F000C5;
	Tue, 17 Nov 2026 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923799;
	bh=955rSHytw353+kX4GJ/2ppKhYBxbDLqQad9xzhWOC6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ftnvz5rgOCRpDUKPKNjy27R4QUmsnvYn1MxObcCQupIrYPOpPeedZT08WtgQMlDIz
	 Sgv6/DIlj/Bmf7mhLCB6+YabTLcGaJAoDsVdRiRmuWkZq9dnhrkqYG6hObsylMPNAf
	 2E8EEZGWoKFvcFWM5sZGwgfX+xT//mQ/oI/OGP8C6J1Xr3NqJmE5kTweHrVw9Ivtcs
	 CwzGzGWDs4Hf6/vfZdE+NFx45mhfzr1fmda9KVrW5DrRq/mp32dEZuYS9ssEYq3RBv
	 eUwUlK/dJ4SRwcougc0X1tci+mPxG3KlD+sKN53d+5OnOsU71ztp/R0uVaXxMfnc0s
	 QWqhiBhZbRHHQ==
Date: Tue, 17 Nov 2026 15:56:34 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line
 parameter
Message-ID: <20261117135634.GA162713@unreal>
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>
 <20261116174238.GC2299285@ziepe.ca>
 <CADrjBPpyhKcvdH=jxiGSN46SZoFahaBdH4fAQ5KEzRvH_C3AJA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPpyhKcvdH=jxiGSN46SZoFahaBdH4fAQ5KEzRvH_C3AJA@mail.gmail.com>
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

On Tue, Nov 17, 2026 at 12:19:45PM +0000, Peter Griffin wrote:
> Hi Jason,
> 
> Thanks for the review feedback.
> 
> On Mon, 16 Nov 2026 at 17:42, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:
> >
> > > Instead, I propose handling this in the generic IOMMU core via a
> > > kernel command-line parameter. This makes it available uniformly
> > > across both Device Tree and ACPI systems and across all IOMMU drivers.
> >
> > Something like this could be useful, but also Leon's series will allow
> > userspace to do it from the initrd too. IDK if that is more/less
> > interesting to Android.
> 
> Could you point me to the series you are referring to? I want to be
> sure I'm looking at the right patches :)

https://lore.kernel.org/all/20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com/

Thanks

