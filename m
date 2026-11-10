Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19160A2603
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CVlLgODE;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=l6bkluDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q4Xohw5mmf9HaJmwh1HyXHKVuyq9JIpdGzwAqa+LDzE=; b=CVlLgODECe33sk
	0DpzqdxbEGrtqn8XEN0rC8JV+uxYiWnaJVC8vpLk0Q0Yryfk3Zm5z5JENvHndMNOCSInQj7Pw3SFa
	stPm1EGfgppSjJ1AFBmmw5DBjlOBprnLXMKFOFIlMQ39g7pi6EpXPfpjK34utJt64nUEfdg3UQfYC
	IpWqfIk2u0hWExOU808tYdtTyikKLMc3wmdOcsxIykzmBsr09jXFjAdpBhnhz9GdQo3G+TW+EWJfP
	N3DDFQsExSGptFHOlDVRiNWG9pCtQUjXuW13f9HCDgCi0+jwR6dDxs7PlFoLUP2xFQTNIqUXSOTtV
	cJBLy62Ly9xgw9jRNbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfAW-00000002cp4-3c8O;
	Tue, 10 Nov 2026 06:17:20 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfAU-00000002cod-1Y5Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=Q4Xohw5mmf9HaJmwh1HyXHKVuyq9JIpdGzwAqa+LDzE=; t=1794291438; x=1795501038; 
	b=l6bkluDdzuuW7mLFaVyldfyJsMHozCpfhhKkNt+9J65QLXTma+U486Wp5PBdRlfxa+iJHXUO+SP
	D1qYSAsMHDtqdjNFdQh1Vi/gdHcDIzmog5Q2YntZYvTrcFq05oULP/S8dhw/8lWPNJU9+vfKRbFRn
	uM9qZZ6n5Tf1rHnWWhsBfaGuAEEOG1vjmuAhcVbFhpYSIYVy8u91QRHix5KaTpM9adDWgUZEBbIcR
	ktjkXpqLvQfgNzyZLGHbe+E19OrfLTKULQ1OItzFWIO8h3i1hm19WJiJwCmPpjz8TxUsSIGWx1Usd
	puW8n+CurTtxk2ricwZt8qppF28gN5mJm85A==;
Date: Tue, 10 Nov 2026 07:15:38 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christopher
 Obbard <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Paul Walmsley <paul@pwsan.com>, Russell King
 <linux@armlinux.org.uk>, Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/9] ARM: dts: omap: dm816x: fixes and peripheral
 updates for DM8168 SoC
Message-ID: <20261110071538.69f9cc54@kemnade.info>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_221718_415326_1BEDE8CA 
X-CRM114-Status: GOOD (  11.84  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 20:52:46 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> This patch series collects several fixes and peripheral enhancements for TI
> DM816x SoCs and the DM8168-EVM board:
> 
> - Pinctrl: add correct pullup/down enable defines for DM816X SoCs, which
>   they appear to be inverted respect to OMAP2/3.
> - SD: explicit pullup disable in DM8168-EVM SD card pinmuxing.
> - Storage (MMC): Update MMC node settings, dropped mmc1 hwmod.
> - USB: Update MUSB node, enable multipoint mode, dropped usb-otg hwmod.
> 
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
> Without upcoming Andreas's patch (not yet on the list) that silences the
> WARN() for the missing hwmod from DT, commits in between the hwmod DT
> and the code removal will get a harmless WARN() during boot.
> 
The patch is applied now.

Regards,
Andreas

