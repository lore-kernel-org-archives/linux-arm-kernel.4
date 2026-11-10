Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AOn8Ozpx;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E+qpiYl1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eh/GkHmVLemeAYxVqb0jIsD7IgzOXsSMzWc10IqxN3I=; b=AOn8OzpxdgqOoF
	17e6/3kHRuHRH3axEq5QELbWIxuGtuVkllkHL5YDiyrB2UTU4NQmfDtQy5dqMXjIfm1I8ILGG01p8
	dLp2MdwYchTd8/NSzDDqOSo1xSVc9oFJWwvxLNVGcidMsC82Z9qnj/hurHyNz617K2TFOtnccIyrw
	ukLKUh+MW0v8nRRPlUwnwDSydq10s4+OETumDjtBqjkXHQoVDbHAe565fB8bW0b01BKVwaXfx1SpZ
	onE0U5XVkRK/+KcZV1al3kI/2fdvsng1GIn6J5pxVUjd/Xkyo+1TB9tIqpqwXDYjELQ0vdu+s8UC+
	1lKn2ejGH4qt5YB5HlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQug9-00000005C4J-49HF;
	Tue, 10 Nov 2026 22:51:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQug7-00000005C31-3ciR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794351052;
	bh=eh/GkHmVLemeAYxVqb0jIsD7IgzOXsSMzWc10IqxN3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E+qpiYl1HOD2n9wrp4FO84c+BjljBtMQb7NsJBaKScfSXcm2erLdY9zpRR6YavS3n
	 x9kIFzMpd1rTmVNGTYH2TqyRBrr2YjgbM6keWHhJIUKMnyigds97WQ6132sUCPBOqM
	 0wvIkEA1Dvver+LehqYg8TfnwY5hn3KpeellgANrWVOzW2rLbwg0hDKlIsQa0aloXM
	 B5FYwyy8Ut+iTpcSHEARU8Xvx68/Jk1wO0XV0PCtfdTgM+Mny3pgIhE0Yv4y0ql3Gd
	 GvMGTbvpoBaGmhZCMlgGF9c1hGx63RTRPBe42OUK9hEVcVv9IYTgQ63OHGeP0S80mE
	 1agYmbUOrLgbg==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D4F6D70885;
	Wed, 11 Nov 2026 06:50:50 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Zev Weiss <zev@bewilderbeest.net>, Tan Siewert <tan@siewert.io>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>
References: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: ASRock Rack X470D4U BMC
 support
Message-Id: <179435104820.1995370.12519686770871849197.b4-ty@b4>
Date: Wed, 11 Nov 2026 09:20:48 +1030
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_145100_102913_73CA98B4 
X-CRM114-Status: GOOD (  10.25  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 16 Aug 2026 13:05:48 +0200, Tan Siewert wrote:
> This series adds support for the BMC of the ASRock Rack X470D4U mainboard,
> which uses an ASPEED AST2500.
> 
> The mainboard exists in three known flavors, the "normal" X470D4U, the
> X470D4U2-2T (with 2x10G RJ45) and the X470D4U2/1N1 (an ODM version with
> 2x1G RJ45 that is now available in retail). The 1N1 version also has a 64MB
> BMC SPI by default, but they are all swappable.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


