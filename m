Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18816606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V4ZpStjU;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=bw3+HFFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/dzVLSTzAtZpIlTRksLK3iB4FqDeUyOeTiMZVSsykQw=; b=V4ZpStjUzgUaXS
	mPs6u+ovmYYSuaTNTDLICNaTfCCkedNJCL1g36sKNbadQGbt1e362uDZ/FwmlSxlcnxnE29kAzBdS
	EbPkC40K8wLY1O60KXppV2zY/VXDWhQJUtmDtgwv0saQ/CJJuZTiiHlZRoKWEo/P6WUv8fzBgET14
	Wd2C1KCXVJvlMJcziyGlCJbluxQyJQVpIq/r3yww5uiPO0SVA9ns3uqhdQeyNRb5Z147xObIlqe+D
	AHsIadCVK3IzxwdyK56gaWmYvpc1X7ce0fT8tsaCfAIgeZ3nEFGnpdSQ0nczS6HsOUNp8VSu6NeLI
	RUuaQ7PVKo5TbKuLjMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyda-0000000H1bl-2GBc;
	Fri, 27 Nov 2026 16:17:26 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWydX-0000000H1b7-3qQM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795796236; x=1796055436;
	bh=/dzVLSTzAtZpIlTRksLK3iB4FqDeUyOeTiMZVSsykQw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bw3+HFFyYQSibJAWqRVnLPlholNoMj9tEn3t2soACFMU2eyOHoBOwGWI/J9jRj7w/
	 SuWRdVrnbfegHXOIj2NPi8YSpMwdGzNpvSfkqKCpTu7a9NHfXQG+c6TY3AaFA/PZek
	 zO9FEn8O7MR1Gy82G3LDgzvtXoKO8YO5OnbSTWemOC1yC+WDCtpqRshHZtByTHn/dN
	 i+s7V+6z3sxAYmkdsO1bTo2PiQH+Yyj+vCKggv0MudNRzvPLTj0w8VFy/SsaUspiqg
	 WuV3tP6d4UFWNLjV586UWPJf2Itj4o//zCrPSfajSK9pARyKKJNU1FaU9Hejit0QfW
	 FkJbT6dR+YT4w==
Date: Fri, 27 Nov 2026 16:17:11 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: Norman Herms <dockseed@proton.me>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Message-ID: <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me>
In-Reply-To: <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 2bae6d665eabca9caaa9f917c67d0b69de98846a
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_081724_102216_F6D9F52E 
X-CRM114-Status: UNSURE (   7.75  )
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

On the ELDO1 question: the AXP318W datasheet (V1.0, Chinese, table
6-3) gives ELDO1 a default of 0.9 V and leaves it off at power-up, as it
does DCDC6 and DCDC7. So 1.075 V is not the PMIC default.

On the A7S we boot our own chain (U-Boot SPL calling the vendor DRAM
init, TF-A, U-Boot), and none of the open parts writes ELDO1. That
leaves the vendor DRAM init, which switches it on. Its value follows
VDD2H on the 25 mV grid: with DCDC7 at 1080 mV we read ELDO1 at
1075 mV, and with Radxa's own boot0 at 1120 mV we read 1100 mV.

We have also tried VDD2L at 0.9 V on the A7S. Lowering ELDO1 from
Linux changes the voltage after the DRAM training ran at 1.075 V,
which can lead to errors. So we keep the value the DRAM init leaves,
even though it does not match the schematic, as the v6 node without
voltage bounds does. The vendor DRAM init sets all the DRAM rails
itself, so a clean 0.9 V would have to come from there.

Built and measured by AI agents (Claude) on my board.

Thanks,
Norman

