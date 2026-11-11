Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD88606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 01:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b45pKfqV;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L8BOQL94
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8ZZk9oEGAIjQ2tF3K4JfYaKrxUDTTjE79kClK2OjhcE=; b=b45pKfqVQUcIOYUhKi5zrxwOYj
	5OyVuc5EfVyc2x0G+C1Il6lHBz3LT/TILEQZcaQHnvGD6yfhxGYTODdyC71niHwNrDGfBi8RZjFre
	xath3qdEGffVlI8yUCxi5w6gGB3HO6TpOn7bixgSvarozIg7o8pXT56EgcuPZHjD/bGYIcdWOQ/74
	kDxTnetFLn1VgPjPqlKR3Hbh+C2LJimVfh3X6Fv4DFtjKNtOhdE2pGvkDXtqyCeEYyEiaCfFVKNHG
	0q5vmU5bz4vcnhVoclQbX2cCdkkGiwmfKxO0tBw66DFTQh7VBOmeuGgpbsiNtqLewHolXmhQKYFUw
	sIIlvEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQx2K-00000005Mjq-2QdW;
	Wed, 11 Nov 2026 01:22:04 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQx2F-00000005MhJ-10W8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 01:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794360114;
	bh=8ZZk9oEGAIjQ2tF3K4JfYaKrxUDTTjE79kClK2OjhcE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L8BOQL94I2g3NOqQh4X2CDZ9nBgiSyCun7TWRPgsPkU85idmewltrojo+I1blRbE3
	 zJoeAAMAjylQ0kXJlot9qZrBhlj/sQsUhnW44OZmzt1Tq4zMBlrZemXE3+ZEAGPrTM
	 Ff1NmHE4KW5QHaiCMwlJ9UTjoKPuTmlsF36bXWuZujMHUrUq45S72M/NhsCybCj+3h
	 lDSbmjxABpAhKWJ2/AdaWpzAEYJDG8KTuIMlRbk524qXP2UruNfQJDZnVxmZUfKO3h
	 097gOG8nEDuYCwEnar1EyWBnkTugQeivYCweS8mxZXLJJ5UC+W91JBzPh1g9qPFCu3
	 z5Lnd4BZEFQ5A==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D882164C3C;
	Wed, 11 Nov 2026 09:21:52 +0800 (AWST)
Message-ID: <cb3d9f50467089c6b13ea83aeddfb032c046848a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and
 GPIO line names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan
 Chen <ryan_chen@aspeedtech.com>,  Billy Tsai <billy_tsai@aspeedtech.com>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Wed, 11 Nov 2026 11:51:52 +1030
In-Reply-To: <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
	 <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
	 <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_172159_475290_321D4411 
X-CRM114-Status: GOOD (  14.15  )
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

On Tue, 2026-11-10 at 16:44 +0800, Kyle Hsieh wrote:
> On Mon, Nov 9, 2026 at 10:41=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> > On Fri, 2026-11-06 at 11:08 +0800, Kyle Hsieh wrote:
> > > The LTC2305 ADCs use their internal 4.096V reference, so no vref-supp=
ly
> > > is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
> > > ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
> > > dtbs_check reports a missing vref-supply for the LTC2305 nodes.
> >=20
> > Can you provide a link to this patch? I am yet to find it on lore.
>=20
> Sorry, I should have sent it before this series. It is now posted at:
> https://lore.kernel.org/linux-iio/20261110-ltc2497-vref-optional-v1-1-35c=
9657f3c0f@gmail.com/

Thanks. Can you please let me know when this one has merged?


Andrew

