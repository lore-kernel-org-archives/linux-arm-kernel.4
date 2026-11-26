Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65750606A680
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ob6+hsRs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBF4TsmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DkUy01y7xEbf/+LpBM+I9BkjCedA7NkFboIBCgJYdX4=; b=ob6+hsRsFQHAeN
	KqvINBxA2dEDFFNHiWu37eG7bQ8l+x14Ue4tjoJTpOz6UmloAaKcTByMcbyvsVE5Sn7N7DXJTIeXL
	TvmEtFGp3XbtOIX/EGqmgNCvdV4MMZgikyB8KcB6VIJfA10Viw8UquIlnmEDd5l864VwN1U9QoFIC
	3ZbEfGPeJE1fYkZHlIdh8AzUZmvQpb319/AmWG+FG6hNsbN9L4v/jEaSuqPyRQP5WmVxm8QcQpkJt
	znWvnxgVX/padIZ4obi8OSdbMRdugZ5P6hqraB60hxzi3stkDtzV/+NAWMgP//7Ftw2ipegqR8vGk
	CMn40XWVUAE1YTwxF+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeVj-0000000ECMc-37Tn;
	Thu, 26 Nov 2026 18:47:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeVi-0000000ECMN-2PXZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:47:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A69614399A;
	Thu, 26 Nov 2026 18:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96E01F000C4;
	Thu, 26 Nov 2026 18:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718877;
	bh=DkUy01y7xEbf/+LpBM+I9BkjCedA7NkFboIBCgJYdX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jBF4TsmR7GFh0k+NboYQnFAM4Y9gkAG1djVNMrQN9KWPX/AVg8obZFA8aMlb1vSBF
	 RFXE+SgvQW6oO617L66UefSjI5+Gik4HBNMhBLbx8qSb4SXhxFatRXaZMfhUI2cK2k
	 YASGpLIcsWeP8Qec2WYUrQc5K1JouNMPZkjtTCCyW3b1GfRV0ptfopc9X9AQFcIuFm
	 pbqFcvQiCeGUyrhZiu4js0k1W+cESSxlFxtoeahqRnvCCpQ6i0WKbyp6YOJm8CVYbZ
	 A/sZjS4dVvEiJy7q3qWWJ3svug03JcZNwXzevVScebjbg5dopXjvb0DctlWO6ogOSH
	 3mTYNeHIVBkqw==
Message-ID: <cdc5f00b-380c-4c8a-800d-967008c16a4f@kernel.org>
Date: Thu, 26 Nov 2026 19:47:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/6] lx2160a: change the pad muxes through the RCW
 override
To: Linus Walleij <linusw@kernel.org>, vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
 <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

Le 26/11/2026 à 13:53, Linus Walleij a écrit :
> Hi Vincent,
> 
> On Wed, Nov 18, 2026 at 12:00 PM Vincent Jardin via B4 Relay
> <devnull+vjardin.free.fr@kernel.org> wrote:
> 
>> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
>> fields of the RCW. They are read-only in RCWSR12..14 of DCFG, and are
>> changed at runtime through the override registers in the DCSR view of
>> DCFG, which read 0 until written.
>>
>> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
>> gpio to support bus recovery"), fsl-lx216x.dtsi drives the override
>> registers with pinctrl-single for the I2C bus recovery. Its first pin
>> state clears every other field of the word: a board whose RCW programs
>> a non-zero pad mux loses those pads at the first I2C probe.
>>
>> This series reads the fields in effect from RCWSR and writes RCWCR, as
>> fsl_guts_rcw_rmw() already does for the SerDes protocols:
> 
> Once the review is complete, can I merge all patches except the DTSI
> patch through the pin control tree, i.e. does it have the right ACKs?

I acked patch 3/6 as maintainer of drivers/soc/fsl/ and include/linux/fsl/

Christophe

