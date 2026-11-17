Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4COUD6HD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=D6QleEwL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TVmLuN6TdmZRBmVuzJ3dizL5Wjg0xswtTu8Vva+GDgk=; b=4COUD6HDgj5aJBQ51JvwTYPvEb
	FyQrWx0Dc0tX4w+L4zwgHQ8eLaOIz1DuzciLOpBbh4SyjXPn2HDc8VBBtz46meQD0ljyA2A8kJsh2
	gKeLoKcylnrgd7Y85Ih9A0DrsRmgrwVqczjR9GT2+qRu0EVD64X+qka+uc4rjbmHEUTId17SIYpES
	Uwmufn/bvn9v66uXsIV1hfdWMI6BJVSbXckUT6FqOI1/Pve4kpzkibUsHe9xQXBVSa2gGyBAt9xHX
	2RSVS8eFnrqOjUM/AsTUkVyTvZJbDQhnPDTTWPGg8sSVSY0+17Sl0SXeNzksCY68659pQm3kQ81Ac
	FxEHmU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQSK-000000075dm-3XMI;
	Tue, 17 Nov 2026 21:11:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQSH-000000075aq-3jd0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TVmLuN6TdmZRBmVuzJ3dizL5Wjg0xswtTu8Vva+GDgk=; b=D6QleEwLtE+BfhmYDylHgTmtFk
	A4WxMb47kUB/TREB44aHL1jqaP8wvPk2xsBfUMFnN1Vi/RwSJGLAd+oIQoUf3snmR5gKp25gn9BlV
	yYNm1POZmhDfTi6rqjfD4V4POk6Pex2YDirvyDvC/LZZmlwXPFwYL3Czg/yM0HGSygtc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTQSD-00HGsb-LC; Tue, 17 Nov 2026 22:11:01 +0100
Date: Tue, 17 Nov 2026 22:11:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: A B <pwnzorius@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: armada-370: Add WD My Cloud EX2 (Gen1)
Message-ID: <2ee34025-2b4f-4a01-b840-d7b4929d1198@lunn.ch>
References: <CADS6G6JDXAP7PzKWqmq69ViC6Gim9o+9pQ=ctuaiEboJ-WsS6g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADS6G6JDXAP7PzKWqmq69ViC6Gim9o+9pQ=ctuaiEboJ-WsS6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_131105_926505_4386B14F 
X-CRM114-Status: GOOD (  15.08  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 09:10:31PM +0100, A B wrote:
> Hello,
> 
> This adds a board file for the Western Digital My Cloud EX2 (Gen1) NAS
> (board RD-88F6710 "KingsCanyon", Marvell Armada 370 / 88F6710), which has
> no mainline board file today.

Please take a read of

https://docs.kernel.org/process/submitting-patches.html

> Confidentiality
> 
> This electronic transmission is strictly confidential and intended solely for
> the addressee. It may contain information which is covered by legal,
> professional or other privilege. If you are not the intended addressee, you
> must not disclose, copy or take any action in reliance of this transmission. If
> you have received this transmission in error, please notify us and delete the
> received data as soon as possible. This footnote also confirms that this email
> message has been swept for the presence of computer viruses.

FYI: Your email will be publicly archived, so i really do hope there
is nothing confidential in it, because it is not any more. Please
remove such footers for public mailing lists.

