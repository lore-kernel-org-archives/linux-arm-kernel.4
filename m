Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB8F606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0RDl+O8H;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XCx3yf+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qpHMzF8uQm7flv6KgMn2jkq7huYsicBHJwz+7Q3OqcI=; b=0RDl+O8H+e6CW2Q/nxtyX2t5bL
	PwbQ/xlCC7rv8dBvxKlup7WWMvMBZ7ze0yZmL7cb2T9cEKcVB99aWakb3wDNkbJQe+4DFT/4uyFpi
	gMBdJEEBw/CO4+R5DxemxtsYv3vIFuUUnM/f/2mz85C6qgKBNvLfjBhQsdho93iqyr61oAK/uC3pI
	jtz6S1cgJWx2jsS9N2CYFFOwA76LY+nL92B3UvGJ9jQgIdxIh2J2FcQ/PMEgKsap9hJmTYSMMaVr4
	3SM92fOJsVOGTx8lW2T2e5u3uu3epXKCqJ9eVzNCQijlJz0a2ikVnENczZ84kPACOITzcJnOVTuYe
	AKCHJ17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxu2-00000005Qhv-0pnR;
	Wed, 11 Nov 2026 02:17:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxu0-00000005Qhb-1bPQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qpHMzF8uQm7flv6KgMn2jkq7huYsicBHJwz+7Q3OqcI=; b=XCx3yf+zD4ZRfr1RtoYg1/xQ3i
	OcPSEuAFmPUtHDJOZBJw7+SG53vWkQ+oGJ3pSrLCDbVK/Po/xRXtKcjkOtNS+5vN3Qi3HKRzv5BWQ
	L2hfcBfCzbLCjtXtHsk0wVoehwGWEgTOBE9C7pPQPu3xhPwRzKFFSbK4NvWZ1EYfJBOE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xQxtv-00FdAT-FO; Wed, 11 Nov 2026 03:17:27 +0100
Date: Wed, 11 Nov 2026 03:17:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Message-ID: <871379a5-c6bd-4e35-b7c8-618b3af49745@lunn.ch>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
 <20261108215010.351256-3-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108215010.351256-3-cyan2254650260@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_181732_439196_BAA8C8F0 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

> +&gem0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethernet_phy>;
> +
> +	ethernet_phy: ethernet-phy@1 {
> +		reg = <1>;
> +

It is better to have an MDIO node, with the PHY a child of that.

	Andrew

