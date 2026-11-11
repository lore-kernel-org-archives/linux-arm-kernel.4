Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDB7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 23:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G7xK7TIF;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KD+N4m3F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4jTQv18d6f1WQDZPy8KbBDvAw2VyV9v3NRrsYhICvJ8=; b=G7xK7TIF2+ujiNvcsluF1+xNXk
	YrApVBlRNwmcf0l3fd+wwkwVVMWZNffdXYz4DyE7dN+iVqK+AFDSmtv5CPjO+rwcXzT5dcM8fLYUh
	sMvCQGRYV5LAh8jwEoReeGIAQANQERT7z7ELrtO4C9kL5aotdAAr7G6mrFcopAA27UEjMe0kRGdcp
	eYfdbZ9w0E1kznwletZNQjJRW4JvQ5i5wjoEXykPg0hEUHlJ1vnYRwBdSEr+0qyQkiQ3a5g95CpPq
	uSArzL/xhpIlNqcFrRPwWAtsss/h/UXo8loB5wW/JY6mcsQXp8atOp54igWgHCHq4X8asNPDmHdkB
	+9HOi3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHlb-000000088un-0Epq;
	Wed, 11 Nov 2026 23:30:11 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHlX-000000088uL-2Stp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 23:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794439799;
	bh=4jTQv18d6f1WQDZPy8KbBDvAw2VyV9v3NRrsYhICvJ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KD+N4m3FafpulELFLuXVw9qA2sr62kqjZns89QS9ygPOv1uZ3Vt23iID59FR9yobW
	 mXLcnCqeJXqjnuwkx3u5k5yfMVCSahFMzu7cjYe1WBBMdryWAlcIhe6EmViHIozTov
	 jFZ1X7gUWke2ocIFRWQtMBBZChLgvJhg8cqNOLz26uy3ticSXZk2LNWiyavGR2YNg0
	 jXKd4bklxKqKdmWlik5SxLDO5xidJ4pupeTmBrqs+fKBCJkPAo5Kjzb0XNbmkHKr6k
	 Vdb476ZIPgAULgRS/7Jwt1Bzj/sTUfZc3fJUV+LeO2fTr06UqmsMUh1FKQ8nS899if
	 H5eUI0c0Xz1jA==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9EE65704C1;
	Thu, 12 Nov 2026 07:29:57 +0800 (AWST)
Message-ID: <42bb0b817905637239c16b94a562254cd0e6a644.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com,
 devicetree@vger.kernel.org, 	linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Date: Thu, 12 Nov 2026 09:59:56 +1030
In-Reply-To: <179438627442.2016371.12057101111349178921@nvidia.com>
References: <91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
	 <179438627442.2016371.12057101111349178921@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_153007_831420_35FCBE89 
X-CRM114-Status: GOOD (  11.27  )
X-Spam-Score: -2.1 (--)
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

On Wed, 2026-11-11 at 17:32 +0800, Jacky Huang wrote:
> Hi Andrew,
>=20
> Thanks for taking the time to review this.
>=20
> > Can you please expand the description of the platform? Why was it
> > designed and built? What's its purpose?
>=20
> The NVIDIA MGX Vera C2 is a Vera CPU-based server platform. I will
> expand the description in v3 to clarify its purpose.

Thanks. Just to make sure we're on the same page, I feel stating that
'NVIDIA MGX Vera C2' is 'Vera-based' doesn't add any new information as
it's already in the name. Describing the purpose would give better
insight.

I'm after a helpful description in the commit message for the purpose
of summarising the content of the branch when I do a pull-request. 'Add
support for more platforms' doesn't really cut it there.

If the platform is described on the web by e.g. marketing material,
please include the link.


Andrew

