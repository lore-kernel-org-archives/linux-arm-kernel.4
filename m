Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB57606A6EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QYmMktGm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=56QyAMft
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jttWHcN3Lx/YqX8MrbxqckD48EazTafTDyqhRLhuIs0=; b=QYmMktGmbYs1IUHPsgEQIZ9R0F
	5b4cubeMFskSPBvp0wmDmF7ScG6hjr5QMvH2P/+mD8uZveeLZkZL9ne9eLZOnai5mFCHRpgi16vfP
	RvdUQq1GkSv4SnWuNWTeN7vbbOqfERoRIBvz4VDi1poxya2ChR9BdQxEIwXeIDaHz6H7sNcn7rC3p
	qF8VZvXty2XfBiqS7xQ17ad+CIYi94JKOyOIVBeQ0q8BNJnnZz81v9yirLFLOt4g7T5fcVPqmLxo9
	DrE67fcNpnbeyHV4CQt53OSeEi6EgfLj0IbiQcRm7qs2Zq2NPonEnAyEX3Pz33mw8iU6xrgtFNNdk
	Lq8IbrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUj5-0000000GAAh-2lrS;
	Fri, 20 Nov 2026 19:56:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiM-0000000G9ZS-2ZEI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jttWHcN3Lx/YqX8MrbxqckD48EazTafTDyqhRLhuIs0=; b=56QyAMfteX5gb32fdPnkmUy7fY
	DMW8mpXWCenxb+reYE9o2DxAL4Fhmrwq82GeG3M8wCnKAiUcNDSyZgAycBlyNIX7lx63ydcyLMnsL
	Htzvj0bKh+YG+4fMXw7FVaqJs+bQ5HoSMbtwYWgcW2JBatuVFihlxLpBIKU2c+21CsgI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUUi5-000MvO-DG; Fri, 20 Nov 2026 20:55:49 +0100
Date: Fri, 20 Nov 2026 20:55:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Heidelberg <david@ixit.cz>
Cc: Karel Balej <balejk@matfyz.cz>, Brian Norris <briannorris@chromium.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Johannes Berg <johannes.berg@intel.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
Message-ID: <20374af8-2f50-4637-b92a-4fa5c5192c20@lunn.ch>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
 <afI8y70U7wFT_07h@google.com>
 <DLQ9LXDE2P29.248MPYCJMT0DL@matfyz.cz>
 <787950f1-ff2f-4b49-b164-61da3c9971c6@ixit.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <787950f1-ff2f-4b49-b164-61da3c9971c6@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115607_672844_674CCE6E 
X-CRM114-Status: GOOD (  14.40  )
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

On Fri, Nov 20, 2026 at 03:47:48PM +0100, David Heidelberg wrote:
> On 27/09/2026 19:12, Karel Balej wrote:
> > Brian,
> > 
> > Brian Norris, 2026-04-29T10:15:55-07:00:
> > > > Brian, what are the options here now? Would it be possible to make an
> > > > exception and accept the patches without the firmware being in
> > > > linux-firmware? This is an old device with no mainstream audience

Why even bother, if it has no users?

We have to look at it from the perspective of Maintenance. If it gets
merged, you have to expect a hoard of LLM script kids descending on it
and submitting patch after patch fixing theoretical problems. Is
reviewing and merging such patches a good use of time for a driver
with no mainstream users?

Does openwrt support it? How do they solve the firmware problem?

     Andrew

