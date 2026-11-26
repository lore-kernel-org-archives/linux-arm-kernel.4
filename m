Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SUERCjxD;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Jb4yJYx3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XYSDHZYOz2HcGfIl+aUARLgMG4MFI97vgguT4JgL9tM=; b=SUERCjxDK2h2ig
	bgIotSELiNaj+xTelnMmSZ33nFumgFoW5NgznxUdTEJDrfhWHamqnjIBs/FZRk5vSEQUT6vuXM4Eg
	hDjYsuhqS22iFlNSr2NkEwhLan3O1xTDBMzmhXgZef1vjeonvfPVVcq3h55B3OnLgJ45wN03u0NqL
	AmofesGY2ooiNego9xnS4u3UcJOBEbT7w+o6Pu91LgtGnRoWD2bexmieCqIHNX7hep6+BNVIZAv+G
	opdp+VFv2XjGQ5tndkk10OOkAxTrXH8KOTOF9uFKhRUr5dEDlhrjVcy6BD2Kj5fsvAZgEJk3yzQNC
	M5YoEnaGR1utwNzzz+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbSZ-0000000Dk5X-0YdI;
	Thu, 26 Nov 2026 15:32:32 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbSS-0000000Dk44-1Nzi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795707141; x=1795966341;
	bh=XYSDHZYOz2HcGfIl+aUARLgMG4MFI97vgguT4JgL9tM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Jb4yJYx39VMrBlih8bC71VbKLC01jlwmddrAjmQtCjvgbFgUkTyxEMteQIgBOMtEC
	 EVbThkMokOZs7YmDldetiV0+eluG8jHJ4STSY3eUQ00FiZ7+EX+tFXPOY1W9DApaHL
	 sPnribWdfS4aiqmrfilU9yf+8WbmRfskr5C91McrAJ6J7zOxSrPoR205BMC1UDk/1m
	 anBl+uTjZa19HH+AgglE9/NhCwLvnWLJaan2alA48EDSRc+qohBK/DHQCPwW/Xr8wF
	 zxyJ9GsfLn40GYqrVM3MElzBeHE/6uaY9OE1nJn2AyfOmT42CJftY7eXKwKdWSbqob
	 z77+trV6yXzcQ==
Date: Thu, 26 Nov 2026 15:32:16 +0000
To: Enzo Adriano <enzo.adriano.code@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: linusw@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Andre Przywara <andre.przywara@arm.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Message-ID: <hLr27fLEbAhwAQMkO50HHXP_6CB0avqrmqECAA0v51G-wllHh5gH-430fmoZQ9-H_QG0yeuyKXGHK2rnzXiZPDFELQU-nWdwwpxJqYWT3tY=@proton.me>
In-Reply-To: <20261109-a733-pinctrl-v3@gmail.com>
References: <20261109-a733-pinctrl-v3@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: f179a31c19f8418be2ca57072deb600c19315a8d
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_073225_428103_7E18D0DD 
X-CRM114-Status: UNSURE (   4.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

Hi Enzo,

Tested on a Radxa Cubie A7S (1.8 V banks: PC, PE, PK) with v7.3.6 plus
our A733 patches, with this patch and Pablo's IRQ-bank series
backported and our own voltage-mode patches removed.

The firmware leaves GPIO_POW_MOD_SEL at 0x01155550 and
SGPIO_POW_MOD_SEL at 0x000AAAAA. After the probe they read 0x05555555
and 0x00055555. GPIO_POW_VAL shows 1.8 V on PC, PE and PK and 3.3 V on
the other banks, matching the schematic. The SD card works at 3.3 V
High Speed, and GPIO interrupts on PK0, PB0 and PJ24 follow pull edges.
Without both patches GPIO_POW_MOD_SEL reads 0x01155514.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Not tested: 1.8 V switching of the SD card, the A523, pad voltages.
Built and measured by AI agents (Claude) on my board.

Thanks,
Norman

