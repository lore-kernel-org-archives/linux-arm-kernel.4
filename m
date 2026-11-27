Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59278606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bz89FzxR;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=VYTx6d9Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U1yLLCVNt57u5GF+uQ4RZt1RrCY+NCxvna0eB8L6VaY=; b=Bz89FzxRDMgRd5
	+rjslJbYPrBu3i2lTafJutT0Me63DLao285WjziKnnM7//xugYo97FqA/4zdnRJAROUhXaTenNbDM
	mFtUsgSqeQhX5Y8As8707zwPqHNM7vw/PDTx2GIFL00jPzvPYRGSVUSWDCy28JOkdY/CAtaXB5oba
	eaGSoT/DhKxX16aj7WuDq2rABxV5zFsXervInuAHfz4znFebQictFAU11jIpLHBg6k48O5Rt4izBC
	tFaLOED1PkLgQ0IF2OiMIj1xdjwkrMg52/FnwH5PZtcMAJZ2VBY+9S6OEV2wutegB8XOM1K52f2EC
	LGDhaTOa7iTz8dXlRP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzJO-0000000HBeE-3AhC;
	Fri, 27 Nov 2026 17:00:38 +0000
Received: from mail-10628.protonmail.ch ([79.135.106.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzJL-0000000HBdY-2mz6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795798823; x=1796058023;
	bh=U1yLLCVNt57u5GF+uQ4RZt1RrCY+NCxvna0eB8L6VaY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VYTx6d9ZdxGH5l81XvuuWIPnYHtdFZItIsvM6pQWRUqF3Iqn2pTfo7abM7gjUKzh2
	 Irp6q3gykmkf+v6rBYbl25atF1ZxmiCHkOnTNvCbVu1QuG4F/a0+6QmtaKygRbK4wd
	 N67LVxwJPkt64LR4XoRrjya++TNX+BjrCjftMEuy5qv0i9PX+nmuRY11sF4AAB0ZsU
	 oXZITO8llruZdsdF2Rd522JCHjXLL77ne2Sg2VpJlyLwDdaEkbEYF0iY6JU5+8BzXo
	 6W2/C8dzKBwVHW8bPud1NaAp2IyDyGzriunuLvzGOKZ5OOt/oweW4Eo8x5sXMnxPy5
	 7m6Ll2rpGWWJQ==
Date: Fri, 27 Nov 2026 17:00:13 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: Norman Herms <dockseed@proton.me>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Message-ID: <AzjLG4iAqXVYU5xs3jzLGCHNElMjyalfu_xCbgGLeyvgkAXIXMDFHCm4LUyEe1sq6C4gcLhjyje0myr_eNKHhYEmWpoAVHJF0YHgGW7cDVA=@proton.me>
In-Reply-To: <fcdd57ea-8f03-45ce-886e-f0efb6f23d3a@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com> <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me> <fcdd57ea-8f03-45ce-886e-f0efb6f23d3a@arm.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: e1853d72c46332b596795337445d7c8e003b41de
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090036_323720_620449BE 
X-CRM114-Status: UNSURE (   9.39  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

> Regardless I wouldn't want to leave it completely unbound, but instead
> provide some limits. I guess for VDD2L, potentially the same as VDD2H,
> it should be 0.87V - 1.12V, which seem to be limits Google turns up for
> those LPDDR5 specified values.

That covers what we have read on the A7S: ELDO1 (VDD2L) at 1.075 V
with our chain and at 1.1 V with Radxa's own boot0 (V0.6034, and the
same on Radxa's Debian image).

In June we also stepped ELDO1 on an A7S in 25 mV steps, with memtester
at each step: no errors from 575 mV up to 1.2 V, where we stopped on
purpose, and a crash at 550 mV. That was after the training at
1.075 V, so it says nothing about training at other voltages, but
0.87 V - 1.12 V sits well inside it.

Radxa's boot0 also sets DCDC7 (VDD2H) to 1.12 V, above the 1.1 V
maximum that v6 gives vcc-dram. On a board booted with Radxa's loader,
the regulator core would bring VDD2H down to 1.1 V at probe, i.e.
after the training. We have seen exactly that on ELDO1 with an early
test DT of ours that gave it a fixed 0.95 V, on a board with Radxa's
boot0:

  [    1.792706] vcc09-vdd2l: Bringing 1100000uV into 950000-950000uV

with the DRAM already trained and in use. With our chain DCDC7 is at
1.08 V. So 1.12 V as the maximum for both rails would also cover the
vendor chain.

Built and measured by AI agents (Claude) on my boards.

Thanks,
Norman

