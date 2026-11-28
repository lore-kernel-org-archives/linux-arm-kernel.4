Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 02:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yHUPRnQV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iU2SKOzJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PsHuO+dYPHrDaL7olY6c856oTYxQkKQxCg0cq/BUyYk=; b=yHUPRnQVfZcRIo
	a/bgJ7KsaYiQygoWZuQZ8f0HPOG0Os1X0G8ezReNno6+skopOoip9rKXsorFu63yzvd0V3ae5NzvA
	o2hOBAll+enyMu85x+Bt06vnkQjnoa1vXEXxxmFEhIzZ3mUU135h5J3SknUAC9ZmsX5kBP+jeb0PN
	Te1kHhzC90JASfaWnK1QXtwPp1TtNvdRK/btyHEsq9pJUlY8wfrHcUYQRciTZh7ZtcbDx1DpassWP
	RAuL/G5aNrYjVFolT3tBnpzB7OX6EQf3/3DFvpB2Zt6SYqyvHSw7b2LXQS9DLWiafJizpdb0LXeW8
	SBGTDCRNI5JmIn/TqtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX7pD-00000000I8q-1neh;
	Sat, 28 Nov 2026 02:06:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX7p9-00000000I8U-2oRq;
	Sat, 28 Nov 2026 02:06:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 271BC4419E;
	Sat, 28 Nov 2026 02:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3C91F000C1;
	Sat, 28 Nov 2026 02:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795831559;
	bh=PsHuO+dYPHrDaL7olY6c856oTYxQkKQxCg0cq/BUyYk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iU2SKOzJDNDO1HhvVJC8Qi/jVM+1GtK+RTIBFu4NxLfTHmM+P/aph9mcPGGxTk2Lp
	 9ceB2PjKil8j0vBhAO2oTpgzWDpJu/t2gjdRfyZlHtNDAp69RLcU5QoruJz3IaHHuN
	 NfO+5a7OwsrzvFj2EKdFs5c3DmUrAtyB3ln8iMkD0ffKqqJD+M3mHkdeud5N845Bc8
	 BJK/M91A9bwsGBw+Fg13H42P+Vqk1lhwUN14Dc26Ay7KhCzc4AqjphxFkC4wxSaU/z
	 sFfG+H/09U4vyo/DBJ+e2pHDePQbiNB5lq6LUjq9t0GWwq4ceJhUqc92X6pnrFJUrY
	 OtcGi/UsdEIMw==
Date: Sat, 28 Nov 2026 02:05:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
Cc: iasnezhkov@gmail.com, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Roman Vivchar
 <rva333@protonmail.com>, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and MT6358
 VCDT request bits
Message-ID: <20261128020551.17cf4fe3@jic23-hlaptop>
In-Reply-To: <20261127025517.9548-1-iasnezhkov@gmail.com>
References: <20261127025517.9548-1-iasnezhkov@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 27 Nov 2026 02:55:17 +0000
Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Ilia Snezhkov <iasnezhkov@gmail.com>
> 
> mt6357_auxadc_ch_desc[] sets req_bit to 0 for both ISENSE and VCDT, and
> mt6358_auxadc_ch_desc[] sets req_bit to 0 for VCDT. Bit 0 of
> PMIC_AUXADC_RQST0 triggers BATADC (ADC0) rather than ISENSE (ADC1) or
> VCDT (ADC2), so polling the ready bit of ADC1/ADC2 times out unless the
> channel was triggered externally.
> 
> Use the actual hardware request bits in PMIC_AUXADC_RQST0: bit 1 for
> MT6357 ISENSE and bit 2 for MT6357/MT6358 VCDT (matching MT6363 VCDT
> and the MediaTek PMIC AUXADC hardware registers).
> 
> Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
> Reviewed-by: Roman Vivchar <rva333@protonmail.com>
> Tested-by: Roman Vivchar <rva333@protonmail.com> # mt6358
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
Applied like Roman's series to the testing branch of iio.git + marked for stable.
That puts it on course for the merge window rather than rushing it in as a fix
during the rc cycle.

Thanks,

Jonathan

