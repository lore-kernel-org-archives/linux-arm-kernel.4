Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TlDnkCYW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALziLNVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LEUOEvYWNj7E1ZyLE8IW+ae/bA1XEfjmbaEAK8yH2KE=; b=TlDnkCYWNHjcxqdu1RftDnBMHe
	Yx6xF13IIJ0mRPiVmdefvCKkjrHeaFJJkmZFHUXqRrwYVxrqydP6+mLT9HQ9Ma4ZcKsCWVoc2Y1GS
	FUCRa0jtu02IZIobhAsdj/lfkAqlVaaLMMzRKbJzMgvycE2Eg+VxdmYrojjrL9b9vznJdHE4kHZPW
	jIhDpd9XNTaQ8IzdvRMyJNISgmXA1TN8agyb692qFmJnwag9DCkYixibpaE5+r2EkJEOklDqegJnj
	q/zoffm0E7L9c4Nd2KNUSge9GZlrmUBwpVKcIFajwIUykgS9TjYAFiCQ4bjUi/1xc2E2PUSHhiDyq
	IKFTJOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9XH-00000006zki-1Ohw;
	Wed, 11 Nov 2026 14:42:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9XG-00000006zju-1zjm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:42:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4E8443460;
	Wed, 11 Nov 2026 14:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818BE1F00A06;
	Wed, 11 Nov 2026 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794408169;
	bh=LEUOEvYWNj7E1ZyLE8IW+ae/bA1XEfjmbaEAK8yH2KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ALziLNVu3wa+LaDP9x3ssBcCGzk85Mbmk1r1TzuM4bBYeS+kPKqcDoONyyd+dBSfM
	 IggHjPvsPBRmf2TvrXHxprxWqgdx6k/uuhR5nDg8nI3ZsB7GPz8Ccqk0uX3MLNHorp
	 vjY/opfg/1htNZ7KozoS7mOonllKDA3qdzYmxJQufGISMXZcs+pbjGlJvbXkSVWa6N
	 ozth1YbAa4H7Q/KaLNgp9WSDPRdJNUlLRKMMdjdyvNFytlP378AnB4mdok/5rZsw1H
	 4L7DK9dZhBz7nmkrnQgZYiLggvgZV/neQuQgWJyKeJm74KPO7Ec5EYpi0N5G/xGY5o
	 5MCtT1hioyxWw==
Date: Wed, 11 Nov 2026 08:42:47 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@nabladev.com>,
	Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
	=?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Subject: Re: [PATCH 0/4] ARM: dts: stm32: adopt hex format for timers
Message-ID: <20261111144247.GA2193350-robh@kernel.org>
References: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 05:25:02PM +0100, Fabrice Gasnier wrote:
> This series intends to comply with hexadecimal unit addresses for timer
> subnodes as described in  ("dt-bindings: Use hex unit address patterns").
> 
> Also update hexadecimal format for 'reg' property in these nodes. Take
> care to update the boards accordingly. Note there aren't in-tree overlays
> impacted.
> 
> Purpose is to avoid upcoming new dtbs_check logs like:
> make CHECK_DTBS=y st/stm32mp135f-dk.dtb
> ...
> stm32mp135f-dk.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not
> match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
> from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
> ...
> 
> Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
> ---
> Fabrice Gasnier (4):
>       ARM: dts: stm32: Use hex timer addresses on stm32mp13
>       ARM: dts: stm32: Use hex timer addresses on stm32mp15
>       ARM: dts: stm32: use hex reg for timer2 on stm32mp15xx-dhcom-overlay
>       arm64: dts: stm32: Use hex timer addresses on stm32mp251

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

