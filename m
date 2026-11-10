Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC113606A7DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZ6vHu25;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=t62pdt2N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uN8v/ql7Ig3Q1kzcH3JlLyoHXVIkZ6u9pSBdR1rwWCg=; b=LZ6vHu25rwWvpQ4SVJRD3wsPnm
	tToNenWy0D8yu4gjHiFp1TyUjZ09kmV6fEcWwLtarrgH97VxDbyvgAN/oVUehMxI2BI7jCgADJS+2
	VLmr9lZiwwlY8NUD1YqUf6ByBu+srjQXYge05TxAy0vn1vTVCOiUF2+ts3KI6Q1m12GoGveuVjVt4
	Him2IQ6ZesWxxbpqmCd0RvYmPk9mzhhREt8SvJ5LypFIDjAFctX5uPWQDJxoILmpnguoCnnqSXn5g
	/IuQdPgz/f3jmUFSBY3NMifmwnXZ+kKsAZZcw4yKhGHqKrgcn71SPBhy2bTfeSaG+zmLWdtoNTVVu
	w/FMKBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQleO-00000003ztx-2wLg;
	Tue, 10 Nov 2026 13:12:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQleM-00000003ztH-0C8Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uN8v/ql7Ig3Q1kzcH3JlLyoHXVIkZ6u9pSBdR1rwWCg=; b=t62pdt2NbyA0Rm8RsYb4nduog1
	bDSBtA7ZYHqleUkTKEPRlFTIzt4Uu9JI47Br24O6URPnJSKyYQ+miajbzhp5ZFyJyhCOXQnydWkTw
	88LSdaHDXTmJugXY9MjIJlHcBSIpCIRpjZPvwlddRyaXM3hnwV114qBTcdAssYzBkXIw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xQleA-00FTwe-5i; Tue, 10 Nov 2026 14:12:22 +0100
Date: Tue, 10 Nov 2026 14:12:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Michal Simek <michal.simek@amd.com>,
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 5/5] net: phy: dp83867: support setting
 output-impedance
Message-ID: <ab3b042d-dded-4349-b9c0-7b2678274275@lunn.ch>
References: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
 <20261106-v7-2-topic-dp83867-v3-5-45e1d3adf1bf@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-v7-2-topic-dp83867-v3-5-45e1d3adf1bf@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051234_087843_87F4F4CE 
X-CRM114-Status: GOOD (  16.77  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 08:47:29AM +0100, Steffen Trumtrar wrote:
> Currently the dp83867 supports setting the io impedance to minimum,
> maximum, default or a value from a nvmem cell. In situations where there
> is no backend for a nvmem cell, the value can not be set to anything but
> minimum, maximum or default.
> 
> Add support for the ti,output-impedance-ohms binding, allowing to
> specify the impedance in ohms via the devicetree. The PHY has 32
> settings between 35 and 70 ohms. The datasheet does not specify the
> impedance of each setting, so the value is mapped linearly to the
> nearest one.
> 
> With this mapping, 50 ohms results in 0x12. For non-OF devices, the
> driver sets 0x0f (IO_IMPEDANCE_MIN / 2) as the 50 ohm default "per
> datasheet", which would be 53 ohms with the linear mapping. As the
> datasheet only gives the range, neither value can be checked against it.
> 
> The binding does not allow combining the new property with the nvmem
> cell or the boolean properties. The driver still reads the nvmem cell
> first, then ti,max-output-impedance, ti,min-output-impedance and
> ti,output-impedance-ohms.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

