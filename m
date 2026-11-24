Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B94606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a8sv6IfJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CvzFLhg2;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OiDP+/11
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3skHsXPWAPA6xtcJjoetiAZ5hNyad5A7kWWBwX3cakc=; b=a8sv6IfJnDWcB3
	bhxNVa33hB9MzJU7LIr2L1HGnV68N24BpWgbcrC9NYo5briQaX+HgBx3/Xe/v77NXXRa2NdatB5Vn
	7xXCvtB+zJFW2mKMy2gjwSAGaWmthB9kOvcZTJYarURcjmWIHgKuWoA39CTyj6YgraV08nD6b9EwC
	Wwf4OwslZfEPyqox/E3wyD3KqHwTSPVL55O4FAHMEJw6Ln9RPh4Ty91wTtfjmCsvLpFJruIx36oNI
	U9IBSJhN50EcKwnIGhuTyh/fukbHI7vLg+baV+tm2WVSp2ivDwXNlNOKEof4zUWP/0bCCIZ/UqnDJ
	7TPLsgVFiAYYdyQEZCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtAA-0000000758k-3jRa;
	Tue, 24 Nov 2026 16:14:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtAA-0000000758K-03n2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3skHsXPWAPA6xtcJjoetiAZ5hNyad5A7kWWBwX3cakc=; b=CvzFLhg24v/NA/IxDTLW5shCHL
	fw/523GczAD9CDgYcDjyrzcYL2kPfa2G424hn9vS9WNO1p2kg+WM5iIhIGTV5JEpvL1Dno4T4pLW+
	YtT3Zjf0EXC67PHl4WfR40gKXS3AGibzajRtnTtrUIMjdSBespd/g34dNNvH8w8Xkwsedk20MLoKP
	DLzwI/Ewmg0Okvz6K01p4RnR3ZJw7huyMQ0nIl+AY4pJIk9qDgz1Uir6qyI+1AgthsInvnu/OGVLm
	D1FiHTjnjaHrANg3p1IanGZW5WRVjjgbhmFj7ZgoPTdbnJJH9boRX0SuJv1uOXnMC4h7IrxiX2lLW
	9XVExYbw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt9z-00000004KNF-2id3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:14:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EEA46C2C65E;
	Tue, 24 Nov 2026 16:14:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76D2C601E1;
	Tue, 24 Nov 2026 16:13:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CCAB11E6809C;
	Tue, 24 Nov 2026 17:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795536837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3skHsXPWAPA6xtcJjoetiAZ5hNyad5A7kWWBwX3cakc=;
	b=OiDP+/118IsNkkWNjVvkTkhOkwiJEOWOgt/AuPd0p7RfL1uW/xPditFOwmUGlJAF+/ald1
	94jFeUbZ18pOhAWP9JdAeLzCIfoUAY4H4OLm6IcU6FaEegWeAb7ja+V5e/5aqY4C8GxgE5
	iqe7I80hpVi1dW09EJBRUcbNKJsfYRc2brJ4F8i9ljOvjSYCXRrEoLADhLZWn03WgVC4a2
	f2Qevq0S93oGchK8Au4ccupyRpgPxM/JKMqxEHx7mf0ufKL10dWwB8aT9iELn7GHRBGQ6Z
	vcceJIYH2yJ111oJRwPMlSr/FKSRRThvC7sxN43b2KaSllqYZp4v+ef2o9qd/A==
Message-ID: <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
Date: Tue, 24 Nov 2026 17:13:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: netdev-bot+sashiko@kernel.org, zxyan0222@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261118025528.2703790-1-zxyan0222@gmail.com>
 <179520945915.3135.14304625182301747705@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <179520945915.3135.14304625182301747705@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_161425_490705_5FE309E5 
X-CRM114-Status: GOOD (  19.41  )
X-Spam-Score: -0.2 (/)
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/20/26 22:17, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] On every in-tree XGMAC platform, the XGMAC half of the fix never
>   runs.
> - [Medium] csr_clk_mhz is only computed when priv->plat->stmmac_clk is
>   non-NULL.
> - [Medium] The patch turns on an FSM timeout check that resets the
>   interface, with a hardcoded NTMRMD = 0x6 (about 1 s) for every…
> - [Low] The commit is written as a bug fix: the protection is
>   'ineffective' and a stuck FSM 'was not reported through the safety…
> - [Low] The patch adds ten STMMAC_NTMRMD_* register-encoding macros (1US
>   .. 64SEC) to include/linux/stmmac.h, the platform-data header shared…
> - [Low] The same clock (stmmac_clk) is converted into a 'CSR clocks per
>   1us tic' register value in two places that use different conventions.
> 
> --
> 
> net: stmmac: program the FSM timeout timer
> 
> This patch programs MAC_FSM_ACT_Timer on dwmac5 and dwxgmac3 cores after
> TMOUTEN is enabled. TMR is set from the CSR clock rate in MHz, and NTMRMD
> is set to a fixed 1s timeout. A csr_clk_mhz argument is added to the
> safety_feat_config callback, and NTMRMD encoding macros are added to
> include/linux/stmmac.h.
> 
>> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
>> not reported through the safety interrupt despite TMOUTEN being set.
>>
>> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

[...]

> [Severity: High]
> XGMAC_TMOUTEN is set just above without looking at safety_cfg, but the
> timer is only programmed when safety_cfg is non-NULL. Does any XGMAC
> platform set plat->safety_feat_cfg?

This looks valid, on what xgmac platform did you test that ?

Maxime

