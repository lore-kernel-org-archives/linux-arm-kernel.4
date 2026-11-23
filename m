Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BBE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QNF1jDuM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIIF6fdf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NvDPN1uzBydiluj4pwaIyQ1aBVv33ogPl+ZaFWP3YRE=; b=QNF1jDuM4hSsm/d2sqkjO1EW1d
	8G+Su1jkF3zWPPM+5TaH66asWqOFIVi6ZCa3uONH9fz9z1Jt8bwKtb2T22wEdRdkI7UC5aAwpwknY
	Ls/FKrjqK4NsNp+sQWSsaEi/wi/7JIQHtKK/dds1DRvhtkY67ra0tvjekZfq1fAT/HDF7uMT02rIK
	pQ4QSopq/zt/AhkbDvQ6OA8+puy0sUQ3Y5D0gW70Y/peC9WHAQ7gEDJvdD8T5WK/aOt2YusZzHxGr
	57XuCtnr0oh5ZLGfPhRw9+1yml5DjL8TRlcyjEIILOh+TFPRe7Trgo2n99XPOGs3LsBxZTj/VzCHe
	LgyMQrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS6e-000000038Gh-1Rtg;
	Mon, 23 Nov 2026 11:21:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS5e-000000037ZN-2sqV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:20:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B049461F8F;
	Mon, 23 Nov 2026 11:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7B91F000EE;
	Mon, 23 Nov 2026 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432805;
	bh=NvDPN1uzBydiluj4pwaIyQ1aBVv33ogPl+ZaFWP3YRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OIIF6fdf1BrCCs+ruq1Mvor5MI237MSEBGArpu+IeV8lxMgB1PSycdxaJfBNCzQKZ
	 BULGgtpV9n+x8VbHXVo462EzyHat97zTLMaHuaDA+YsNznBqPT29IXzl/v5xarrLbC
	 kSDUIQUT/JdX6oFMkAAwmiSSuVN56ncum0N785MpKGK6eTMK7dlhbbAf0UPJIu4RpG
	 ZmTmvKQKTuBkJHX5lkf7JquLJAPy8/2x+1KtdYeUqEF0R5+oRXaRExyGVmqUR4nvoV
	 Qa3GshrtY9qHhtuvfM/PcfCIaTcO9o3piwHMUMtmQqmp+ViPR9zXjFbsJ+c4pJ4VDd
	 O7bjESx+6ongA==
Date: Mon, 23 Nov 2026 12:20:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: soc: synaptics: Allow SL2610 mux
 controller children
Message-ID: <20261123-imposing-crimson-chinchilla-fe56de@quoll>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-6-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116135442.4827-6-jszhang@kernel.org>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 09:54:39PM +0800, Jisheng Zhang wrote:
> The SL2610 system controller includes selector fields for routing shared
> peripheral signals. Allow a mux-controller child using the register mux
> binding and show the shared MDIO master selector in the example.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Assisted-by: LLM

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> ---
>  .../bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml | 10 ++++++++++

There is no such file, which means you are fixing in-flight patches.
Squash it with in-flight patches instead so we see entire picture.

Best regards,
Krzysztof


